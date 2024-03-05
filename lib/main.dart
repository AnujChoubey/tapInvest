import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tapinvest_assingment/screens/purchase_screen.dart';
import 'package:tapinvest_assingment/styles/text_theme_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  List<String> metrics = [
    'FUNDING',
    'TRANSACTION',
    'FINANCIALS',
    'COMPETITION'
  ];
  List<String> doc_icons = ['disc_cont','pitch_desk_icon'];
  List<String> doc_title = ['Invoice Discounting Contract','Company Pitch Deck'];
  List<String> doc_subtitle = ['All the legalese surrounding this deal and how it relates to you.','Read more about the company and see how they pitch to investors.'];
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomSheet: Material(
        elevation: 10,
        child: Container(
          color: Colors.white,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  SizedBox(height: 24,),
                  Text('FILLED',style: TextThemeHelper.grey_10_400.copyWith(color:Colors.black.withOpacity(0.4) ),),
                  Text('30%',style: TextThemeHelper.black_16_400,),
                ],),
                GestureDetector(
                  onTap: (){
                    Clipboard.setData(ClipboardData(text: ''));
                    HapticFeedback.vibrate();

                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: PurchasingScreen()));

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color:Color(0xff15803D) ),
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff16A34A)
                    ),
                    child: Text('Tap to Invest',style: TextThemeHelper.white_14_400.copyWith(fontWeight: FontWeight.w600),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leadingWidth: 20,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
            size: 18,
          ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: Text(
          'Back to Deals',
          style: TextStyle(color: Colors.green, fontSize: 14),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        'Agrizy ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
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
                  Text(
                    'Agrizy offers solutions across digital vendor management, and supply and value chainautomation to its agri processing units. Agrizy, a Bengaluru-based agri tech startup.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xff78716C), fontSize: 14),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 16),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.04),
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: commonContainer(
                                            'MIN INVT',
                                            RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                // Adjust font size as needed
                                                children: [
                                                  TextSpan(
                                                    text: '₹',
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' ', // Add a space after the symbol
                                                  ),
                                                  TextSpan(
                                                    text: '1',
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .black), // Adjust text color here
                                                  ),
                                                  TextSpan(
                                                    text: ' Lakh',
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 16),
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              border: Border(
                                                left: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1.0,
                                                ),
                                                bottom: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            child: commonContainer(
                                              'TENURE',
                                              RichText(
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                      fontSize: 16.0),
                                                  // Adjust font size as needed
                                                  children: [
                                                    TextSpan(
                                                      text: '61',
                                                      style: const TextStyle(
                                                          color: Colors
                                                              .black), // Adjust text color here
                                                    ),
                                                    TextSpan(
                                                      text: ' Days',
                                                      style: const TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 16),
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              border: Border(
                                                right: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1.0,
                                                ),
                                                top: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            child: commonContainer(
                                              'NET YIELD',
                                              RichText(
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                      fontSize: 16.0),
                                                  // Adjust font size as needed
                                                  children: [
                                                    TextSpan(
                                                      text: '13.23',
                                                      style: const TextStyle(
                                                          color: Colors
                                                              .black), // Adjust text color here
                                                    ),
                                                    TextSpan(
                                                      text: ' %',
                                                      style: const TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 16),
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              border: Border(
                                                left: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1.0,
                                                ),
                                                top: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            child: commonContainer(
                                              'RAISED',
                                              RichText(
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                      fontSize: 16.0),
                                                  // Adjust font size as needed
                                                  children: [
                                                    TextSpan(
                                                      text: '70',
                                                      style: const TextStyle(
                                                          color: Colors
                                                              .black), // Adjust text color here
                                                    ),
                                                    TextSpan(
                                                      text: ' %',
                                                      style: const TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      commonTitleListView('Clients', 3),
                    ],
                  ),
                  Row(
                    children: [
                      commonTitleListView('Backed by', 3),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highlights',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 185,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return commonSimpleContainer(
                            Image.asset(
                              'assets/bulb_icon.png',
                              height: 35,
                            ),
                            SizedBox(),
                            SizedBox(
                              width: 270,
                              child: Text(
                                'Agrizy was founded in 2021 by Vicky Dodani and Saket Chirania to provide an end-to-end solution to the agri processing market.',
                                style: TextStyle(color: Color(0xff78716C)),
                              ),
                            ));
                      },
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Metrics',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 27,
                    child: ListView.builder(
                      // padding: EdgeInsets.symmetric(horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: metrics.length,
                      itemBuilder: (ctx, index) {
                        // postLength = list[index]!.data!.length;
                        // post = list[index]!.data!;
                        // ContentModelList data = list[index]!.title;
                        return _commonTitleContainer(metrics[index], index);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 4,
                      onPageChanged: (val) {
                        setState(() {
                          selected = val;
                        });
                      },
                      itemBuilder: (ctx, index1) {
                        return SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 16),
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.04),
                                                  border: Border(
                                                    right: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1.0,
                                                    ),
                                                    bottom: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                child: commonContainer(
                                                  'MIN INVT',
                                                  RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                          fontSize: 16.0),
                                                      // Adjust font size as needed
                                                      children: [
                                                        TextSpan(
                                                          text: '₹',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' ', // Add a space after the symbol
                                                        ),
                                                        TextSpan(
                                                          text: '1',
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black), // Adjust text color here
                                                        ),
                                                        TextSpan(
                                                          text: ' Lakh',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.04),
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1.0,
                                                      ),
                                                      bottom: BorderSide(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: commonContainer(
                                                    'TENURE',
                                                    RichText(
                                                      text: TextSpan(
                                                        style: const TextStyle(
                                                            fontSize: 16.0),
                                                        // Adjust font size as needed
                                                        children: [
                                                          TextSpan(
                                                            text: '61',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black), // Adjust text color here
                                                          ),
                                                          TextSpan(
                                                            text: ' Days',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.04),
                                                    border: Border(
                                                      right: BorderSide(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1.0,
                                                      ),
                                                      top: BorderSide(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: commonContainer(
                                                    'NET YIELD',
                                                    RichText(
                                                      text: TextSpan(
                                                        style: const TextStyle(
                                                            fontSize: 16.0),
                                                        // Adjust font size as needed
                                                        children: [
                                                          TextSpan(
                                                            text: '13.23',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black), // Adjust text color here
                                                          ),
                                                          TextSpan(
                                                            text: ' %',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.04),
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1.0,
                                                      ),
                                                      top: BorderSide(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: commonContainer(
                                                    'RAISED',
                                                    RichText(
                                                      text: TextSpan(
                                                        style: const TextStyle(
                                                            fontSize: 16.0),
                                                        // Adjust font size as needed
                                                        children: [
                                                          TextSpan(
                                                            text: '70',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black), // Adjust text color here
                                                          ),
                                                          TextSpan(
                                                            text: ' %',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
            SizedBox(
              height: 16,
            ),
            Divider(),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Documents',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return commonSimpleContainer(
                          Image.asset('assets/${doc_icons[index]}.png',height: 48,),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Text(doc_subtitle[index],
                                    style: TextStyle(color: Color(0xff78716C)),
                                  ),
                                  width: MediaQuery.of(context).size.width *0.6,
                                ),
                                Spacer(),
                                Icon(Icons.download_for_offline_outlined,color: Colors.grey,),
                                SizedBox(width: 16,)
                              ],
                            ),
                          ),                          Text(doc_title[index]),
                      );
                    },
                    itemCount: 2,
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                  )
                ],
              ),
            ),
            SizedBox(height: 150,),
          ],
        ),
      ),
    );
  }

  commonContainer(title, subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4.0),
        subtitle
      ],
    );
  }

  commonTitleListView(title, count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  'assets/google_logo.png',
                  height: 40,
                  width: 66,
                ),
              );
            },
            itemCount: count,
          ),
        )
      ],
    );
  }

  commonSimpleContainer(item1, item2,title) {
    return Container(
      padding: EdgeInsets.all(16),
      // height: 173,
      margin: EdgeInsets.only(right: 16,bottom: 16),
      // width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffE7E5E4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item1,
          SizedBox(
            height: 16,
          ),
          title,
          item2
        ],
      ),
    );
  }

  _commonTitleContainer(data, index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
          _pageController.jumpToPage(selected);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
            color: selected == index ? Color(0xFF15803D) : Colors.transparent,
            border: Border.all(
              color: selected == index ? Color(0xFF15803D) : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
          data,
          style: selected == index
              ? TextThemeHelper.white_10_400
              : TextThemeHelper.grey_10_400,
        )),
      ),
    );
  }
}
