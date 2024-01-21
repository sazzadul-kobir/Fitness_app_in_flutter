import 'package:fittnessapp/models/catagory_models.dart';
import 'package:fittnessapp/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CatagoryModel> catgories=[];
  List<dietModel> diets=[];

  void getdiets(){
    diets=dietModel.getDiets();
  }

  void getcategories(){
    catgories=CatagoryModel.getCatagory();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcategories();
    getdiets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Textfield(),
      //
          SizedBox(
            height: 40,
          ),
      //
          Catagory(),

          SizedBox(
            height: 40,
          ),

         Recommendation(diets: diets),




        ],
      )
    );
  }

  AppBar Appbar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,



      leading: GestureDetector(
        onTap: (){

        },

        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
          alignment: Alignment.center,
        ),
      ),



      actions: [
        GestureDetector(
          onTap: (){

          },
          child: Container(
            margin: EdgeInsets.all(10),
            width: 37,
            decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            alignment: Alignment.center,
          ),
        )
      ],
    );



  }

  Catagory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),

          child: Text(
            "Category",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18
            ),

          ),
        ),

        SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          padding: EdgeInsets.only(
            right: 20,
            left: 20
          ),
          child: ListView.separated(
              itemCount: catgories.length,
              scrollDirection: Axis.horizontal,


              separatorBuilder: (context,index)=>SizedBox(width: 25,),

              itemBuilder: (context,index){
                return Container(
                  width: 100,

                  decoration: BoxDecoration(
                      color: Color(int.parse(catgories[index].boxcolor)).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(

                        width:50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child:Padding(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(catgories[index].iconpath,)
                        ),

                      ),
                      Text(
                        catgories[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    ],
                  ),
                );
              }

          ),
        )
      ],
    );
  }
}

class Recommendation extends StatelessWidget {
  const Recommendation({
    super.key,
    required this.diets,
  });

  final List<dietModel> diets;

  @override
  Widget build(BuildContext context) {
    return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [

           Padding(
             padding: EdgeInsets.only(left: 20),

             child: Text(
               "Recommendation \nfor diet",
               style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w600,
                   fontSize: 18
               ),

             ),
           ),
           SizedBox(
             height: 15,
           ),


            Container(
              height: 200,
               padding: EdgeInsets.only(left: 20,right: 20),
               child: ListView.separated(
                   itemBuilder: (context,index){
                      return Container(
                        width: 190,
                       decoration: BoxDecoration(
                           color: Color(int.parse(diets[index].boxcolor)).withOpacity(0.5),
                           borderRadius: BorderRadius.circular(20)
                         ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(diets[index].iconpath),
                            Text(
                              diets[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                 fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                            Text(
                              diets[index].level +' | '+ diets[index].calories + ' | ' +
                                diets[index].duration,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xff7b6f72),

                              ),
                            ),
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                               gradient: LinearGradient(
                                 colors: [
                                   diets[index].viewselected? Color(0xff9dceff):Colors.transparent,
                                   diets[index].viewselected?Color(0xff92a3fd):Colors.transparent
                                 ]
                               ),
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: Center(
                                child: Text(
                                  'view',
                                  style: TextStyle(
                                    color: diets[index].viewselected? Colors.white:Color(0xffc58bf2),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                       );


                   },
                   separatorBuilder: (context,index){
                     return SizedBox(
                       width: 25,
                     );
                   },
                   itemCount: diets.length,
                 scrollDirection: Axis.horizontal,

               ),

             ),



         ],
       );
  }
}



class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20, left: 20,right: 20),
      decoration: BoxDecoration(

        boxShadow: [
          BoxShadow(
            color: Color(0xff1d1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0
          )
        ]
      ),

      child: TextField(

        decoration: InputDecoration(

          prefixIcon: Padding(
            padding: EdgeInsets.all(15),
              child: SvgPicture.asset('assets/icons/Search.svg',)
          ),

        hintText: "Search pancake",
        hintStyle: TextStyle(
          fontSize: 14,
          color: Color(0xffa9a2a2)
        ),
        suffixIcon:  Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 28,
                width: 0.1,
                child: Container(

                  color: Colors.black54,
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: SvgPicture.asset('assets/icons/Filter.svg',color: Colors.blue,)
              ),
            ],
          ),
        ),


          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          )
        ),

      ),
    );
  }
}
