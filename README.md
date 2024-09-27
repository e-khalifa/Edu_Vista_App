# Edu Vista
Edu Vista is a comprehensive educational app designed for Android, built using Flutter. It offers a range of features to enhance the learning experience. The app leverages BLoC for efficient state management and Firebase for backend services, ensuring a robust and scalable platform.

## ✨ Key Features
### Course Management
-   [x] Browse available courses
-   [x] Search for specific courses
-   [x] Manage course enrollments
-   [x] Purchase courses
-   [x] View purchased courses
### User Authentication
-   [x] Secure sign-up
-   [x] Easy login with Firebase Authentication
### Payment Integration
-   [x] Smooth and secure payment process with Paymob
### Content Display
-   [x] Embedded video playback
-   [x] Dynamic content loading
-   [x] Efficient image caching
### Customization and UX
-   [x] Smooth animations and transitions
-   [x] Responsive UI design

## 📸 Demo
 [Edu vista Demo](https://drive.google.com/drive/u/0/folders/1ctOTkt5xmhGO-bCRY0Cc-EnJ3IhvKti3)  


## 📸 Screenshots

<!-- Variables -->
[home1]: assets/screenshots/home1.JPG 'Home #1'
[home2]: assets/screenshots/home2.JPG 'Home #2'
[drawer]: assets/screenshots/drawer.JPG 'Drawer'
[categories1]: assets/screenshots/categories1.JPG 'Categories #1'
[categories2]: assets/screenshots/categories2.JPG 'Categories #2'
[categories3]: assets/screenshots/categories3.JPG 'Categories #3'
[addcategory]: assets/screenshots/addcategory.JPG 'AddCategory'
[clients]: assets/screenshots/clients.JPG 'Clients'
[addclient]: assets/screenshots/addclient.JPG 'AddClient'
[products]: assets/screenshots/products.JPG 'Products'
[productsearch]: assets/screenshots/productsearch.JPG 'ProductSearch'
[productssort]: assets/screenshots/productssort.JPG 'ProductsSort'
[addproduct1]: assets/screenshots/addproduct1.JPG 'AddProduct #1'
[addproduct2]: assets/screenshots/addproduct2.JPG 'AddProduct #2'
[allsales]: assets/screenshots/allsales.JPG 'AllSales'
[newsale1]: assets/screenshots/newsale1.JPG 'NewSale #1'
[newsale2]: assets/screenshots/newsale2.JPG 'NewSale #2'
[newsale3]: assets/screenshots/newsale3.JPG 'NewSale #3'
[exchangerate]: assets/screenshots/exchangerate.JPG 'ExchangeRate'
[deletedialog]: assets/screenshots/deletedialog.JPG 'DeleteDialog'
[about]: assets/screenshots/about.JPG 'About'


<!-- Table -->

|      Home #1       |      Home #2      |      Drawer      |
| :---------------: | :-------------: | :---------------: |
| ![Home #1][home1] | ![Home #2][home2] | ![Drawer][drawer] |

|        Categories #1        |       Categories #2       |      Categories #3       |
| :---------------------: | :-----------------: | :---------------: |
| ![Categories #1][categories1] | ![Categories #2][categories1] | ![Categories #3][categories3] |

|      AddCategory       |      Clients       |      AddClient       |
| :---------------: | :---------------: | :---------------: |
| ![AddCategory][addcategory] | ![Clients][clients] | ![AddClient][addclient] |

|        Products        |       ProductSearch       |      ProductsSort      |
| :---------------------: | :-----------------: | :---------------: |
| ![Products][products] | ![ProductSearch][productsearch] | ![ProductsSort][productssort] |

|      AddProduct #1       |      CAddProduct #2       |      AllSales       |
| :---------------: | :---------------: | :---------------: |
| ![AddProduct #1][addproduct1] | ![AddProduct #2][addproduct2] | ![AllSales][allsales] |

|        NewSale #1        |       NewSale #2       |      NewSale #3      |
| :---------------------: | :-----------------: | :---------------: |
| ![NewSale #1][newsale1] | ![NewSale #2][newsale2] | ![NewSale #3][newsale3] |

|      ExchangeRate       |      DeleteDialog       |      About       |
| :---------------: | :---------------: | :---------------: |
| ![ExchangeRate][exchangerate] | ![DeleteDialog][deletedialog] | ![About][about] |


## 📚 Dependencies

| Name                                                                                  | Version       | Description                                                                                                                                                              |
| ------------------------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [device_preview](https://pub.dev/packages/device_preview)                                             | 1.1.0        | Helps ensure your app's UI looks great and functions well across different devices and screen sizes without needing to deploy it to physical devices. as it allows you to preview your app on various device screens and orientations directly from your development environment.  |
| [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)                                                 | 5.9.3       |  A popular package for building a responsive UI that adapts to different screen sizes and resolutions.                                                                                                                        |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc)                                 | 8.1.6        | It Manages app state using the BLoC (Business Logic Component) pattern, promoting separation of business logic from UI.                                                                                                                                |
| [shared_preferences](https://pub.dev/packages/shared_preferences)                                     | 2.2.3       | It Stores simple data persistently across app launches, such as user preferences and settings.                                                                                                                                 |
| [firebase_core](https://pub.dev/packages/firebase_core)               | 3.3.0 | It's essential for integrating firebase services, as it intializes them in the app.                                                                                              |
| [firebase_auth](https://pub.dev/packages/firebase_auth)                                             | 2.1.0       |  Handles user authentication securely and efficiently, supporting various methods such as email/password and social logins.                                         |
| [cloud_firestore](https://pub.dev/packages/cloud_firestore)                                             | 5.2.1       |  This package manages and retrieves data in real-time using a NoSQL cloud database.                                         |
| [firebase_storage](https://pub.dev/packages/firebase_storage)                                             | 12.2.0       |  It Provides a secure and scalable way to handle file storage, such as images, videos, and other user content.                                       |
| [file_picker](https://pub.dev/packages/file_picker)               | 8.0.5 | It allows users to select files from their device storage..                                                                                              |
| [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)                                             | 5.1.0      |  It Keeps sensitive information like API keys secure and separate from the source code.                                        |
| [url_launcher](https://pub.dev/packages/url_launcher)                                             | 6.3.0       |  It Allows users to open external links easily.                                         |
| [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)                                             | 9.0.3      |  It Provides a youtube IFrame Within your app.                                        |
| [cached_network_image](https://pub.dev/packages/cached_network_image)                                           | 3.4.0         | It stores loaded images from the web in its cache directory, reducing the need for frequent network requests. This improves performance and ensures images are available even when the device is offline.                                                                                                                           | | [paymob_payment](https://pub.dev/packages/paymob_payment)                                           | 0.0.1+1        | Integrates Paymob’s payment gateway to handle transactions securely and efficiently.                                                                                                                           |
| [animated_rating_stars](https://pub.dev/packages/animated_rating_stars)                                           | 1.0.1       | Offers animated star rating widgets for engaging course ratings.                                                                                                                           |
#   E d u _ V i s t a _ A p p  
 