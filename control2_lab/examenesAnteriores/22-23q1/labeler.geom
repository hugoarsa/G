#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat3 normalMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform float size = 0.07;
uniform float depth = -0.01;
out vec2 gtexCoord;
out float tex_f;


void setBaricentre() {
	
    gfrontColor = vec4(1, 1, 0, 1);
    tex_f = 1;
    
    // Baricentro del triangulo dado
    vec3 bar = (gl_in[0].gl_Position.xyz + gl_in[1].gl_Position.xyz + gl_in[2].gl_Position.xyz) / 3.0;
    //paso a clip space
    vec4 C = modelViewProjectionMatrix * vec4(bar,1);
    //ndc
    vec4 NDC = C/C.w;

    gl_Position = NDC + vec4(- size, - size/1.6, depth, 0.0);
    gtexCoord.s = 0;
    gtexCoord.t = 0;
    EmitVertex();
    gl_Position = NDC + vec4(size, - size/1.6, depth, 0.0);
    gtexCoord.s = 7;
    gtexCoord.t = 0;
    EmitVertex();
    gl_Position = NDC + vec4(- size, size/1.6, depth, 0.0);
    gtexCoord.s = 0;
    gtexCoord.t = 7;
    EmitVertex();
    gl_Position = NDC + vec4(size, size/1.6, depth, 0.0);
    gtexCoord.s = 7;
    gtexCoord.t = 7;
    EmitVertex();
    
    EndPrimitive();			
}

void main( void )
{
    //emitimos el triangulo original 
    tex_f = 0;
    for( int i = 0 ; i < 3 ; i++ ){
	gfrontColor = vfrontColor[i];
	gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
	EmitVertex();
    }
    EndPrimitive();
    	
    //ahora nos encargamos de emitir el rectangulo a partir del baricentro correctamente
    setBaricentre();
}
