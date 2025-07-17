#version 460 compatibility

out vec4 blockColor;
out vec2 lightMapCoords;


void main() {

    blockColor = gl_Color; //pass through color to fragment shader
    lightMapCoords = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;

    gl_Position = ftransform();
}