
// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  var searchControler=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var List =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body:Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaulyFormField(
                  prefixicon: Icons.search,
                  controller: searchControler,
                  keyboardtype: TextInputType.text,
                  labelText:'Search' ,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                    return null;
                  }
              ),
            ),
            Expanded(child: articleBuilder( List , context,isSearch: true))
          ],) ,

        );
      },
    );
  }
}
