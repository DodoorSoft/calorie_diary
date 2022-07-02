
import 'package:calorie_diary/components/custom_button.dart';
import 'package:calorie_diary/components/custom_text_field.dart';
import 'package:calorie_diary/constants.dart';
import 'package:flutter/material.dart';


class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>{


  late PageController _controller;

  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  int _selectedPage = 0;

  late String _name;
  late int _age;
  late int _weight;
  late int _height;
  late DateTime _birthday;
  late int _gender;

  void onPressedBack(){
    if(_selectedPage>0){
      setState((){
        switch (_selectedPage){
          case 4:
            _textController.text = _height.toString();
            break;
          case 3:
            _textController.text = _weight.toString();
            break;
          case 2:
            _textController.text = _age.toString();
            break;
          case 1:
            _textController.text = _name;
            break;

        }
        _selectedPage -= 1;

      });
    }
    else{
      Navigator.pop(context);
    }

  }

  void updateFields(){
    switch (_selectedPage){
      case 0:
        setState((){
          _name = _textController.text;
        });
        break;
      case 1:
        setState((){
          _age = int.parse(_textController.text);
        });
        break;
      case 2:
        setState((){
          _weight = int.parse(_textController.text);
        });
        break;
      case 3:
        setState((){
          _height = int.parse(_textController.text);
        });
        break;

    }
    _textController.clear();
    _focusNode.unfocus();
    setState((){
      _selectedPage++;
    });
  }

  late final List<Widget> _pages = [Column(
    children: [const Text('Lets start by getting to know you',style: kSubTitleStyle,),
      const Padding(
        padding: EdgeInsets.only(top:15,bottom: 1),
        child: Text('What is your name?',style: kTitleStyle,),
      ),
      CustomTextField(controller: _textController, node: _focusNode,
        keyboardType: _selectedPage == 0 ? TextInputType.text : TextInputType.number,),],
  ),
    Column(
      children: [const Text('How old are you?',style: kTitleStyle,),
        CustomTextField(controller: _textController, node: _focusNode,
          keyboardType: TextInputType.number,),],
    ),
    Column(
      children: [const Text('What is your current weight?',style: kTitleStyle,),
        CustomTextField(controller: _textController, node: _focusNode,
          keyboardType: TextInputType.number,),],
    ),
    Column(
      children: [const Text('How tall are you?',style: kTitleStyle,),
        CustomTextField(controller: _textController, node: _focusNode,
          keyboardType: TextInputType.number,),],
    ),
    Column(
      children: [const Text('How tall are you?',style: kSubTitleStyle,),
        CustomTextField(controller: _textController, node: _focusNode,
          keyboardType: TextInputType.number,),],
    ),
    Column(
      children: [const Text('How tall are you?',style: kSubTitleStyle,),
        CustomTextField(controller: _textController, node: _focusNode,
          keyboardType: TextInputType.number,),],
    ),];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
    _textController.addListener(() {
      setState((){});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _textController.dispose();
    _focusNode.dispose();
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
                  controller: _controller,
                  onPageChanged: (int page){
                    setState((){
                      _selectedPage = page;

                    });

                  },
                  children: [_pages[_selectedPage]],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(color: _textController.text.isNotEmpty ? kLightGreen : Colors.grey, onPressed: (){

                  if(_textController.text.isNotEmpty){
                    updateFields();
                  }

                }, buttonChild: Text('Next',
                  style: kSubTitleStyle.copyWith(
                      color: Colors.white,
                      fontSize: 18
                  ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}