// Fragment Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_uv;

void main()
{
    float pos = (v_vTexcoord.y - u_uv[0]) / (u_uv[1] - u_uv[0]);
    vec4 colorMap = texture2D(gm_BaseTexture, v_vTexcoord);
	float bw = dot(colorMap.rgb, vec3(1.0, 1.0, 1.0));
	if (pos <= 0.5) {
		gl_FragColor = vec4(bw * vec3(0.0, 0.35686, 0.73), colorMap.a);
    } else {
		gl_FragColor = vec4(bw * vec3(1.0, 0.835, 0.0), colorMap.a);
    }
}