/// Step Event
/// @description Detecta os inputs

script_execute(estado);

// Combate
if (alarm[0] > 0) {
    if (image_alpha >= 1) {
        alfa_hit = -0.08;
    } else if (image_alpha <= 0) {
        alfa_hit = 0.05;
    }
    image_alpha += alfa_hit;
} else {
    image_alpha = 1;
}
