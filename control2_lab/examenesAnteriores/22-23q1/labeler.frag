#version 330 core

in vec4 gfrontColor;
in vec2 gtexCoord;
out vec4 fragColor;
in float tex_f;

void main()
{

    bool F1 = gtexCoord.s>2 && gtexCoord.s<3 && gtexCoord.t>1 && gtexCoord.t<6;
    bool F2 = gtexCoord.s>3 && gtexCoord.s<5 && gtexCoord.t>5 && gtexCoord.t<6;
    bool F3 = gtexCoord.s>3 && gtexCoord.s<4 && gtexCoord.t>3 && gtexCoord.t<4;

    if(tex_f==1&&(F1||F2||F3)){ //si estamos en un rectangulo!
    	if(F1||F2||F3) fragColor = vec4(0, 0, 0, 0);//pinto negro si estoy en la f
    } else{
   	fragColor = gfrontColor;
    }
}
