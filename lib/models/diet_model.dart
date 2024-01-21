class dietModel {
  String name;
  String iconpath;
  String level;
  String duration;
  String calories;
  String boxcolor;
  bool viewselected;

  dietModel({
    required this.name,
    required this.iconpath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewselected,
    required this.boxcolor,
  });

  static List<dietModel> getDiets() {
    List<dietModel> diets = [
      dietModel(
          name: "Honey pancake",
          iconpath: "assets/icons/honey-pancakes.svg",
          level: 'Easy',
          duration: '30 mins',
          calories: '180cal',
          viewselected: true,
        boxcolor: "0xff92a3fd"
      ),
      dietModel(
        name: "Canai Bread",
        iconpath: "assets/icons/canai-bread.svg",
        level: 'Easy',
        duration: '20 mins',
        calories: '180cal',
        viewselected: false ,
        boxcolor: "0xffc588f2"
      ),
      dietModel(
        name: "salmon nigiri",
        iconpath: "assets/icons/salmon-nigiri.svg",
        level: 'hard',
        duration: '50 mins',
        calories: '200cal',
        viewselected: true,
        boxcolor: "0xff92a3fd"
      ),

    ];


    return diets;
  }
}
