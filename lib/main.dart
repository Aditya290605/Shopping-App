import 'package:flutter/material.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'pages/shopping_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget{
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),

      child: MaterialApp(
        home: const ShoppingScreen(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1)),
          fontFamily: "Lato",
          inputDecorationTheme: const InputDecorationTheme(
            alignLabelWithHint: true,
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            prefixIconColor: Colors.blue,
            
          ),        
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
      
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
      
            bodyLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            
            
          ),
          useMaterial3: true,
          
        ),
      
        debugShowCheckedModeBanner: false,
      
      ),
    );
  }
}