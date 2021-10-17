import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'map_locations.dart';
import  'list_home.dart';
class mapHome extends StatefulWidget {
  @override
  _mapHomeState createState() => _mapHomeState();
}

class _mapHomeState extends State<mapHome> {
  @override
  Widget build(BuildContext context) {
  return Column(
    children:  <Widget>[
      Container(
        margin: const EdgeInsets.only(top:20, bottom:0, right:0, left:0),
        child: _SearchWidget(),
      ),
      Expanded(child: Stack(
        children: [
          // Container(
          //   child: GoogleMap(
          //       zoomGesturesEnabled: true,
          //       // markers: _markers,
          //       initialCameraPosition:
          //       CameraPosition(
          //         target: LatLng(45.521563, -122.677433),
          //         zoom: 7.0,
          //       ),
          //       mapType: MapType.normal,
          //       onMapCreated: (controller) {
          //         setState(() {
          //           // _controller = controller;
          //         });
          //       },
          //       // onTap: (coordinates) => _controller
          //       //     .animateCamera(CameraUpdate.newLatLng(coordinates))
          //   ),
          // ),
          Location(),
        ],
      ),
      ),

    ],
  );
}
}
class _SearchWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,

          boxShadow: [
            BoxShadow(
                blurRadius: 6.0,
                color: Colors.black
                    .withOpacity(0.16),
                offset: Offset(0.0, 5.0)),
          ]),
      child: Container(
        margin: const EdgeInsets.only(left:15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: <Widget> [
            Row(
                children: <Widget>[
                  Expanded(

                    flex: 1,
                    child: TextFormField(
                      style: TextStyle( fontWeight: FontWeight.normal,),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontWeight: FontWeight.normal),
                        hintText: "House near me",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.grey.shade400,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 14),
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.search,
                      textCapitalization: TextCapitalization.sentences,
                      controller: TextEditingController(text: ""),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right:16, left: 16),
                    child: InkWell(
                        onTap:  () {
                          Navigator.pushNamed(context, 'list_home');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.list,
                              color: Colors.red,
                            ),
                            Text(
                              "List",
                              style: TextStyle(
                                color: Colors.red,
                              )
                                ),
                          ],
                        )
                    ),
                  )

                ]
            ),
            Container(
              height: 32,
              margin: EdgeInsets.only(top: 12),
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  buildFilter("House"),
                  buildFilter("Price"),
                  buildFilter("Rooms"),
                  buildFilter("Bed/Bath"),
                  SizedBox(
                    width: 8,
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget buildFilter(String filterName){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          )
      ),
      child: Center(
        child: Text(
          filterName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}