part of choose_language_view;

class _ChooseLanguageMobile extends StatefulWidget {
  final ChooseLanguageViewModel viewModel;

  _ChooseLanguageMobile(this.viewModel);

  @override
  __ChooseLanguageMobileState createState() => __ChooseLanguageMobileState();
}

class __ChooseLanguageMobileState extends State<_ChooseLanguageMobile> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       
       body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assests/images/languagebg.png"),
                 fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Padding(
                padding: const EdgeInsets.only(top:24.0),
                 child: Container(
                   child: FlatButton(
                     onPressed: () async {
                       widget.viewModel.changeLang('hi');
                         setState(() {});
                     },
                     
                     padding: EdgeInsets.only(left:20.0,right: 20.0),
                     child:  DottedBorder(
                             
                              borderType: BorderType.RRect,
                              radius: Radius.circular(4),
                              child: ClipRRect(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: 50,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text('हिन्दी',
                                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                    ),
                                    
                                    
                                    ),
                                  ),
                                ),
                              ),
                            ),
                  
                         
                   ),
                 ),
           
             
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Container(
                  child: FlatButton(
                    onPressed: () async {
                      widget.viewModel.changeLang('en');
                        setState(() {});
                    },
                    
                    padding: EdgeInsets.only(left:20.0,right: 20),
                  
                      child:  DottedBorder(
                             
                              borderType: BorderType.RRect,
                              radius: Radius.circular(4),
                              child: ClipRRect(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: 50,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text('English',
                                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                    ),
                                    
                                    
                                    ),
                                  ),
                                ),
                              ),
                              
                  ),
                ),
              ),
            ],
          ),
            ),
            )
);
  }
}