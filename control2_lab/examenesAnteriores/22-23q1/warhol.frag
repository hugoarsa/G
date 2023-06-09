#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform sampler2D colormap;

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
    vec3 rgb_color = texture(colormap,vec2(vtexCoord.s*2,vtexCoord.t*2)).xyz;
    vec3 hsv_color = rgb2hsv(rgb_color);
    
    if(vtexCoord.s*2<1&&vtexCoord.t*2<1){
    	rgb_color = hsv2rgb(vec3(hsv_color.x + 0.2, hsv_color.y*2, hsv_color.z));
    } else if(vtexCoord.s*2>1&&vtexCoord.t*2<1){
    	rgb_color = hsv2rgb(vec3(hsv_color.x + 0.6, hsv_color.y*2, hsv_color.z));
    } else if(vtexCoord.s*2<1&&vtexCoord.t*2>1){
     	rgb_color = hsv2rgb(vec3(hsv_color.x + 0.4, hsv_color.y*2, hsv_color.z));
    } else{
    	rgb_color = hsv2rgb(vec3(hsv_color.x + 0.8, hsv_color.y*2, hsv_color.z));
    }
    
    fragColor = vec4(rgb_color,0);
}
