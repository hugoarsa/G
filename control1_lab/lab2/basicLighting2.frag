#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 f_color;
in vec3 f_norm;
uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix * f_norm);
    fragColor = vec4(f_color,1.0) * N.z;
}
