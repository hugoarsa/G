#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin;

void main( void )
{
	//en este problema paso las coordenadas en world space para que de esa forma
	//el paso a clip space se realice dentro de el geometry shader para poder hacer
	//todas estas transformaciones

	//primero paso el triangulo basico que me pasan de antes con toda la informacion necesaria
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
	
    	EndPrimitive();
	
	//despues paso una trasnsformacion de ese mismo triangulo con la posicion y modificada
	//para achatarlo y hacer una sombra como si estuviese siendo iluminado uniformemente
	//desde arriba
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vec4(0, 0, 0, 1);
		vec4 pos = gl_in[i].gl_Position;
		gl_Position = modelViewProjectionMatrix * vec4(pos.x, boundingBoxMin.y, pos.z, pos.w);
		EmitVertex();
	}
	
    	EndPrimitive();
} 
