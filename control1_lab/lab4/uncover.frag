#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec4 position;

uniform float time;

void main()
{
    if(float(position.x / position.w + 1)>time) discard;
    else fragColor = vec4(0,0,1,0);
}  
