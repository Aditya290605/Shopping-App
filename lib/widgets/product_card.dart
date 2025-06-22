import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget{
  final String title;
  final String url;
  final double price;
  final int ind;

  const ProductCard({super.key,
  required this.title,
  required this.url,
  required this.price,
  required this.ind
  });

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      
      color: ind.isEven ?const Color.fromRGBO(216, 240, 253, 1) : 
      const Color.fromRGBO(245, 247, 249, 1),
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text(title,
          style: Theme.of(context).textTheme.bodyMedium
                    
          ),
          const SizedBox(height: 5,),
    
          Text("\$$price",
          style: Theme.of(context).textTheme.bodySmall
          ),
          const SizedBox(height: 5,),
    
          Center(
            child: Image.asset(url,
            height: 170,
            alignment: Alignment.center),
          )
        ],
      ),
    );
  }
}