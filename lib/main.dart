import 'package:flutter/material.dart';
import 'package:myapp/theme_provider.dart';
import 'package:myapp/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, thmpvd, child) => MaterialApp(
          title: 'Test Try',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(brightness: Brightness.dark)
          ),
          home: MainScreen(),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ThemedAppBar(
        title: Text('Theme provider'),
        actions: [
          IconButton(
            icon: Icon(Icons.colorize),
            onPressed: () => _showColorPicker(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<ThemeProvider> (
              builder: (context, themProvider, child) => Text('Text', style: Theme.of(context).textTheme.headline2?.copyWith(color: themProvider.mainColor),),
            ),
            Consumer<ThemeProvider> (
              builder: (context, themProvider, child) => Text('CHEE HAU', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: themProvider.mainColor),),

            ),
            Consumer<ThemeProvider> (
              builder: (context, themProvider, child) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: themProvider.mainColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  )
                ),
              )
              
            ),
            Consumer<ThemeProvider> (
              builder: (context, themeProvider, child) => Slider(value: 0, inactiveColor: themeProvider.mainColor.withOpacity(0.5), onChanged: (newValue){}, activeColor: themeProvider.mainColor,),
            ),
            Consumer<ThemeProvider> (
              builder: (context, themeProvider, child) => Switch(value: true, onChanged: (newValue){}, activeColor: themeProvider.mainColor,),
            ),

          ],
        ),
      ),
    );
  }
}

void _showColorPicker(BuildContext context) {
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.all(0.0),
      content: Wrap(
        children: [
          ColorPicker(
            pickerColor: themeProvider.mainColor
          , 
          onColorChanged: (color) => themeProvider.changeThemeColor(color))
        ],
      ),
      actions: [
       
      ],
    ));
}

class _ThemedAppBar extends StatelessWidget with PreferredSizeWidget{
  final Widget? title ;
  final List<Widget>? actions;

  final Size preferredSize;

  _ThemedAppBar({
    Key? key,
    this.title,
    this.actions
  }) : preferredSize = Size.fromHeight(kToolbarHeight),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => AppBar(
        title: title,
        actions: actions,
        backgroundColor: themeProvider.mainColor,
      ),
    );
  }
}