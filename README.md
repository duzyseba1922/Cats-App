# Cats-App
Simple iOS app with the list of all cat breeds using TheCatAPI.

# Problem
Creating simple app that fetches list of cat breeds using TheCatAPI.

# Solution
Created an app using technologies listed below:

Platform: iOS
Programming language: Swift
UI: SwiftUI
Networking: URLSession
Architecture: MVVM

# Choices made during the process of coding:
- Used dependency injection pattern for better testability in the future
- Used CachedAsyncImage for caching downloaded data to increase performance and avoid unnecessary requests
- Added DataFetcher protocol for easier functionality extension in the future

# Improvements in the future
- Completing CatBreedDetailsView to fully showcase the power of TheCatAPI.
- Adding animations
- Adding support for TheDogAPI
- Add unit tests and UI tests
- Add LaunchScreen and AppIcon
- Improving security by storing api key locally on the machine instead of pushing it to remote repository
