import "package:flutter/material.dart";

class Homepage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Welcome to the Homepage',
              style: TextStyle(fontSize: 24),
            ),
          ]
        )
      )
    );
  }
}