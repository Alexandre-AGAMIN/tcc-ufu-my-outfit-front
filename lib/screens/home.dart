import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        flexibleSpace: Container(
          decoration: _boxDecoration(),
        ),
        leading: Image.asset(
          "assets/icons8-user-48.png",
        ),
        title: Stack(
          children: const [
            Text(
              "Nome",
              style: TextStyle(color: Colors.black38),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => _algoAcontece(),
            icon: const Icon(
              Icons.menu,
              color: Colors.black38,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            _FeaturePanel(
              "Outfits",
              "assets/outfits.png",
              constraints,
              acao: _algoAcontece,
            ),
            _FeaturePanel(
                "Guarda Roupa", "assets/guarda-roupa-asset.png", constraints,
                acao: _algoAcontece),
            Container(
              height: constraints.maxHeight * 0.1,
              width: constraints.maxWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _FeatureItem("Roupa", Icons.photo_camera,
                      _boxDecoration(), constraints,
                      onClick: () => _algoAcontece()),
                  _FeatureItem(
                      "Outfit", Icons.work_sharp, _boxDecoration(), constraints,
                      onClick: () => _algoAcontece()),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.deepOrangeAccent,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.bottomCenter,
        stops: [0.03, 1],
      ),
    );
  }
}

void _algoAcontece() {}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;
  final BoxDecoration decorador;
  final BoxConstraints constraints;

  const _FeatureItem(this.name, this.icon, this.decorador, this.constraints,
      {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        width: constraints.maxWidth * 0.5,
        height: constraints.maxHeight * 0.5,
        alignment: Alignment.center,
        child: Container(
          // decoration: decorador,
          width: constraints.maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(
                Icons.add,
                size: 16,
                semanticLabel: name,
                color: Colors.deepOrange,
              ),
              Icon(
                  icon,
                  size: 32,
                  semanticLabel: name,
                color: Colors.deepOrange,
                ),

              Text(
                name,
                style: const TextStyle(color: Colors.deepOrange, fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturePanel extends StatelessWidget {
  final String title;
  final String urlImage;
  final Function acao;
  final BoxConstraints constraints;

  const _FeaturePanel(this.title, this.urlImage, this.constraints,
      {required this.acao});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: constraints.maxHeight * 0.45,
        child: Flexible(
          child: InkWell(
            onTap: () => acao,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 1.0, right: 4.0, left: 4.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    children: [
                      _buildImageBackground(urlImage, constraints),
                      _buildGradientBackground(),
                      _buildTitle(title, constraints),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Positioned _buildTitle(final String subTitle, BoxConstraints constraints) {
    return Positioned(
      width: constraints.maxWidth,
      bottom: 40,
      child: Text(
        subTitle,
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 40.0,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Positioned _buildGradientBackground() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Image _buildImageBackground(
      final String urlString, BoxConstraints constraints) {
    return Image.asset(
      urlString,
      fit: BoxFit.cover,
      width: constraints.maxWidth,
      height: constraints.maxHeight,
    );
  }
}
