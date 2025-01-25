# Evaluation Task (iOS)

This repository contains an iOS application built to showcase movies from **The Movie Database (TMDb) API**, displaying lists of now playing, popular, and upcoming movies. The app also provides detailed information for each movie upon selection.

## Features

### 1. List Screen
- **Tabs**: Three tabs are implemented using a native `UITabBar` to display:
  - **Now Playing** movies
  - **Popular** movies
  - **Upcoming** movies
- **Movie List**: Fetch and display movies in a list view under each tab.
- **Basic Details**: Each list item displays the movie's title, release date, and poster image.

### 2. Detail Screen
- Displays comprehensive details about the selected movie, including:
  - Overview
  - Genres
  - Runtime
- Includes a back button for navigation to the list screen.

---

## Architectural Design

### 1. **MVVM Architecture**
The app follows the **Model-View-ViewModel** (MVVM) design pattern:
- **Model**: Represents domain entities (e.g., Movie) and handles data mapping.
- **ViewModel**: Manages data for the views and business logic using use cases.
- **View**: Renders the UI and listens to changes from the ViewModel.

### 2. **Domain-Driven Design (DDD)**
The codebase is organized into three distinct layers:
- **Domain Layer**:
  - Contains core business logic and domain models.
  - Includes use cases for fetching movie data.
- **Data Layer**:
  - Handles API integration and data management.
  - Implements data sources for fetching movies from TMDb.
- **Presentation Layer**:
  - Manages UI components and interaction logic using ViewModels.
  - Provides a clean separation of concerns for easier testing and maintainability.

---

## Requirements

1. **APIs**:
   - The Movie Database (TMDb) API: [API Documentation](https://developer.themoviedb.org/reference)

2. **Dependencies**:
   - No third-party frameworks (e.g., CocoaPods or Swift Package Manager) are used.

3. **Error Handling**:
   - Graceful handling of network errors, API failures, and unexpected exceptions.
   - Informative error messages are displayed to users.

4. **Testing**:
   - Comprehensive unit tests covering:
     - Domain logic
     - Data retrieval
     - UI interactions

5. **Caching**:
   - Implemented caching mechanisms to store previously fetched data locally.
   - Displays cached data in offline mode or during network errors.

---

## Deliverables

- A fully functional and well-structured iOS project.
- Source code hosted in this repository with:
  - Clear commit history
  - Meaningful commit messages

---

## Evaluation Criteria

1. **Adherence to Requirements**:
   - Meets all specified functionality and guidelines.

2. **Architecture**:
   - Correct implementation of MVVM and DDD principles.

3. **Code Quality**:
   - Readability, maintainability, and adherence to Swift coding conventions.

4. **Testing**:
   - Comprehensive test coverage for critical components.
   - Effective error handling strategies.

---
