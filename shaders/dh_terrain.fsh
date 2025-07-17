#version 460 compatibility

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

uniform sampler2D lightmap; //lightmap sampler
uniform sampler2D depthtex0;
uniform float viewHeight;
uniform float viewWidth;


in vec4 blockColor;
in vec2 lightMapCoords; //lightmap coordinates

void main() {
    vec3 lightColor = pow(texture(lightmap, lightMapCoords).rgb, vec3(2.2));

    vec4 outputColorData = pow(blockColor,vec4(2.2)); //use the block color directly
    vec3 outputColor = outputColorData.rgb * lightColor; //apply foliage color to the texture color
    float transparency = outputColorData.a; //use the alpha from the texture
    if (transparency < 0.1) {
        discard; //discard fragments with low alpha
    }
    vec2 texCoord = gl_FragCoord.xy / vec2(viewWidth, viewHeight);
    float depth = texture(depthtex0, texCoord).r; //get depth from the depth texture

    if(depth != 1.0) {
        discard;
    }

    outColor0 = pow(vec4(outputColor, transparency), vec4(1/2.2)); //output the final color with alpha
}