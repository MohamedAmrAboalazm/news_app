// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, curly_braces_in_flow_control_structures
// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/settings.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) =>BlocProvider.of(context);
  List<Widget> Screens = [
    BusinessSceen(),
    SportsSceen(),
    ScienceSceen(),
  ];
  List<String> Title = ['Business News', 'Sports News', 'Science News'];
  List<BottomNavigationBarItem> BottomItem=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];
  var currentIndex=0;
  void changeIndex(int index)
  {

    currentIndex=index;
    emit(NewsBottomNavBarState());
  }
  List<dynamic> business=[];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(

        url: "v2/top-headlines",
        query: {"country":"eg",
          "category":"business",
          "apiKey":"a051b17cd0434699a62f61644e911856",
        }).then((value) {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsGetBusinessErorrState(e.toString()));
    });
  }
  List<dynamic> sports=[];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(

        url: "v2/top-headlines",
        query: {"country":"eg",
          "category":"sports",
          "apiKey":"a051b17cd0434699a62f61644e911856",
        }).then((value) {
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsGetSportsErorrState(e.toString()));
    });
  }
  List<dynamic> science=[];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(

        url: "v2/top-headlines",
        query: {"country":"eg",
          "category":"science",
          "apiKey":"a051b17cd0434699a62f61644e911856",
        }).then((value) {
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsGetScienceErorrState(e.toString()));
    });
  }
  List<dynamic> search=[];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    search=[];
    DioHelper.getData(

        url: "v2/everything",
        query: {"q":"$value",
          "apiKey":"a051b17cd0434699a62f61644e911856",
        }).then((value) {
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsGetSearchErorrState(e.toString()));
    });
  }
  bool isDark=false;
  void isModeChange({bool fromShared}){
    if(fromShared !=null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    }
    else
      {
        isDark=!isDark;
        CacheHelper.putBoolen(key: 'isDark', value: isDark).then((value) {
            emit(NewsChangeModeState());
        });
      }



  }
}