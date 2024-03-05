import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tapinvest_assingment/screens/loading_screen.dart';
import 'package:tapinvest_assingment/screens/purchase_screen.dart';

import '../styles/text_theme_helper.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.15,),
            Image.asset('assets/contract_img.png'),
            GestureDetector(
              onTap: (){
                Clipboard.setData(ClipboardData(text: ''));
                HapticFeedback.vibrate();


                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: LoaderScreen(isDone: true,)));

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                decoration: BoxDecoration(
                    border: Border.all(color:Color(0xff15803D) ),
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff16A34A)
                ),
                child: Text('Sign Contract',style: TextThemeHelper.white_14_400.copyWith(fontWeight: FontWeight.w600),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
