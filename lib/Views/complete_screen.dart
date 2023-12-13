import 'package:flutter/material.dart';

class CompleteView extends StatefulWidget {
  final String title, description;

  const CompleteView(
      {super.key, required this.title, required this.description});

  @override
  State<CompleteView> createState() => _CompleteViewState();
}

class _CompleteViewState extends State<CompleteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Title : ",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.title, style: const TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              const Text("Description : ", style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.description),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
