# Apps Didáticos em MATLAB  
**Sinais, Sistemas e Controle Digital**

Este repositório reúne aplicativos desenvolvidos no **MATLAB App Designer** com finalidade didática, voltados ao apoio no ensino e aprendizagem de conceitos de:

- Sinais e Sistemas
- Processamento Digital de Sinais
- Fundamentos de Controle
- Controle Digital.

Os aplicativos priorizam **visualização interativa**, permitindo que estudantes explorem conceitos abstratos de forma intuitiva e experimental.

---

## Objetivo

O propósito principal destes apps é **auxiliar a compreensão conceitual**, permitindo que o usuário:

- Visualize conceitos matemáticos em tempo real  
- Experimente parâmetros e observe efeitos imediatos  
- Conecte teoria com comportamento prático de sistemas.

---

## Aplicativos Disponíveis

### Bode Demo

Aplicativo interativo para exploração de **diagramas de Bode** e sua relação com a resposta temporal.

#### Funcionalidades:

- Seleção de diferentes tipos de filtros
- Ajuste de frequência do sinal de entrada
- Visualização simultânea:
  - Diagrama de magnitude e fase
  - Sinal senoidal de entrada
  - Sinal de saída correspondente.

#### Objetivo didático:

Demonstrar como a resposta em frequência se manifesta diretamente na **atenuação e defasagem** de sinais senoidais.

---

### zPlane Demo

Aplicativo para estudo do **mapeamento do plano contínuo (s)** para o **plano discreto (z)**.

#### Métodos de discretização incluídos:

- Transformada Z exata
- Euler Forward
- Euler Backward
- Tustin (bilinear).

#### Funcionalidades:

- Inserção interativa de polos e zeros no plano s
- Visualização imediata do mapeamento no plano z
- Comparação entre diferentes métodos de discretização.


#### Objetivo didático:

Permitir a compreensão visual de como diferentes métodos alteram:

- Estabilidade
- Localização de polos
- Dinâmica do sistema discretizado.

---

### PID Demo

Simulação de um sistema de pêndulo invertido no carrinho (Cartpole) controlado por PID ajustável.

#### Funcionalidades

- Plot do pêndulo evoluindo no tempo
- Sliders de ajuste dos ganhos proporcional, derivativo e integrativo
- Botão para iniciar simulação.

#### Objetivo didático

Proporcionar ao usuário uma interface rápida para o ajuste _ad hoc_ do controlador PID até que o pêndulo possa ser equilibrado.


---

## Requisitos

- MATLAB (versão com suporte ao **App Designer**)
- Toolboxes:
  - Control System Toolbox
  - Signal Processing Toolbox (recomendado).

---

## Uso

1. Abra o arquivo `.mlapp` desejado no MATLAB
2. Execute o aplicativo
3. Explore os parâmetros e observe os resultados em tempo real

## Instalação dos Aplicativos

Os aplicativos podem ser utilizados de duas formas:

1. Executando diretamente a partir do código fonte (`.mlapp`)
2. Instalando a versão compilada (`.mlappinstall`)

---

##  Opção 1 — Executar a partir do arquivo fonte (.mlapp)

Esta é a forma mais simples e indicada para uso acadêmico ou para quem deseja modificar o código.

### Passos:

1. Clone ou baixe este repositório
2. Abra o MATLAB
3. Navegue até a pasta do app desejado
4. Abra o arquivo `.mlapp`
5. Clique em **Run**

### Observações:

- O App Designer abrirá o aplicativo em modo executável
- O código pode ser visualizado e editado normalmente
- Requer licenças das toolboxes utilizadas pelo app

---

## Opção 2 — Instalar a versão compilada (.mlappinstall)

Esta opção é recomendada para distribuição a alunos, pois:

- Não expõe o código fonte
- Permite instalação com um clique
- Integra o app à aba **APPS** do MATLAB

---

### Como compilar o aplicativo

Se você deseja gerar o pacote instalável:

1. Abra o arquivo `.mlapp` no App Designer
2. Clique em:

   **Share → MATLAB App**

3. Configure:

   - Nome do aplicativo
   - Ícone (opcional)
   - Arquivos adicionais necessários

4. Clique em **Package**

Isso irá gerar um arquivo:

---
## Status do Projeto

✔ Estrutura inicial criada  
✔ Três aplicativos implementados  
Novos apps didáticos em desenvolvimento
