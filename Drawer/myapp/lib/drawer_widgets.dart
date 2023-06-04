import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 125, 249),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundImage: NetworkImage(
                        'https://scontent.fdac14-1.fna.fbcdn.net/v/t39.30808-6/293548141_1496767507405470_8557744850596832448_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFr4UrH4myXl5Fayaz_q-oOhTPv_YUBmneFM-_9hQGad8JXqBpZ0Nsy1LPU3AaxS_ZYdtZznD9z11skvt91ogVU&_nc_ohc=LLDn7jyED-IAX8EvhtY&_nc_ht=scontent.fdac14-1.fna&oh=00_AT-XbXa3Qmj6aTGNG0BtpihgxVAkMGsrSqC-7RLAmidMTw&oe=634FF3E0'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Iftikar Islam Atiq',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        height: 30,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Your Score',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '200',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 234, 46)),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '1265',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text('Created'),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              '72',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text('Downloaded'),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              '256',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text('Uploaded'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DrawerItem(
                        title: 'My Wallet',
                        onTap: () {},
                      ),
                      DrawerItem(
                        text2: '\$95.64',
                        onTap: () {},
                      ),
                    ],
                  ),
                  DrawerItem(
                    title: 'My Trips',
                    onTap: () {},
                  ),
                  DrawerItem(
                    title: 'InviteFriends',
                    onTap: () {},
                  ),
                  DrawerItem(
                    title: 'Promotions',
                    onTap: () {},
                  ),
                  Spacer(),
                  Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 201, 203, 204),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 192, 191, 185))),
                          onPressed: () {},
                          child: Text(
                            'Settings',
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 192, 191, 185))),
                          onPressed: () {},
                          child: Text(
                            'User Guide',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  String? title;
  String? text2;
  VoidCallback? onTap;
  DrawerItem({this.onTap, this.title, this.text2});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: Colors.grey,
      padding: EdgeInsets.only(bottom: 15),
      onPressed: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Text(
            '${title ?? ''}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${text2 ?? ''}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 233, 31)),
          ),
        ],
      ),
    );
  }
}
