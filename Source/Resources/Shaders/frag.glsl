#version 330 core

out vec4 FragColor;

in vec2 texCoords;

uniform sampler2D aTex1;
uniform sampler2D aTex2;
uniform float disp;

void main()
{
    FragColor = mix(texture(aTex1, texCoords), texture(aTex2, texCoords), disp);
}