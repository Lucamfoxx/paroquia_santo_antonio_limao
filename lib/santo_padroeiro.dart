import 'package:flutter/material.dart';

class SantoPadroeiro extends StatefulWidget {
  @override
  _SantoPadroeiroState createState() => _SantoPadroeiroState();
}

class _SantoPadroeiroState extends State<SantoPadroeiro> {
  double _fontSize = 16.0;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize <= 2.0 ? 2.0 : _fontSize - 2.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Santo Padroeiro - Santo Antônio'),
        actions: [
          IconButton(
            icon: Icon(Icons.zoom_out),
            onPressed: _decreaseFontSize,
            tooltip: 'Diminuir Tamanho da Fonte',
          ),
          IconButton(
            icon: Icon(Icons.zoom_in),
            onPressed: _increaseFontSize,
            tooltip: 'Aumentar Tamanho da Fonte',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/logo2.png', // Caminho para a imagem logo2.png
                    fit: BoxFit.fill, // Preenche toda a área disponível
                  ),
                  Text(
                    'Santo Antônio',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Santo Antônio, também conhecido como Santo Antônio de Pádua, é um dos santos mais venerados e populares da Igreja Católica. Sua vida é marcada por devoção, milagres e um profundo amor pelo próximo.',
                    style: TextStyle(
                      fontSize: _fontSize,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildExpansibleButtons(_fontSize),
                  SizedBox(height: 20),
                  Text(
                    'Sua Vida',
                    style: TextStyle(
                      fontSize: _fontSize + 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nascido em Lisboa, Portugal, no final do século XII, Antônio de Pádua dedicou sua vida ao serviço de Deus desde tenra idade. Ingressou na Ordem dos Agostinianos aos 15 anos e, posteriormente, na Ordem dos Franciscanos, onde adotou o nome de Antônio em homenagem a Santo Antão.',
                    style: TextStyle(
                      fontSize: _fontSize,
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'Legado e Devoção Contínua',
                    style: TextStyle(
                      fontSize: _fontSize + 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mesmo após sua morte, o legado de Santo Antônio continua a inspirar milhões de pessoas em todo o mundo. Sua intercessão é buscada por aqueles que buscam ajuda em momentos de dificuldade e sua devoção permanece viva na Igreja Católica.',
                    style: TextStyle(
                      fontSize: _fontSize,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Fotos de Santo Antônio',
                    style: TextStyle(
                      fontSize: _fontSize + 4,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildClickablePhotoWidget(context, 'assets/santo_antônio_1.jpg'),
                      _buildClickablePhotoWidget(context, 'assets/santo_antônio_2.jpg'),
                      _buildClickablePhotoWidget(context, 'assets/santo_antônio_3.jpg'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildClickablePhotoWidget(context, 'assets/santo_antônio_4.jpg'),
                      _buildClickablePhotoWidget(context, 'assets/santo_antônio_5.jpg'),
                      _buildClickablePhotoWidget(context, 'assets/santo_antônio_6.jpg'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mais sobre Santo Antônio',
                    style: TextStyle(
                      fontSize: _fontSize + 4,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Além dos aspectos mencionados anteriormente, Santo Antônio é lembrado por sua humildade, caridade e dedicação aos menos favorecidos. Sua influência se estende além do âmbito religioso, impactando áreas como a cultura, a arte e a música. Suas orações e intercessões são buscadas por fiéis em todo o mundo, tornando-o um dos santos mais queridos e invocados na tradição católica.',
                    style: TextStyle(
                      fontSize: _fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansibleButtons(double fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildExpansibleButton('Os Pássaros e a Plantação', '''
O pai de Santo Antônio, Martinho de Bulhões, gostava de ir a uma fazenda que possuía nos arredores de Lisboa. Um dia, levou o filho com ele. Ocorre que insaciáveis bandos de pássaros desciam continuamente para bicar os grãos de trigo. Era necessário espantá-los para impedir grave dano à colheita. Martinho encarregou o garoto de manter longe os pequenos ladrões. 
O pai se foi e Fernando permaneceu correndo de cá para lá no campo. Em pouco tempo, começou a se aborrecer com aquela ocupação. Não muito longe, uma capelinha rústica o convidava à oração. Mas o pai o mandara enxotar os passarinhos. Gritou então aos pássaros, convidando-os a segui-lo para dentro de uma sala da fazenda. Obedientes os pássaros entraram. Quando todos estavam dentro, Fernando fechou as janelas e as portas, e foi tranquilamente fazer sua visita ao Senhor. Retornando o pai veio procurá-lo. Andou pelo campo, chamando-o, mas não o encontrou. Preocupado, dirigiu-se à capela e o descobriu, todo absorto na prece. Fernando tomou o pai pelas mãos e o conduziu ao salão repleto dos voos e dos cantos dos graciosos prisioneiros. Abriu a porta e, a um sinal seu, os pássaros, em bando, retornaram os livres caminhos do espaço.
''',fontSize),
        _buildExpansibleButton('O Jumento se Curva Diante da Eucaristia', '''
Durante uma pregação, cujo tema era a Eucaristia, levantou-se um homem
dizendo: “Eu acreditarei que Cristo está realmente presente na Hóstia
Consagrada quando vir o meu jumento ajoelhar-se diante da custódia com o
Santíssimo. Sacramento”. O Santo aceitou o desafio. 
Deixaram o pobre jumento três dias sem comer. No momento e lugar pré-estabelecido,
apresentou-se Antônio com a custódia e o herege com o seu jumento que já
não aguentava manter-se em pé devido ao forçado jejum. 
Mesmo meio-morto de fome, deixou de lado a apetitosa pastagem que lhe era
oferecida pelo seu dono, para se ajoelhar diante do Santíssimo Sacramento.

''',fontSize),
        _buildExpansibleButton('Livro Roubado', '''
Um dia o frei descobriu que um noviço havia fugido do mosteiro e levado
com ele seus comentários sobre o Livro dos Salmos. Então, rezou para o
retorno de ambos. Em pouco tempo, o jovem arrependido voltou para a
vida religiosa, acompanhado, é claro, dos manuscritos.
''',fontSize),
        _buildExpansibleButton('Sermão aos Peixes', '''Santo Antônio foi pregar na cidade de Rímini, onde dominavam os hereges
que resolveram não ouvi-lo em hipótese alguma. Frei Antônio subiu ao
púlpito e quase todos se retiraram e fugiram. Não esmoreceu e pregou aos
que tinham ficado. Inflamado pela inspiração Divina, falou com tal energia
que os hereges presentes, reconheceram seus erros e resolveram mudar de
vida. Mas o Santo não estava contente com o resultado parcial Retirou-se
para orar em solidão, pedindo ao Altíssimo que toda a cidade se
convertesse. Saindo do retiro, foi direto às praias do Mar Adriático e, em
altos brados clamou aos peixes que o ouvissem e celebrassem com louvores
ao seu supremo Criador, já que os homens ingratos não queriam fazê-lo.
Diante daquela voz imperiosa, apareceram logo os incontáveis habitantes
das águas, e se distribuíram ordenadamente, cada qual com os de sua
espécie e tamanho. Os peixes ergueram suas cabeças da água e ficaram
longo tempo imóveis, a ouvi-lo.''',fontSize),
        _buildExpansibleButton('O Prato Envenenado', '''Alguns hereges resolveram matar Santo Antônio, envenenando-o.
Convidaram-no para comer com eles, dando como pretexto debater sobre
alguns pontos da Fé. Santo Antônio sempre aceitava comparecer a esses
debates e polêmicas. Os hereges puseram diante dele, entre outros pratos,
um que continha veneno mortal. Antes que o tocasse, Deus revelou-lhe a
cilada e o Santo, conservando toda a calma, repreendeu os hereges pela
traição. Vendo revelado o intento perverso, os hereges não se abalaram e
responderam cinicamente: “É verdade que esse prato tem veneno, mas nós
o colocamos aí porque desejamos fazer uma experiência: no Evangelho está
escrito que Jesus Cristo disse aos seus discípulos que ainda que tomassem
veneno mortal nenhum mal sofreriam e estamos querendo saber se és de
fato discípulo de Cristo”. Santo Antônio fez o sinal da Cruz sobre aquele
prato e o comeu com apetite, saboreando a comida envenenada como se
fosse alimento saudável, e nada sofreu, deixando mais uma vez os hereges
confusos e assombrados.''',fontSize),
        _buildExpansibleButton('O Milagre da Bilocação ', '''
No domingo de Páscoa enquanto pregava na Catedral, Santo Antônio
lembrou-se de que fora designado para entoar a Aleluia na Missa que se
celebrava naquele momento na Igreja do Convento franciscano. Não
querendo faltar com a obediência e não podendo descer do púlpito, parou
um pouco, calou-se como se estivesse retomando a respiração e, nesse
momento, foi milagrosamente visto no Coro de seu convento, entoando a
Aleluia. Esse prodigioso milagre de bilocação foi assistido e certificado por
muitas testemunhas, espalhando-se a notícia em todos os locais.''',fontSize),
        _buildExpansibleButton('Controle sobre o Tempo', '''Num dia festivo, em Limoges, Santo Antônio pediu licença para pregar numa
igreja paroquial. Como era imensa a sua fama, o povo deslocou-se para o
local, mas o recinto era pequeno para acolher toda aquela gente e foi
obrigado a pregar em praça pública. Mal havia começado o sermão, o céu
escureceu e muitos relâmpagos e trovões anunciavam uma grande
tempestade. O povo, atemorizado, começou a murmurar e já se dispunham a
sair dali em busca de abrigo. Mas Santo Antônio pediu silêncio e, em nome
de Deus, assegurou que não choveria naquele local, recomendando a todos
que ficassem atentos à pregação. Tranquilizados, os fiéis ouviram o sermão
até o fim. Quando se retiravam para suas casas, verificaram com muita
admiração, que embora estivesse perfeitamente seco o local da pregação,
toda a redondeza estava completamente alagada pela chuva da forte
tempestade.''',fontSize),
        _buildExpansibleButton('Santo Antônio Cura um Louco', '''No meio de um sermão de Santo Antônio, entrou um louco e, com voz
alterada e gestos desordenados, perturbava os ouvintes que não
conseguiam prestar atenção nas palavras do pregador. De repente, o louco
disse: “Não sossegarei enquanto aquele homem (e apontou para Santo
Antônio) não me der o cordão que usa na cintura”. O Santo retirou o cordão
e com ele envolveu o louco que foi imediatamente curado.''',fontSize),
        _buildExpansibleButton('Menino Salvo pela Fé', '''Santo Antônio pregava em Briba, quando uma senhora, apressada para
assistir seu sermão, deixou sobre o fogo um caldeirão com água, sem se
lembrar de que seu filho pequeno ficara só em casa. Ao chegar da pregação,
viu com horror que o menino havia caído dentro do caldeirão e que a água
estava fervendo. Bem se pode imaginar os gritos de desespero que deu a
pobre mãe! Não ousava aproximar-se, certa de que encontraria a inocente
vítima horrivelmente queimada e morta. Mas, cheia de fé em Santo
Antônio, invocou-o e quando aproximou-se seu filho estava são e salvo,
brincando e pulando na água fervente, sem que esta lhe queimasse.''',fontSize),
        _buildExpansibleButton('Criada Caminha sob Forte Chuva sem Molhar as Roupas', '''Certo dia, faltando alimentos no convento de Briba, Frei Antônio mandou
que fossem pedir a uma senhora devota, dona de uma grande propriedade,
a esmola de algumas verduras. Apesar de estar chovendo fortemente, a
piedosa senhora ordenou a uma criada que fosse apanhar as verduras na
horta distante da casa. A criada obedeceu contrariada pois chovia muito. Foi
quando se deu conta de que, apesar da chuva torrencial que caía, não
estava molhando nem os pés, nem as roupas que vestia. Chegou à horta,
colheu as verduras, foi entregá-las no convento e retornou à casa
completamente seca. Tanto ela, quanto sua senhora, ficaram assombradas
diante daquele prodígio e não cessaram de contar a todos, os altos
merecimentos do Santo.''',fontSize),
        _buildExpansibleButton('Santo Antônio Ressuscita um Morto', '''Vinha Frei Antônio e um companheiro pelo caminho, voltavam de uma aldeia
carregando grande peso às costas, quando encontraram um carroceiro que
carregava um homem adormecido. O Santo, muito cansado, pediu-lhe por
amor de Deus que levasse alguns víveres que ele e seu companheiro haviam
recebido de esmola para o sustento da comunidade. O carroceiro respondeu
rudemente que não podia fazê-lo porque estava conduzindo um defunto. O
Santo acreditou, rezou pelo descanso eterno da alma do falecido e continuou
seu caminho. Qual não foi o espanto do carroceiro quando, mais tarde, foi
acordar o amigo que supunha adormecido e o encontrou realmente morto!
Confuso e arrependido, foi em busca de Santo Antônio e prostrou-se aos seus
pés, pedindo-lhe humildemente perdão. Frei Antônio se compadeceu do
homem, aproximou-se da carroça e depois de uma curta oração, fez o sinal
da Cruz sobre o cadáver e o ressuscitou.''',fontSize),
        _buildExpansibleButton('Salvou um Homem da Morte por Esmagamento', '''Durante a construção do convento de Leontino, aconteceu o seguinte
milagre: Estava sendo transportada uma grande pedra para o portal da
igreja em uma carroça. Ao ser retirada, caiu sobre o carroceiro
esmagando-o, deixando-o quase morto. Frei Antônio, querendo por
humildade ocultar seu dom de fazer milagres, disse aos presentes que
invocassem o auxílio de São Francisco. Imediatamente o homem ferido
levantou-se perfeitamente são, como se nenhum acidente tivesse ocorrido.''',fontSize),
        _buildExpansibleButton('A Cura de um Menino Paralítico', '''Aproximou-se de Santo Antônio uma mulher trazendo nos braços um filho
paralítico de nascença e rogava em altos brados que o curasse. O Santo
manifestou certo desagrado por aquela forma ruidosa de pedir, mas a
mulher continuou a implorar. Tanto ela pediu e suplicou, que este, afinal,
fez sobre o menino paralítico o “sinal da cruz”, curando-o imediatamente.
Com modéstia, atribuiu o milagre à fé da boa mulher e recomendou-lhe que
não contasse o ocorrido à ninguém enquanto ele fosse vivo.''',fontSize),
        _buildExpansibleButton('O Menino Jesus Aparece para o Santo', '''Certa vez, Santo Antônio precisou de alojamento em Pádua e um senhor
nobre, da família dos Condes de Camposampiero, teve a honra de o acolher
em sua casa. Uma noite, vendo do lado de fora do quarto de Frei Antônio
alguns raios de luz, aproximou-se e viu o Santo segurando nos braços um
gracioso Menino que suavemente o acariciava. Ficou cheio de espanto por
tão extraordinária maravilha. Compreendeu que se tratava do Menino Jesus
que se tornara visível ao Santo para recompensá-lo com celestes
consolações pelas fadigas sofridas. Enquanto ainda observava, o Menino
desapareceu. Saindo do êxtase, Frei Antônio deixou o quarto e dirigiu-se ao
dono da casa, dizendo que sabia que ele o havia observado durante a
aparição. Pediu então com insistência que não revelasse o que tinha visto. O
senhor cumpriu a palavra, somente revelando o fato depois da morte do
Santo. A história o tocara profundamente e todas as vezes que a relatava,
não conseguia reter as lágrimas.''',fontSize),
        _buildExpansibleButton('Reconstituiu um Pé', '''Um jovem chamado Leonardo confessou-se com o Santo e contou-lhe
que, levado pela cólera, havia dado um pontapé em sua mãe. Frei Antônio,
para fazê-lo compreender a gravidade do pecado que cometera, disse-lhe:
“Teu pé bem que merecia ser cortado”. Essas palavras impressionaram tão
fortemente o jovem, que chegando em casa, aterrorizado com o que fizera,
cortou fora o pé. Na hora em que caiu ao chão, fez um ruído tão grande que
sua mãe correu para ver o que estava acontecendo. Horrorizada com a cena
e por saber as razões pelas quais o filho assim procedera, correu em busca
de Frei Antônio, que foi apressadamente à casa do rapaz. Comovido pelo
estado em que o encontrou, quase à beira da morte pelo sangue perdido,
animou-o a ter confiança em Deus. O rapaz e o Santo pegaram o pé cortado,
recolocaram-no e imediatamente foi restaurado. Ficou tão perfeito como se
nunca houvesse sido cortado, com apenas pequena cicatriz no lugar do
golpe para testemunho do grande milagre realizado.''',fontSize),
        _buildExpansibleButton('Morto Falou em Defesa do Pai de Frei Antônio', '''Um rapaz foi assassinado perto da casa de Martinho de Bulhões, pai de
Santo Antônio. Os assassinos levaram o corpo para o quintal de Martinho e
ali o enterraram, sem que o proprietário do terreno soubesse. Mais tarde,
foi descoberto pela Justiça o corpo na casa do infeliz fidalgo e este foi
acusado pelo crime. Diante dos gravíssimos indícios de sua culpa,
permaneceu quinze meses preso e, finalmente, estava sendo julgado e seria
com certeza condenado à morte. Frei Antônio foi misteriosamente avisado
do perigo que ameaçava seu pai. Santo Antônio foi imediatamente pedir ao
Guardião do convento que o deixasse ausentar-se de Pádua por pouco
tempo. Assim que foi autorizado, viu-se transportado num instante à Lisboa,
indo direto ao tribunal e, depois de beijar a mão de seu pai em sinal de
respeito, tomou a sua defesa. Os juízes ficaram impressionados com o
aparecimento daquele inesperado advogado e com a segurança com que
ele falava, mas não se convenceram da inocência do réu, tantas eram as
provas que tinham de sua culpa. Faltando testemunhas de defesa, Santo
Antônio apelou para o depoimento da vítima. Os assistentes, surpresos com
a estranha proposta, começaram a rir. Mas Frei Antônio insistiu e os juízes
levados pela curiosidade, consentiram que ele chamasse o morto como
testemunha da defesa. Chegados à sepultura do falecido, o Santo ordenou
que a abrissem e chamou o frio cadáver em voz alta, ordenando-lhe em
nome de Deus que dissesse aos juízes a verdade sobre o seu assassinato.
Imediatamente o morto levantou-se como se estivesse vivo e respondeu
com voz sonora que Martinho de Bulhões era inocente e não estava
manchado pelo seu sangue. Em seguida, deitou-se na sepultura. Santo
Antônio, depois de se despedir do pai, desapareceu. Ficaram os juízes e a
assistência assombrados com o milagre que acabavam de presenciar. O
nobre Martinho de Bulhões, graças ao seu santo filho, teve sua vida salva.
Os verdadeiros culpados foram descobertos.''',fontSize),
        _buildExpansibleButton('Recupera os Cabelos Arrancados de uma Mulher', '''Em Arezzo vivia um homem nobre, mas tão colérico que quando se
irritava parecia perder o juízo. A esposa, senhora de muito siso e
prudência, teve um dia a infelicidade de proferir umas palavras que
irritaram o marido a tal ponto que ele se atirou sobre ela espancando-a
cruelmente, chegando a lhe arrancar os cabelos. Com os gritos da infeliz,
os vizinhos correram para acudi-la, encontrando-a quase morta na cama.
O marido, depois de serenar, envergonhou-se do que tinha feito e
lembrando-se da fama de Santo Antônio, foi procurá-lo arrependido,
pedindo que o ajudasse. O piedoso Santo foi logo procurar a senhora,
abençoando-a e, fazendo o sinal da Cruz sobre ela, começou a rezar.
Pouco a pouco ela foi recuperando o antigo vigor e, milagrosamente,
quando se ajoelhou aos pés do Santo, renasceu todo o cabelo.''',fontSize),
        _buildExpansibleButton('Conserva um Copo Intacto e Faz Nascer Uvas numa Videira sem Frutos', '''Um soldado espanhol chamado Aleardino, que havia perdido a Fé, chegou à
Pádua no dia do enterro de Santo Antônio. Vangloriando-se de sua
incredulidade, segurou um grande copo de vidro e disse a muitas pessoas
que o censuravam: “Se este copo ficar inteiro depois que eu o atirar àquelas
pedras, acreditarei que esse padre faz milagres”. E atirou o copo com toda a
força, mas ele não se partiu. Renunciou então seus erros publicamente e
quis converter a um amigo também incrédulo. Chegou, pois, ao amigo e lhe
contou todo o acontecido, mostrando-lhe o copo objeto do prodígio. O
amigo ouviu-o com risadas e sinais de desprezo e respondeu: “Não acredito
no que dizes. O que estás dizendo é tão impossível como aquela videira sem
frutos, de repente, ficar carregada de ramos e cachos, e nós, com suas uvas,
fazermos vinho para encher teu copo milagroso!” Mal acabara de falar, a
videira se encheu prodigiosamente de folhas e belos cachos de saborosas
uvas, as quais, espremidas por Aleardino, encheram o copo com seu licor
maravilhoso. Esse copo ainda hoje se conserva no relicário da Basílica de
Santo Antônio, em Pádua.''',fontSize),
        _buildExpansibleButton('Anel Desaparecido do Bispo de Córdoba é Reencontrado', '''Muito devoto de Santo Antônio, o Bispo possuía um anel de estimação.
Certo dia notou a falta dele: ou o tinha perdido, ou o tinham furtado.
Passou-se muito tempo sem que o anel aparecesse. Um dia, estava o Bispo
à mesa com alguns senhores seus parentes, quando casualmente falaram
no poder de Santo Antônio para encontrar bens perdidos. Disse então o
Bispo: “Tenho recebido grandes favores do Santo, mas ele ainda não ouviu
as súplicas que lhe tenho feito para achar um anel que perdi”. Mal tinha
acabado de proferir essas palavras quando o anel desaparecido caiu no
meio da mesa, à vista de todos, sem que ninguém soubesse explicar de
onde veio.''',fontSize),
        _buildExpansibleButton('Ajuda um Bispo a Recuperar Papéis Perdidos', '''O Bispo D. Frei Ambrósio Catarino, grande escritor, estava saindo de Tolosa
e levava na bagagem muitos papéis e apontamentos particulares e também
um livro intitulado “A Glória dos Santos”, para discutir com os hereges.
Depois de caminhar muitos quilômetros, percebeu que haviam caído pelo
caminho três escritos preciosos, frutos de muito trabalho. Com enorme
tristeza, refez o caminho para os encontrar. Procurou-os em vão.
Lembrou-se então de Santo Antônio, dirigiu-lhe uma prece fervorosa,
prometendo que se encontrasse os papéis, acrescentaria ao livro “A Glória
dos Santos” a narração daquela graça de Santo Antônio. Nesse mesmo
instante, aproxima-se dele um desconhecido que lhe pergunta se não havia
perdido uns papéis e, ante a reposta afirmativa do Bispo, entrega-lhe os
papéis tão desejados!''',fontSize),
        _buildExpansibleButton('O Casamento da Jovem', '''Conta-se que uma jovem muito linda, mas cansada de esperar por um noivo,
já desesperada de encontrar marido, pediu ajuda a Santo Antônio. Adquiriu
uma imagem do santo, benzeu-a e todos os dias enfeitava-a com flores que
colhia no jardim. Além disso, orava com regularidade para que Santo Antônio
lhe arranjasse um noivo. Mas, passou-se muito tempo e o noivo não
aparecia. Certa vez, pôs-se a lamentar a ingratidão do santo, chegando
mesmo a ser repreendida pela mãe. E, desapontada, pegou a imagem e, no
auge do desespero, atirou-a pela janela afora. Passava na rua, naquele
momento, um jovem cavaleiro e a imagem o acertou na cabeça. Apanhou-a
intacta e subiu a escada para devolvê-la. Quem o recebeu foi a formosa
donzela. O cavaleiro apaixonou-se por ela e algum tempo depois casaram-se,
naturalmente por milagre do santo. Santo Antônio, rogai por nós!''',fontSize),
      ],
    );
  }

  Widget _buildExpansibleButton(String title, String description, double fontSize) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClickablePhotoWidget(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        _showFullScreenImage(context, imagePath);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        clipBehavior: Clip.antiAlias, // Adiciona um clip para evitar cantos pontiagudos
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (_) => GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: Colors.black,
          child: Center(
            child: InteractiveViewer(
              panEnabled: true, // Enable panning
              boundaryMargin: EdgeInsets.all(20),
              minScale: 0.5,
              maxScale: 2,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
