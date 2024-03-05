import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tapinvest_assingment/styles/text_theme_helper.dart';

import 'contract_screen.dart';

class LoaderScreen extends StatefulWidget {
  bool? isDone = false;

  LoaderScreen({super.key, this.isDone});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen>
    with SingleTickerProviderStateMixin {
  bool _showWait = true;
  bool _showContract = true;
  AnimationController? _controller1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff15803D),
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/dotted_bg.png'),
            Lottie.asset('assets/bg_animation.json', width: MediaQuery
                .of(context)
                .size
                .width, height: MediaQuery
                .of(context)
                .size
                .height),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2),
                Row(
                  children: [],
                ),
                Container(
                  height: 111,
                  width: 111,
                  decoration: BoxDecoration(
                    color: Color(0xff116631),
                    borderRadius: BorderRadius.circular(13.5),
                  ),
                  child: widget.isDone == true
                      ? Center(child: Image.asset(
                      'assets/flag_icon.png',height: 47.22, width: 47.22).animate().fadeIn().scale(),)
                      : Center(
                    child: _showWait ? Stack(
                      children: [
                        Image.asset('assets/rotating_icon.png', height: 47.22,
                          width: 47.22,).animate(onComplete: (_) {
                          // _.repeat();

                        }).rotate(duration: Duration(seconds: 10)),
                        Positioned(child: Image.asset('assets/green_check.png',
                          height: 19.3,).animate().fadeIn().scale(), top: 14, left: 14,),
                      ],
                    ) : Image.asset('assets/contract_icon.png', height: 47.22,
                        width: 47.22),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                widget.isDone == true ? Text('All Done!',
                  style: TextThemeHelper.white_16_400.copyWith(
                      fontWeight: FontWeight.w600),
                ).animate().fadeIn().scale():Text(
                  _showWait ? 'Payment done' : 'Generating Contract',
                  style: TextThemeHelper.white_16_400.copyWith(
                      fontWeight: FontWeight.w600),
                ).animate(
                  controller: _controller1,
                  onComplete: (_) {
                    Future.delayed(const Duration(seconds: 5), () {
                      // _.repeat();
                      // _.stop();
                      setState(() {
                        _showWait = !_showWait;
                      });
                    });
                    Future.delayed(Duration(seconds: 10), () {
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ContractScreen(),
                          childCurrent: ContractScreen()));
                    });
                  },)
                    .fadeIn(
                  duration: 700.ms, // Adjust fade duration as needed
                  curve: Curves.easeInOut, // Adjust animation curve if desired

                ).scale(),

                SizedBox(
                  height: 24,
                ),
                widget.isDone == true ? Text('Redirecting you to the Dashboard.',
                  style: TextThemeHelper.white_12_400.copyWith(
                      fontWeight: FontWeight.w600),
                ).animate().fadeIn().scale():Text(
                  'You are almost there!',
                  style: TextThemeHelper.white_12_400.copyWith(
                      fontWeight: FontWeight.w600),
                ),
                widget.isDone == true ? SizedBox(): Text(
                  'Do not leave this page, or press the back button.',
                  style: TextThemeHelper.white_12_400.copyWith(
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
