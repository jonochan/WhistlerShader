#version 460

uniform mat4 modelViewMatrix;
uniform mat4 modelViewMatrixInverse;
uniform mat4 projectionMatrix;

in vec3 vaPosition; //vertex position, xyz
in vec2 vaUV0;
in vec4 vaColor;

out vec2 texCoord;
out vec3 foliageColor;


void main() {
    texCoord = vaUV0; //pass through UV coordinates to fragment shader
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition, 1.0); //convert from modelspace to clip space
}