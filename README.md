# nasa_api


Main Application
The main entry point of the application is in main.dart. It sets up the Flutter application and uses the BlocProvider to manage the state of the application using the NasaBloc.

BLoC (Business Logic Component)
The BLoC pattern is used to manage the state of the application. The NasaBloc class in nasa_bloc.dart handles fetching data from the NASA API and updating the state accordingly.

Summary
This project is a cross-platform Flutter application that fetches data from the NASA API and displays it. It uses the BLoC pattern for state management and includes platform-specific code for Linux and Windows to handle the application setup and window management.
