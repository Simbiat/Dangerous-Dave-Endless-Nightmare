//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 u_lum;
uniform vec4 u_tone;

void main()
{
	vec4 colorMap = texture2D(gm_BaseTexture, v_vTexcoord);
    float bw = dot(colorMap.rgb, u_lum.rgb);
    gl_FragColor = vec4( bw * u_tone.rgb, colorMap.a);
}
