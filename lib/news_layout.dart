// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/search.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/components.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          appBar: AppBar(
            title: Text(cubit.Title[cubit.currentIndex]),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: () {
                  NewsCubit.get(context).isModeChange();

                },
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.changeIndex(value);
            },
            currentIndex: cubit.currentIndex,
            items: cubit.BottomItem,
          ),
        );
      },
    );
  }
}
