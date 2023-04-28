#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D noise0;
uniform sampler2D rock1;
uniform sampler2D grass2;

in vec2 vtexCoord;

void main()
{
    fragColor = texture(noise0,vtexCoord).r*texture(grass2,vtexCoord) + (1-texture(noise0,vtexCoord).r)*texture(rock1,vtexCoord);
}
