import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_api/api/api.dart';
import 'package:nasa_api/bloc/nasa_event.dart';
import 'package:nasa_api/bloc/nasa_state.dart';

class NasaBloc extends Bloc<NasaEvent, NasaState> {
  NasaBloc() : super(NasaStateInitial()) {
    on<NasaEventFetch>(_fetchApiData);
  }
  Future<void> _fetchApiData(
    NasaEventFetch event,
    Emitter<NasaState> emit,
  ) async {
    emit(NasaStateLoading());

    try {
      // Fetch data from API
      final response = await http.get(
        Uri.parse(
          'https://api.nasa.gov/planetary/apod?api_key=${ApiManager().nasa_api}',
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final url = data['url'];
        emit(NasaStateSuccess(url: url));
      } else {
        emit(NasaStateError(message: 'Failed to fetch data'));
      }
    } catch (e) {
      emit(NasaStateError(message: e.toString()));
    }
  }
}
