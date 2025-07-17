#version 460



in vec3 vaPosition; //vertex position, xyz
in vec2 vaUV0;
in vec4 vaColor;

//terrain needs chunk  offset to be added to vertex positions
uniform mat4 modelViewMatrix;
uniform mat4 modelViewMatrixInverse;
uniform mat4 projectionMatrix;
uniform vec3 chunkOffset;
uniform vec3 cameraPosition;
uniform mat4 gbufferModelViewInverse;;


out vec3 foliageColor;
out vec2 texCoord;

void main() {
    texCoord = vaUV0; //pass through UV coordinates to fragment shader
    foliageColor = vaColor.rgb; //pass through color to fragment shader
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition + chunkOffset, 1.0); //convert from modelspace to clip space
}