
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'heart_container.dart';



List<String> prices=['GH₵ 567,900','GH₵ 335,900','GH₵ 289,700','GH₵ 470,000','GH₵ 224,670','GH₵ 490,270','GH₵ 300,600','GH₵ 651,230','GH₵ 980,000','GH₵ 300,000',];
List<String> addresses=['Osu,oxford st 8728','East legon A-23423','Eastwood st, GW-A002 ','Odokor GA 30127','Dansoman GA-2459','4592 Eldywood,OH 45103','4028 Timber Creek ,OH45623','11456 57th St E Parrish','67 Marvin Park,GA 30178','Ofankor, Gw-23E4' ];
List<String> houseImg=['assets/images/house.jpg','assets/images/house1.jpg','assets/images/house2.jpg','assets/images/house3.jpg','assets/images/house4.jpg','assets/images/house5.jpg','assets/images/house6.jpg','assets/images/house7.jpg','assets/images/house8.jpg','assets/images/house9.jpg'];

listOfProperties() {
  return ListView.builder(
      itemCount: houseImg.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'HouseDetails');
                },
                child: Card(
                  margin: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    height: 340,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(
                                right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(houseImg[index]))),
                          ),
                        ),
                        Expanded(
                          // flex: 6,
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 8.0,
                                right: 8.0,
                                left: 10.0,
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    prices[index],
                                    style: kh2,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    addresses[index],
                                    style: TextStyle(color: Colors.grey, fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text(
                                          '3 ',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'bds ',
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                        ),

                                        Text(
                                          ' 5 ',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'baths ',
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                        ),

                                        Text(
                                          ' 1,767 ',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'sqft',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 5,
                                          backgroundColor: Colors.green,
                                        ),
                                        Text(
                                          ' House for Sale',
                                          style: TextStyle(fontSize: 13),
                                        ),

                                        Spacer(),
                                        HeartContainer(index)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ))
          ],
        );
      });
}

