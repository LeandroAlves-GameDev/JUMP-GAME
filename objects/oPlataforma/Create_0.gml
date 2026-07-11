/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// 1. Você está criando a função/método e dando o nome de 'cria_plataformas' para ela.
cria_plataformas = function()
{
    // 2. Aqui você descobre a ALTURA total da sua tela de jogo (ex: 720 pixels) 
    // e guarda essa informação dentro da caixinha 'cam_height'.
    var cam_height = camera_get_view_height(view_camera[0])
    
    // 3. Uma 'margem' de segurança de 60 pixels. Ela serve para a plataforma 
    // não sumir ou aparecer colada na borda da tela.
    var marg = 60
    
    // 4. A GRANDE PERGUNTA (A Condição):
    // camera_get_view_y(view_camera[0]) = Pega onde está o TOPO da tela.
    // + cam_height = Soma a altura da tela (agora chegamos no FUNDO da tela).
    // + marg = Soma mais 60 pixels para baixo (uma linha invisível abaixo do fundo da tela).
    // Se essa linha invisível for menor que o Y da plataforma (< y), significa: 
    // "Esta plataforma ficou para trás e sumiu completamente por baixo da tela!"
    if(camera_get_view_y(view_camera[0]) + cam_height + marg < y)
    {
        // 5. Como ela sumiu lá embaixo, ela se auto-destrói para não pesar no jogo.
        instance_destroy()
        
        // 6. O jogo sorteia (choose) qual tipo de plataforma vai nascer agora,
        // escolhendo aleatoriamente entre a normal, a 2 ou a 3.
        var obj = choose(oPlataforma, oPlataforma3, oPlataforma2, oPlataforma3)
        
        // 7. Sorteia uma posição horizontal (X) aleatória na tela, mas respeita as bordas
        // para a plataforma não nascer cortada ou metade para fora do mapa.
        var _x = random_range(sprite_width/2, room_width - sprite_width/2)
        
        // 8. O NASCIMENTO LÁ NO TOPO:
        // Ele cria o objeto sorteado no X aleatório.
        // A altura (Y) é calculada pegando a posição onde o jogo começou (ystart),
        // jogando lá para cima baseado na altura da câmera e na margem.
        instance_create_layer(_x, ystart - cam_height - marg, "Plataformas", obj)
        var _chance = random_range(0, 100)
        if(_chance <= 30)
        {
           var novo_acai = instance_create_layer(_x, ystart - cam_height - marg - 15, layer, oAcai)
           novo_acai.image_index = choose(0, 0, 0, 0, 0, 0, 1, 2) 
        }
    }
}