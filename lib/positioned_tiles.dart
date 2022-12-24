import 'package:flutter/material.dart';

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({Key? key}) : super(key: key);

  @override
  State<PositionedTiles> createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  late List<Widget> tiles;


  @override
  void initState() {
    super.initState();
    tiles = [
      const StatelessColorfulTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Row(children: tiles,)),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.sentiment_very_satisfied),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}


class StatelessColorfulTile extends StatelessWidget {
  const StatelessColorfulTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      color: Colors.amber,
    );
  }
}