#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

const float pi = 3.141592;
uniform float amp = 0.5;
uniform float freq = 0.25;
uniform float time;

void main()
{
    
    float temporal = 2*pi*freq*time;
    float rad = amp*sin(vertex.y + temporal);
    mat3 X = mat3(1, 0, 0,  0, cos(rad), sin(rad), 0, -sin(rad), cos(rad));
    vec3 vertex2 = X * vertex;
    
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0)*N.z;
    gl_Position = modelViewProjectionMatrix * vec4(vertex2, 1.0);
}
