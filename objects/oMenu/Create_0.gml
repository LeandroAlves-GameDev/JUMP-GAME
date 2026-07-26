/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

audio_play_sound(Mariachi_Snooze, 1, 1)
//Criando o menu do jogo

//Criando uma lista de arrays para desenvolver o menu
lista_menu = ["Jogar", "Loja", "Skins", "Recordes"]
//Criando um index para ver onde estou me movendo
index = 0
tempo_sequencia = 0;
tempo_sequencia_maxima = 60; // 1 segundo (a 60 FPS)
estou_em_transicao = false;

// Variável para guardar o ID da Sequence criada
id_sq_transicao = noone;


controle_menu = function()
{
    //Criando os controle dos menu
    if(keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up))
    {
        //Ele vai verificar se estou apertando o W ou seta para cima
        //então ele vai mudar o index 
        if(index != 0)
        {
            index = 0
        }
    }
    if(keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down))
    {
        if(index == 0)
        {
            index = 2
        }
    }
    if(keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left))
    {
        if(index > 1)
        {
            index--
        }
        else if(index == 1)
        {
            index = 3
        }
    }
    if(keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right))
    {
        if(index > 0 && index < 3)
        {
            index++
        }
        else if(index == 3)
        {
            index = 1
        }
    }
    //Criando o if de confirmação
    if (keyboard_check_pressed(vk_enter))
    {
        roda_menu()
        audio_stop_all()
    }
}

//Criando o metodo para rodar o menu
roda_menu = function()
{
    if (!estou_em_transicao)
    { 
       estou_em_transicao = true
         
       id_sq_transicao = layer_sequence_create("sq_nome", room_width / 2, room_height / 2, sq_transicao2);
       //criando um metodo de switch
       switch (index) 
       {
           case 0:
           {
               global.sala_destino = rm_jogo
           }
           break
           case 1:
           {
              global.sala_destino = rm_recorde
           }
           break
           case 2:
           {
               global.sala_destino = rm_skins
           }
           break
           case 3:
           {
                global.sala_destino = rm_loja
               
           }
           break
       }
    }    
}

desenha_menu = function()
{
    //Criando uma variavel temporaria para guardar a coordenada
    var coordx = 90
    var coordy = 240
    var espaco = 60
    
    draw_sprite(spr_menu_base, 0, coordx, coordy)
    
    if(index = 0)
    {
     draw_set_color(c_purple)    
     draw_sprite(spr_placa_menu, 0, coordx, coordy - 95)
     //Criando o texto jogar
     draw_set_font(fnt_menu)
     draw_set_halign(fa_center)
     draw_set_valign(fa_middle)
     draw_text(coordx, coordy - 95, "Jogar")
     draw_set_color(c_white)     
    }
    else
    {
     
     draw_sprite(spr_placa_menu, 0, coordx, coordy - 95)
     //Criando o texto jogar
     draw_set_font(fnt_menu)
     draw_set_halign(fa_center)
     draw_set_valign(fa_middle)
     draw_text(coordx, coordy - 95, "Jogar")  
     draw_set_color(c_white)    
    }
    
    //Criando os desenhos das placas loja, skin, Recordes
    if(index = 1)
    {
        draw_sprite_ext(spr_placa_record, 0, coordx, coordy + 40, 1.8, 1.8, 0, c_white, 1)
    }
    else 
    {
    	draw_sprite_ext(spr_placa_record, 0, coordx, coordy + 40, 1.5, 1.5, 0, c_white, 1)
    }
    if(index = 2)
    {
        draw_sprite_ext(spr_placa_skin, 0, coordx + espaco, coordy + 40, 1.8, 1.8, 0, c_white, 1)
    }
    else 
    {
        draw_sprite_ext(spr_placa_skin, 0, coordx + espaco, coordy + 40, 1.5, 1.5, 0, c_white, 1)	
    }
    if(index = 3)
    {
        draw_sprite_ext(spr_placa_loja, 0, coordx - espaco, coordy + 45, 1.8, 1.8, 0, c_white, 1)
    }
    else 
    {
    	draw_sprite_ext(spr_placa_loja, 0, coordx - espaco, coordy + 45, 1.5, 1.5, 0, c_white, 1)
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
