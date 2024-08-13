// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mraqb/Screen/AddHouse.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> messages = []; // قائمة للرسائل

  void sendMessage(String message) {
    setState(() {
      messages.add(
        ChatMessage(
          text: message,
          isLoading: false,
          isUserMessage: true,
        ),
      );
      messages.add(
        ChatMessage(
          text: '',
          isLoading: true,
          isUserMessage: false,
        ),
      );
    });

    // تأخير لمدة 3 ثواني قبل إظهار الرد
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        messages.removeLast(); // إزالة أيقونة التحميل
        messages.add(
          ChatMessage(
            text: "هذا هو الرد من البوت.",
            isLoading: false,
            isUserMessage: false,
          ),
        );
      });
    });
  }

  Future<dynamic> report(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'تقرير الوحدة السكنية رقم 31',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 300,
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.red.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 100),
                                                  Text(
                                                    'يحتاج لاصلاح عاجل جدا',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/svg/danger.svg',
                                                    width: 20,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Color(0xffECECEC),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'حالة المشكلة',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            'تشقق الجدران يمثل خطرًا كبيرًا على سلامة المنزل وأهله. هذه التشققات قد تشير إلى مشاكل هيكلية خطيرة مثل ضعف أساسات المبنى...',
                                            style: TextStyle(
                                              fontSize: 26,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Container(
                                          width: 60,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xffE0D1FF),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'الملفات',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.attach_file),
                                                SizedBox(width: 8),
                                                Text(
                                                    'صور جدران تقرير الوحدة السكنية رقم 31'),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Icon(Icons.attach_file),
                                                SizedBox(width: 8),
                                                Text(
                                                    'صور جدران تقرير الوحدة السكنية رقم 31'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'جهات يمكنها حل المشكلة',
                                            style: TextStyle(
                                              color: Color(0xff687A92),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(4, (index) {
                                            return Column(
                                              children: [
                                                Icon(Icons.business, size: 40),
                                                Text('شركة مقاولات'),
                                              ],
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 470,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListView(
                                    children: messages,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      onSubmitted: (text) {
                                        sendMessage(text);
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'اكتب سؤالك هنا...',
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isContentChanged = false; // متغير لتتبع حالة المحتوى

  void changeContent() {
    setState(() {
      isContentChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(38.0),
        child: isContentChanged
            ? AddHouse() // عرض المحتوى الجديد إذا تم التغيير
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 200,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'إجمالي الاوقاف',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xff702DFF).withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/svg/House.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '220',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'منزل',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/up.svg',
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '20%',
                                    style: TextStyle(
                                      color: Color(0xff1A9882),
                                      fontSize: 25,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'عدد الحالات الحمراء',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/svg/danger.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '40',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'منزل',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Transform.rotate(
                                    angle:
                                        3.14159, // This is equivalent to 180 degrees (π radians)
                                    child: SvgPicture.asset(
                                      'assets/svg/up.svg',
                                      width: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '40%',
                                    style: TextStyle(
                                      color: Color(0xff1A9882),
                                      fontSize: 25,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'عدد الحالات الصفراء',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/svg/info-circle.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '80',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'منزل',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Transform.rotate(
                                    angle:
                                        3.14159, // This is equivalent to 180 degrees (π radians)
                                    child: SvgPicture.asset(
                                      'assets/svg/down.svg',
                                      width: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '30%',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 25,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'عدد الحالات الخضراء',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/svg/Correct.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '100',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'منزل',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/up.svg',
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '76%',
                                    style: TextStyle(
                                      color: Color(0xff1A9882),
                                      fontSize: 25,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 510,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(28),
                      child: Column(
                        children: [
                          Wrap(
                            spacing: 20,
                            runSpacing: 50,
                            children: [
                              GestureDetector(
                                onTap: changeContent,
                                child: Container(
                                  width: 250,
                                  height: 175,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.18),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xff702DFF),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'اضافة سكن جديد',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff702DFF),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 175,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.18),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/png/ex.png',
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'الوحدة رقم 31',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    '#13311',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'حي الربيع',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Container(
                                                    width: 80,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red
                                                          .withOpacity(0.18),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'غير جاهز للسكن',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '2024-5-2',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          report(context);
                                        },
                                        child: Center(
                                          child: Container(
                                            width: 200,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'عرض التقرير',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 175,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.18),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/png/ex.png',
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'الوحدة رقم 31',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    '#13311',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'حي الربيع',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Container(
                                                    width: 80,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.yellow
                                                          .withOpacity(0.18),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'بحاجة للمراجعة',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xffF2C94C),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '2024-5-2',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          width: 200,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF2C94C),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'عرض التقرير',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 175,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.18),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/png/ex.png',
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'الوحدة رقم 31',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    '#13311',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'حي الربيع',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Container(
                                                    width: 80,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red
                                                          .withOpacity(0.18),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'غير جاهز للسكن',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '2024-5-2',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          width: 200,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'عرض التقرير',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 175,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.18),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/png/ex.png',
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'الوحدة رقم 31',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    '#13311',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'حي الربيع',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Container(
                                                    width: 80,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.green
                                                          .withOpacity(0.18),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'جاهزة للسكن',
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '2024-5-2',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          width: 200,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'عرض التقرير',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 175,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.18),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/png/ex.png',
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'الوحدة رقم 31',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    '#13311',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'حي الربيع',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Container(
                                                    width: 80,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.green
                                                          .withOpacity(0.18),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'جاهزة للسكن',
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '2024-5-2',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          width: 200,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'عرض التقرير',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 400,
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // زر السابق
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // زر الصفحة 1
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xff702DFF),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // زر الصفحة 2
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // زر الصفحة 3
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // النقاط
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '...',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // زر الصفحة 7
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '7',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // زر التالي
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isUserMessage; // تحديد ما إذا كانت الرسالة من المستخدم

  ChatMessage({
    required this.text,
    required this.isLoading,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isLoading)
            CircularProgressIndicator()
          else
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isUserMessage ? Colors.grey[200] : Colors.blue[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // تغيير موقع الظل
                  ),
                ],
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
