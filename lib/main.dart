import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double pi = 3.1415926535897932;
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white10),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  double _value = 20;
  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
      _selectedIndex = index;
    });
  }

  List<String> bottomNavigationBar_ = ["Home", "Business", "School", "Admin"];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: bottomNavigationBar_.length);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  int? count;
  int dobleClick = 0;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool playTrue = false;
  List<Widget> playAndStop = [
    IconButton(
      icon: Icon(
        Icons.play_circle_outline,
        size: 44,
        color: Colors.deepPurpleAccent,
      ),
      onPressed: () {},
    ),
    Icon(
      Icons.pause_circle_outline,
      size: 44,
      color: Colors.deepPurpleAccent,
    ),
  ];
  List<String> myLibrary = List.generate(4, ((index) => "index: ${index + 1}"));

  void _onButtomPressedPlay(int index) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        builder: (context) {
          return FractionallySizedBox(
              heightFactor: 1.5,
              child: Column(children: [
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://64.media.tumblr.com/7eb2dbcf5cd91cf87622d649d26977c3/1da33a30fb8146b1-a1/s1280x1920/ffe5fcbe3a0a8e99574c4107a9562ced03b9f15c.gifv"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  color: Colors.black87,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(children: [
                          Text(
                            myLibrary[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          Slider(
                            min: 0.0,
                            max: 100.0,
                            value: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.fast_rewind,
                                size: 44,
                                color: Colors.deepPurpleAccent,
                              ),
                              Icon(
                                Icons.pause,
                                size: 44,
                                color: Colors.deepPurpleAccent,
                              ),
                              Icon(
                                Icons.fast_forward,
                                size: 44,
                                color: Colors.deepPurpleAccent,
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ]));
        }).whenComplete(() => setState(() {
          playTrue = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    double padHim = (MediaQuery.of(context).size.height / 100) * 2;
    double pad = (MediaQuery.of(context).size.height / 100) * 1;

    final List<Map> myProducts =
        List.generate(11, (index) => {"id": index, "name": "Product $index"})
            .toList();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airlines_sharp,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
            ),
            label: 'School',
          ),
        ],
        selectedIconTheme: IconThemeData(color: Colors.deepPurple, size: 40),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (_tabController.index == 1) {
            return Scaffold(
                appBar: AppBar(
                  title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Page 2",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  backgroundColor: Colors.black87,
                ),
                body: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 1,
                    ),
                    itemCount: myProducts.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Column(children: [
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: pad, right: pad, left: pad),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(myProducts[index]["name"]),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: pad, right: pad, left: pad),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(myProducts[index]["name"]),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                              )),
                        ),
                      ]);
                    }));
          } else if (_tabController.index == 0) {
            return Scaffold(
                appBar: AppBar(
                  title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Page 1",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  backgroundColor: Colors.black87,
                ),
                body: ListView.builder(
                    itemCount: myProducts.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.center,
                              height: pad * 20,
                              child: Text(myProducts[index]["name"]),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: pad * 10,
                              child: Text(myProducts[index]["name"]),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                            ),
                          ]));
                    }));
          } else if (_tabController.index == 3) {
            return Scaffold(
                appBar: AppBar(
                  title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Page 4",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  backgroundColor: Colors.black87,
                ),
                body: ListView(
                    padding: EdgeInsets.all(pad * 2),
                    children: <Widget>[
                      Center(
                          child: CustomPaint(
                        foregroundPainter: LinePainter(Colors.greenAccent, 60),
                        child: Container(
                            width: 200,
                            height: 200,
                            child: Center(
                              child: Text(
                                "${_selectedIndex}%",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )),
                      Padding(
                        padding: EdgeInsets.only(top: pad * 4),
                        child: Text(
                          "Procent: ${_selectedIndex}%",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]));
          } else {
            return Scaffold(
                appBar: AppBar(
                  title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Page 3",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  backgroundColor: Colors.black87,
                ),
                body: ListView.builder(
                    itemCount: myLibrary.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      return new Dismissible(
                        background: Container(
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 44,
                                ),
                                Text(
                                  "delete",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                        key: new UniqueKey(),
                        onDismissed: (direction) {
                          Scaffold.of(context).showBottomSheet(
                            (context) => Text("Item dismissible."),
                          );
                          setState(() {
                            myLibrary.removeAt(index);
                            count = null;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Center(
                                  child: ListTile(
                                    trailing: LayoutBuilder(
                                        builder: (context, constraints) {
                                      if (playTrue && count == index) {
                                        return Icon(
                                          Icons.pause_circle_outline,
                                          size: 44,
                                          color: Colors.deepPurpleAccent,
                                        );
                                      } else {
                                        return Icon(
                                          Icons.play_circle_outline,
                                          size: 44,
                                          color: Colors.deepPurpleAccent,
                                        );
                                      }
                                    }),
                                    leading: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxHeight: 44,
                                          minHeight: 44,
                                          maxWidth: 64,
                                          minWidth: 64),
                                      child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3LdBKSYG3fc68UQUgVDu6o59qr63PNT5wfSw5tLD4dr9CmRwkIg1CH91uk89aW75kdBQ&usqp=CAU"),
                                    ),
                                    title: Text(
                                      'The Enchanted Nightingale',
                                      textAlign: TextAlign.left,
                                    ),
                                    subtitle: Text(
                                      'Music by Julie Gable. Lyrics by Sidney Stein.',
                                      textAlign: TextAlign.start,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        playTrue = true;
                                        if (count == index) {
                                          if (dobleClick % 2 != 0) {
                                            playTrue = false;
                                          }
                                        }
                                        _onButtomPressedPlay(index);
                                        count = index;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
          }
        },
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  double right = 200;
  double bottom = 200;
  Color color;
  Color colorEnd = Colors.black;
  double rad;
  LinePainter(this.color, this.rad) {}
  @override
  void paint(Canvas canvas, size) {
    final rect = Rect.fromLTRB(0, 0, right, bottom);
    final startAngle = -pi / 2;
    final sweepAngle = pi / 180 * rad * 3.6;
    final useCenter = false;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;
    final paintEnd = Paint()
      ..color = colorEnd
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
    canvas.drawArc(rect, startAngle + sweepAngle, 2 * pi - sweepAngle,
        useCenter, paintEnd);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
