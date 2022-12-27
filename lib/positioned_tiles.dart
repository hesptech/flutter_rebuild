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
      //const StatelessColorfulTileOne(),
      //const StatelessColorfulTileTwo(),
      StatefulColorfulTileOne(key: UniqueKey(),),
      StatefulColorfulTileTwo(key: UniqueKey(),),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Row(children: tiles,)),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.sentiment_very_satisfied),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}


class StatelessColorfulTileOne extends StatelessWidget {
  const StatelessColorfulTileOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.green,
    );
  }
}

class StatelessColorfulTileTwo extends StatelessWidget {
  const StatelessColorfulTileTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
    );
  }
}


class StatefulColorfulTileOne extends StatefulWidget {
  const StatefulColorfulTileOne({Key? key}) : super(key: key);

  @override
  State<StatefulColorfulTileOne> createState() => _StatefulColorfulTileOneState();
}

class _StatefulColorfulTileOneState extends State<StatefulColorfulTileOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.orange,
    );    
  }
}

class StatefulColorfulTileTwo extends StatefulWidget {
  const StatefulColorfulTileTwo({Key? key}) : super(key: key);

  @override
  State<StatefulColorfulTileTwo> createState() => _StatefulColorfulTileTwoState();
}

class _StatefulColorfulTileTwoState extends State<StatefulColorfulTileTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );    
  }
}



class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({Key? key}) : super(key: key);

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );    
  }
}