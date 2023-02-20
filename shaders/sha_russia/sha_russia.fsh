// Fragment Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_uv;

void main()
{
    float pos = (v_vTexcoord.y - u_uv[0]) / (u_uv[1] - u_uv[0]);
    vec4 colorMap = texture2D(gm_BaseTexture, v_vTexcoord);
	float bw = dot(colorMap.rgb, vec3(1.0, 1.0, 1.0));
	if (pos <= 0.33) {
		//Using `*0.5` to reduce brightness, which pops-out too much compared to other colors
		gl_FragColor = vec4(bw * vec3(1.0, 1.0, 1.0) * 0.5, colorMap.a);
    } else if (pos <= 0.66) {
		gl_FragColor = vec4(bw * vec3(0.0, 0.1961, 0.6275), colorMap.a);
    } else {
		gl_FragColor = vec4(bw * vec3(0.8549, 0.1608, 0.1098), colorMap.a);
    }
}