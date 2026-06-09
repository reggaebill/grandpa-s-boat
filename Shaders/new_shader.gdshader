shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

// Adjust this to change how blocky the pixel effect is.uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec2 screen_size = vec2(1920.0, 1080.0);
uniform vec2 pixel_block = vec2(10.0, 10.0);

void fragment() {
    // Use the screen-space UVs so the effect covers the whole viewport.
    vec2 uv = SCREEN_UV;

    // Snap UVs to a grid based on the desired pixel block size.
    vec2 pixel_uv = floor(uv * screen_size / pixel_block) * pixel_block / screen_size;

    // Sample the rendered screen at the snapped UV coordinate.
    COLOR = texture(screen_texture, pixel_uv);
}
