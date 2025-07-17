#version 460

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

uniform sampler2D gtexture; //texture sampler

in vec2 texCoord;
in vec3 foliageColor;

void main() {
    vec4 outputColorData = texture(gtexture, texCoord);
    vec3 outputColor = outputColorData.rgb * foliageColor; //apply foliage color to the texture color
    float transparency = outputColorData.a; //use the alpha from the texture
    if (transparency < 0.1) {
        discard; //discard fragments with low alpha
    }
    outColor0 = vec4(outputColor, transparency); //output the final color with alpha
}