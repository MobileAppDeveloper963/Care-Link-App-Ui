import 'package:animate_do/animate_do.dart';
import 'package:care_link_app/widgets/build_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List healthList = [
    {'image': 'assets/images/5.png', 'name': 'Appointment'},
    {'image': 'assets/images/2.webp', 'name': 'Hospital'},
    {'image': 'assets/images/3.webp', 'name': 'COVID-19'},
    {'image': 'assets/images/1.png', 'name': 'More'},
  ];
  List doctorName = [
    'Dr. Skylar Korsgard',
    'Dr. Adison Schleifer',
    'Dr. Katherin Rayan',
    'Dr. Jack Anderson'
  ];
  List doctorImage = [
    // 'assets/images/11.webp',
    'assets/images/13.jpg',
    'assets/images/11.webp',
    'assets/images/12.jpg',
    'assets/images/15.webp',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hi, Jane",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "How are you feeling today?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BuildIconButton(icon: Icons.notifications_outlined,),
                      const SizedBox(width: 10),
                      BuildIconButton(icon: Icons.search,),
                    ],
                  ),
                ],
              ),
            ),
            _doctorContainer().bounceInDown(),
            _healthContainer(),
            Text(
              'Nearby Doctor',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ).fadeIn(
                duration: Duration(seconds: 1),
                delay: Duration(milliseconds: 500)),
            Expanded(
              child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: 100,
                              height: 110,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(doctorImage[index]),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: 95,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctorName[index],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text('General practioner',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          Text(
                                            index == 1 ? '4.0' : '4.2',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            index == 1
                                                ? '  (191 Reviews)'
                                                : '  (215 Reviews)',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                      itemCount: 4)
                  .fadeInUp(),
            )
          ],
        ),
      ),
    );
  }

  Widget _healthContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Needs',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ).fadeIn(
            duration: Duration(seconds: 1), delay: Duration(milliseconds: 500)),
        SizedBox(
          height: 120,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisExtent: 120),
            itemCount: healthList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(healthList[index]['image']),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    healthList[index]['name'],
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              );
            },
          ).fadeInLeft(),
        )
      ],
    );
  }

  Widget _doctorContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 18.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue.shade500,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 3,
                offset: const Offset(0, 15),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade300,
                    image: DecorationImage(
                        image: AssetImage('assets/images/6.jpg'))),
              ),
            ).bounceInUp(delay: Duration(seconds: 1)),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Ruban Dorwart',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Dental Specialist',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    // width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          ' Today    ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          ' 14:30 - 15:30 AM',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
