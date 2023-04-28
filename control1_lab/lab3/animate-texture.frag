#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform sampler2D colorMap;
uniform float speed = 0.1;
uniform float time;

void main()
{
    fragColor = frontColor*texture(colorMap,vtexCoord + vec2(1*speed*time , 1*speed*time));
}
