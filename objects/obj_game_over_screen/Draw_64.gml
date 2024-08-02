// Draw event

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

draw_set_alpha(0.2); // Define o alpha para 50%
draw_set_color(c_red);
draw_rectangle(0, 0, gui_width, gui_height, false);

// Restaura o alpha de volta ao normal
draw_set_alpha(1.0);

draw_set_color(c_black);
draw_rectangle(0, 0, gui_width, rect_height_top, false);
draw_rectangle(0, gui_height - rect_height_bottom, gui_width, gui_height, false);

if (animation_done) {
	
	if file_exists("save.sav") {
                    ini_open("save.sav");
                    // Carrega informações do jogador
                    obj_player.x = ini_read_real("Jogador", "x_atual", 0);
                    obj_player.y = ini_read_real("Jogador", "y_atual", 0);
					ini_close();
}
    
// draw_set_font(fnt_menu); ------------------------		FONTEEE
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var x1 = gui_width / 2;
var y1 = gui_height /2;
var margin = 120;
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);

draw_set_halign(fa_center);

for (var i = 0; i < op_max; i++){
	var y2 = y1 + (margin * i);
	var string_w = string_width(options[i]);
	var string_h = string_height(options[i]);
	
	if (point_in_rectangle(m_x, m_y, x1 - string_w /2, y2 - string_h /2, x1 + string_w, y2 + string_h)){
	draw_set_color(c_red);
	index = i;
	
	if(mouse_check_button_pressed(mb_left)){
		if (index == 1){
		room_goto(Room1); // MUDAR ISSO
		obj_player.x = 32;
		obj_player.y = 315;
		obj_player.vida +=20;
		//obj_personagem.tomardano = true;
		obj_player.estado = scr_player_movendo;
		instance_create_layer(0, 0, "Instances", obj_controle);
		}
		
		if (index == 2){
			game_end();
		}
		
		if (index == 0){
			obj_player.tomardano = true;
			obj_player.estado = scr_player_movendo;
			if file_exists("save.sav") {
                    ini_open("save.sav");
                    // Carrega informações do jogador
                    obj_player.x = ini_read_real("Jogador", "x_atual", 0);
                    obj_player.y = ini_read_real("Jogador", "y_atual", 0);
                    room_goto(ini_read_real("Jogador", "sala_atual", 0));
                    obj_player.vida = ini_read_real("Jogador", "vida_atual", 0);

                    ini_close();
                }
				
		}
	}
	}else {
	draw_set_color(c_white);
	
	
	}
draw_text(x1, y2, options[i]);
}

draw_set_color(c_red);

draw_text(950, 310, "GameOver")
draw_set_color(c_white);

}
