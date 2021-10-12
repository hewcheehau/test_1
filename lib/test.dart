import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<User>(
      create: (context) => User(),
      child: Consumer<User>(
        builder: (context, urs, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Try',
          home: Scaffold(
            appBar: AppBar(
              title: Text(urs.name),
              backgroundColor: urs.mainColor,
              
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    
                    onPressed: () {
                      urs.changeSomething('NEW NAME CHEE HAU');
                    },
                    child: const Text('Click me',style: TextStyle(color: Colors.white, fontSize: 30),),

                  ),
                  ElevatedButton(
                    
                    onPressed: () {
                      urs.changeSomething('Welcome', clr:Colors.indigoAccent);
                    },
                    child: const Text('Click back',style: TextStyle(color: Colors.white, fontSize: 30),),

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}