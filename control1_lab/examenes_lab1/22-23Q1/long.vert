#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform vec3 boundingBoxMin; 
uniform vec3 boundingBoxMax;
uniform float t = .4;
uniform float scale = 4.0;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    //hago la interpolacion lineal entre los bounding boxes
    float c = mix(boundingBoxMin.y, boundingBoxMax.y, t); 
	
    vec4 pos;
    if (vertex.y < c) //si la y es inferior que c interpolacion escalo en 4
        pos = modelViewProjectionMatrix * vec4(vertex.x, scale * vertex.y, vertex.z, 1.0);
    else //si me queda algo por encima de y no aplico el escalado sino la translacion delta en y resultado de aislar
        pos = modelViewProjectionMatrix * vec4(vertex.x, c * scale - c + vertex.y, vertex.z, 1.0);

    //calculo la iluminacion simple con la normal como siempre
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;  
    gl_Position = pos;
}

