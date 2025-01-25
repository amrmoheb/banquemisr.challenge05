# Evaluation Task (iOS)

This project is an iOS application I built to display lists of movies using **The Movie Database (TMDb) API**. It includes three categories of movies: **Now Playing**, **Popular**, and **Upcoming**, and allows users to view detailed information about each movie. Here's a breakdown of how I approached the task:

---

## What I Did

### 1. List Screen
- I implemented **three tabs** using a native `UITabBarController`. Each tab represents a movie category:
  - **Now Playing**
  - **Popular**
  - **Upcoming**
- For each tab, I used a `UITableView` to display a list of movies fetched from the TMDb API.
- Each movie item in the list displays:
  - **Title**
  - **Release Date**
  - **Poster Image**

### 2. Detail Screen
- I created a detail screen that shows additional information about a selected movie. This screen includes:
  - **Overview**
  - **Genres**
  - **Runtime**
- I added a back button to navigate from the detail screen back to the list screen.
- The movie details are fetched from the TMDb API using the movie's unique ID.

---

## Architecture and Design

### MVVM Architecture
- I followed the **Model-View-ViewModel (MVVM)** pattern:
  - **Model**: Represents movie entities and handles data mapping.
  - **ViewModel**: Manages fetching data from use cases and prepares it for the view.
  - **View**: Displays the data and reacts to updates from the ViewModel.

### Domain-Driven Design
- I organized the codebase into:
  - **Domain Layer**: Contains core logic, such as models and use cases.
  - **Data Layer**: Manages API integration, network requests, and data parsing.
  - **Presentation Layer**: Handles the UI using ViewControllers and ViewModels.

### Error Handling
- I implemented error handling to manage:
  - Network issues
  - API failures
  - Unexpected exceptions
- Informative error messages are displayed to users when something goes wrong.

### Caching
- I added a caching mechanism to store previously fetched movie data locally. This helps:
  - Show cached data during network errors.
  - Provide a better experience in offline mode.

---

## Testing
- I wrote unit tests to cover critical components, including:
  - **Domain Logic**: Use cases and data transformations.
  - **Data Retrieval**: API integration

---

## Tools and Guidelines Followed
- **No Third-Party Frameworks**: I avoided using any dependency managers like CocoaPods or Swift Package Manager.
- **Swift Coding Standards**: I adhered to best practices for clean, readable, and maintainable code.
- **UI/UX**: I focused on creating a clean and intuitive user interface.

---
