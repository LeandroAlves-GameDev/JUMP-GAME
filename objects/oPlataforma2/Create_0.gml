/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

//criando uma velocidade para lançar a plataforma para baixo
velv = 0

//Criando uma variavel bool
caindo = false
tempo_para_cair = 60


// 2. O seu método na plataforma fica assim:
cai_plataformas = function()
{
    // Se o player encostar nela (por baixo, por dentro ou por cima)
    if(instance_place(x, y + 1, oPlayer))
    {
        caindo = true; // Ativa o sistema
    }
    
    // Se o sistema foi ativado
    if(caindo == true)
    {
        // Enquanto o tempo não zerar, ela fica parada e o tempo vai diminuindo
        if (tempo_para_cair > 0)
        {
            tempo_para_cair -= 1; 
        }
        else 
        {
            // O tempo zerou! Agora sim ela começa a cair de verdade
            y += velv;
            velv += 0.2;
        }
    }
}