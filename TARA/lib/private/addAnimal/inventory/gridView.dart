import 'package:TARA/colors/colors.dart';
import 'package:TARA/private/addAnimal/upDateAnimal/upDate.dart';
import 'package:flutter/material.dart';
import 'dataInventory.dart';

class GridViewInventary extends StatefulWidget {
  GridViewInventary({Key key}) : super(key: key);

  @override
  _GridViewInventaryState createState() => _GridViewInventaryState();
}

class _GridViewInventaryState extends State<GridViewInventary> {
  final ScrollController _scrollController = ScrollController();

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<dynamic> responseList = GRID_DATA;
  List<Widget> listItems = [];
  List<Widget> itemsData = [];

  void getPostsData() {
    responseList.forEach((post) {
      listItems.add(
        Card(
          borderOnForeground: true,
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpDateAnimal(
                                title: "${post["name"]}",
                                image: "assets/img/${post["image"]}",
                                text: "${post["idAnimal"]}",
                                id: "Id: ${post["idAnimal"]}",
                                ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.amber,
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              "assets/img/${post["image"]}",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Nombre: ${post["name"]}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Id: ${post["idAnimal"]}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Raza: ${post["race"]}",
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 7;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Text(
                "INVENTARIO",
                style: TextStyle(
                    color: DeliveryColors.dark,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    color: DeliveryColors.brown,
                    size: 50,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: DeliveryColors.brown,
                      size: 50,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: <Widget>[
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext contex, index) {
                          return Align(
                              heightFactor: 0.94,
                              alignment: Alignment.topCenter,
                              child: itemsData[index]);
                        },
                        childCount: itemsData.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
