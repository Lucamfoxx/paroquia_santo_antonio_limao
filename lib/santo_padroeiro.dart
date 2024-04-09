import 'package:flutter/material.dart';

class SantoPadroeiro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Santo Padroeiro - Santo Antônio'),
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
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sua Vida',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nascido em Lisboa, Portugal, no final do século XII, Antônio de Pádua dedicou sua vida ao serviço de Deus desde tenra idade. Ingressou na Ordem dos Agostinianos aos 15 anos e, posteriormente, na Ordem dos Franciscanos, onde adotou o nome de Antônio em homenagem a Santo Antão.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Devoção e Milagres',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Santo Antônio é conhecido por sua profunda devoção a Deus e à Virgem Maria. Sua pregação eloquente e seu exemplo de vida simples e humilde atraíram multidões para ouvir sua mensagem de amor e compaixão. Dentre os muitos milagres atribuídos a Santo Antônio, um dos mais conhecidos é o Milagre do Peixe.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Legado e Devoção Contínua',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mesmo após sua morte, o legado de Santo Antônio continua a inspirar milhões de pessoas em todo o mundo. Sua intercessão é buscada por aqueles que buscam ajuda em momentos de dificuldade e sua devoção permanece viva na Igreja Católica.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Fotos de Santo Antônio',
                    style: TextStyle(
                      fontSize: 20,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Além dos aspectos mencionados anteriormente, Santo Antônio é lembrado por sua humildade, caridade e dedicação aos menos favorecidos. Sua influência se estende além do âmbito religioso, impactando áreas como a cultura, a arte e a música. Suas orações e intercessões são buscadas por fiéis em todo o mundo, tornando-o um dos santos mais queridos e invocados na tradição católica.',
                    style: TextStyle(
                      fontSize: 16,
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
