import 'package:chatsapp/core/constent/colors.dart';
import 'package:flutter/material.dart';
class Conversation extends StatefulWidget {
  const Conversation({Key? key}) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Tabs Demo'),
        backgroundColor:appBarColor
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints(maxHeight: 150.0),
              child:  const Material(
                color: yellowColor,
                child: TabBar(
                  indicatorColor: whiteColor,
                  tabs: [
                    Tab(child: Text('Chat',style: TextStyle(fontWeight: FontWeight.bold),),),
                    Tab(child: Text('videos',style: TextStyle(fontWeight: FontWeight.bold),),),
                    Tab(child: Text('Images',style: TextStyle(fontWeight: FontWeight.bold),),),
                    Tab(icon: Icon(Icons.search)),

                  ],
                ),
              ),
            ),
             Expanded(
              child: TabBarView(
                children: [
              Container(
              margin: EdgeInsets.all(15.0),
               height: 61,
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(35.0),
                         boxShadow: const [
                           BoxShadow(
                               offset: Offset(0, 3),
                               blurRadius: 5,
                               color: Colors.grey)
                         ],
                       ),
                       child: Row(
                         children: [
                           IconButton(
                               icon: const Icon(Icons.face , color: Colors.blueAccent,), onPressed: () {}),
                           const Expanded(
                             child: TextField(
                               decoration: InputDecoration(
                                   hintText: "Type Something...",
                                   hintStyle: TextStyle( color:     Colors.blueAccent),
                                   border: InputBorder.none),
                             ),
                           ),
                           IconButton(
                             icon: const Icon(Icons.photo_camera ,  color: Colors.blueAccent),
                             onPressed: () {},
                           ),
                           IconButton(
                             icon: const Icon(Icons.attach_file ,  color: Colors.blueAccent),
                             onPressed: () {},
                           )
                         ],
                       ),
                     ),
                   ),
                   SizedBox(width: 15),
                   Container(
                     padding: const EdgeInsets.all(15.0),
                     decoration: const BoxDecoration(
                         color: Colors.blueAccent, shape: BoxShape.circle),
                     child: InkWell(
                       child: const Icon(
                         Icons.keyboard_voice,
                         color: Colors.white,
                       ),
                       onLongPress: () {
                       },
                     ),
                   )
                 ],
               ),
             ) ,
                  Container(
                    child: Text('ffff'),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: const Text('ffff'),
                    color: Colors.green,
                  ),
                  // Icon(Icons.directions_transit),
                  const Icon(Icons.directions_bike),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
