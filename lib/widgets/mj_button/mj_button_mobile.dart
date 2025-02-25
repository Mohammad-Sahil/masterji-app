part of mj_button_widget;

class _MjButtonMobile extends StatelessWidget {
  final String buttonText;
  final double padding;
  _MjButtonMobile({this.buttonText, this.padding = 8});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assests/images/btnbgfullwidth.svg',
            semanticsLabel: 'Next',
            fit: BoxFit.cover,
          ),
          Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
