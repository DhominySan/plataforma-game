/// @description Insert description here
event_inherited();

if vida > 0{
// colidir com a parede inimigo, muda a direção
if place_meeting(x,y, obj_parede_inimigo){
	if direc == 0{
	direc = 1;
	}else if direc ==1{
	direc = 0;
	}
}

// andando para direita
if direc == 0{
	sprite_index = spr_pombo_d;
	x += veloc;
} // andar para esquerda
else if direc ==1{
	sprite_index = spr_pombo_e;
	x -= veloc;
}

if vida <=0{
	instance_destroy();
}
}