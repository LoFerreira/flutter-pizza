# Pizza Delivery (Flutter)

Flutter app with Firebase authentication and pizza listing integrated with Cloud Firestore. It follows a BLoC-based architecture and repository separation (`user_repository`, `pizza_repository`).

## Overview

- Email/password authentication (Firebase Auth)
- Read pizza data via Cloud Firestore (`pizzas` collection)
- Responsive UI using Material Design and selective Cupertino components
- State management with BLoC (`flutter_bloc`)
- Repository pattern for users and pizzas domain
- BLoC observability with `SimpleBlocObserver`

## Tech & Dependencies

- Flutter SDK (compatible with Dart `^3.10.7`)
- Firebase Core, Firebase Auth, Cloud Firestore
- `bloc`, `flutter_bloc`, `equatable`
- `font_awesome_flutter`
- Local packages: [packages/user_repository](packages/user_repository), [packages/pizza_repository](packages/pizza_repository)

## Architecture

- Entry at [lib/main.dart](lib/main.dart): initializes Firebase, sets `Bloc.observer`, and injects `UserRepository`.
- `MyApp` in [lib/app.dart](lib/app.dart): provides `AuthenticationBloc`.
- `MyAppView` in [lib/app_view.dart](lib/app_view.dart): decides between welcome screen and home based on `AuthenticationStatus`.
- Authentication:
  - `AuthenticationBloc` ([lib/blocs/authentication_bloc](lib/blocs/authentication_bloc)): listens to user changes via `UserRepository`.
  - `SignInBloc` and `SignUpBloc` ([lib/screens/auth/blocs](lib/screens/auth/blocs)): perform login, sign-up, and persistence.
- Pizzas domain:
  - `GetPizzaBloc` ([lib/screens/home/blocs/get_pizza_bloc](lib/screens/home/blocs/get_pizza_bloc)): fetches the pizza list.
  - Listing UI in [lib/screens/home/views/home_screen.dart](lib/screens/home/views/home_screen.dart) and details in [lib/screens/home/views/details_screen.dart](lib/screens/home/views/details_screen.dart).
- Repositories:
  - Users: [packages/user_repository](packages/user_repository) with `FirebaseUserRepo`.
  - Pizzas: [packages/pizza_repository](packages/pizza_repository) with `FirebasePizzaRepo`.

## Folder Structure

- [lib/](lib): app, view, global blocs, components, and screens.
- [lib/screens/auth](lib/screens/auth): authentication screens and BLoCs.
- [lib/screens/home](lib/screens/home): pizza list and details plus loading BLoC.
- [lib/components](lib/components): reusable widgets (e.g., `MyTextField`, `MyMacroWidget`).
- [packages/user_repository](packages/user_repository): models, entities, `UserRepository`, and Firebase implementation.
- [packages/pizza_repository](packages/pizza_repository): models, entities, `PizzaRepo`, and Firebase implementation.
- [assets/](assets): images and assets.

## Data Model (Firestore)

Collections used:

1. `users` (one document per user):

```json
{
  "userId": "string",
  "email": "string",
  "name": "string",
  "hasActiveCart": true
}
```

2. `pizzas` (one document per pizza):

```json
{
  "pizzaId": "string",
  "picture": "https://...",
  "name": "string",
  "description": "string",
  "price": 29,
  "discount": 10,
  "isVeg": true,
  "spicy": 2,
  "macros": {
    "calories": 300,
    "proteins": 12,
    "fats": 8,
    "carbs": 42
  }
}
```

Notes:

- UI applies `discount` to the displayed price.
- `spicy`: 1 (Bland), 2 (Balance), 3 (Spicy).
- `macros` is a nested object per `MacrosEntity`.

## Main Features

- Sign-up: validates password (uppercase, lowercase, number, special, 8+ chars) and persists data in Firestore.
- Sign-in: email/password with error feedback and loading states.
- Home: pizza grid with image, tags (`VEG/NON-VEG`, `spicy` level), discounted price, navigation to details.
- Details: macros visualization (`Calories`, `Protein`, `Fat`, `Carbs`).
- Logout: AppBar action triggers `SignOutRequired`.

## Next Steps (Ideas)

- Real cart and checkout using `hasActiveCart`.
- Filters and search (veg, spicy, price).
- Offline persistence and Firestore sync.
- Internationalization with `flutter_localizations`.
