#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform bool classic;

void main()
{
    float pi = 3.14159265359;
    bool round = (sqrt((vtexCoord.s - 0.5)*(vtexCoord.s - 0.5) + (vtexCoord.t - 0.5)*(vtexCoord.t - 0.5))<=0.2);
    vec2 v = vec2(vtexCoord.s - 0.5,vtexCoord.t - 0.5);
    float deg = atan(v.t,v.s);
    bool sunray = mod(deg/(pi/16.0) + 0.5,2)<1;
    bool red = round;
    
    if(!classic) red = red || sunray;
    
    if(red) fragColor = vec4(1,0,0,1);
    else fragColor = vec4(1,1,1,0);
}
