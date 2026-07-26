/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

minhas_skins = [spr_player_case, spr_player_be, spr_player_al]
sprite_index = minhas_skins[global.skin_equipada]

//Criando uma variavel para nossa velocidade vertical 
velv = 0
velv_max = 9
grav = 0.3
velh = 3

//rodando a musica do jogo
audio_play_sound(snd_music_play, 1, 1)

//Criando um metodo para fazer o sistema de movimentos do player
move_player = function()
{
    var direita, esquerda
    //Se eu apertar a tecla D então vou pra direita 
    direita = keyboard_check(ord("D")) || keyboard_check(vk_right)
    //Se eu apertar a tecla A devo ir pra esquerda
    esquerda = keyboard_check(ord("A")) || keyboard_check(vk_left)
    
    //Se eu apertar direita ou esquerda
    if(direita || esquerda)
    {
        //ele rodará o seguinte calculo
        //direita e esquerda vão definir uma direção sendo direita -1 e esquerda 1
        //o += vai mostrar o resultado do calculo da tecla pressionado e multiplicar pelo velh meu
        //ou seja se eu apertei pra direita mais com menos dará menos fazendo eu ir pra direita
        //se eu apertar esquerda a conta da positivo fazendo eu ir pra esquerda
        x += (direita - esquerda) * velh
    }
    //Criando um metodo de gravidade 
    //minha será somada e igualda grav
    velv += grav
    //ele vai pegar o y da room e transformar na minha velv
    y += velv
    
    //Criando um sistema de colisão que faça eu pular para cima
    //se eu colidir com uma plataforma e velv for maior que zero
    if(place_meeting(x, y + velv, oPlataforma) && velv > 0)
    {
        //rodando o som do pulo
        audio_play_sound(snd_jump, 1, 0)
        //criando uma instacia para o efeito
        instance_create_layer(x, y, layer, oEfeito_case)
        //se eu estou pulando na plataforma então eu ganho pontos
        global.pontos += 5
        //então meu velv será negativado com base no valor do velv_max
        velv = -velv_max
    }
}

//Criando um meto para colidir com meu Açai
colide_coletavel = function()
{
    var _acai_tocado = instance_place(x, y, oAcai);
    if(_acai_tocado)
    {
       //Criando um metodo de switch para nosso açai 
        switch (_acai_tocado.image_index) 
        {
        	case 0:
            {
                global.pontos += 30
                //rodando o som de coleta
                audio_play_sound(snd_pick_up_1, 1, 0)
                global.acai_coletado += 1
            } 
            break;
            case 1:
            {
                global.pontos += 50
                velv = -12
                //rodando o som de coleta
                audio_play_sound(snd_pick_up_1, 1, 0)
                global.acai_coletado += 2
            } 
            break;    
            case 2:
            {
                global.pontos += 100
                velv = -15
                //rodando o som de coleta
                audio_play_sound(snd_pick_up_1, 1, 0)
                global.acai_coletado += 3
            }
            break;    
            
        }
        instance_destroy(_acai_tocado)
    }
}