#version 330 core

out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
	float a = 1./9.;
	float f = fract(vtexCoord.x);
	if ((f>=0 && f<a) || (f>=2*a && f<3*a) 
				|| (f>=4*a && f<5*a) 
				|| (f>=6*a && f<7*a) 
				|| (f>=8*a && f<9*a)) fragColor = vec4(1, 1, 0, 1);
	else fragColor = vec4(1, 0, 0, 1);
}
