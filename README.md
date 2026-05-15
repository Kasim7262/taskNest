# TaskNest Flutter App

A clean and beginner-friendly task management application built using Flutter and Firebase.

TaskNest allows users to create, update, complete, and delete tasks with real-time Firestore synchronization and Firebase Authentication support.

---

## Features

### Authentication
- User Signup
- User Login
- Persistent Login Session
- Logout Functionality

### Task Management
- Add Tasks
- Update Tasks
- Delete Tasks
- Mark Tasks as Completed
- Real-time Firestore Updates
- Automatic Task Timestamp Storage

### UI & UX
- Clean Minimal UI
- Responsive Layouts
- Reusable Widgets
- Empty State Handling

### Quote Integration
- Displays motivational quotes using the ZenQuotes API

---

# Tech Stack

## Frontend
* Flutter
* Dart

## Backend
* Firebase Authentication
* Cloud Firestore

## API
* ZenQuotes API

---


# Project Structure

```text
lib/
│
├── main.dart
│
├── models/
│   └── task_model.dart
│
├── services/
│   ├── auth_service.dart
│   ├── firestore_service.dart
│   └── quote_service.dart
│
├── screens/
│   ├── home_page.dart
│   ├── login_page.dart
│   ├── signup_page.dart
│   ├── task_page.dart
│   ├── edit_task_page.dart
│   └── splash_page.dart
│
├── widgets/
│   ├── task_tile.dart
│   └── custom_textfield.dart
│
└── firebase_options.dart
```

---
## Firebase Setup 

This project uses Firebase for:

* Authentication
* Cloud Firestore

Configure Firebase using the FlutterFire CLI before running the project.

Firebase configuration files are excluded from version control.

---

## Firebase Configuration

This project uses Firebase Authentication and Cloud Firestore.

To configure Firebase:

1. Create a Firebase project
2. Enable:
    - Firebase Authentication
    - Cloud Firestore
3. Configure the project using FlutterFire CLI:

```bash
dart pub global activate flutterfire_cli

flutterfire configure

This generates the required:

firebase_options.dart

---

# Required Packages

Install packages using terminal.

## Firebase Core

```bash
flutter pub add firebase_core
```

## Firebase Auth , Cloud Firestore

```bash
flutter pub add firebase_auth cloud_firestore
```

## HTTP Package , Intl Package

```bash
flutter pub add http intl

```

---

# Running the App

## Clean Project

```bash
flutter clean
```

## Install Dependencies

```bash
flutter pub get
```

## Run App

```bash
flutter run
```

---

# Authentication Flow

## Signup

Uses:

```dart
FirebaseAuth.instance.createUserWithEmailAndPassword()
```

## Login

Uses:

```dart
FirebaseAuth.instance.signInWithEmailAndPassword()
```


## Persistent Login

The app uses a dedicated Splash Screen to handle login persistence.

Flow:

```text
App Starts
   ↓
Splash Screen Opens
   ↓
Checks FirebaseAuth.instance.currentUser
   ↓
If user exists → HomePage
If user does not exist → LoginPage
```

Example logic used inside Splash Screen:

```dart
User? user = FirebaseAuth.instance.currentUser;

if (user != null) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const HomePage(),
    ),
  );
} else {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
}
```

This keeps users logged in even after:

* Hot Restart
* App Restart
* Rebuilds

until logout is performed.


---

## Firestore Flow

### Add Task

Creates and stores task documents in Firestore.

### Update Task

Updates existing task data using document IDs.

### Delete Task

Removes tasks from Firestore.

### Task Status

Supports real-time completion status updates.

---

## Task Date Handling

Task creation timestamps are generated once during task creation and stored permanently in Firestore using epoch milliseconds.

---

# Quote API

API Used:

```text
https://zenquotes.io/api/random
```

Example response:

```json
[
  {
    "q": "Yesterday's home runs don't win today's games.",
    "a": "Babe Ruth"
  }
]
```

Quote Service fetches:

```dart
data['q']
data['a']
```

---


---

# Future Improvements

Possible upgrades:

* Dark Mode
* Task Categories
* Priority Levels
* Search Tasks
* Task Filtering
* Push Notifications
* Offline Storage
* Provider/Bloc State Management
* Animations
* Profile Screen

---

# Developer Notes

This project intentionally keeps logic simple and beginner-friendly.

The goal is:

* easier understanding
* internship-level architecture
* clean explanations
* easy debugging
* fast development

Complex state management and advanced architecture were intentionally avoided.

---

# Author

TaskNest Flutter App
Built using Flutter + Firebase
