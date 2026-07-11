/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_set_font(fnt_pontos)

//Criando o desenha da pontuação
var _x = 32
var _y = 32

draw_text(_x, _y, "Pontos: " + string(global.pontos))

//Criando o desenho de contagem dos açais coletados
var _acai_x = 32
var _acai_y = 107
//80 pixels para baixo, ficando logo abaixo do texto

//Desenha o açaí travado na posição correta do HUD
draw_sprite_ext(spr_coletavel, 2, _acai_x + 10, _acai_y, 3, 3, 0, c_white, 1)

//Criando um texto indicando a quantidade que coletei de açais
draw_text(_x + 32, _y + 45, global.acai_coletado)