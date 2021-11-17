abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsBottomNavBarState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErorrState extends NewsStates{
  final String erorr;
  NewsGetBusinessErorrState(this.erorr);
}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErorrState extends NewsStates{
  final String erorr;
  NewsGetSportsErorrState(this.erorr);
}
class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErorrState extends NewsStates{
  final String erorr;
  NewsGetScienceErorrState(this.erorr);
}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErorrState extends NewsStates{
  final String erorr;
  NewsGetSearchErorrState(this.erorr);
}


class NewsChangeModeState extends NewsStates{}

