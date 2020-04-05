import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:restoin/widgets/custom_icon_icons.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String type;
  final Function savePw;
  final String confPw;
  final IconData icon;
  final bool isSuffix;
  final bool isObscureText;
  final TextEditingController controller;

  CustomTextField(
      {this.hint,
      this.type,
      this.savePw,
      this.confPw,
      this.icon,
      this.isSuffix,
      this.isObscureText,
      this.controller,
      key})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => new _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focus = new FocusNode();
  bool _isObscureText;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _isObscureText = widget.isObscureText ?? false;
  }

  void dispose() {
    _focus.removeListener(_onFocusChange);
    // widget.controller.dispose();
    super.dispose();
  }

  Future<Null> _onFocusChange() async {
    if (_focus.hasFocus) {
      setState(() {});
    } else {
      setState(() {});
    }
  }

  _toggleObscure() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _focus.hasFocus == true || widget.controller.text != ""
            ? Padding(
                padding: EdgeInsets.only(left: 48),
                child: Container(
                    child: Text(widget.hint,
                        style: Styles.customStyle("smallGray"))))
            : Container(
                width: 0,
                height: 0,
                padding: EdgeInsets.all(0),
              ),
        TextFormField(
          style: Styles.customStyle("mediumBlack"),
          focusNode: _focus,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: _focus.hasFocus == true ? null : widget.hint,
              hintStyle: Styles.customStyle("mediumGray"),
              contentPadding: EdgeInsets.symmetric(vertical: 13.5),
              enabledBorder: widget.controller.text == ""
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(color: Styles.gray, width: 2.0))
                  : UnderlineInputBorder(
                      borderSide: BorderSide(color: Styles.black, width: 2.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Styles.black, width: 2.0)),
              prefixIcon: new Icon(widget.icon,
                  size: 20,
                  color: _focus.hasFocus == true
                      ? Styles.black
                      : widget.controller.text == ""
                          ? Styles.gray
                          : Styles.black),
              suffixIcon: widget.isSuffix == true
                  ? GestureDetector(
                      onTap: _toggleObscure,
                      child: new Icon(
                        _isObscureText ? CustomIcon.eye_off : CustomIcon.eye,
                        color: Styles.gray,
                        size: 20,
                      ))
                  : null),
          obscureText: _isObscureText,
          validator: widget.type == "email"
              ? (val) => !EmailValidator.Validate(val, true)
                  ? 'Please provide a valid email. Ex: bob@gmail.com'
                  : null
              : widget.type == "pw"
                  ? (val) => val.length < 8 ||
                          !val.contains(new RegExp(r'[0-9]')) ||
                          !val.contains(new RegExp(r'[A-Za-z]'))
                      ? 'Use 8 or more characters with a mix of letters & numbers'
                      : null
                  : widget.type == "confPw"
                      ? (val) => val.isEmpty || val != widget.confPw
                          ? 'Please provide the same password'
                          : null
                      : widget.type == "name"
                          ? (val) => val.isEmpty
                              ? 'Please provide a valid name.'
                              : null
                          : null,
          onChanged: (val) => widget.type == "pw" ? widget.savePw(val) : null,
        ),
      ],
    );
  }
}
