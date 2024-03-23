shader_type canvas_item;

uniform float time;
uniform float multi;
uniform vec2 resolution;

void fragment() {
    vec2 coord = 6.0 * UV / resolution;

    for (int n = 1; n < 8; n++) {
        float i = float(n);
        coord += vec2(0.7 / i * sin(i * coord.y + time + 0.3 * i) + 0.8, 0.4 / i * sin(coord.x + time + 0.3 * i) + 1.6);
    }

    coord *= vec2(0.7 / sin(coord.y + time + 0.3) + 0.8, 0.4 / sin(coord.x + time + 0.3) + 1.6);

    vec3 color = vec3((0.5 * sin(coord.x) + 0.5) * multi, (0.5 * sin(coord.y) + 0.5) * multi, (sin(coord.x + coord.y * -50.0)) * multi);
	
    COLOR = vec4(color, 1.0);
}
//void vertex() {
    //float t = time * 0.1;
    //float r = abs(sin(t * 2.0));
    //float g = abs(sin(t * 2.0 + 2.094));
    //float b = abs(sin(t * 2.0 + 4.188));
    //float dist = length(vec2(UV.x - 0.5, UV.y - 0.5));
    //float edge_darkness = clamp(dist * 2.0 - 1.0, 0.0, 1.0);
    //float cell_size = 80.0;
    //float cell_x = mod(UV.x, cell_size);
    //float cell_y = mod(UV.y, cell_size);
    //float cell_id = cell_x + cell_y * 10.0;
    //float cell_color = fract(cell_id * 0.1);
    //COLOR = vec4(r, g, b, 1.0) * (multi + edge_darkness) * cell_color;
//}