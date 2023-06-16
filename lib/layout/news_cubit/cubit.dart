import 'package:apis/layout/news_cubit/news_states.dart';
import 'package:apis/moduls/business.dart';
import 'package:apis/moduls/science.dart';
import 'package:apis/moduls/setting.dart';
import 'package:apis/moduls/sports.dart';
import 'package:apis/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(Newsinitstate());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_football),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    )
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SciencesScreen(),
    SettingScreen(),
  ];

  void changebottomnavbar(index) {
    currentIndex = index;
    if (index == 1) getsports();
    if (index == 2) getscience();
    emit(Newsbattonnavbarstate());
  }

  List<dynamic> business = [];
  void getbusiness() {
    emit(Newsgetbusinessloadingstate());
    Diohelper.getdata(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': '7b1baaba4e8c4e1e82938974f7aca8b3'
    }).then((value) {
      print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(Newsgetbusinesssuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(Newsgetbusinesserrorstate(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getsports() {
    emit(Newsgetsportsloadingstate());
    if (sports.length == 0) {
      Diohelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '7b1baaba4e8c4e1e82938974f7aca8b3'
      }).then((value) {
        print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(Newsgetsportssuccessstate());
      }).catchError((error) {
        print(error.toString());
        emit(Newsgetsportserrorstate(error.toString()));
      });
    } else {
      emit(Newsgetsportssuccessstate());
    }
  }

  List<dynamic> science = [];
  void getscience() {
    emit(Newsgetscienceloadingstate());
    if (science.length == 0) {
      Diohelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '7b1baaba4e8c4e1e82938974f7aca8b3'
      }).then((value) {
        print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(Newsgetsciencesuccessstate());
      }).catchError((error) {
        print(error.toString());
        emit(Newsgetscienceerrorstate(error.toString()));
      });
    } else {
      emit(Newsgetsciencesuccessstate());
    }
  }
}
