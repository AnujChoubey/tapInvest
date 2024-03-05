import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tapinvest_assingment/screens/loading_screen.dart';
import 'package:tapinvest_assingment/styles/text_theme_helper.dart';

import '../widget/slider_widget.dart';

class PurchasingScreen extends StatefulWidget {
  @override
  State<PurchasingScreen> createState() => _PurchasingScreenState();
}

class _PurchasingScreenState extends State<PurchasingScreen> {
  final _amountController = TextEditingController();
  String _amountError = '';
  final numberFormatter = NumberFormat(
    "##,##,###",
    "en_US", // local US
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBF6),
      bottomSheet: Material(
          color: Color(0xffFBFBF6),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Balance: ₹1,00,000',
                      style: TextThemeHelper.black_14_400
                          .copyWith(color: Color(0xff44403C)),
                    ),
                    Text(
                      'Required: ₹0',
                      style: TextThemeHelper.black_14_400
                          .copyWith(color: Color(0xff44403C)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    GradientSlideToAct(
                      borderRadius: 6,
                      width: MediaQuery.of(context).size.width,
                      text: 'SWIPE TO PAY',
                      height: 45,
                      // width: 400,
                      dragableIconBackgroundColor: Color(0xff15803D),
                      draggableWidget: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ),
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      backgroundColor: Colors.grey.shade300,
                      onSubmit: () {
                        Clipboard.setData(ClipboardData(text: ''));
                        HapticFeedback.vibrate();
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTopPop,
                                child: LoaderScreen(),
                                childCurrent: LoaderScreen()));
                      },
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff15803D),
                            Color(0xff15803D),
                          ]),
                    ),
                    _amountError == ''
                        ? SizedBox()
                        : Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.red.withOpacity(0.4),),
                          )
                  ],
                ),
              ],
            ),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16,),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        // margin: EdgeInsets.all(16),
                        height: 36, width: 36,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff15803D).withOpacity(0.12)),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xff15803D),
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      'Purchasing',
                      style: TextThemeHelper.black_16_400
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text(
                          'Agrizy ',
                          style: TextStyle(
                              color: Color(0xff78716C),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Text(
                          ' Keshav Industries',
                          style: TextStyle(
                            color: Color(0xff78716C),
                            fontSize: 18,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    const Text(
                      'ENTER AMOUNT',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 8.0),

                    // Search bar (modified)

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IntrinsicWidth(
                          child: TextFormField(
                            autofocus: true,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            // Allow only numbers
                            inputFormatters: [
                              // Fit the validating format.
                              //fazer o formater para dinheiro
                              ThousandsSeparatorInputFormatter()
                            ],
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  '₹',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              isDense: true,

                              prefixIconConstraints:
                                  BoxConstraints(minWidth: 0, minHeight: 0),
                              // // prefixIconConstraints: ,
                              hintText: _amountController.text.isNotEmpty
                                  ? ''
                                  : 'Min 50,000',
                              // Set initial hint with two decimal places
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                              // errorText: _amountError.isEmpty ? null : _amountError, // Set error text
                              border: InputBorder.none,
                              // Remove border
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            onChanged: (value) => setState(
                                () => _amountError = validateAmount(value)),
                          ),
                        ),
                      ],
                    ),
                    _amountError.isEmpty
                        ? const SizedBox()
                        : Text(
                            _amountError,
                            style: TextStyle(color: Colors.red),
                          ),
                    const SizedBox(height: 16.0),

                    // ... Rest of the code (unchanged)
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Returns',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff475569),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16.0),
                        // Adjust font size as needed
                        children: [
                          TextSpan(
                            text: '₹',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ' 56,555',
                            style: TextStyle(
                                color: Colors.black), // Adjust text color here
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                // Divider between rows
                height: 1.0, // Adjust divider thickness
                // color: Colors.grey, // Adjust divider color
              ),
              const SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Net Yield',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff475569),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16.0),
                        // Adjust font size as needed
                        children: [
                          TextSpan(
                            text: ' 13.11',
                            style: TextStyle(
                                color: Colors.black), // Adjust text color here
                          ),
                          TextSpan(
                            text: '%',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              const Divider(),
              const SizedBox(
                height: 16,
              ),
// Divider between rows (uses default thickness and color)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tenure',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff475569),
                      ),
                    ),
                    RichText(
                      text:const TextSpan(
                        style: TextStyle(fontSize: 16.0),
                        // Adjust font size as needed
                        children: [
                          TextSpan(
                            text: ' 61',
                            style: TextStyle(
                                color: Colors.black), // Adjust text color here
                          ),
                          TextSpan(
                            text: 'days',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String validateAmount(String value) {
    if (value.isEmpty) {
      Clipboard.setData(ClipboardData(text: ''));
      HapticFeedback.vibrate();
      return 'Please enter an amount.';
    } else if (int.parse(value.replaceAll(',', '')) > 100000) {
      Clipboard.setData(ClipboardData(text: ''));
      HapticFeedback.vibrate();
      return 'Value cannot exceed the balance.';
    }
    return ''; // No error
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
