#version 460



in vec3 vaPosition; //vertex position, xyz
in vec2 vaUV0;
in vec4 vaColor;
in ivec2 vaUV2;

//terrain needs chunk  offset to be added to vertex positions
uniform mat4 modelViewMatrix;
uniform mat4 modelViewMatrixInverse;
uniform mat4 projectionMatrix;
uniform vec3 chunkOffset;
uniform vec3 cameraPosition;
uniform mat4 gbufferModelViewInverse;;


out vec3 foliageColor;
out vec2 texCoord;
out vec2 lightMapCoords;

void main() {
    texCoord = vaUV0; //pass through UV coordinates to fragment shader
    foliageColor = vaColor.rgb; //pass through color to fragment shader
    lightMapCoords = vaUV2 * (1.0/256.0) + (1.0/32.0); //pass through lightmap coordinates to fragment shader



    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition + chunkOffset, 1.0); //convert from modelspace to clip space
}