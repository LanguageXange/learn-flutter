import 'package:flutter/material.dart';

class DecisionProvider extends ChangeNotifier {
  // Mock data representing card choices
  final List<Map<String, String>> _options = [
    {'title': 'Pizza Night', 'image': '🍕', 'category': 'Food'},
    {'title': 'Sci-Fi Movie Marathon', 'image': '🚀', 'category': 'Movie'},
    {'title': 'Sushi Feast', 'image': '🍣', 'category': 'Food'},
    {'title': 'Horror Film Night', 'image': '🎬', 'category': 'Movie'},
    {'title': 'Taco Tuesday', 'image': '🌮', 'category': 'Food'},
  ];

  int _currentIndex = 0;
  final List<String> _likedItems = [];

  List<Map<String, String>> get options => _options;
  int get currentIndex => _currentIndex;
  List<String> get likedItems => _likedItems;
  bool get isFinished => _currentIndex >= _options.length;

  void vote(bool liked) {
    if (liked) {
      _likedItems.add(_options[_currentIndex]['title']!);
    }
    _currentIndex++;
    
    // Equivalent to dispatching an update or triggering a re-render hook
    notifyListeners(); 
  }

  void reset() {
    _currentIndex = 0;
    _likedItems.clear();
    notifyListeners();
  }
}