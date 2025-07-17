#version 460 compatibility

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

uniform sampler2D gtexture; //texture sampler
uniform sampler2D lightmap; //lightmap sampler

in vec2 texCoord;
in vec3 foliageColor;
in vec2 lightMapCoords; //lightmap coordinates

void main() {
    vec3 lightColor = pow(texture(lightmap, lightMapCoords).rgb, vec3(2.2));
    vec4 outputColorData = pow(texture(gtexture, texCoord),vec4(2.2)); //apply gamma correction to the texture color
    vec3 outputColor = outputColorData.rgb * pow(foliageColor, vec3(2.2)) * lightColor; //apply foliage color to the texture color
    float transparency = outputColorData.a; //use the alpha from the texture
    if (transparency < 0.1) {
        discard; //discard fragments with low alpha
    }
    outColor0 = pow(vec4(outputColor, transparency), vec4(1/2.2)); //output the final color with alpha
}