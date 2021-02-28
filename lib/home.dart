import 'package:flutter/material.dart';
import 'package:intact/dataPost.dart';
import 'package:intact/setData.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<String> postInput = [];
  TextEditingController subject = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController urgency = TextEditingController();

  List<String> replyInput = [];
  TextEditingController reply = TextEditingController();
  TextEditingController product = TextEditingController();
  //index = await get highest index of post
  List<Post> postList = [];

  Post instance2;

  void setData() async {
    //Data test = new Data();
    //dynamic max = test.getdata();

    // for (var i = 1; i <= 2; i++) {
    //   input.add(Post(id: i));
    // }

    Post instance1 = new Post(id: "1");
    await instance1.getdata();
    //instance1 = postList[0];
    print("${instance1.description}");

    //input.add(Post(id: "1"));
    // input.add(Post(id: 1));
    // instance1 = postList[0];
    // instance2 = postList[1];
    // await instance1.getdata();
    // await instance2.getdata();

    // Post instance = Post(id: "1");
    // instance.getdata();
    // print("${instance.description}");
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    //setData(postList);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey[800],//Color(0xFF212239),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Crowd Post',
              style: TextStyle(
                  color: Colors.blue[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      //int check = postList.length;
                      // print("{$check}");
                      // print("index - $index");
                      // print("${instance1.description}");

                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.3),
                                  Colors.blue,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage:
                                          AssetImage('assets/erenRep.jpg'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      //postList[index].fname,
                                      "Autrin Abdi",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Text(
                                      'Just now',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Text(
                                    //   "tite...",
                                    //   style: TextStyle(
                                    //     fontSize: 18,
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.w800,
                                    //   ),
                                    //   textAlign: TextAlign.start,
                                    // ),
                                    //Text('Priority Level: High', style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w400, ), textAlign: TextAlign.start,),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Text(
                                  //postList[0].description,
                                  "Hi! I am currently dealing with issues that occurred recently due to the snow storm. Due to the power outage, some of my light bulbs have shorted. I was wondering if anyone can help me find tools that would be necessary to replace them, so that I may purchase them.",
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                child: Image.asset('assets/bulb.jpg'),
                              ),
                            
                              //All Icons

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.reply,
                                          color: Colors.white,
                                        ),
                                        onPressed: () => showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(20.0))),
                                            backgroundColor: Colors.white,
                                            context: context,
                                            builder: (context) {
                                              return Column(
                                                children: <Widget>[
                                                  IconButton(
                                                    icon: Icon(Icons.arrow_downward),
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(5.0),
                                                    child: TextField(
                                                      controller: reply,
                                                      keyboardType: TextInputType.multiline,
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                        hintText: "Reply",
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.transparent,
                                                              width: 1.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  Padding(
                                                    padding: EdgeInsets.all(5.0),
                                                    child: TextField(
                                                      controller: product,
                                                      keyboardType: TextInputType.multiline,
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                        hintText: "Product",
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.transparent,
                                                              width: 1.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  RaisedButton(
                                                    color: Colors.blue[700],
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius.circular(5.0)),
                                                    onPressed: () {
                                                      replyInput.add(reply.text);
                                                      replyInput.add(product.text);
                                                      //send to backend using put command
                                                      Navigator.pushNamed(context, '/home',
                                                          arguments: replyInput);
                                                    },
                                                    child: Text('Post',
                                                        style: TextStyle(fontSize: 15)),
                                                  ),
                                                ],
                                              );
                                            })),
                                    IconButton(
                                        icon: Icon(
                                          Icons.person_add_alt_1_rounded,
                                          color: Colors.white,
                                        ),
                                        onPressed: null),
                                    IconButton(
                                      icon: Icon(
                                        Icons.comment,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(20.0))),
                                          backgroundColor: Colors.white,
                                          context: context,
                                          builder: (context) {
                                            return Column(children: <Widget>[
                                              Card(
                                                child: ListTile(
                                                  title: Text("Rishi Villa: Hey I have a good Idea you can use Incandescent Light Bulbs:     https://www.ebay.com/itm/Incandescent-Light-Bulbs-100-Watt-75-Watt-60-Watt-40-Watt-Soft-White-8-Bulbs/383388246331?var=651906576983&hash=item5943b8613b:g:lOoAAOSwsKdgBic6"),
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        AssetImage("assets/guy1.png"),
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                child: ListTile(
                                                  title: Text("Yash Pathi: Wishing you good luck"),
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        AssetImage("assets/guy3.png"),
                                                  ),
                                                ),
                                              ),
                                              ]);
                                          }),
                                      ),
                                    ]),
                            ],
                          ),
                        ),
                      );
                    })
                    ),

                    //new one
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withOpacity(0.3),
                                  Colors.blue,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage:
                                          AssetImage('assets/avatar2.png'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      //postList[index].fname,
                                      "Bryan Chen",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Text(
                                      'February 28',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Text(
                                    //   "tite...",
                                    //   style: TextStyle(
                                    //     fontSize: 18,
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.w800,
                                    //   ),
                                    //   textAlign: TextAlign.start,
                                    // ),
                                    //Text('Priority Level: High', style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w400, ), textAlign: TextAlign.start,),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Text(
                                  //postList[0].description,
                                  "Hi, while on campus I tend to notice bits of waste lying on the curbs. I would like to help change this but I need someone's advice on what the best tool to use is.",
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Image.asset("assets/trash.jpg"),
                              ),
                              //All Icons

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.reply,
                                          color: Colors.white,
                                        ),
                                        onPressed: () => showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(20.0))),
                                            backgroundColor: Colors.white,
                                            context: context,
                                            builder: (context) {
                                              return Column(
                                                children: <Widget>[
                                                  IconButton(
                                                    icon: Icon(Icons.arrow_downward),
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(5.0),
                                                    child: TextField(
                                                      controller: reply,
                                                      keyboardType: TextInputType.multiline,
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                        hintText: "Reply",
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.transparent,
                                                              width: 1.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  Padding(
                                                    padding: EdgeInsets.all(5.0),
                                                    child: TextField(
                                                      controller: product,
                                                      keyboardType: TextInputType.multiline,
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                        hintText: "Product",
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.transparent,
                                                              width: 1.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  RaisedButton(
                                                    color: Colors.blue[700],
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius.circular(5.0)),
                                                    onPressed: () {
                                                      replyInput.add(reply.text);
                                                      replyInput.add(product.text);
                                                      //send to backend using put command
                                                      Navigator.pushNamed(context, '/home',
                                                          arguments: replyInput);
                                                    },
                                                    child: Text('Post',
                                                        style: TextStyle(fontSize: 15)),
                                                  ),
                                                ],
                                              );
                                            })),
                                    IconButton(
                                        icon: Icon(
                                          Icons.person_add_alt_1_rounded,
                                          color: Colors.white,
                                        ),
                                        onPressed: null),
                                    IconButton(
                                      icon: Icon(
                                        Icons.comment,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(20.0))),
                                          backgroundColor: Colors.white,
                                          context: context,
                                          builder: (context) {
                                            return Column(children: <Widget>[
                                              Card(
                                                child: ListTile(
                                                  title: Text("Sam Hughes: You should try hothands     https://www.ebay.com/itm/5-PAIRS-OF-HOTHANDS-HAND-WARMERS-UP-TO-10-HOURS-OF-HEAT-PER-PAIR/133346328992?epid=730155089&hash=item1f0c0f81a0:g:TCAAAOSwKKpeWCfN "),
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        AssetImage("assets/guy1.png"),
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                child: ListTile(
                                                  title: Text("Jack Daniels: Wishing you good luck"),
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        AssetImage("assets/guy3.png"),
                                                  ),
                                                ),
                                              ),
                                              ]);
                                          }),
                                      ),
                                    ]),
                            ],
                          ),
                        ),
                      ),
            //navigation bar
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 18,
                    width: 30,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: Icon(Icons.house, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    width: 25,
                    child: IconButton(
                      //add post
                      onPressed: () => _onButtonPressed(),
                      icon: Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    width: 45,
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
//button for reply

  void _onButtonPressed() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: subject,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Subject",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: description,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Description",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            controller: date,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Date",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            controller: urgency,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Priority (High/Low)",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              RaisedButton(
                color: Colors.blue[700],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                onPressed: () {
                  postInput.add(subject.text);
                  postInput.add(description.text);
                  postInput.add(date.text);
                  postInput.add(urgency.text);
                  //send to backend using put command
                  Navigator.pushNamed(context, '/home', arguments: postInput);
                },
                child: Text('Post', style: TextStyle(fontSize: 15)),
              ),
            ],
          );
        });
  }
}

//Name
//profile icon
//Title
//short description
//Share and reply

//   @override
//   Widget build(BuildContext context) {
//     setData(postList);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("home"),
//       ),
//       body: ListView.builder(
//           itemCount: postList.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
//               child: Card(
//                 child: ListTile(
//                   title: Text("hi"),
//                 ),
//             ),
//           );
//       }),
//     );
//   }
// }

// Container(
//                             child: ListView.builder(
//                               itemCount: 2,
//                               itemBuilder: (context, index) {
//                                 return Card(
//                                   child: ListTile(
//                                     title: Text("sdfsdf"),
//                                     leading: CircleAvatar(
//                                       backgroundImage:
//                                           AssetImage("assets/eren.png"),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
