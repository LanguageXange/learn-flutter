# my_first_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# learn-flutter


1. Installation 
Using VS Code Flutter extension -> prompt to install Flutter SDK
2. Adding Env to PATH
`nano ~/.zshrc`
`export PATH="$PATH:/xxx/flutter/bin"`
`source ~/.zshrc`
3. VS code command flutter:New Project
4. Install state management `flutter pub add provider`
5. Run local preview: `flutter run -d chrome`
6. update code:
add `lib/decision_provider.dart` file and update `lib/main.dart`
create git repo and push code to git first
7. compile web bundle: `flutter build web --base-href "/MY_REPO_NAME/"` 
8. Push source code (`main` branch) + Production bundle (`gh-pages` branch)
`cd build/web` and do git init, git add, git branch -M gh-pages, git remote add origin https://xxxx.git, git push -f origin gh-pages
9. Active Github Pages: Settings -> Pages -> select `gh-pages` branch