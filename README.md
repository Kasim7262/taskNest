# TaskNest Flutter App

A simple and beginner-friendly Task Manager application built using Flutter and Firebase.

This project was designed with:

* Clean UI
* Simple architecture
* Beginner-friendly logic
* Firebase Authentication
* Cloud Firestore
* Quote API integration
* Modern modal bottom sheet task creation flow

The project is optimized for:

* macOS development
* MacBook Air
* Android Studio
* iOS Simulator

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

# Features

## Authentication

* User Signup
* User Login
* Persistent Login Session
* Logout

## Task Management

* Add Task
* Update Task
* Delete Task
* Real-time Firestore updates
* Automatic task creation date

## UI Features

* Modal Bottom Sheet task creation
* Clean minimal UI
* Reusable widgets
* Responsive layouts

## Quote Feature

* Fetches motivational quote from API
* Displays quote on Home Screen

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

# Firebase Setup

## Step 1 — Create Firebase Project

Open:

[https://console.firebase.google.com](https://console.firebase.google.com)

Create a new Firebase project.

---

## Step 2 — Install Firebase CLI

Run:

```bash
npm install -g firebase-tools
```

---

## Step 3 — Login to Firebase

```bash
firebase login
```

Recommended options:

* Gemini in Firebase → No
* Analytics/Error Reporting → Yes or No (optional)

---

## Step 4 — Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

---

## Step 5 — Configure Firebase

Inside project terminal:

```bash
flutterfire configure
```

Select:

* Android
* iOS
* macOS (optional)

This generates:

```text
firebase_options.dart
```

IMPORTANT:
Do not delete this file.

---

# Required Packages

Install packages using terminal.

## Firebase Core

```bash
flutter pub add firebase_core
```

## Firebase Auth

```bash
flutter pub add firebase_auth
```

## Cloud Firestore

```bash
flutter pub add cloud_firestore
```

## HTTP Package

```bash
flutter pub add http
```

## Intl Package

```bash
flutter pub add intl
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

# Firestore Flow

## Add Task

Task object is converted into Map:

```dart
task.toMap()
```

Saved using:

```dart
tasks.add(task.toMap())
```

---

## Update Task

Uses document ID:

```dart
tasks.doc(id).update(task.toMap())
```

---

## Delete Task

```dart
tasks.doc(id).delete()
```

---

# Task Date Logic

Task date is automatically generated during task creation.

Example:

```dart
String currentDate =
    DateFormat('dd MMM yyyy - hh:mm a')
        .format(DateTime.now());
```

IMPORTANT:
Date is generated only once during task creation.

It is then stored permanently in Firestore.

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

# Modal Bottom Sheet Flow

Instead of opening a new screen directly:

```dart
Navigator.push()
```

The app uses:

```dart
showModalBottomSheet()
```

The entire `AddTaskScreen` UI is rendered inside the modal.

Benefits:

* Cleaner UI
* Modern UX
* Less navigation complexity
* Faster interactions

---

# GitHub Setup

## Initialize Git

```bash
git init
```

---

## Add Files

```bash
git add .
```

---

## First Commit

```bash
git commit -m "Initial TaskNest setup"
```

---

# Recommended Git Commit Flow

## After Firebase Setup

```bash
git commit -m "Configured Firebase"
```

## After Authentication

```bash
git commit -m "Added Firebase authentication"
```

## After Firestore CRUD

```bash
git commit -m "Implemented Firestore task CRUD"
```

## After Quote API

```bash
git commit -m "Added motivational quote API"
```

## After UI Completion

```bash
git commit -m "Completed TaskNest UI"
```

---

# Push to GitHub

## Create GitHub Repository

Open:

[https://github.com](https://github.com)

Create new repository.

---

## Connect Repository

```bash
git remote add origin YOUR_GITHUB_REPO_LINK
```

---

## Push Code

```bash
git branch -M main

git push -u origin main
```

---

# Deployment Notes

Before deployment:

## iOS

Open:

```text
ios/Runner.xcworkspace
```

inside Xcode.

Set:

* Signing Team
* Bundle Identifier

---

# Common Errors

## Firebase.initializeApp Error

Error:

```text
No Firebase App '[DEFAULT]' has been created
```

Fix:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

---

## SSL Certificate Error

Error:

```text
CERTIFICATE_VERIFY_FAILED
```

Fix:

Use:

```text
https://zenquotes.io/api/random
```

instead of older quote APIs.

---

## Navigator.pop Not Working

Ensure:

* screen opened using `Navigator.push()`
* async flow completes properly
* correct BuildContext used

---

# Learning Concepts Covered

This project teaches:

* Flutter Widgets
* StatefulWidget
* Navigation
* Modal Bottom Sheets
* Firebase Authentication
* Firestore CRUD
* API Integration
* Async/Await
* JSON Parsing
* Reusable Widgets
* MVC-like Folder Structure
* Git & GitHub Workflow

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
