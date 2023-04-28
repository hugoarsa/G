#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

out vec3 N;
out vec3 V;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

void main()
{
    N = normalize(normalMatrix * normal); //paso la normal unitaria eye space
    V = (modelViewMatrix * vec4(vertex, 1.0)).xyz; //y la posicion en eye space
    frontColor = vec4(color,1.0) * N.z;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}

