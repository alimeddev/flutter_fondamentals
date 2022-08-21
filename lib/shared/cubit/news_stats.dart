abstract class NewsStats {}

class NewsInitialState extends NewsStats{}
class ButtonNavigationState extends NewsStats{}
class NewsBusinessLoadingStat extends NewsStats{}
class NewsBusinessSuccessStat extends NewsStats{}
class NewsBusinessErrorStat extends NewsStats{
  final String error;

  NewsBusinessErrorStat(this.error);

}
class ChangeNewsAppMode extends NewsStats{}

class NewsSportSuccessStat extends NewsStats{}
class NewsSportLoadingStat extends NewsStats{}
class NewsSportErrorStat extends NewsStats{
  final String error;

  NewsSportErrorStat(this.error);

}

class NewsScienceLoadingStat extends NewsStats{}
class NewsScienceSuccessStat extends NewsStats{}
class NewsScienceErrorStat extends NewsStats{
  final String error;

  NewsScienceErrorStat(this.error);

}

class NewsSearchLoadingStat extends NewsStats{}
class NewsSearchSuccessStat extends NewsStats{}
class NewsSearchErrorStat extends NewsStats{
  final String error;

  NewsSearchErrorStat(this.error);

}