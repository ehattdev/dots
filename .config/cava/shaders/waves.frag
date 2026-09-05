#version 330

in vec2 fragCoord;
out vec4 fragColor;

uniform float bars[512];
uniform int bars_count;
uniform vec3 u_resolution;
uniform vec3 bg_color;
uniform vec3 fg_color;

// Cubic Hermite interpolation for smoother curves
float cubicInterpolate(float p0, float p1, float p2, float p3, float t)
{
    float t2 = t * t;
    float t3 = t2 * t;
    
    // Catmull-Rom spline coefficients
    float a0 = -0.5 * p0 + 1.5 * p1 - 1.5 * p2 + 0.5 * p3;
    float a1 = p0 - 2.5 * p1 + 2.0 * p2 - 0.5 * p3;
    float a2 = -0.5 * p0 + 0.5 * p2;
    float a3 = p1;
    
    return a0 * t3 + a1 * t2 + a2 * t + a3;
}

void main()
{
    vec2 uv = fragCoord;
    
    // Initialize with background color
    fragColor = vec4(bg_color, 1.0);
    
    // Calculate the wave height at current X position with smooth interpolation
    float waveHeight = 0.0;
    
    // Find which bar segment we're in
    float xScaled = uv.x * float(bars_count - 1);
    int barIndex = int(xScaled);
    barIndex = clamp(barIndex, 1, bars_count - 2);
    
    float t = fract(xScaled);
    
    // Get 4 control points for cubic interpolation
    float p0 = bars[max(0, barIndex - 1)];
    float p1 = bars[barIndex];
    float p2 = bars[min(bars_count - 1, barIndex + 1)];
    float p3 = bars[min(bars_count - 1, barIndex + 2)];
    
    // Apply cubic interpolation for ultra-smooth transitions
    float barValue = cubicInterpolate(p0, p1, p2, p3, t);
    
    // Create wave oscillation with sine wave
    float frequency = 5.0;
    waveHeight = sin(uv.x * frequency) * 0.05 + barValue * 0.4;
    
    // Sharp edge with small anti-aliasing for smoothness
    float edgeWidth = 0.005; // Very thin edge for sharp look
    float alpha = smoothstep(waveHeight + edgeWidth, waveHeight, uv.y);
    
    // Solid fill: if below wave, use fg_color, otherwise bg_color
    fragColor = vec4(mix(bg_color, fg_color, alpha), 1.0);
}
