import 'package:flutter/material.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? paymentMethod;
  String? cardInfo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const ReusableText(
          title: 'Payment Method',
          size: 18,
          weight: FontWeight.w700,
          color: Color(0xff593D77),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      paymentMethod == 'Bank'
                          ? const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 2,
                              color: Color(0x40252525),
                            )
                          : const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 0,
                              color: Color(0x40252525),
                            ),
                    ],
                    color: const Color(0xffFFFFFF),
                    border: Border.all(color: const Color(0xffE8E6EA)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(width: 46, image: AssetImage('assets/images/home_screen/payment_method/bank.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const ReusableText(
                        title: 'Bank Transfer',
                        size: 18,
                        weight: FontWeight.w700,
                        color: Color(0xff593D77),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 30,
                        child: RadioListTile(
                          value: "Bank",
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value.toString();
                            });
                          },
                          activeColor: const Color(0xFF593D77), // Set the selected color
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return const Color(
                                  0xFF593D77); // Set the unselected color when the radio button is selected
                            }
                            return const Color(
                                0xff593D77); // Set the unselected color when the radio button is not selected
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      paymentMethod == 'Moblink'
                          ? const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 2,
                              color: Color(0x40252525),
                            )
                          : const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 0,
                              color: Color(0x40252525),
                            ),
                    ],
                    color: const Color(0xffFFFFFF),
                    border: Border.all(color: const Color(0xffE8E6EA)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(width: 46, image: AssetImage('assets/images/home_screen/payment_method/moblink.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const ReusableText(
                        title: 'Jazzcash',
                        size: 18,
                        weight: FontWeight.w700,
                        color: Color(0xff593D77),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 30,
                        child: RadioListTile(
                          value: "Moblink",
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value.toString();
                            });
                          },
                          activeColor: const Color(0xFF593D77), // Set the selected color
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return const Color(
                                  0xFF593D77); // Set the unselected color when the radio button is selected
                            }
                            return const Color(
                                0xff593D77); // Set the unselected color when the radio button is not selected
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      paymentMethod == 'Easypaisa'
                          ? const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 2,
                              color: Color(0x40252525),
                            )
                          : const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 0,
                              color: Color(0x40252525),
                            ),
                    ],
                    color: const Color(0xffFFFFFF),
                    border: Border.all(color: const Color(0xffE8E6EA)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                          width: 46, image: AssetImage('assets/images/home_screen/payment_method/easypaisa.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const ReusableText(
                        title: 'Easypaisa',
                        size: 18,
                        weight: FontWeight.w700,
                        color: Color(0xff593D77),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 30,
                        child: RadioListTile(
                          value: "Easypaisa",
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value.toString();
                            });
                          },
                          activeColor: const Color(0xFF593D77), // Set the selected color
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return const Color(
                                  0xFF593D77); // Set the unselected color when the radio button is selected
                            }
                            return const Color(
                                0xff593D77); // Set the unselected color when the radio button is not selected
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      paymentMethod == 'Cash'
                          ? const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 2,
                              color: Color(0x40252525),
                            )
                          : const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 0,
                              color: Color(0x40252525),
                            ),
                    ],
                    color: const Color(0xffFFFFFF),
                    border: Border.all(color: const Color(0xffE8E6EA)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage('assets/images/home_screen/payment_method/image 5.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const ReusableText(
                        title: 'Cash',
                        size: 18,
                        weight: FontWeight.w700,
                        color: Color(0xff593D77),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 30,
                        child: RadioListTile(
                          value: "Cash",
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value.toString();
                            });
                          },
                          activeColor: const Color(0xFF593D77), // Set the selected color
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return const Color(
                                  0xFF593D77); // Set the unselected color when the radio button is selected
                            }
                            return const Color(
                                0xff593D77); // Set the unselected color when the radio button is not selected
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.50,
            width: MediaQuery.sizeOf(context).width * 1,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              color: Color(0xffF7F7F7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      height: 3,
                      width: 20,
                      color: const Color(0xf53593D77),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const ReusableText(
                  title: 'Card Number',
                  size: 18,
                  weight: FontWeight.w700,
                  color: Color(0xff593D77),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Image(
                          image: AssetImage("assets/images/home_screen/payment_method/image 6.png"),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xffE8E6EA),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xffE8E6EA),
                            )),
                        hintText: '   0765 **** **** **92',
                        hintStyle:
                            const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff999CAD))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ReusableText(
                          title: 'CVC',
                          size: 18,
                          weight: FontWeight.w700,
                          color: Color(0xff593D77),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 54,
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          decoration:
                              BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E6EA),
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E6EA),
                                    )),
                                hintText: '  Type Here',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff999CAD))),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ReusableText(
                          title: 'Expire Date',
                          size: 18,
                          weight: FontWeight.w700,
                          color: Color(0xff593D77),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 54,
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          decoration:
                              BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E6EA),
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Color(0xffE8E6EA),
                                    )),
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                  color: Color(0xff593D77),
                                ),
                                hintText: '  Pick Date',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff999CAD))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                      child: RadioListTile(
                        value: "value",
                        groupValue: cardInfo,
                        onChanged: (value) {
                          setState(() {
                            cardInfo = value.toString();
                          });
                        },
                        activeColor: const Color(0xFF1E9706), // Set the selected color
                        fillColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(
                                0xFF1E9706); // Set the unselected color when the radio button is selected
                          }
                          return const Color(
                              0xff1E9706); // Set the unselected color when the radio button is not selected
                        }),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const ReusableText(
                      title: 'Save card Information',
                      size: 14,
                      weight: FontWeight.w500,
                      color: Color(0xff6D6D6D),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 41,
                      width: MediaQuery.sizeOf(context).width * 0.60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                      child: const Center(
                          child: ReusableText(
                        title: 'Next',
                        size: 12,
                        weight: FontWeight.w700,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
