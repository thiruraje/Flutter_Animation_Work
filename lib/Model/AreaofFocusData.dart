class AreaofFocusData{
  AreaofFocusData({
    this.imagePath = '',
    this.title = '',
    this.detail = '',
    this.topics,
  });

  String imagePath;
  String title;
  String detail;
  List<String> topics;

  static List<AreaofFocusData> tabIconsList = <AreaofFocusData>[
    AreaofFocusData(
      imagePath: 'assets/images/runner.png',
      title: 'python',
      topics: <String>['Topic 1,', 'Topic 2,', 'Topic 3', 'Topic 4', 'Topic 5','Topic 6','Topic 7','Topic 8'],
      detail: '#FA7D82',
    ),
    AreaofFocusData(
      imagePath: 'assets/images/runner.png',
      title: 'react',
      topics: <String>['Topic 1,', 'Topic 2,', 'Topic 3', 'Topic 4', 'Topic 5','Topic 6','Topic 7','Topic 8'],
      detail: '#738AE6',
    ),
    AreaofFocusData(
      imagePath: 'assets/images/runner.png',
      title: 'java',
      topics: <String>['Topic 1,', 'Topic 2,', 'Topic 3', 'Topic 4', 'Topic 5','Topic 6','Topic 7','Topic 8'],
      detail: '#FE95B6',
    ),
    
  ];
}