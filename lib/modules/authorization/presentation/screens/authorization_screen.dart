import 'package:flutter/material.dart';
import 'package:skynet/resources/resources.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                    height: 800,
                    width: 360,
                    child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(
                    AssetImage(Images.callcenter),
                    color: Colors.red,
                    size: 30,
                  )),
              SizedBox(
                height: 230,
                width: 230,
              ),
              TextField()
              // SizedBox(height: 50, width: 300, child: TextFormField())
            ],
                    ),
                  ),
          )),
    );
  }
}
