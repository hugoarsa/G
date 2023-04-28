#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 lightPosition;


uniform vec4 matAmbient; 	
uniform vec4 matDiffuse; 	
uniform vec4 matSpecular; 	
uniform float matShininess; 

vec4 ilum(vec3 N, vec3 L, vec3 V) {
	vec3 R = 2.0 * dot(N, L) * N - L;
		
	//llum ambient = Ka*Ia
	vec4 ambient = matAmbient * lightAmbient;
	
	//llum difosa = Kd*Id*(dot(N,L))
	vec4 difosa = matDiffuse * lightDiffuse * max(0.0, dot(N, L));
	
	//llum especular = Ks*Is*(pow(dot(R,V),S))
	vec4 especular = matSpecular * lightSpecular * pow(max(0.0, dot(R, V)), matShininess);
	
	return ambient + difosa + especular;
}

void main()
{
    //normal de la superficie
    vec3 N = normalize(normalMatrix * normal);
    //vector del objecte
    vec3 Vsco = normalize((modelViewMatrix * vec4(vertex, 1.0)).xyz);
    //vector director del focus de llum
    vec3 L = normalize(lightPosition.xyz - Vsco);

    frontColor = ilum(N, L, -Vsco);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
