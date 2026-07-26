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

//criando um sistema de navegação
opcao_selecionada = 0

//Criando um metodo para controlar a navegação das skins
controla_skins = function()
{
    // Navegação para Cima
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
    {
        if (opcao_selecionada > 0)
        {
            opcao_selecionada--;
        }
    }
    
    // Navegação para Baixo
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
    {
        if (opcao_selecionada < 3)
        {
            opcao_selecionada++;
        } 
    }
    
    // Pressionou ENTER
    if (keyboard_check_pressed(vk_enter))
    {
        // Se for o botão Voltar (Opção 3)
        if (opcao_selecionada == 3)
        {
            volta_menu();
        }
        else 
        {
            // Descobre se a skin atual pode ser equipada:
            // É a Skin 0 (Grátis) OU está comprada no array?
            var pode_equipar = (opcao_selecionada == 0) || global.skin_comprada[opcao_selecionada - 1];
            
            if (pode_equipar)
            {
                // Equipou a skin selecionada!
                global.skin_equipada = opcao_selecionada;
            }
            else
            {
                // Aqui ela NÃO foi comprada ainda (bloqueada).
                // Não equipa nada! (Você pode tocar um som de erro aqui se quiser)
            }
        }
    }
}

//Criando uma lista de skins
lista_skins = [spr_player_case, spr_player_be, spr_player_al]

desenha_skins = function()
{
    //Criando uma variavel temporaria para guardar a coordenada
    var coordx = 90
    var coordy = 240
    var espaco = 60
    
    draw_sprite_ext(spr_base_loja, 0, coordx + 5, coordy + 40, 0.9, 0.9, 0, c_white, 1)
    
    var escala_voltar = (opcao_selecionada == 3) ? 2.1 : 1.8;
    draw_sprite_ext(spr_placa_voltar, 0, coordx, coordy + 40, escala_voltar, escala_voltar, 0, c_white, 1)
    
    for (var i = 0; i < 3; i++) 
    {
       var escala = (opcao_selecionada == i) ? 1.2 : 1.0;
       var pos_y  = coordy - 160 + (i * espaco);
       
       var esta_liberada = (i == 0) || global.skin_comprada[i - 1];
       
       var cor_skin = c_dkgray
        
       if (global.skin_equipada == i)
       {
           cor_skin = c_white; // Skin equipada sempre fica colorida!
       }
       else if (esta_liberada && opcao_selecionada == i)
       {
           cor_skin = c_white; // Skin com o cursor em cima fica colorida!
       }
       
       draw_sprite_ext(spr_placa_skins, 0, coordx, pos_y, escala, escala, 0, c_white, 1);
       
       draw_sprite_ext(lista_skins[i], 0, coordx + 3, pos_y - 25, escala, escala, 0, cor_skin, 1);
        
    }
    
    ////Criando os desenhos das sprites
    //draw_sprite(spr_player_al, 0, coordx + 45, coordy - 95)
    //draw_sprite(spr_player_be, 0, coordx - 40, coordy - 125)
    //draw_sprite(spr_player_case, 0, coordx - 40, coordy - 125)
}
