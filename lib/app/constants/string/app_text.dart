class AppString {
  AppString._init();

  static AppString? _instance;
  // ignore: prefer_constructors_over_static_methods
  static AppString get instance {
    _instance ??= AppString._init();
    return _instance!;
  }

  final String appBarTitle = 'Тапшырма 07';
  final String finished = 'Аяктады!';
  final String finishedTest = 'Сиз тесттин аягына жеттиниз ...';
  final String buttonTrue = 'Туура';
  final String buttonFalse = 'Туура эмес';
  
}
