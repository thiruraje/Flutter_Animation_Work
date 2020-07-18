class TeamMemberListData{
  TeamMemberListData({
    this.imagePath = '',
    this.membername = '',
    this.detail = '',
    this.startColor = '',
    this.endColor = '',
    this.role,
  });

  String imagePath;
  String membername;
  String detail;
  String startColor;
  String endColor;
  List<String> role;

  static List<TeamMemberListData> tabIconsList = <TeamMemberListData>[
    TeamMemberListData(
      imagePath: 'assets/images/thiru.jpeg',
      membername: 'Thiru',
      role: <String>['Flutter,', 'React,', 'Laravel'],
      detail: 'Developer in Greefi Technologies',
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    TeamMemberListData(
      imagePath: 'assets/images/vicky.jpeg',
      membername: 'Vicky',
      role: <String>['C,', 'C++,'],
       detail: 'Future Government Employee',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    TeamMemberListData(
      imagePath: 'assets/images/karthik.jpeg',
      membername: 'Karthik',
      role: <String>['Python','C'],
       detail: 'Python Developer',
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    TeamMemberListData(
      imagePath: 'assets/fitness_app/dinner.png',
      membername: 'Vikas',
      role: <String>['Python', 'Java','React'],
       detail: 'React Developer',
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
    TeamMemberListData(
      imagePath: 'assets/fitness_app/dinner.png',
      membername: 'Soundhar',
      role: <String>['Python'],
       detail: '#FA7D82',
       startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    TeamMemberListData(
      imagePath: 'assets/fitness_app/dinner.png',
      membername: 'Parthiban',
      role: <String>['Editor'],
       detail: 'Editor',
        startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
    TeamMemberListData(
      imagePath: 'assets/fitness_app/dinner.png',
      membername: 'Srini',
      role: <String>['Editor'],
       detail: 'Animator',
        startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
  ];
}