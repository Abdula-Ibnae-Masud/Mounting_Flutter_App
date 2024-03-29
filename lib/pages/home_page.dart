import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/app_cubit_states.dart';
import 'package:myapp/cubit/app_cubits.dart';
import 'package:myapp/misc/colors.dart';
import 'package:myapp/widgets/app_large_text.dart';
import 'package:myapp/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
   var images = {
    "mountain8.png" : "Mountain",
    "mountain4.png" : "Hiking",
    "mountain3.png" : "Kayaking",
    "mountain.png" : "Snorkling"
  }; 

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if (state is LoadedState){
            var info = state.places;
            return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(  // For Menu text
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: [
                //const Icon(Icons.menu, size:30, color: Colors.black,),
                IconButton(onPressed: (){
                    BlocProvider.of<AppCubits>(context).goFrontPage();
                  }, 
                  icon: const Icon(Icons.backspace_rounded, size: 40,),
                  color: Colors.blueGrey,
                  ),
                  
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.grey.withOpacity(0.5),
                    image: const DecorationImage(
                     image: AssetImage("img/me.png"),
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 20,), // For Discover text

          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),

          const SizedBox(height: 20,), // For Tab bar text
          
          // Container was in use
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey, 
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: const [
                Tab(text: "Places"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: info.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 20),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/" + info[index].img
                          ),
                          fit: BoxFit.cover
                        )
                      ),
                                      ),
                    );
                  },
                  
                ),
                const Text("If you describe someone or something good as an inspiration, you mean that they make you or other people want to do or achieve something."),
                const Text("Emotion, a complex experience of consciousness, bodily sensation, and behaviour that reflects the personal significance of a thing, an event, or a state of affairs."),
            ],),
          ),

          const SizedBox(height: 30,),

          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 22,),
                AppText(text: "See all", color: AppColors.textColor1,)
              ],
            ),
          ),

          const SizedBox(height: 20,),

          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                       // margin: const EdgeInsets.only(right: 50),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            "img/"+images.keys.elementAt(index)
                          ),
                          fit: BoxFit.cover
                        )
                      ),
                     ),

                     const SizedBox(height: 20,),  // Image under text
                     
                     // Container was in use
                     AppText(
                      text: images.values.elementAt(index),
                      color: AppColors.textColor2,
                     ),

                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
          }
          else{
            return Container();
          }
        },
        )
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // ignore: todo
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }
 
}

 class _CirclePainter extends BoxPainter{
   final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // ignore: todo
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2, configuration.size!.height -radius);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
    
  }