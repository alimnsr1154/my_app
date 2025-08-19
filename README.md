# 📱 My App

A modern Flutter application built with **clean architecture** and **scalable state management**.  
The project leverages **AutoRoute**, **GetX**, **Flutter Hooks**, and **Build Runner** to ensure smooth navigation, reactive state handling, and efficient code generation.  

---

## Features

- **AutoRoute** → Declarative, strongly-typed navigation.
- **GetX** → Lightweight state management, dependency injection, and reactivity.
- **Flutter Hooks** → Simplifies stateful logic and lifecycle handling.
- **Gap** → Clean spacing between widgets.
- **Build Runner** → Automated code generation for routes, models, and more.
- **SVGs Support** → Vector-based assets for crisp UI across devices.
- **Custom Fonts & Theming** → Typography and design system for consistent UI.

---

## Project Structure

assets/
├── fonts/ # Custom fonts (Pretendard)
├── icons/ # App icons in SVG/PNG
└── images/ # Raster images

lib/
└── app/
├── data/
│ ├── models/ # Data models
│ └── repositories/ # Data sources / repositories
├── modules/
│ └── stats/ # Example feature module
│ ├── bindings/ # Dependency bindings (GetX)
│ ├── controllers/ # Business logic & state
│ └── view/ # UI screens & widgets
├── routes/ # AutoRoute setup
└── ui/
├── colors/ # Color constants & palette
├── pages/ # Page-level widgets
├── theme/ # Global app theme
├── typography/ # Font styles
├── utils/ # Helpers & extensions
└── widgets/ # Reusable UI components
├── buttons/
├── containers/
├── layouts/
├── text_fields/
└── tiles/
main.dart # App entry point


## Getting Started

### 1. Clone the repository

git clone https://github.com/your-username/my_app.git
cd my_app

### 2. Install dependencies
flutter pub get

### 3. Run code generation
dart run build_runner build --delete-conflicting-outputs

### 4. Run the app
flutter run




## Tech Stack

Framework: Flutter
State Management: GetX
Navigation: AutoRoute
UI Helpers: Flutter Hooks, Gap
Code Generation: Build Runner
Assets: SVGs, custom fonts (Pretendard)
