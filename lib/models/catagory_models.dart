

class CatagoryModel{

  String name;
  String iconpath;
  String boxcolor;

  CatagoryModel({required this.name,required this.iconpath, required this.boxcolor});



  static List<CatagoryModel> getCatagory(){
    List<CatagoryModel> catagory=[
      CatagoryModel(name: "salad", iconpath:'assets/icons/plate.svg', boxcolor: '0xff92a3fd',),
      CatagoryModel(name: "cake", iconpath:'assets/icons/pancakes.svg', boxcolor: '0xffc588f2',),
      CatagoryModel(name: "pie", iconpath:'assets/icons/pie.svg', boxcolor: '0xff92a3fd',),
      CatagoryModel(name: "smothies", iconpath:'assets/icons/orange-snacks.svg', boxcolor: '0xffc588f2',),

    ];

    return catagory;


  }



}