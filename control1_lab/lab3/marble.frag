#version 330 core

uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform sampler2D noise;

in vec3 N;
in vec3 V;
out vec4 fragColor;

const vec4 blanco=vec4(1);
const vec4 rojizo=vec4(0.5, 0.2, 0.2, 1);

const vec4 sp=0.3*vec4(0, 1, -1, 0);
const vec4 tp=0.3*vec4(-2, -1, 1, 0);

vec4 shading(vec3 N, vec3 V, vec4 diffuse) {
  N=normalize(N);
  V=normalize(V);
  const vec3 lightPos=vec3(0, 0, 2);
  vec3 L=normalize(lightPos-V);
  vec3 R=reflect(-L, N); 
  float NdotL=max(0, dot(N, L));
  float RdotV=max(0, dot(R, -V));
  float Ispec=pow(RdotV, 20);
  return diffuse*NdotL+Ispec;
}

void main() {
  vec4 vcoords=vec4(V, 1);
  float s=dot(vcoords, sp);
  float t=dot(vcoords, tp);
  vec2 texCoord=vec2(s, t);
  
  
  float v=2*texture(noise, texCoord).x;
  vec4 diffuse=blanco;
  if (v<1) diffuse=mix(blanco, rojizo, fract(v));
  else if (v<2) diffuse=mix(rojizo, blanco, fract(v));
  

  
  vec3 NE=normalMatrix*N;
  vec3 VE=(modelViewMatrix*vcoords).xyz;
  fragColor=shading(NE, VE, diffuse);
}
