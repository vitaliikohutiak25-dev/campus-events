import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
    const ProfileScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text("Профіль студента")),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const CircleAvatar(radius: 40, backgroundColor: Colors.indigo, child: Icon(Icons.person, size: 40, color: Colors.white)),
                        const SizedBox(height: 16),
                        const Text("Віталій Когутяк", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const Text("Активних реєстрацій: 3 події", style: TextStyle(fontSize: 16, color: Colors.grey)),
                        const SizedBox(height: 24),
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Повернутися на головну"),
                        ),
                    ],
                ),
            ),
        );
    }
}
