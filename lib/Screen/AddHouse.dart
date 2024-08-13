// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddHouse extends StatefulWidget {
  const AddHouse({super.key});

  @override
  State<AddHouse> createState() => _AddHouseState();
}

class _AddHouseState extends State<AddHouse> {
  int currentStep = 0;

  void nextStep() {
    setState(() {
      if (currentStep < 4) {
        currentStep++;
      }
    });
  }

  void BeforStep() {
    setState(() {
      if (currentStep < 4) {
        currentStep--;
      }
    });
  }

  Widget buildStepContent() {
    switch (currentStep) {
      case 0:
        return part1(
          onNextStep: nextStep,
          onPreviousStep: BeforStep,
        );
      case 1:
        return part2(
          onNextStep: nextStep,
          onPreviousStep: BeforStep,
        );
      case 2:
        return part3(
          onNextStep: nextStep,
          onPreviousStep: BeforStep,
        );
      case 3:
        return part4(
          onNextStep: nextStep,
          onPreviousStep: BeforStep,
        );
      case 4:
        return FinalReport();
      default:
        return Center(child: Text('محتوى غير معروف'));
    }
  }

  Widget buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildStepIndicatorItem("1", "إضافة سكن جديد", currentStep >= 0),
        buildStepArrow(),
        buildStepIndicatorItem("2", "قم بتعبئة بيانات السكن", currentStep >= 1),
        buildStepArrow(),
        buildStepIndicatorItem("3", "قم بتحليل السكن", currentStep >= 2),
        buildStepArrow(),
        buildStepIndicatorItem("4", "قم بحفظ التقرير", currentStep >= 3),
      ],
    );
  }

  Widget buildStepIndicatorItem(String number, String title, bool isActive) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: isActive ? Color(0xffF28B26) : Color(0xffCED4DA),
          radius: 10,
          child: Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: isActive ? Color(0xffF28B26) : Color(0xff6C757D),
            fontSize: 13,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget buildStepArrow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Icon(
        Icons.arrow_back_ios,
        color: Color(0xff6C757D),
        size: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تسجيل سكن جديد ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
            ),
          ),
          SizedBox(height: 20),
          buildStepIndicator(),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 200,
                  height: 500,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'بيانات التقرير',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '...',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 40,
                        ),
                        buildStep("بيانات عامة", 0),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: Container(
                            width: 2,
                            height: 30,
                            color: Color(0xffDEE2E6),
                          ),
                        ),
                        buildStep("بيانات الحوش", 1),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: Container(
                            width: 2,
                            height: 30,
                            color: Color(0xffDEE2E6),
                          ),
                        ),
                        buildStep("بيانات الغرف", 2),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: Container(
                            width: 2,
                            height: 30,
                            color: Color(0xffDEE2E6),
                          ),
                        ),
                        buildStep("صور السكن", 3),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: Container(
                            width: 2,
                            height: 30,
                            color: Color(0xffDEE2E6),
                          ),
                        ),
                        buildStep("التقرير النهائي", 4),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildStepContent(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStep(String title, int step) {
    return Row(
      children: [
        Icon(
          currentStep >= step
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: currentStep >= step ? Color(0xff702DFF) : Colors.grey,
          size: 30,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: currentStep >= step ? Color(0xff702DFF) : Colors.black,
            fontWeight:
                currentStep == step ? FontWeight.bold : FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class FinalReport extends StatelessWidget {
  const FinalReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      constraints: BoxConstraints(
        maxHeight:
            MediaQuery.of(context).size.height - 250, // Example constraint
      ),
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'التقرير النهائي للوحدة السكنية رقم 32',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
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
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'نسبة جاهزية السكن',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                    child: CircularProgressIndicator(
                                      value: 0.61,
                                      strokeWidth: 10,
                                      color: Colors.amber,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      '61%',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'معايير السكن',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Icon(Icons.close, color: Colors.red),
                                      Text(
                                        'هل تناسب ذوي الإعاقة؟',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.people, color: Colors.grey),
                                      Text(
                                        'الطاقة الاستيعابية: 9-10 أفراد',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle,
                                          color: Colors.green),
                                      Text(
                                        'هل تحتاج إلى صيانة؟',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مؤشرات الجودة',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                // Sample data
                                final data = [
                                  {
                                    'quality': 'جيدة',
                                    'value': 0.95,
                                    'color': Colors.green,
                                    'percentage': '95%'
                                  },
                                  {
                                    'quality': 'متوسطة',
                                    'value': 0.68,
                                    'color': Colors.amber,
                                    'percentage': '68%'
                                  },
                                  {
                                    'quality': 'سيئة',
                                    'value': 0.41,
                                    'color': Colors.red,
                                    'percentage': '41%'
                                  },
                                  {
                                    'quality': 'جيدة',
                                    'value': 0.95,
                                    'color': Colors.green,
                                    'percentage': '95%'
                                  },
                                  {
                                    'quality': 'متوسطة',
                                    'value': 0.68,
                                    'color': Colors.amber,
                                    'percentage': '68%'
                                  },
                                  {
                                    'quality': 'جيدة',
                                    'value': 0.95,
                                    'color': Colors.green,
                                    'percentage': '95%'
                                  },
                                ];

                                final item = data[index];

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Percentage with border
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: item['color']
                                                  as Color), // Explicit cast to Color
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          item['percentage']
                                              as String, // Explicit cast to String
                                          style: TextStyle(
                                            color: item['color']
                                                as Color, // Explicit cast to Color
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      // Progress bar
                                      Expanded(
                                        child: LinearProgressIndicator(
                                          value: item['value']
                                              as double, // Explicit cast to double
                                          color: item['color']
                                              as Color, // Explicit cast to Color
                                          backgroundColor: Colors.grey.shade300,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      // Quality label
                                      Text(
                                        item['quality']
                                            as String, // Explicit cast to String
                                        style: TextStyle(
                                          color: item['color']
                                              as Color, // Explicit cast to Color
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      // Quality description
                                      Text(
                                        'جودة الكهرباء',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('عرض التقرير كامل'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff702DFF),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xff702DFF)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  label: Text(
                    'رفع وحفظ التقرير',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff702DFF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class part2 extends StatelessWidget {
  final VoidCallback onNextStep;
  final VoidCallback onPreviousStep;

  const part2({
    required this.onNextStep,
    required this.onPreviousStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'صور السكن',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: buildTextField('نوع الغرفة', 200),
              ),
              Expanded(
                child: buildTextField('رقم الدور', 200),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              DottedBorder(
                color: Colors.grey.shade400,
                strokeWidth: 2,
                dashPattern: [5, 3],
                borderType: BorderType.RRect,
                radius: Radius.circular(8),
                child: Container(
                  width: 470,
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('قم بسحب مقطع فيديو / صورة أو'),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'ارفع هنا',
                                style: TextStyle(
                                  color: Color(0xff702DFF),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.camera_alt,
                  color: Color(0xff702DFF),
                  size: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'المشاكل',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8, // الموقع على حافة الحقل
                      bottom: 8, // الموقع على حافة الحقل
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add your problem adding functionality here
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: Text(
                          'إضافة مشكلة',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff702DFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onPreviousStep,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xff702DFF),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xff702DFF)),
                ),
                child: Text('السابق'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: onNextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff702DFF),
                ),
                child: Text(
                  'التالي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, double W) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Color(0xff6C757D)),
        ),
        SizedBox(height: 8),
        Container(
          width: W,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class part3 extends StatelessWidget {
  final VoidCallback onNextStep;
  final VoidCallback onPreviousStep;

  const part3({
    required this.onNextStep,
    required this.onPreviousStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'صور السكن',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: buildTextField('نوع الغرفة', 200),
              ),
              Expanded(
                child: buildTextField('رقم الدور', 200),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              DottedBorder(
                color: Colors.grey.shade400,
                strokeWidth: 2,
                dashPattern: [5, 3],
                borderType: BorderType.RRect,
                radius: Radius.circular(8),
                child: Container(
                  width: 470,
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('قم بسحب مقطع فيديو / صورة أو'),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'ارفع هنا',
                                style: TextStyle(
                                  color: Color(0xff702DFF),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.camera_alt,
                  color: Color(0xff702DFF),
                  size: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'المشاكل',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8, // الموقع على حافة الحقل
                      bottom: 8, // الموقع على حافة الحقل
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add your problem adding functionality here
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: Text(
                          'إضافة مشكلة',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff702DFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onPreviousStep,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xff702DFF),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xff702DFF)),
                ),
                child: Text('السابق'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: onNextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff702DFF),
                ),
                child: Text(
                  'التالي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, double W) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Color(0xff6C757D)),
        ),
        SizedBox(height: 8),
        Container(
          width: W,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class part4 extends StatelessWidget {
  final VoidCallback onNextStep;
  final VoidCallback onPreviousStep;

  const part4({
    required this.onNextStep,
    required this.onPreviousStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'صور السكن',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: buildTextField('نوع الغرفة', 200),
              ),
              Expanded(
                child: buildTextField('رقم الدور', 200),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              DottedBorder(
                color: Colors.grey.shade400,
                strokeWidth: 2,
                dashPattern: [5, 3],
                borderType: BorderType.RRect,
                radius: Radius.circular(8),
                child: Container(
                  width: 470,
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('قم بسحب مقطع فيديو / صورة أو'),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'ارفع هنا',
                                style: TextStyle(
                                  color: Color(0xff702DFF),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.camera_alt,
                  color: Color(0xff702DFF),
                  size: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'المشاكل',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8, // الموقع على حافة الحقل
                      bottom: 8, // الموقع على حافة الحقل
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add your problem adding functionality here
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: Text(
                          'إضافة مشكلة',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff702DFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onPreviousStep,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xff702DFF),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xff702DFF)),
                ),
                child: Text('السابق'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: onNextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff702DFF),
                ),
                child: Text(
                  'التالي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, double W) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Color(0xff6C757D)),
        ),
        SizedBox(height: 8),
        Container(
          width: W,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class part1 extends StatefulWidget {
  final VoidCallback onNextStep;
  final VoidCallback onPreviousStep;

  const part1({
    required this.onNextStep,
    required this.onPreviousStep,
    super.key,
  });

  @override
  _Part1State createState() => _Part1State();
}

class _Part1State extends State<part1> {
  // TextEditingControllers for form fields
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController floorsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController unitsController = TextEditingController();
  TextEditingController designTypeController = TextEditingController();
  TextEditingController usageController = TextEditingController();

  String propertyType = 'سكني';

  void _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      // Here you can read the file and extract data to populate the fields
      // For this example, we'll just fill in some dummy data
      setState(() {
        registrationNumberController.text = "123456";
        locationController.text = "الرياض";
        floorsController.text = "3";
        dateController.text = "2020-01-01";
        unitsController.text = "10";
        designTypeController.text = "حديث";
        usageController.text = "سكني";
      });

      Navigator.of(context).pop(); // Close the dialog after picking the file
    } else {
      // File picking was canceled
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'بيانات عامة',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ارفاق ملف العقار',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 10),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.folder,
                                            color: Color(0xff702DFF),
                                            size: 50,
                                          ),
                                          SizedBox(height: 10),
                                          Text('الضغط على ادناه لرفع الملفات'),
                                          TextButton(
                                            onPressed: () => _pickFile(context),
                                            child: Text(
                                              'تصفح الملفات',
                                              style: TextStyle(
                                                  color: Color(0xff702DFF)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'التالي',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff702DFF),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'الغاء',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff702DFF),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ارفاق ملف عقار',
                          style: TextStyle(
                            color: Color(0xff702DFF),
                          ),
                        ),
                        Icon(
                          Icons.file_upload_outlined,
                          color: Color(0xff702DFF),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                children: [
                  buildTextField(
                      'رقم تسجيل العقار', registrationNumberController),
                  buildTextField('موقع العقار', locationController),
                  buildDropdownField(
                    'نوع العقار',
                    propertyType,
                    ['سكني', 'تجاري', 'أربطة'],
                    (String? newValue) {
                      setState(() {
                        propertyType = newValue!;
                      });
                    },
                  ),
                  buildTextField('عدد الطوابق', floorsController),
                  buildDateField('تاريخ البناء', context, dateController),
                  buildTextField('عدد الوحدات', unitsController),
                  buildTextField('نوع تصميم العقار', designTypeController),
                  buildTextField('استخدامات العقار', usageController),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: widget.onPreviousStep,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff702DFF),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xff702DFF)),
                  ),
                  child: Text('السابق'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: widget.onNextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff702DFF),
                  ),
                  child: Text(
                    'التالي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Color(0xff6C757D)),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField(String label, String selectedValue,
      List<String> items, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Color(0xff6C757D)),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget buildDateField(
      String label, BuildContext context, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Color(0xff6C757D)),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    controller.text = "${pickedDate.toLocal()}".split(' ')[0];
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
