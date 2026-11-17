import 'package:flutter/material.dart';
import '../models/event_model.dart';

class DetailScreen extends StatefulWidget {
    final CampusEvent event;
    const DetailScreen({super.key, required this.event});

    @override
    State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
    bool _remindMe = false;
    final TextEditingController _controller = TextEditingController();
    String _savedNote = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.event.title),
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(widget.event.description, style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        SwitchListTile(
                            title: const Text("Отримувати нагадування"),
                            value: _remindMe,
                            onChanged: (bool value) {
                                setState(() { _remindMe = value; });
                            },
                        ),
                        const SizedBox(height: 10),
                        TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                                labelText: "Ваше питання спікеру",
                                border: OutlineInputBorder(),
                            ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                                setState(() { _savedNote = _controller.text; });
                            },
                            child: const Text("Зберегти питання"),
                        ),
                        const SizedBox(height: 10),
                        if (_savedNote.isNotEmpty)
                            Text("Надіслано запитання: $_savedNote", style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                    ],
                ),
            ),
        );
    }
}
