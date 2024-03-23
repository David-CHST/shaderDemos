shader_type canvas_item;

uniform float time;
uniform vec2 resolution;

const int AMOUNT = 12;

void fragment() {
    vec2 coord = 20.0 * (UV - resolution / 2.0) / min(resolution.y, resolution.x);

    float len;

    for (int i = 0; i < AMOUNT; i++) {
        len = length(vec2(coord.x, coord.y));
}}