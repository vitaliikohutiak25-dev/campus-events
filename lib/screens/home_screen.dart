import 'package:flutter/material.dart';
import '../models/event_model.dart';
import 'detail_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});

    final List<CampusEvent> events = [
        CampusEvent(title: "Хакатон AI & Code 2026", category: "Штучний інтелект", date: "15 Травня", description: "Створіть власний чат-бот за 24 години командної роботи."),
        CampusEvent(title: "Інтенсив з UI/UX", category: "Дизайн", date: "18 Травня", description: "Проєктування мобільних інтерфейсів у Figma з нуля."),
        CampusEvent(title: "Cyber Security Meetup", category: "Безпека", date: "22 Травня", description: "Розбір реальних кейсів кібератак та методів захисту."),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Campus Events"),
                actions: [
                    IconButton(
                        icon: const Icon(Icons.person),
                        onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                        },
                    ),
                ],
            ),
            body: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                    final event = events[index];
                    return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                            leading: const Icon(Icons.event, color: Colors.indigo),
                            title: Text(event.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("${event.category} • ${event.date}"),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(event: event)));
                            },
                        ),
                    );
                },
            ),
        );
    }
}
