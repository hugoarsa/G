#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

in vec3 vnormal[];
const float speed = 0.5;
uniform float time;
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	//sumo las normales de los tres vertices y hago la media
	vec4 n = vec4(vnormal[0]+vnormal[1]+vnormal[2],0)/3;
	
	//aplico la funcion descrita por el enunciado
	vec4 res = speed * time * n;
	
	//realizo la translacion necesaria
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * (gl_in[i].gl_Position + res);
		EmitVertex();
	}
    	EndPrimitive();
}
