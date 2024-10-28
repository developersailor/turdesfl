import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:turdes/product/navigation/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.push(const AidrequestsRoute());
          },
          child: const Text('Aid Request'),
        ),
      ),
    );
  }
}
