import 'package:flutter/material.dart';

class HistoriaParoquiaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('História da Paróquia'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0), // Cantos arredondados
          boxShadow: [ // Adicionando uma sombra
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // Altere o deslocamento vertical conforme necessário
            ),
          ],
        ),
        margin: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleWithImage(
                    'Paróquia São Santo Antonio do Limão',
                    '''


A história da Paróquia Santo Antônio do Limão confunde-se com a história do próprio bairro. No início do século XIX o Bairro do Limão era um sítio estabelecido numa várzea, quase sempre inundada pela cheia do Rio Anhembi, atualmente Tietê. O local era praticamente desabitado, possuía então, apenas uma escola, uma capela e aproximadamente dez moradias.

 

1933 A Paróquia Santo Antônio nasce, porque muitos fiéis membros da Comunidade encaminharam um pedido ao Arcebispo Metropolitano da Arquidiocese de São Paulo, na época Dom Duarte Leopoldo e Silva, solicitando primeiramente a construção da Capela, e posteriormente da Igreja como Paróquia. Primeiramente se adquiriu o terreno, uma gleba com área de 10.000 m², situado hoje na Avenida Professor Celestino Bourroul, onde se construiu a antiga Capela, chamada de Santa Cruz, isso em 1933. O terreno foi adquirido pelos moradores do bairro que fizeram uma arrecadação entre os católicos. Era uma Capela pequena. Posteriormente mudou-se o nome para Capela Santo Antônio, pertencente à Paróquia São João Evangelista. A Capela nesta época já possuía muitos fiéis e também realidades tais como: Associação de Santo Antonio, os Vicentinos e o Sagrado Coração de Jesus.
 

1939 Após insistentes pedidos da Comunidade, Dom José Gaspar da Fonseca e Silva assinou o decreto de criação em 19/11/1939, conforme registro de decretos das paróquias da Arquidiocese de São Paulo 1911-1953, folhas 45v-47, em 13 de novembro de 1939. Na sua criação os limites territoriais da Paróquia eram: com a Paróquia Nossa Senhora do Ó, começa no ponto do lançamento riacho Cabuçu para o rio Tietê, sobe pelo dito córrego Cabuçu seguindo este curso d’agua até atingir a fonte na estrada de Itaberaba. Com a Paróquia de Tremembé: segue a direita pela entrada de Itaberaba até atingir a sua confluência com as estradas de parada pinto e Imirim. Com a Paróquia da Casa Verde: segue pela estrada do Imirim até encontrar a estrada ou Avenida Carmem, entra na via Matilde e depois na Rua Zilda, segue por esta até o Rio Mandaqui. Segue por este até alcançar a estrada do limoeiro, segue pela dita estrada até a ponte sobre o riacho ou córrego Manuel Francisco, que divide as propriedades Mazzeti e Tereza Aranha. Segue por este córrego até o rio Tietê. Com a Paróquia da Barra Funda: pelo rio Tietê, no trecho compreendido entre as foces dos riachos Manuel Francisco e Água Branca. Com a Paróquia de Água Branca: no trecho compreendido entre Flores da Água Branca e Cabuçu. No mesmo decreto, já foi nomeado o primeiro Pároco para a nova Paróquia de Santo Antônio do Bairro Limão: o então padre, Monsenhor Vitorino Gandara Mendes, que assumiu a Paróquia com todos os seus direitos e deveres, com prazo indeterminado, conforme provisão de Vigário nº 01200, confirmada em 18 de janeiro de 1975.
 

1944, Monsenhor Vitorino, Dona Bibi e Dona Rita Todere fundam o Coral Santa Cecília.
 

1956 A estrutura física da Igreja ficou pronta entre os anos de 1955/1956, faltando apenas o reboco e pintura na parte externa. No lugar da antiga igrejinha se construiu um Cinema chamado de Cine Ozanan. A finalidade do cinema, segundo os depoimentos, era o de unir a Comunidade e ser um ponto de diversão para as famílias. Terminada a construção da Igreja, começou a construção do Salão paroquial, todo em alvenaria, e também da casa paroquial, que é em cima do salão. Novamente, Monsenhor Vitorino convocou a comunidade para fazerem quermesses, doações, eventos para arrecadar os fundos necessários. Muitas eram as famílias tradicionais que ajudavam o Padre. As quermesses eram realizadas na rua que fica em frente à Igreja. Esta rua era fechada para a festa, que tinha de tudo, comidas típicas, bebida, artesanatos, danças. A Comunidade participava da festa com alegria e grande contentamento.
 

1978 Monsenhor Vitorino veio a falecer em 1978. Foram 40 anos de seu Ministério sacerdotal dedicados a Paróquia Santo Antônio. Após o falecimento do Monsenhor Vitorino, toma posse na Paróquia em 1981 o Padre Marcos Michalak, e logo após o Pe. Michel. O período em que estiveram no governo da Paróquia foi relativamente curto, estimado em 07 anos.
 

1986 Em 07 de março de 1986, conforme ato de provisão toma posse como Pároco da Paróquia Santo Antônio do bairro Limão, ao Reverendo Pe. Antônio Carlos Rossi Keller. Sua primeira reunião com o CPP aconteceu em vinte e oito de maio de 1986, na oportunidade pôde conhecer todas as realidades da Paróquia, além dos representantes do Conselho. Nesta mesma data Pe. Antônio formou a primeira equipe de Administração e Finanças. Em julho de 1986 fez a eleição do novo Conselho paroquial.
 

1989 No ano de 1989 celebrou-se o cinqüentenário da fundação da Paróquia. No dia 19 de novembro organizou-se uma grande festa, com a Dedicação do Altar e da Igreja foi realizada uma Solene celebração da Eucaristia, presidida pelo então Arcebispo de São Paulo, Emmª Cardeal Arcebispo, Dom Paulo Evaristo Arns. A celebração serviu também para serem postas sobre o altar as relíquias dos santos: Santa Maria Goretti, Santo Ambrósio e Santo Antônio de Pádua. No dia 19 de novembro a celebração foi presidida pelo Emmª Cardeal Arcebispo de São Paulo, D. Paulo Evaristo Arns, em Missa Solene de Dedicação da Igreja e do Altar.

2008 O Santo Padre o Papa Bento XVI em 11/06/2008 nomeia Pe. Antônio Carlos para Bispo da Diocese de Frederico Westphalen, quando a Comunidade passa então a rezar e pedir a Deus um novo pastor para estar à sua frente conduzindo-a em sua caminhada. Dom Joaquim Justino Carreira, Bispo Auxiliar da Arquidiocese de São Paulo e Vigário Episcopal da Região Sant'ana (na época), em 13/09/2008 dá posso ao 5º Pároco da Paróquia Santo Antônio do Limão, o Reverendo Padre Gilberto de Oliveira Alves. O Rito de Posso foi realizado em uma Solene Celebração da Eucaristia, no sábado, às 17hs, na festa da Exaltação da Santa Cruz.

''',

                    'assets/imagens/imagemsj_1.jpg',
                    context,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildImageSlider(context), // Adiciona o slider de imagens abaixo das informações
          ],
        ),
      ),
    );
  }

  Widget _buildTitleWithImage(
      String title, String text, String imagePath, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            _showImageDialog(context, imagePath);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildImageSlider(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildImageItem('assets/imagens/imagemsj_1.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_2.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_3.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_4.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_5.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_6.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_7.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_8.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_9.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_10.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_11.jpg', context),
          _buildImageItem('assets/imagens/imagemsj_12.jpg', context),
        ],
      ),
    );
  }

  Widget _buildImageItem(String imagePath, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          _showImageDialog(context, imagePath);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            imagePath,
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
