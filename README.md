# Fatasmas

Repositório do jogo desenvolvido para a matéria de Inteligência Artificial para Jogos, ministrado pelo professor [Andre Maurício Campos](https://sigaa.ufrn.br/sigaa/public/docente/portal.jsf?siape=1363515) para o Bacharelado de Tecnologia da Informação na UFRN

## Antes de mais nada 
### Pré requisitos
É necessária a versão 4.3 do Godot para poder abrir o projeto do jogo
É necessário o Obsidian para abrir os arquivos da pasta Vault

## Construido com :construction_worker:
* [Godot 4.3](https://godotengine.org/download/archive/4.3-stable) - Motor gráfico
* [Obidian](https://obsidian.md/download) - Gestor de arquivos de produtividade

## Autores
* Carlos Eduardo de Souza Andrade 🎨 - *Artista e programador*
* Marcos Arthur da Silva Melo 😎 - *Programador*

## Funcionamento do inimigo ⚙️
O inimigo utiliza uma árvore de comportamento que segue o jogador sempre que ele entrar na área dele.

Caso o inimigo passe para outra área, ele começará a pertencer a essa nova área.

Quando ele chega perto do jogador, ele causa dano, mas caso sofra dano, ele vai ficar stunado.

Para seguir o jogador, é implementado um algoritmo de seek utilizando conceitos de steering behavior, onde a direção do inimigo não muda automaticamente, mas vai sendo atualizada com base na direção anterior que o inimigo estava seguindo e para onde ele vai.

Ao chegar no jogador, o inimigo altera o algoritmo para um de arrive, on a sua velocidade vai diminuindo a medida que ele se aproxima do jogador, de modo que zera, quando ele o alcança completamente.

Abaixo está uma imagem da ávore de comportamento:

![Árvore de comportamente](scripts/AI/Árvore%20de%20comportamento%20do%20inimigo.png)


## Licença :cop:
Não licenciado

## Reconhecimentos :two_men_holding_hands:

> *"I've seen things, you people wouldn't believe, hmmm.
... attack ships on fire off the shoulder of Orion.
I've watched see Beams glitter in the dark near the Tannhauser Gate.
All those moments, will be lost in time like tears in rain..."
["... time to die ..."]* 
>
> __- Roy Batty__
