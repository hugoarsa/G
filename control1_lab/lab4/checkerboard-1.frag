#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
    bool grey = (int(floor(vtexCoord.s*8.0))%2==0) == (int(floor(vtexCoord.t*8.0))%2==0);
    
    if(grey) fragColor = vec4(0.8);
    else fragColor = vec4(0,0,0,1);
}
