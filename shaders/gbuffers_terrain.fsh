#version 460

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

uniform sampler2D gtexture; //texture sampler

in vec2 texCoord;

void main() {
    outColor0 = texture(gtexture, texCoord);
}