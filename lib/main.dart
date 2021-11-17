// ignore_for_file: prefer_const_constructors
// @dart=2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();
  bool isDark=CacheHelper.getBoolen(key: 'isDark');
  runApp( MyApp(isDark));
}
class MyApp extends StatelessWidget {
 final bool isDark;
 MyApp(this.isDark); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness()..getSports()..getScience()..isModeChange(fromShared: isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){},
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme: TextTheme(
                    bodyText1:TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )
                ),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor:Colors.white ,
                  elevation: 25,
                  type: BottomNavigationBarType.fixed,
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme:  AppBarTheme(
                    titleSpacing: 20,
                    iconTheme: IconThemeData(color: Colors.black),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white,
                    elevation: 0
                )
            ),
            darkTheme: ThemeData(
                textTheme: TextTheme(
                    bodyText1:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )
                ),
                scaffoldBackgroundColor: HexColor('333739'),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor:HexColor('333739') ,
                  elevation: 25,
                  type: BottomNavigationBarType.fixed,
                ),
                appBarTheme:  AppBarTheme(
                  titleSpacing: 20,
                    iconTheme: IconThemeData(color: Colors.white),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor:  HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                    titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                    backgroundColor:  HexColor('333739'),
                    elevation: 0
                )

            ),
            themeMode:NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}