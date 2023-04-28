#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
	float dist = length(vec2(vtexCoord.s -0.5, 3./4. * (vtexCoord.t-0.55)));
	float sonrisa = step(dist, 0.21);

	dist = length(vec2(vtexCoord.s - 0.5, 3./4. * (vtexCoord.t-0.62)));
	float sonrisa2 = step(dist, 0.22);
	
	dist = length(vec2(vtexCoord.s - 0.4, 0.85 * (vtexCoord.t-0.6)));
	float ojillo1 = step(dist, 0.07);
	
	dist = length(vec2(vtexCoord.s - 0.6, 0.85 * (vtexCoord.t-0.6)));
	float ojillo2 = step(dist, 0.07);
	
	//uso un escalado diff para que quede ovalado
	dist = length(vec2(vtexCoord.s - 0.5, 0.98*(vtexCoord.t-0.5))); 
	float calabesa = step(dist, 0.3);
	
	float fondo1 = length(vec2(vtexCoord.s -0.5, 3./4. * (vtexCoord.t-0.5)));
	
	bool cuadraito = vtexCoord.s > 0.47 && vtexCoord.s < 0.53 && vtexCoord.t > 0.8 && vtexCoord.t < 0.9;

	//if que define que se pinta como el fondo
	if(cuadraito) fragColor = vec4(0, 0, 0, 1);
	else if ((sonrisa != 0 && sonrisa2 == 0) || ojillo1 !=0 || ojillo2!=0 || calabesa==0)
    		fragColor = vec4(vec3(1.,0.7,0.0)*smoothstep(1,0,fondo1*2),1.0);
	else//aqui pintas negro
    		fragColor = vec4(0, 0, 0, 1);	
}

