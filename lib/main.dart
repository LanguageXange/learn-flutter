import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'decision_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DecisionProvider(),
      child: const VibeMatchApp(),
    ),
  );
}

class VibeMatchApp extends StatelessWidget {
  const VibeMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VibeMatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DecisionScreen(),
    );
  }
}

class DecisionScreen extends StatelessWidget {
  const DecisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎯 VibeMatch'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Consumer<DecisionProvider>(
        builder: (context, provider, child) {
          // Screen 1: Completion View
          if (provider.isFinished) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('🎉 Round Finished!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    const Text('Your top vibes:', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    const SizedBox(height: 10),
                    Text(
                      provider.likedItems.isEmpty ? 'Nothing selected 😢' : provider.likedItems.join('\n'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () => provider.reset(),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try Again'),
                    )
                  ],
                ),
              ),
            );
          }

          // Screen 2: Swiping Interface View
          final currentCard = provider.options[provider.currentIndex];

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(currentCard['image']!, style: const TextStyle(fontSize: 90)),
                          const SizedBox(height: 20),
                          Text(currentCard['title']!, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                          Text(currentCard['category']!.toUpperCase(), style: const TextStyle(fontSize: 14, color: Colors.grey, letterSpacing: 1.5)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton.large(
                      heroTag: 'dislike_btn',
                      backgroundColor: Colors.redAccent.shade100,
                      onPressed: () => provider.vote(false),
                      child: const Icon(Icons.close, size: 36, color: Colors.white),
                    ),
                    FloatingActionButton.large(
                      heroTag: 'like_btn',
                      // backgroundColor: Colors.green.shade400,
                      backgroundColor: const Color(0xFF2ECC71), // Custom green color
                      onPressed: () => provider.vote(true),
                      child: const Icon(Icons.favorite, size: 36, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}