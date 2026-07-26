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

controla_loja = function()
{
    
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")))
    {
        if (opcao_selecionada == 1) opcao_selecionada = 0;
    }
    
    if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")))
    {
        if (opcao_selecionada == 0) opcao_selecionada = 1;
    }
    
    
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
    {
        if (opcao_selecionada < 2) opcao_selecionada = 2;
    }
    
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
    {
        if (opcao_selecionada == 2) opcao_selecionada = 0;
    }

    
    if (keyboard_check_pressed(vk_enter))
    {
        if (opcao_selecionada == 0)
        {
            compra_skin(0);
        }
        else if (opcao_selecionada == 1)
        {
            compra_skin(1);
        }
        else if (opcao_selecionada == 2)
        {
            volta_menu();
        }
    }
}


opcao_selecionada = 0; // 0 = Skin Esquerda, 1 = Skin Direita, 2 = Voltar

desenha_loja = function()
{
    var coordx = 90;
    var coordy = 240;
    
    // Escalas de zoom para a placa selecionada
    var escala_skin1  = (opcao_selecionada == 0) ? 1.2 : 1.0;
    var escala_skin2  = (opcao_selecionada == 1) ? 1.2 : 1.0;
    var escala_voltar = (opcao_selecionada == 2) ? 2.1 : 1.8;
    
    draw_sprite_ext(spr_base_loja, 0, coordx, coordy + 40, 0.9, 0.9, 0, c_white, 1);
    
    draw_set_font(fnt_record);
    draw_set_color(c_white);     
    draw_text(coordx - 55, coordy - 210, global.acai_total);
    draw_sprite_ext(spr_coletavel, 2, coordx - 70, coordy - 195, 1.5, 1.5, 0, c_white, 1);
    
    var cor_skin1 = global.skin_comprada[0] ? c_white : c_dkgray;
    draw_sprite_ext(spr_placa_loja_skin_1, 0, coordx - 40, coordy - 100, escala_skin1, escala_skin1, 0, c_white, 1);
    draw_sprite_ext(spr_player_be, 0, coordx - 40, coordy - 125, escala_skin1, escala_skin1, 0, cor_skin1, 1);
    
    if (global.skin_comprada[0]) 
    {
        //draw_text(coordx - 55, coordy - 70, "COMPRADO");
    } 
    else 
    {
        draw_text(coordx - 55, coordy - 100, string(global.skin_preco[0]));
    }

    var cor_skin2 = global.skin_comprada[1] ? c_white : c_dkgray;
    draw_sprite_ext(spr_placa_loja_skin, 0, coordx + 35, coordy - 70, escala_skin2, escala_skin2, 0, c_white, 1);
    draw_sprite_ext(spr_player_al, 0, coordx + 45, coordy - 95, escala_skin2, escala_skin2, 0, cor_skin2, 1);
    
    if (global.skin_comprada[1]) 
    {
        //draw_text(coordx + 30, coordy - 40, "COMPRADO");
    } 
    else 
    {
        draw_text(coordx + 30, coordy - 70, string(global.skin_preco[1]));
    }

    draw_sprite_ext(spr_placa_voltar, 0, coordx, coordy + 40, escala_voltar, escala_voltar, 0, c_white, 1);
}

compra_skin = function(index_skin)
{
    // Só tenta comprar se a skin ainda NÃO foi comprada
    if (!global.skin_comprada[index_skin])
    {
        if (global.acai_total >= global.skin_preco[index_skin])
        {
            global.acai_total -= global.skin_preco[index_skin];
            global.skin_comprada[index_skin] = true; // Salva como comprada na memória global!
        }
    }
}
