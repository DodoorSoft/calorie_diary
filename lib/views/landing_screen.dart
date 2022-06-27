
import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  late PageController _controller;


  int _selectedPage = 0;

  List<String> texts = [
    'Consumed calories',
    'Water intake',
    'Steps'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*.5,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (int page){
                    setState((){
                      _selectedPage = page;
                    });
                  },
                  children: [
                    Image.asset('assets/eating.png'),
                    Image.asset('assets/drinking.png'),
                    Image.asset('assets/running.png'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                          color: _selectedPage == 0 ? kLightGreen: Colors.grey
                      ),
                      height: 12,
                      width: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _selectedPage == 1 ? kLightGreen: Colors.grey
                      ),
                      height: 12,
                      width: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _selectedPage == 2 ? kLightGreen: Colors.grey
                      ),
                      height: 12,
                      width: 40,
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const Text('Track your',style: kTitleStyle,),
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                        opacity: 1,
                        child: Text(texts[_selectedPage],style: kTitleStyle,)),

                  ],
                ),
              ),
              Column(children: [ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kLightGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width*.85,55)
              ),
              onPressed: (){}, child: Text('Get Started',
                style: kSubTitleStyle.copyWith(
                color: Colors.white,
                fontSize: 18
                ),)
              ),
                TextButton(
              onPressed: (){},
              child:
              Text('Sign In',style: kSubTitleStyle.copyWith(
                  color: kLightGreen,
                  fontSize: 18
              ),),
                )],)
            ],
          )
        ),
      ),
    );
  }
}
/*

*/