import 'package:flutter/material.dart';
import 'package:flutter_rebuild/positioned_tiles.dart';
import 'package:flutter_rebuild/users_presentation.dart';

// https://blog.logrocket.com/how-when-force-flutter-widget-rebuild/#using-keys-force-widget-rebuild
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orders',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // remove the debug banner

      // state manegement using setState and keys
      //home: const MyHomePage(title: 'Orders'),

      // change position of widgets
      //home: const PositionedTiles(),

      // read data from json
      home: const UsersPresentation(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;


  /* final List<Order> _orders = [
    Order(1, 'Coffee', 20.00, 1, DateTime(2020, 1, 1)),
    Order(2, 'Tea', 10.00, 1, DateTime(2020, 1, 2)),
    Order(3, 'Cake', 50.00, 1, DateTime(2020, 1, 3)),
    Order(4, 'Pizza', 100.00, 1, DateTime(2020, 1, 4)),
  ]; */

  final List<Widget>_orders = [
    OrderCard(Order(1, 'Coffee', 20.00, 1, DateTime(2020, 1, 1)), UniqueKey()),
    OrderCard(Order(2, 'Tea', 10.00, 1, DateTime(2020, 1, 2)), UniqueKey()),
    OrderCard(Order(3, 'Cake', 50.00, 1, DateTime(2020, 1, 3)), UniqueKey()),
    OrderCard(Order(4, 'Pizza', 100.00, 1, DateTime(2020, 1, 4)), UniqueKey()),
  ];

  /* void _incrementCounter() {
    setState(() {
      _counter++;
    });
  } */


  void incrementQuantity(Order order) {
    double initialPrice = order.price / order.quantity;
    // the original price
    setState(() {
      // updating the state
      order.quantity++;
      order.price = initialPrice * order.quantity;
    });
  }

  void decrementQuantity(Order order) {
    if (order.quantity > 1) {
      // Check if the quantity is greater than one
      double initialPrice = order.price / order.quantity;
      // orginal price
      setState(() {
        // updating the state
        order.quantity--;
        order.price = initialPrice * order.quantity;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /* body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  final order = _orders[index];
                  /* return ListTile(
                    title: Text(order.name),
                    subtitle: Text('USD ${order.price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => decrementQuantity(order),
                          icon: const Icon(Icons.remove)
                        ),
                        const SizedBox(width: 15),
                        Text('${order.quantity}'),
                        const SizedBox(width: 15),
                        IconButton(
                          onPressed: () => incrementQuantity(order),
                          icon: const Icon(Icons.add)
                        ),
                      ],
                    ),
                  ); */
                  return OrderCard(order, UniqueKey());
                },
              ),
            )
          ],
        ),
      ), */
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _orders,
        ),
      ),

      /* body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [UsersPresentation()],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class OrderCard extends StatefulWidget {
  final Order order;
  // Order
  final Key orderKey;
  // key, Flutter UI uses different keys such as unique key, value key, and object key.
  const OrderCard(this.order, this.orderKey) : super(key: orderKey);

  @override
  State<OrderCard> createState() => OrderCardState();
}


class OrderCardState extends State<OrderCard> {
  late Order order;
  @override
  void initState() {
    super.initState();
    order = widget.order;
    // Get the order
  }

  void incrementQuantity(Order order) {
    double initialPrice = order.price / order.quantity;
    setState(() {
      order.quantity++;
      order.price = initialPrice * order.quantity;
    });
  }

  void decrementQuantity(Order order) {
    if (order.quantity > 1) {
      double initialPrice = order.price / order.quantity;
      setState(() {
        order.quantity--;
        order.price = initialPrice * order.quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(order.name),
      subtitle: Text('USD ${order.price}'),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          IconButton(
              onPressed: () => decrementQuantity(order),
              icon: const Icon(Icons.remove)),
          const SizedBox(width: 15),
          Text('${order.quantity}'),
          const SizedBox(width: 15),
          IconButton(
              onPressed: () => incrementQuantity(order),
              icon: const Icon(Icons.add)),
        ])
      ]),
    );
  }
}



class Order<Widget> {
  Order(this.id, this.name, this.price, this.quantity, this.date); //Flutter UI uses different keys such as unique key, value key, and object key
  int id;
  String name;
  int quantity;
  double price;
  DateTime date;
  //Key key;
}
