# 🌟 Favorite Places App

> **Your Personal Digital Travel Companion** 📱✈️

A beautiful Flutter application that lets you capture and organize your favorite places with photos and location data. Built with modern Flutter architecture and state management using Riverpod.

![Flutter](https://img.shields.io/badge/Flutter-3.7.2+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.7.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-2.6.1+-FF6B6B?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

## ✨ Features

### 📸 **Photo Capture & Storage**

- Take photos directly from your camera
- High-quality image storage and display
- Optimized image handling with configurable dimensions

### 📍 **Location Services**

- Get current location with GPS
- Reverse geocoding to display address
- Static map preview using Google Maps API
- Location permission handling

### 🏷️ **Place Management**

- Add custom titles for each location
- Organize your favorite spots
- Unique ID generation for each place
- Beautiful list view with place previews

### 🎨 **Beautiful UI/UX**

- Modern Material Design 3
- Dark theme with purple accent colors
- Smooth animations and transitions
- Responsive design for all screen sizes
- Custom typography with Google Fonts

### 🔄 **State Management**

- Built with Riverpod for efficient state management
- Reactive UI updates
- Clean architecture patterns
- Type-safe state management

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

3. **Configure Google Maps API (Optional)**

   For location features to work properly, you'll need a Google Maps API key:

   - Get an API key from [Google Cloud Console](https://console.cloud.google.com/)
   - Enable Maps Static API and Geocoding API
   - Replace the API key in `lib/widgets/location_input.dart`

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 How to Use

### Adding a New Place

1. Tap the **+** button in the top-right corner
2. Enter a title for your place
3. Take a photo using the camera
4. (Optional) Get current location or select on map
5. Tap **Save** to add it to your collection

### Viewing Your Places

- All your saved places appear in a beautiful list
- Tap on any place to view details in full-screen
- Photos are displayed in high quality
- Location data is shown when available

## 🛠️ Tech Stack

| Technology       | Version | Purpose                     |
| ---------------- | ------- | --------------------------- |
| **Flutter**      | 3.7.2+  | Cross-platform UI framework |
| **Dart**         | 3.7.2+  | Programming language        |
| **Riverpod**     | 2.6.1+  | State management            |
| **Google Fonts** | 6.2.1+  | Typography                  |
| **Image Picker** | 1.1.2+  | Camera access               |
| **Location**     | 8.0.1+  | GPS and location services   |
| **HTTP**         | 1.4.0+  | API calls for geocoding     |
| **UUID**         | 4.5.1+  | Unique ID generation        |

## 📁 Project Structure

```
lib/
├── main.dart              # App entry point with theme configuration
├── models/
│   └── place.dart         # Place and PlaceLocation data models
├── providers/
│   └── user_places.dart   # Riverpod state management
├── screens/
│   ├── places.dart        # Main places list screen
│   ├── add_place.dart     # Add new place screen
│   └── places_detail.dart # Place details screen
└── widgets/
    ├── image_input.dart   # Camera image picker widget
    ├── location_input.dart # Location services widget
    └── places_list.dart   # Places list display widget
```

## 🎯 Key Features Explained

### State Management with Riverpod

The app uses Riverpod for efficient state management, ensuring:

- Reactive UI updates
- Memory efficient
- Type-safe state management
- Easy testing and debugging

### Image Handling

- **Camera Integration**: Direct photo capture with configurable quality
- **File Storage**: Local image storage using File API
- **Quality Optimization**: Efficient image handling with max dimensions
- **Preview Display**: Beautiful image previews in lists and details

### Location Services

- **GPS Integration**: Get current location using device GPS
- **Permission Handling**: Automatic permission requests
- **Reverse Geocoding**: Convert coordinates to human-readable addresses
- **Static Maps**: Google Maps preview of saved locations
- **Error Handling**: Graceful handling of location service failures

### Modern UI Design

- **Material Design 3**: Latest design guidelines
- **Dark Theme**: Easy on the eyes with purple accent colors
- **Custom Typography**: Google Fonts integration with Ubuntu Condensed
- **Responsive Layout**: Works on all device sizes
- **Smooth Animations**: Fluid transitions and interactions

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

### Code Analysis

The project uses Flutter Lints for code quality:

```bash
flutter analyze
```

## 🔐 API Configuration

### Google Maps API Setup

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing one
3. Enable the following APIs:
   - Maps Static API
   - Geocoding API
4. Create credentials (API Key)
5. Replace the API key in `lib/widgets/location_input.dart`

**Note**: The current implementation includes a sample API key for demonstration. For production use, please use your own API key and implement proper security measures.

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
- Google Maps API for location services
- The Flutter community for inspiration

## 📞 Support

If you have any questions or need help:

- Open an [issue](https://github.com/yourusername/favorite_places_app/issues)
- Check the [Flutter documentation](https://flutter.dev/docs)
- Join the [Flutter community](https://flutter.dev/community)

## 🚧 Known Issues & Future Enhancements

### Current Limitations

- Location data is not yet fully integrated with place storage
- Map selection feature is not implemented
- No data persistence (places are lost on app restart)

### Planned Features

- [ ] Data persistence with SQLite or Hive
- [ ] Map selection for custom location picking
- [ ] Place categories and filtering
- [ ] Export/import functionality
- [ ] Cloud sync capabilities
- [ ] Offline map support

---

**Made with ❤️ and Flutter**

_Keep exploring, keep capturing memories!_ 🌍📸
