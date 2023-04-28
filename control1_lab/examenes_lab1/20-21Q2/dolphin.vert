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
const float PI = 3.141592;

void main()
{

	float rad, t;
	vec3 p;
	if (vertex.y > 0.5) {
		rad = PI / 32. * sin(time);
		t = smoothstep(0.55, 0.75, vertex.y);
		p = vec3(0, 0.65, 0);
	} else {
		rad = PI / 8. * sin(time + PI / 8);
		t = smoothstep(0.05, 0.5, vertex.y);
		p = vec3(0, 0.35, 0);
	}

	mat3 X = mat3(1, 0, 0,  0, cos(rad), sin(rad), 0, -sin(rad), cos(rad));
	
	vec3 vertex2 =	X * (vertex - p) + p;
	
	vec4 P = modelViewProjectionMatrix * vec4(vertex, 1.0);
	
	vec4 P2 = modelViewProjectionMatrix * vec4(vertex2, 1.0);

	gl_Position = mix(P, P2, t);
	
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(0.8, 0.8, 0.8, 1.0) * N.z;
    vtexCoord = texCoord;
    
}
