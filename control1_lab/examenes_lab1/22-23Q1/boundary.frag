#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 N;
in vec3 V;

uniform float edge0 = 0.35;
uniform float edge1 = 0.4;


void main()
{
    vec3 V2 = normalize(V); //lo hago unitario
    float NdotV = dot(N,-V2); //calculo el coseno con dot
    if(NdotV<edge0) fragColor = vec4(0.0); 
    else if(NdotV>edge1) fragColor = vec4(1.0);
    else fragColor = vec4(smoothstep(edge0,edge1,NdotV)); //aplico smoothstep entre los valores 
    							  //para que la transicion sea suave
}
