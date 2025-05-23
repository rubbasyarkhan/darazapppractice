import 'package:darazapp/drawerside.dart'as drawer;
import 'package:flutter/material.dart';

class Dynamiclist extends StatefulWidget {
  const Dynamiclist({Key? key}) : super(key: key);
  @override
  _DynamiclistState createState() => _DynamiclistState();
}

class _DynamiclistState extends State<Dynamiclist> {
  final users = [
    {
      'name': 'John',
      'age': 32,
      'imageUrl':
          'https://images.unsplash.com/photo-1536924430914-91f9e2041b83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW9kZWxzfGVufDB8fDB8fHww',
    },
    {
      'name': 'Jane',
      'age': 25,
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1688497831081-836510928186?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjF8fG1vZGVsc3xlbnwwfHwwfHx8MA%3D%3Dr',
    },
    {
      'name': 'Jack',
      'age': 30,
      'imageUrl':
          'https://images.unsplash.com/photo-1536924430914-91f9e2041b83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW9kZWxzfGVufDB8fDB8fHww',
    },
    {
      'name': 'Jill',
      'age': 28,
      'imageUrl':
          'https://images.unsplash.com/photo-1638993606271-04836e75d662?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fG1vZGVsc3xlbnwwfHwwfHx8MA%3D%3D',
    },
    {
      'name': 'Bob',
      'age': 40,
      'imageUrl':
          'https://images.unsplash.com/photo-1566802842272-e694af42eb29?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG1vZGVsc3xlbnwwfHwwfHx8MA%3D%3D',
    },
    {
      'name': 'Joe',
      'age': 35,
      'imageUrl':
          'https://images.unsplash.com/photo-1569210538317-4d53f92a0e21?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Sarah',
      'age': 22,
      'imageUrl':
          'https://images.unsplash.com/photo-1556347961-f9521a88cb8a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1vZGVsc3xlbnwwfHwwfHx8MA%3D%3D',
    },

    {
      'name': 'Jill',
      'age': 28,
      'imageUrl':
          'https://images.unsplash.com/photo-1638993606271-04836e75d662?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fG1vZGVsc3xlbnwwfHwwfHx8MA%3D%3D',
    },
    {
      'name': 'Bob',
      'age': 40,
      'imageUrl':
          'https://images.unsplash.com/photo-1566802842272-e694af42eb29?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG1vZGVsc3xlbnwwfHwwfHx8MA%3D%3D',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: listviewmethode(),

        drawer: drawer.DrawerSide(),
    );
  }

  ListView listviewmethode() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0,
          ),
          tileColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            "${users[index]['name']}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Age: ${users[index]['age']}",
            style: TextStyle(color: Colors.grey[600]),
          ),

         
          leading: CircleAvatar(
            backgroundImage: NetworkImage("${users[index]['imageUrl']}"),
            radius: 25,
          ),
          trailing: Icon(Icons.phone, color: Colors.blue),
        );
      },
    );
  }

  AppBar appbar() => AppBar(title: Text('Dynamic List'));
}
