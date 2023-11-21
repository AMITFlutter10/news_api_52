


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_52/dio_helper.dart';
import 'package:news_api_52/news_cubit/news_state.dart';
import 'package:news_api_52/view/screen/business_page.dart';
import 'package:news_api_52/view/screen/sport_page.dart';

import '../const.dart';
import '../view/screen/health_page.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(InitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=935fd7ff5d5d47b9b01be1f7c0b9ba00

  List businessList =[];
  List sportList =[];
List healthList=[];

  List<String>title =[
    'Business',
    'sport',
    'health',
  ];
  int currentIndex= 0;
  void changeNavBar(int index){
    currentIndex= index;
    emit(ChangeNavBarState());
  }

  List<Widget>screens=[
    BusinessPage(),
    SportPage(),
    HealthPage(),
  ];

Future<void> getBusiness()async{
  emit(LoadingBusinessDataState());
   DioHelper.getData(url: endPoint,
  queryParameters: {
    'country':'us',
    'category':'business',
    'apiKey':'935fd7ff5d5d47b9b01be1f7c0b9ba00'
  }).then((value){
     businessList = value.data['articles'];
     print(businessList);
   emit(GetBusinessDataState());
   }).catchError((error){
     print(error);
     emit(ErrorBusinessDataState());
   });
}
Future<void> getSport()async{
  emit(LoadingSportDataState());
   DioHelper.getData(url: endPoint,
  queryParameters: {
    'country':'us',
    'category':'sport',
    'apiKey':'935fd7ff5d5d47b9b01be1f7c0b9ba00'
  }).then((value){
     sportList = value.data['articles'];
     print(sportList);
   emit(GetSportDataState());
   }).catchError((error){
     print(error);
     emit(ErrorSportDataState());
   });
}


Future<void> getHealth()async{
  emit(LoadingHealthDataState());
   DioHelper.getData(url: endPoint,
  queryParameters: {
    'country':'us',
    'category':'health',
    'apiKey':'935fd7ff5d5d47b9b01be1f7c0b9ba00'
  }).then((value){
     healthList = value.data['articles'];
     print(healthList);
   emit(GetHealthDataState());
   }).catchError((error){
     print(error);
     emit(ErrorHealthDataState());
   });
}



}