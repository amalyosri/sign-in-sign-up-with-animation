import 'dart:math';

import 'package:animationsection/signup_signin.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp1());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(     
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
 
Color _color =Colors.pink;
 double _width=100;
  double _hieght=100;
   BorderRadius _bord=BorderRadius.circular(10);
  bool  visible=true;
  double pos=0;
  double dy=0;
  double dx=0;
  FontWeight _fweight=FontWeight.bold;
  Color _color1 =Colors.red;
  double _fsize=30;

  double _value=0.0;
  double _angle=0.0;

 late  AnimationController _controller1;
 late Animation<Size> _animation1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 =AnimationController(vsync: this,duration: Duration(seconds:5 ),
    upperBound:3.0,
    lowerBound:0.5,
    )..repeat();
    
    
    _animation1= Tween<Size>(begin:Size(200, 150),
    end:Size(200,350)).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.linear));
    
    //_controller1.addListener(() =>setState(() {
      
   // }));
  }

  void dispose(){
    super.dispose();
    _controller1.dispose();
  }

  Future <bool> onlikeButtonTaooed (bool islike)async =>!islike;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        
        title: Text("animation"),
      ),
      body:like_button()
      
        
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed:(){

      //     setState(() {
               
      //         Random rand=Random(); 
      //      _color1=Color.fromRGBO(rand.nextInt(256), rand.nextInt(256), rand.nextInt(256), 1) ;
      //      _fsize= rand.nextInt(50).toDouble();
            // visible=!visible;
            // pos=  pos==0?50.0:0;
            // dx=dx==0?1:0;
            // dy=dy==0?1:0;


            // _width=rand.nextInt(100).toDouble();
            // _hieght=rand.nextInt(100).toDouble();
            // _color=Color.fromRGBO(rand.nextInt(256), rand.nextInt(256), rand.nextInt(256), 1);
            // _bord=_bord==BorderRadius.circular(10)?
            // BorderRadius.circular(rand.nextInt(100).toDouble())
            // :BorderRadius.circular(rand.nextInt(100).toDouble());


      //     });
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  Center like_button() {
    return Center(child: LikeButton(size: 200,
    likeCount: 300,
    onTap: onlikeButtonTaooed,
    likeBuilder: (bool islike){return Icon(Icons.home,size: 100,
    color: islike?Colors.deepOrange :Colors.lightBlueAccent,
    );},
    bubblesColor: const BubblesColor(
      dotPrimaryColor: Colors.amber,
    dotSecondaryColor: Colors.green),

    circleColor: CircleColor(end: Colors.red,start:Colors.brown ),
    ),);
  }

  Center heroAnimation() {
    return Center(child:Builder(
      builder: (context) {
        return FlatButton(
            
            child:  Hero(
              tag: "to_flutter",
              child: Image.asset("assetes/a2.png")),
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_)=>flutterpage())),
          
          );
        
      }
    ),);
  }

  


  Center tween_animated() {
    return Center(child:
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
      
      TweenAnimationBuilder<double>(
        tween:Tween (begin:0,end:_angle), 
        duration: Duration(seconds: 1),

        child: Container(height: 200,
      width: 300,
      color: Colors.blueGrey,
      ),


         builder:(_,angle,child)=>Transform.rotate(
         child:child,
         angle:angle,
         ),),
      SizedBox(height: 50,),
     Text("${(_value*(180/pi)).round()}",style: TextStyle(fontSize: 50),),
      Slider(value:_value , onChanged: (val)=>setState(() {
        _value=val;
        _angle=val;
      }),
      min: 0,
      max: 2*pi,
      divisions: 4,
      )


    ],),);
  }

  
}


class  flutterpage  extends StatelessWidget {  
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("welcome homee"),),
       body:Center(child: Hero(
         
         tag: "to_flutter",
         child: Icon(Icons.adb_sharp,size: 300,)),) ,
       
     );
   }
 }

class OutlineButtonTransition1 extends AnimatedWidget{
  const OutlineButtonTransition1({width}) : super(listenable: width);

Animation<double> get width1 =>listenable as Animation<double>;
  
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return OutlineButton(
       onPressed:(){},
       child:  Text("click me"),
       borderSide: BorderSide(width: width1.value),


     );
  }

}

 AnimatedDefaultTextStyle animatedDefault_text_style(_fsize,_color1,_fweight) {
    return AnimatedDefaultTextStyle(
        duration: Duration(seconds: 1),
        style: TextStyle(fontSize: _fsize,color: _color1,fontWeight: _fweight),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("welcome Home"),
             Text("welcome Home"),
          ],),
        ),
  
    );
  }

Center crves_animated(visible,_width,_hieght,_bord,_color){
  return Center(
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
          children:[ 
                     
            Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                curve: Curves.linear,
                opacity:visible==true?1:0 ,
                duration: Duration(seconds: 1),
                child:Column(children: const [
                  Text("name:amal"),
                 Text("age:25"),
                 Text("city:giza")
                ],)
                                
              ),

               AnimatedContainer(
                  curve: Curves.linear,
                  duration: Duration(seconds: 1),
                  width: _width,
                   height: _hieght, 
                   decoration: BoxDecoration(
                     borderRadius: _bord,
                   color:  _color,
                   ),
                ),
              
              
            ],
          ),
          


          ]),
      );
}

 
 Stack animatedpositioned(visible,_bord,_color){

   return Stack(
        
        children: [
          Center(child: Text("welcome home",style: TextStyle(fontSize: 35),),),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            bottom: visible==true?250:350,
            right: 50,
            child: Container(
              width: 300,
              height: 100,
          decoration: BoxDecoration(
            borderRadius: _bord, color: _color),))

        ],
      );
 }

AnimatedPadding animatedpadding(pos,dx,dy){
  return AnimatedPadding(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.symmetric(horizontal: pos),
         child: Center(
           child: Container(
              height: 200,
              color: Colors.cyan,
              child:AnimatedAlign(
                alignment: FractionalOffset(dx,dy),
              duration: Duration(seconds: 1),
              child:FlutterLogo(size: 60,) ,
              ),
              ),
         ),
      
      );
}


