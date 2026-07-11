/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

//Criando um sistema para nosso plataforma dois não sair da room

velh = 4
//essa será nossa velocidade


move_plataforma = function()
{
    x += velh
    //fazendo meu x receber a velocidade do velh
    //criando um if para fazer meu objeto não sair da room
    if(x > room_width )
    {
        //se meu x da room for maior que a largura da room
        velh = -3
        //então ao bater na borda da room no canto direito, ele vai inverter a velocidade
        //fazendo eu ir para esquerda
    }
    if(x < 0)
    {
        //se meu x da room for menor que meu 0 da room ou seja inicio no canto esquerda dela
        velh = 3
        //então ao bater na borda esquerda minha velocidade fica positiva fazendo eu ir pra direita
    }
}