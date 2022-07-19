import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        flexibleSpace: _buildGradientAppBar(),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _FeaturePanel("Outfits", "assets/outfits.png", acao: _algoAcontece,),
          _FeaturePanel(
              "Guarda Roupa", "assets/guarda-roupa-asset.png", acao: _algoAcontece),
          Container(
            height: 142,

            alignment: Alignment.bottomCenter,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _FeatureItem("Roupas", Icons.add,
                    onClick: () => _algoAcontece()),
                _FeatureItem("Outfit", Icons.add,
                    onClick: () => _algoAcontece()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildGradientAppBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.deepOrangeAccent,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomCenter,
          stops: [0.03, 1],
        ),
      ),

    );
  }
}

void _algoAcontece() {}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  const _FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: Theme
            .of(context)
            .primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                )
              ],
            ),
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

  const _FeaturePanel(this.title, this.urlImage, {required this.acao});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme
            .of(context)
            .primaryColor,
        child: Padding(
          padding: EdgeInsets.zero,
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
                      _buildImageBackground(urlImage),
                      _buildGradientBackground(),
                      _buildTitle(title),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )


    );
  }

  Positioned _buildTitle(final String subTitle) {
    return Positioned(
      width: 395,
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

  Image _buildImageBackground(final String urlString) {
    return Image.asset(
      urlString,
      fit: BoxFit.cover,
      width: 425,
      height: 300,
    );
  }
}
