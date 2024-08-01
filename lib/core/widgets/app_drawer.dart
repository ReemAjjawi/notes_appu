import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  final String textname;
  final String textnamegmail;
  final String image;
  MyDrawer({
    Key? key, required this.textname, required this.textnamegmail, required this.image,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(80.0),
        bottomRight: Radius.circular(80.0),
      ),
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_sharp),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      "Back",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        height: 23 / 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 40.0,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  textname,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  textnamegmail,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: const [
                  listtitledrawer(
                    text: "History",
                    icon: Icons.history,
                  ),
                  Divider(),
                  listtitledrawer(
                    text: "Complain",
                    icon: Icons.comment,
                  ),
                  Divider(),
                  listtitledrawer(
                    text: "Referral",
                    icon: Icons.read_more,
                  ),
                  Divider(),
                  listtitledrawer(
                    text: "About",
                    icon: Icons.add_box_outlined,
                  ),
                  Divider(),
                  listtitledrawer(
                    text: "Settings",
                    icon: Icons.settings,
                  ),
                  Divider(),
                  listtitledrawer(
                    text: "Help and Support",
                    icon: Icons.help,
                  ),
                  Divider(),
                  listtitledrawer(
                    text: "Logout",
                    icon: Icons.logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class listtitledrawer extends StatelessWidget {
  final String text;
  final IconData icon;

  const listtitledrawer({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.black,
        ),
      ),
    );
  }
}
