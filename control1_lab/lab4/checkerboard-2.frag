#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform float n = 8;

void main()
{
    bool grey = (int(floor(vtexCoord.s*n))%2==0) == (int(floor(vtexCoord.t*n))%2==0);
    
    if(grey) fragColor = vec4(0.8);
    else fragColor = vec4(0,0,0,1);
}
