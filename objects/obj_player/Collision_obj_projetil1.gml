/// @description Tomar dano
if alarm[0] <= 0{
	vida -= 1;	
	alarm[0] = inv_tempo;
}

with(other){
	instance_destroy();
}