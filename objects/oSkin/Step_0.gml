/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

controla_skins()

if (estou_em_transicao)
{
    tempo_sequencia++;
    
    // Quando atingir o limite de tempo (tela 100% escura/fechada)
    if (tempo_sequencia >= tempo_sequencia_maxima) 
    {
        // 1. Limpa o tempo e a Sequence
        tempo_sequencia = 0;
        if (layer_sequence_exists("sq_nome", id_sq_transicao))
        {
            layer_sequence_destroy(id_sq_transicao);
        }
        
        // 2. Para a música do menu (se houver)
        //audio_stop_sound(snd_menu);
        
        // 3. Muda para a sala do Jumper escolhida!
        room_goto(global.sala_destino);
    }
}