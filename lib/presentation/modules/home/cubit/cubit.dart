// ignore_for_file: void_checks, avoid_print

import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most_popular_articales/data/network/dio_helper.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/PopularArticlesResponse.dart';
import 'package:most_popular_articales/domain/usecase/home_usecase.dart';
import 'package:most_popular_articales/presentation/modules/home/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  final HomeUseCase _homeUseCase;

  AppCubit(this._homeUseCase) : super(InitialAppStates());

  //instance
  static AppCubit get(context) => BlocProvider.of(context);

  PopularArticlesResponse? popularArticlesResponse;

  void getPopularArticles() async {
    emit(LoadingAppStates());
    (await _homeUseCase.execute(Void)).fold((failure) {
      // left -> failure
      print(failure.message);
      emit(ErrorAppStates());
    }, (response) {
      // right -> data (success)
      // content
      popularArticlesResponse = response;
      print(popularArticlesResponse!.status);
      emit(SuccessAppStates());
    });
  }
}
