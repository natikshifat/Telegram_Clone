import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

//Create an account for telegram admin as well

List<dynamic> admin = [
  'TelegramAdmin',
  'Telegram',
  'Video Calls with up to 1000 ...',
  '11.38 pm',
  false,
  Colors.transparent
];

// Create some static user data
List<dynamic> user = [
  'SB',
  'SB Lim',
  'Good Morning!!',
  '8:50 pm',
  true,
  Colors.purple
];
List<dynamic> user2 = [
  'J',
  'John',
  'How are you?',
  '6:57 pm',
  true,
  Colors.blue
];
List<dynamic> user3 = [
  'C',
  'Cindy',
  'Are you free tonight?',
  'Fri',
  false,
  Colors.green
];
List<dynamic> user4 = [
  'L',
  'Lily',
  'I am fine!!',
  'Aug 10',
  false,
  Colors.purpleAccent
];
List<dynamic> user5 = [
  'K',
  'Kathy',
  'Kathy joined Telegram!!',
  '3:08:20',
  false,
  Colors.blueAccent
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a list that contain all the user data created above
    // for iteration purposes later !!1
    List<List<dynamic>> userlist = [admin, user, user2, user3, user4, user5];

    return Scaffold(
      appBar: AppBar(
        title: Text("Telegram"),
        leading: Icon(Icons.menu),
        centerTitle: false,
        actions: [Icon(Icons.search)],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mode_edit, color: Colors.white),
        onPressed: () {},
        backgroundColor: Color.fromRGBO(0, 136, 204, 1),
      ),
      body: chatList(userlist),
    );
  }
}

Widget chatList(List<dynamic> userlist) {
  return ListView.builder(
      itemCount: userlist.length,
      itemBuilder: (context, index) {
        return listTile(
          userlist[index][0],
          userlist[index][1],
          userlist[index][2],
          userlist[index][3],
          userlist[index][4],
          userlist[index][5],
        );
      });
}

// Now, move all the dynamic data into the listTile to display dynamic user

Widget listTile(String image, String title, String subtitle, String time,
    bool isChecked, Color imageColor) {
  return ListTile(
    leading: profileImage(image, imageColor),
    title: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(
          color: subtitle.contains('joined') ? Colors.lightBlue : Colors.white,
          fontSize: 16),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isChecked
            ? Icon(
                Icons.check,
                color: Colors.lightBlue,
              )
            : SizedBox(),
        SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        )
      ],
    ),
  );
}

// Do a checking to differentiate admin and normal user

Widget profileImage(String image, Color imageColor) {
  return Container(
    height: 55,
    width: 55,
    decoration: BoxDecoration(color: imageColor, shape: BoxShape.circle),
    child: image.length < 5
        ? Align(
            alignment: Alignment.center,
            child: Text(
              image,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ))
        : Image.network(
            'https://cdn.freebiesupply.com/logos/large/2x/telegram-logo-png-transparent.png'),
  );
}
