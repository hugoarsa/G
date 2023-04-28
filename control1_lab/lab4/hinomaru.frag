#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
    bool red = sqrt((vtexCoord.s - 0.5)*(vtexCoord.s - 0.5) + (vtexCoord.t - 0.5)*(vtexCoord.t - 0.5))<=0.2;
    
    if(red) fragColor = vec4(1,0,0,1);
    else fragColor = vec4(1,1,1,0);
    
    //fragColor = vec4(step(0.2,length(vtexCoord-vec2(0.5,0.5))));
}
