import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rebuild/users.dart';

class UsersPresentation extends StatelessWidget {
  const UsersPresentation({Key? key}) : super(key: key);

  Future<List<Users>> allUsers() async {
    var response = await rootBundle.loadString("assets/test_file.json");

    if (response.isNotEmpty) {
      
      return usersFromJson(response);
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height - 60,
      color: const Color(0xFFE6E7E8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            
            child: FutureBuilder(
              future: allUsers(),
              builder: (_, AsyncSnapshot<List<Users>> s) {
                //print(s.data![0].users[1].name!);
                if (s.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                return ListView.builder(
                  itemCount: s.data!.length,
                  itemBuilder: (_, i) => Card(
                    child: ListTile(
                      title: Text(s.data![i].users[0].name!),
                      //subtitle: Text(s.data!.length.toString()),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
      
      
      

    );
  }
}