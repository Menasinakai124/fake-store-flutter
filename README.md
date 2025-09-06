# Fake Store Flutter App

A Flutter-based mobile application that fetches and displays products from the [Fake Store API](https://fakestoreapi.com/). The app supports Android devices and provides an interactive, user-friendly interface for browsing products, viewing details, and exploring categories.

## Features

- **Home Screen**: Displays a list of products fetched from the API, including image, title, price, and category.  
- **Product Detail Screen**: Shows detailed information about a selected product (image, title, description, price, category, and rating).  
- **Category Screen**: Lists product categories; selecting a category filters products accordingly.  
- **Favorites / Cart Screen**: Allows users to save favorite products or add products to a cart with local data persistence.  
- **Responsive Design**: Works on various Android devices and screen sizes.  


## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)  
- [Android Studio](https://developer.android.com/studio) or a connected Android device  
- VSCode with **Flutter** and **Dart** extensions installed  
- Android SDK with **API 30** installed  

### Installation

1. Clone the repository:  
   ```bash
   git clone <your-repo-url>
   cd fake_store_app

2. Fetch dependencies:

    flutter pub get


3. Run the app on an emulator or physical device:

    flutter run

4. Project Structure
    fake_store_app/
    │
    ├─ android/          # Android-specific configuration
    ├─ ios/              # iOS-specific configuration
    ├─ lib/
    │  ├─ main.dart      # Entry point of the application
    │  ├─ models/        # Data models
    │  ├─ providers/     # State management and API calls
    │  ├─ screens/       # All UI screens
    │  └─ widgets/       # Reusable UI components
    ├─ pubspec.yaml      # Dependencies and assets
    └─ README.md         # Project documentation

5.  Dependencies

    flutter (latest stable version)

    http (for API requests)

    provider (for state management)

    shared_preferences or hive (for local data storage)

    (Ensure versions are compatible with your Flutter SDK)

6.  Notes

    This project was initially built for desktop, but has been configured to run on Android devices with API 30.

    Make sure your emulator or device has API 30 installed.

    If you encounter NDK or Gradle issues, follow the Flutter troubleshooting guides for Android builds.

7.  Author

    Kalmesh Menasinakai

8.  License

    This project is licensed under the MIT License. See the LICENSE file for details.


    I can also **add a “Run on Android from VSCode” section** directly into this single block so it’s fully Android-ready. Do you want me to do that?
