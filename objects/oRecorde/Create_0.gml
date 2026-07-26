/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

tempo_sequencia = 0;
tempo_sequencia_maxima = 60; // 1 segundo (a 60 FPS)
estou_em_transicao = false;

// Variável para guardar o ID da Sequence criada
id_sq_transicao = noone;

//Criando o sistema de enter para voltar para o menu
volta_menu = function()
{
        
       if(keyboard_check_pressed(vk_enter))
       {
           if (!estou_em_transicao)
           { 
              estou_em_transicao = true
                
              id_sq_transicao = layer_sequence_create("sq_nome", room_width / 2, room_height / 2, sq_transicao2)
              global.sala_destino = rm_inicio
           }
        }    
}


desenha_recorde = function()
{
    //Criando uma variavel temporaria para guardar a coordenada
    var coordx = 90
    var coordy = 240
    var espaco = 60
    
    draw_sprite(spr_menu_base, 0, coordx, coordy)
    
    draw_set_color(c_purple)    
    draw_sprite(spr_placa_menu, 0, coordx, coordy - 90)
     //Criando o texto jogar
    draw_set_font(fnt_record)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(coordx, coordy - 95, "HIGHSCORE")
    
    
    draw_set_color(c_white)     
    draw_text(coordx, coordy - 80, global.recorde_maximo)
    
    draw_sprite_ext(spr_placa_voltar, 0, coordx, coordy + 40, 1.8, 1.8, 0, c_white, 1)
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
