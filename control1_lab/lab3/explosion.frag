#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform sampler2D explosion;

uniform float time;
uniform float speed = 30;

void main()
{
    vec4 color = frontColor*texture(explosion,vec2(vtexCoord.x*1/8,vtexCoord.y*1/6 + 5.0/6.0) + vec2(int(time*speed)*1.0/8.0,int(time*speed/8.0)*1.0/6.0*-1));
    fragColor = color * color.a;
}
