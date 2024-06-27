# ChatMessenger

ChatMessenger is a chat application developed in SwiftUI, using the MVVM (Model-View-ViewModel) architecture and Firebase for authentication and data storage. This project demonstrates how to build a real-time messaging app for iOS.

## Features

- User authentication (email and password)
- Real-time messaging
- Modern and responsive UI with SwiftUI
- MVVM architecture

## Demo Video

[!(https://youtu.be/-i0KQ5Ki4cI)

## Technologies Used

- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel)
- [Firebase](https://firebase.google.com/)

## Prerequisites

- Xcode 12.0 or later
- Swift 5.3 or later
- Firebase account

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/ismv00/ChatMessenger.git
    cd ChatMessenger
    ```

2. Open the project in Xcode:

    ```bash
    open ChatMessenger.xcodeproj
    ```

3. Install Firebase dependencies using CocoaPods (if you don't have CocoaPods installed, follow the instructions at [CocoaPods](https://cocoapods.org/)):

    ```bash
    pod install
    ```

4. Configure Firebase:
    - Go to the [Firebase console](https://console.firebase.google.com/), create a new project, and add an iOS app.
    - Download the `GoogleService-Info.plist` file and add it to your Xcode project.
    - Configure Firebase Authentication and Firestore in the Firebase console.

5. Build and run the project in the simulator or on an iOS device:

    ```bash
    open ChatMessenger.xcworkspace
    ```

    Select the desired simulator or device and click "Run" (Cmd+R).


## Functionality

### Authentication

ChatMessenger uses Firebase Authentication to manage user authentication. Users can register and log in with their email and password.

### Messaging

Real-time messaging is managed by Firebase Firestore. The user interface is automatically updated whenever a new message is sent or received.

### User Interface

ChatMessenger's interface is built with SwiftUI, providing a smooth and modern user experience. The MVVM architecture helps maintain separation of concerns and facilitates code maintenance.

## Contribution

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For more information, contact:

- [Igor S. Menezes](https://github.com/ismv00)
- Email: ismv00@icloud.com

---

Made with ❤️ by [Igor S. Menezes](https://github.com/ismv00)


