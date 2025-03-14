import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api/bloc/nasa_bloc.dart';
import 'package:nasa_api/bloc/nasa_event.dart';
import 'package:nasa_api/bloc/nasa_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NasaBloc(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('NASA API'),
      ),
      body: BlocBuilder<NasaBloc, NasaState>(
        builder: (context, state) {
          if (state is NasaStateInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<NasaBloc>().add(NasaEventFetch());
                },
                child: const Text('Fetch Data'),
              ),
            );
          } else if (state is NasaStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NasaStateSuccess) {
            return Center(child: Image.network(state.url));
          } else if (state is NasaStateError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
