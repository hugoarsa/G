#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform float n = 8;

void main()
{
    float s = (vtexCoord.s*n-floor(vtexCoord.s*n));
    float t = (vtexCoord.t*n-floor(vtexCoord.t*n));
    bool black = (s<=0.1) || (t<=0.1);
    
    if(black) fragColor = vec4(1,0,0,1);
    else discard;
}
