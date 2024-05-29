import 'package:flutter/material.dart';
//import '../data.dart';
import '../new_data.dart';

class ScrollableGameWidget extends StatelessWidget {
  final double _height;
  final double _width;
  final bool _showTitle;
  final List<Game> _gameData;

   const ScrollableGameWidget(
      this._height, this._width, this._showTitle, this._gameData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _gameData.map((game) {
          return Container(
            height: _height,
            width: _width * 0.30,
            padding: EdgeInsets.only(right: _width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _height * 0.80,
                  width: _width * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(game.coverImage.url),
                          ),
                          ),
                ),
                _showTitle
                ?Text(
                  game.title,
                  maxLines: 1,
                  style:
                      TextStyle(color: Colors.white, fontSize: _height * 0.08),
                )
                : Container()
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
