#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 vfrontColor;
out vec3 vnormal;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vfrontColor = vec4(color,1.0);
    gl_Position = vec4(vertex, 1.0);
    
    //aqui tampoco hago los cambios de modelviewprojection matrix para hacerlos en el geometry
    //tambien le paso la normal sin normalizar para que pueda hacer el movimiento correctamente
    vnormal = normal;
}
