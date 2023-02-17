//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 lum = vec3(1.0, 1.0, 1.0);
    float bw = dot(Color.rgb, lum);//black and white result
    gl_FragColor = vec4(bw * vec3(1.0, 1.0, 1.0), Color.a);
}
