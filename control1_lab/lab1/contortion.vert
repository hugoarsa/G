#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;

void main()
{
    
    
    float rad = (vertex.y - 0.5) * sin(time);
    mat3 X = mat3(1, 0, 0,  0, cos(rad), sin(rad), 0, -sin(rad), cos(rad));
    
    vec3 offset = vec3(0,1,0);
    vec3 vertex2 = vertex;
    if(vertex2.y >= 0.5) vertex2 = X * (vertex - offset) + offset;
    
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex2, 1.0);
}
