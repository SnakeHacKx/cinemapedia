import 'package:flutter/material.dart';

class FullscreenLoader extends StatelessWidget {
  Stream<String> getLoadingMessages() {
    const messages = <String>[
      'Cargando películas',
      'Comprando palomitas de maíz',
      'Cargando populares',
      'Dándole comida a los michis',
      'Ahorita... aguántame',
      'Esto está tardando más de lo esperado... :(',
    ];

    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (step) {
        return messages[step];
      },
    ).take(messages.length);
  }

  const FullscreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor...'),
          const SizedBox(height: 16),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 32),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
