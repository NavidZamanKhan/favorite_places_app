# 🌟 Favorite Places App

> **Your Personal Digital Travel Companion** 📱✈️

A beautiful Flutter application that lets you capture and organize your favorite places with photos and memories. Built with modern Flutter architecture and state management.

![Flutter](https://img.shields.io/badge/Flutter-3.7.2+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.7.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-2.6.1+-FF6B6B?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

## ✨ Features

### 📸 **Photo Capture & Storage**

- Take photos directly from your camera
- Pick images from your gallery
- High-quality image storage and display

### 🏷️ **Place Management**

- Add custom titles for each location
- Organize your favorite spots
- Unique ID generation for each place

### 🎨 **Beautiful UI/UX**

- Modern Material Design 3
- Dark theme with purple accent colors
- Smooth animations and transitions
- Responsive design for all screen sizes

### 🔄 **State Management**

- Built with Riverpod for efficient state management
- Reactive UI updates
- Clean architecture patterns

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (3.7.2 or higher)
- [Dart](https://dart.dev/get-dart) (3.7.2 or higher)
- Android Studio / VS Code with Flutter extensions
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/favorite_places_app.git
   cd favorite_places_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📱 How to Use

### Adding a New Place

1. Tap the **+** button in the top-right corner
2. Enter a title for your place
3. Take a photo or select from gallery
4. Tap **Save** to add it to your collection

### Viewing Your Places

- All your saved places appear in a beautiful list
- Tap on any place to view details
- Photos are displayed in high quality

## 🛠️ Tech Stack

| Technology       | Version | Purpose                     |
| ---------------- | ------- | --------------------------- |
| **Flutter**      | 3.7.2+  | Cross-platform UI framework |
| **Dart**         | 3.7.2+  | Programming language        |
| **Riverpod**     | 2.6.1+  | State management            |
| **Google Fonts** | 6.2.1+  | Typography                  |
| **Image Picker** | 1.1.2+  | Camera & gallery access     |
| **UUID**         | 4.5.1+  | Unique ID generation        |

## 📁 Project Structure

```
lib/
├── main.dart              # App entry point
├── models/
│   └── place.dart         # Place data model
├── providers/
│   └── user_places.dart   # State management
├── screens/
│   ├── places.dart        # Main places list
│   ├── add_place.dart     # Add new place
│   └── places_detail.dart # Place details
└── widgets/
    ├── image_input.dart   # Image picker widget
    └── places_list.dart   # Places list widget
```

## 🎯 Key Features Explained

### State Management with Riverpod

The app uses Riverpod for efficient state management, ensuring:

- Reactive UI updates
- Memory efficient
- Type-safe state management
- Easy testing

### Image Handling

- **Camera Integration**: Direct photo capture
- **Gallery Access**: Select existing photos
- **File Storage**: Local image storage
- **Quality Optimization**: Efficient image handling

### Modern UI Design

- **Material Design 3**: Latest design guidelines
- **Dark Theme**: Easy on the eyes
- **Custom Typography**: Google Fonts integration
- **Responsive Layout**: Works on all devices

## 🔧 Development

### Running Tests

```bash
flutter test
```

### Building for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 📸 Screenshots

_[Screenshots would go here - you can add them later]_

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod for excellent state management
- Google Fonts for beautiful typography
- The Flutter community for inspiration

## 📞 Support

If you have any questions or need help:

- Open an [issue](https://github.com/yourusername/favorite_places_app/issues)
- Check the [Flutter documentation](https://flutter.dev/docs)
- Join the [Flutter community](https://flutter.dev/community)

---

**Made with ❤️ and Flutter**

_Keep exploring, keep capturing memories!_ 🌍📸
