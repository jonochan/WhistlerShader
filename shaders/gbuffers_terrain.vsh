#version 460

//terrain needs chunk  offset to be added to vertex positions
uniform mat4 modelViewMatrix;
uniform mat4 modelViewMatrixInverse;
uniform mat4 projectionMatrix;
uniform vec3 chunkOffset;

in vec3 vaPosition; //vertex position, xyz
in vec2 vaUV0;


out vec2 texCoord;

void main() {
    texCoord = vaUV0; //pass through UV coordinates to fragment shader
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition + chunkOffset, 1.0); //convert from modelspace to clip space
}