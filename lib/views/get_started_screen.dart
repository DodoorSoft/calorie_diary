
import 'package:calorie_diary/components/custom_button.dart';
import 'package:calorie_diary/components/custom_text_field.dart';
import 'package:calorie_diary/constants.dart';
import 'package:calorie_diary/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';


class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>{


  late PageController _controller;

  final TextEditingController _kgController = TextEditingController();
  final TextEditingController _lbsController = TextEditingController();
  final TextEditingController _cmController = TextEditingController();
  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _inchController = TextEditingController();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _kgNode = FocusNode();
  final FocusNode _lbsNode = FocusNode();
  final FocusNode _cmNode = FocusNode();
  final FocusNode _inchNode = FocusNode();
  final FocusNode _feetNode = FocusNode();


  int weightType = 0;
  int heightType = 0;
  int _selectedPage = 0;

  double convertedInch = 0;
  double convertedFeet = 0;

  String? _name;
  late double _weight;
  late int _height;
  DateTime? _birthday;
  int? _gender;

  void nextPage(){
    switch (_selectedPage){
      case 0:
        if(_name != null){
          setState((){
            _selectedPage++;
          });
        }
        break;
      case 1:
        if(_kgController.text.isNotEmpty && _lbsController.text.isNotEmpty){
          setState((){
            _weight = double.parse(_kgController.text);
            _selectedPage++;
          });
        }
        break;
      case 2:
        if(_cmController.text.isNotEmpty && _inchController.text.isNotEmpty && _feetController.text.isNotEmpty){
          setState((){
            _height = int.parse(_cmController.text);
            _selectedPage++;
          });
        }
        break;

    }
    if(_selectedPage < 4){
      _controller.jumpToPage(_selectedPage);
      setState((){});
    }
    else{

      UserController.setInitialUserInfo(context, _name!, _weight, _height, _birthday!, _gender!);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('login_screen', (Route<dynamic> route) => false);
    }
  }

  void onPressedBack(){
    if(_selectedPage>0){
      setState((){
        _selectedPage -= 1;
      });
      _controller.jumpToPage(_selectedPage);
    }
    else{
      Navigator.pop(context);
    }

  }


  Color getButtonColor(){
    switch (_selectedPage){
      case 0:
        if(_name != null) return kLightGreen;
        break;
      case 1:
        if(_kgController.text.isNotEmpty || _lbsController.text.isNotEmpty){
          return kLightGreen;
        }
        break;
      case 2:
        if(_cmController.text.isNotEmpty || (_feetController.text.isNotEmpty && _inchController.text.isNotEmpty)){
          return kLightGreen;
        }
        break;
    }
    return Colors.grey;

  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
    _feetController.addListener(() {
      setState((){});
    });
    _lbsController.addListener(() {
      setState((){});
    });
    _kgController.addListener(() {
      setState((){});
    });
    _cmController.addListener(() {
      setState((){});
    });
    _inchController.addListener(() {
      setState((){});
    });

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
      resizeToAvoidBottomInset: false,
      backgroundColor: kLightBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: onPressedBack,
                        ),
                      ),
                      const SizedBox(width: 35,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8,top: 8,bottom: 8,right: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _selectedPage > 0 ? kLightGreen: Colors.grey
                              ),
                              height: 12,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2,top: 8,bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _selectedPage > 1 ? kLightGreen: Colors.grey
                              ),
                              height: 12,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2,top: 8,bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _selectedPage > 2 ? kLightGreen: Colors.grey
                              ),
                              height: 12,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2,top: 8,bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _selectedPage > 3 ? kLightGreen: Colors.grey
                              ),
                              height: 12,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2,top: 8,bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _selectedPage > 4 ? kLightGreen: Colors.grey
                              ),
                              height: 12,
                              width: 40,
                            ),
                          ),
                        ],
                      ),


                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.5,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (int page){
                    setState((){
                      _selectedPage = page;

                    });

                  },
                  children: [Column(
                    children: [const Text('Lets start by getting to know you',style: kSubTitleStyle,),
                      const Padding(
                        padding: EdgeInsets.only(top:15,bottom: 1),
                        child: Text('What is your name?',style: kTitleStyle,),
                      ),
                      CustomTextField(controller: null, node: _nameNode,initialValue: _name,
                        keyboardType: _selectedPage == 0 ? TextInputType.text : TextInputType.number,text: 'name',
                      onChange: (String name){
                        setState((){
                          _name = name;
                        });
                      },),],
                  ),
                    Column(
                      children: [const Text('What is your current weight?',style: kTitleStyle,),
                        Column(children: [
                          weightType == 0 ?CustomTextField(controller: _kgController, node: _kgNode,
                            keyboardType: TextInputType.number,text: 'kg',
                          onChange: (String value){
                            if(_kgController.text.isNotEmpty){
                              _lbsController.text = ((double.parse(value)*2.2).toStringAsFixed(1));
                            }
                            else{
                              _lbsController.clear();
                            }

                          },) :
                          CustomTextField(controller: _lbsController, node: _lbsNode,
                            keyboardType: TextInputType.number,text: 'lbs',
                          onChange: (String value){
                           if(_lbsController.text.isNotEmpty){
                             _kgController.text = ((double.parse(value)/2.2).toStringAsFixed(1));
                           }
                           else{
                             _kgController.clear();
                           }
                          },),
                          ToggleSwitch(
                            activeBgColor: const [kLightGreen],
                            initialLabelIndex: weightType,
                            totalSwitches: 2,
                            labels: const ['Kg','Lbs'],
                            onToggle: (index) {
                              if(index != weightType){
                                setState((){
                                  weightType = index!;

                                });
                                if(weightType==0){
                                  _lbsNode.unfocus();
                                  _kgNode.requestFocus();
                                }
                                else{
                                  _kgNode.unfocus();
                                  _lbsNode.requestFocus();
                                }
                              }

                            },
                          ),
                        ],)
                      ],
                    ),
                    Column(
                      children: [const Text('How tall are you?',style: kTitleStyle,),
                        Column(
                          children: [
                            heightType == 0 ? CustomTextField(controller: _cmController, node: _cmNode,
                                keyboardType: TextInputType.number,text: "cm",onChange: (String value){
                                if(_cmController.text.isNotEmpty){
                                  double totalInches = int.parse(_cmController.text)*0.393701;

                                  int feet = totalInches~/12;
                                  int inches = (totalInches-(feet*12)).toInt();

                                  _feetController.text = feet.toString();
                                  _inchController.text = inches.toString();

                                }
                                else{
                                  _feetController.clear();
                                  _inchController.clear();
                                }
                              },)
                            : Row(children: [
                              Expanded(
                                child: CustomTextField(controller: _feetController, node: _feetNode,
                                  keyboardType: TextInputType.number,text: "feet",onChange: (String feet){
                                  if(_feetController.text.isNotEmpty) {
                                    setState(() {
                                      convertedFeet =
                                          int.parse(_feetController.text) *
                                              30.48;
                                    });
                                  }
                                  else{
                                    setState((){
                                      convertedFeet = 0;
                                    });
                                  }

                                      double cm = convertedFeet + convertedInch;
                                  _cmController.text = cm.ceil().toString();

                                  },),
                              ),  
                              Expanded(
                                child: CustomTextField(controller: _inchController, node: _inchNode,
                                  keyboardType: TextInputType.number,text: "inch",onChange: (String inch){
                                    if(_inchController.text.isNotEmpty){
                                      setState((){
                                        convertedInch = int.parse(_inchController.text)*2.54;
                                      });}
                                    else{
                                      setState((){
                                        convertedInch = 0;
                                      });
                                    }

                                      double cm = convertedFeet + convertedInch;
                                      _cmController.text = cm.ceil().toString();


                                  },),
                              )
                            ],),
                            ToggleSwitch(
                              activeBgColor: const [kLightGreen],
                              initialLabelIndex: heightType,
                              totalSwitches: 2,
                              labels: const ['cm','feet'],
                              onToggle: (index) {
                                if(index != heightType){
                                  setState((){
                                    heightType = index!;

                                  });
                                  if(heightType==0){
                                    _inchNode.unfocus();
                                    _feetNode.unfocus();
                                    _cmNode.requestFocus();
                                  }
                                  else{
                                    _inchNode.unfocus();
                                    _feetNode.requestFocus();
                                    _cmNode.unfocus();


                                  }
                                }

                              },
                            ),
                          ],
                        )],
                    ),
                    Column(
                      children: [const Text('What is your sex?',style: kTitleStyle,),
                        Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:5,right:5),
                                child: GestureDetector(
                                  onTap: (){
                                    setState((){
                                      _gender = 0;
                                      _selectedPage++;
                                    });
                                    _controller.jumpToPage(_selectedPage);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*.45,
                                    height: MediaQuery.of(context).size.width*.25,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: _gender == 0 ? Border.all(color: kLightGreen,width: 3) :
                                        Border.all(width: 3)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/woman.png'),
                                        const Text('Female',style: kSubTitleStyle,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:5,right:5),
                                child: GestureDetector(
                                  onTap: (){
                                    setState((){
                                      _gender = 1;
                                      _selectedPage++;
                                    });
                                    _controller.jumpToPage(_selectedPage);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*.45,
                                    height: MediaQuery.of(context).size.width*.25,


                                    decoration: BoxDecoration(
                                        color: kLightBackground,
                                        borderRadius: BorderRadius.circular(8),
                                        border: _gender == 1 ? Border.all(color: kLightGreen,width: 3) : Border.all(width: 3)

                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/man.png'),
                                        const Text('Male',style: kSubTitleStyle,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )],
                    ),
                    Column(
                      children: [const Text('When is your birthday?',style: kSubTitleStyle,),
                        Expanded(
                          child: CupertinoDatePicker(
                            minimumDate: DateTime(1912,1,1),
                            maximumDate: DateTime.now().add(const Duration(seconds: 1)),
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (DateTime date){
                              setState((){
                                _birthday = date;
                              });
                            },
                          ),
                        )],
                    ),],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _selectedPage != 3 ? CustomButton(color:getButtonColor(), onPressed: nextPage, buttonChild: Text('Next',
                  style: kSubTitleStyle.copyWith(
                      color: Colors.white,
                      fontSize: 18
                  ),)): const SizedBox(height: 1,width: 1,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}