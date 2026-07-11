/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Criando um alvo para a camera acompanhar 
alvo = oPlayer


//Criando o sistema de camera do jogo por metodo
cam_y = y
cam_x = 0

camera = function()
{
    if (instance_exists(alvo)) 
    {
       //Se a posição Y de destino da câmera for maior que o alvo.y (player subiu)
       if(cam_y > alvo.y)
       {
           //Então a posição Y de destino da câmera acompanha a altura do player
           cam_y = alvo.y
       }   
       //iremos usar um camera_set_view_pos onde ele recebe o parametro da camera que foi viewport criado
       //ele recebe o X da camera que será zero e o y que se refere ao meu cam_y - 160 ou seja
       //meu cam.y subindo
       camera_set_view_pos(view_camera[0], 0, cam_y - 160)
       
       //se meu alvo.y for maior que meu camera_get_view_y que retorna o proprio y da camera
       if(alvo.y > camera_get_view_y(view_camera[0]) + 380)
       {
           global.acai_coletado = 0
           global.pontos = 0
           //ele reiniciara o jogo
           game_restart()
       }
    }
}