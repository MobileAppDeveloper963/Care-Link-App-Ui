import 'package:animate_do/animate_do.dart';
import 'package:care_link_app/widgets/build_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildIconButton(icon: Icons.arrow_back),
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text('          '),
                ],
              ),
              ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.only(top: 20),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.amber.shade100,
                  foregroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'),
                ),
                title: Text(
                  'Brooklyn Simmons',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '@Broklyn',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                trailing: BuildIconButton(
                  icon: Icons.edit_square,
                  color: Colors.grey,
                  size: 18,
                ),
              ).fadeInLeft(delay: Duration(milliseconds: 100)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(child: _ageConteiner('Age', '20 Years')),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(child: _ageConteiner('Height', '165 cm')),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(child: _ageConteiner('Weight', '65 kg'))
                  ],
                ).fadeInLeft(delay: Duration(milliseconds: 200)),
              ),
              _heading('Personal Info'),
              _myListTile('My Address', Icons.location_on_outlined, 1),
              _myListTile('Payment Method', Icons.payment_outlined, 2),
              _heading('Security'),
              _myListTile('Change Password', Icons.lock_open, 3),
              _myListTile('Forgot Password', Icons.lock_open, 4),
              _heading('General'),
              _myListTile(
                  'Notification', Icons.notifications_active_outlined, 5),
              _myListTile('Languages', Icons.language, 6),
              _myListTile('Help and Support', Icons.help_center_outlined, 7),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 70,
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myListTile(String option, IconData icon, int index) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.all(0),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
          ),
        ],
      ),
      title: Container(
        // color: Colors.amber.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              option,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 10,
            )
          ],
        ),
      ),
    )
        .animate()
        .fade(duration: 300.ms, delay: (index * 150).ms)
        .slideX(begin: -1, end: 0, curve: Curves.easeOut);
  }

  Widget _heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    ).fadeIn(
        duration: Duration(seconds: 1), delay: Duration(milliseconds: 400));
  }

  Widget _ageConteiner(String name, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(color: Colors.black45),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
