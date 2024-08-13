// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Screen/HomeScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedMenuItem = 0; // variable to keep track of selected item

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedMenuItem = index;
    });
  }

  Widget _buildMenuItem(int index, String svgPath, String title) {
    bool isSelected = _selectedMenuItem == index;

    return GestureDetector(
      onTap: () => _onMenuItemSelected(index),
      child: Container(
        width: 210,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff702DFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ), // change background color when selected
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      svgPath,
                      color: isSelected
                          ? Colors.white
                          : Colors.black, // change icon color when selected
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.black, // change text color when selected
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: isSelected
                          ? Colors.white
                          : Colors.black, // change arrow color when selected
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedMenuItem) {
      case 0:
        return HomeScreen();
      case 1:
        return RealEstate();
      case 2:
        return Center(
          child: Text(
            'محتوى سجل التقارير',
            style: TextStyle(fontSize: 24),
          ),
        );
      case 3:
        return Center(
          child: Text(
            'محتوى الإعدادات',
            style: TextStyle(fontSize: 24),
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height - 50,
              width: 250, // Fixed size for side menu
              color: Colors.white,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/logo.svg',
                    width: 130,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  _buildMenuItem(0, 'assets/svg/Home.svg', 'الصفحة الرئيسية'),
                  SizedBox(
                    height: 10,
                  ),
                  _buildMenuItem(
                      1, 'assets/svg/realestate.svg', 'العقارات المضافة'),
                  SizedBox(
                    height: 10,
                  ),
                  _buildMenuItem(2, 'assets/svg/Report.svg', 'سجل التقارير'),
                  SizedBox(
                    height: 10,
                  ),
                  _buildMenuItem(3, 'assets/svg/Setting.svg', 'الإعدادات'),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RealEstate extends StatefulWidget {
  const RealEstate({super.key});

  @override
  _RealEstateState createState() => _RealEstateState();
}

class _RealEstateState extends State<RealEstate> {
  String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'العقارات المسجلة',
                        style: TextStyle(
                          color: Color(0xff702DFF),
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.9, // 90% من عرض الشاشة
                        child: selectedImagePath != null
                            ? DeatilsProblome(
                                selectedImagePath: selectedImagePath)
                            : DataTable(
                                columnSpacing: 20.0, // مسافة بين الأعمدة
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      'اسم العقار',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'نوع الصيانة',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'نوع المشكلة',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'تاريخ ظهور المشكلة',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'التكلفة المتوقعة',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'حالة الصيانة',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                                rows: [
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedImagePath =
                                                  'assets/png/p1.png'; // مسار الصورة المرسلة
                                            });
                                          },
                                          child: Text('شقة 31'),
                                        ),
                                      ),
                                      DataCell(Text('صيانة طارئة')),
                                      DataCell(Text('تسرب مياه')),
                                      DataCell(Text('10 أغسطس 2024')),
                                      DataCell(Text('1500 ريال سعودي')),
                                      DataCell(Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'منتهي',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                    ],
                                  ),
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedImagePath =
                                                  'assets/png/p1.png';
                                            });
                                          },
                                          child: Text('شقة 66'),
                                        ),
                                      ),
                                      DataCell(Text('صيانة دورية')),
                                      DataCell(Text('تشقق في الجدران')),
                                      DataCell(Text('15 يوليو 2024')),
                                      DataCell(Text('2500 ريال سعودي')),
                                      DataCell(Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'منتهي',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                    ],
                                  ),
                                  // باقي الصفوف...
                                ],
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DeatilsProblome extends StatelessWidget {
  const DeatilsProblome({
    super.key,
    required this.selectedImagePath,
  });

  final String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(selectedImagePath!),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'رطوبه في الجدار',
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'شق في الجدار',
                              style: TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
