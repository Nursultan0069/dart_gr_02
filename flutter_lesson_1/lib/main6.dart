import 'package:flutter/material.dart';

void main() => runApp();

class DialogApp extends StatelessWidget{
  const DialogApp({super.key});
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    title: 'DialogDemo',
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
    ),
    home: ,
   );
  }
  
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  void showConfirmDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text('Пщдтверждение'),
          content: Text('Вы уверены'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: Text('Отмена'),
              ),
              ElevatedButton(
                onPressed:  (){
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showMaterialBanner(materialBanner)
                }, 
                child: child)
          ],
        
        )
      })
  }
}