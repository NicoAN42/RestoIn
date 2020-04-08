import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/screens/search_result_screen.dart';

import '../styles.dart';

class CustomButton extends StatefulWidget {
  final String text;

  const CustomButton({Key key, this.text}) : super(key: key);

  @override
  _CustomButtonState createState() => new _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      child: (FlatButton(
        child: Text(widget.text,
            maxLines: 1, style: Styles.customStyle("mediumGray")),
        color: Styles.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchResultScreen(
                  searchText: widget.text,
                ),
              ));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      )),
    );
  }
}

class CustomHistoryButton extends StatefulWidget {
  final String text;

  const CustomHistoryButton({Key key, this.text}) : super(key: key);

  @override
  _CustomHistoryButtonState createState() => new _CustomHistoryButtonState();
}

class _CustomHistoryButtonState extends State<CustomHistoryButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          isPressed = false;
        });
      },
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResultScreen(
                searchText: widget.text,
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 5),
        child: Text(widget.text,
            style: isPressed
                ? Styles.customStyle("mediumBoldBlack")
                : Styles.customStyle("mediumGray")),
      ),
    );
  }
}

class CustomSearchSortButton extends StatefulWidget {
  final String text;
  final bool isSortBy;

  const CustomSearchSortButton({Key key, this.text, this.isSortBy = false})
      : super(key: key);

  @override
  _CustomSearchSortButtonState createState() =>
      new _CustomSearchSortButtonState();
}

class _CustomSearchSortButtonState extends State<CustomSearchSortButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 10,
      child: (FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: <Widget>[
          Text(widget.text,
              style: widget.isSortBy
                  ? Styles.customStyle("mediumGray")
                  : isPressed
                      ? Styles.customStyle("mediumWhite")
                      : Styles.customStyle("mediumGray")),
          widget.isSortBy
              ? Icon(
                  isPressed
                      ? FontAwesomeIcons.sortUp
                      : FontAwesomeIcons.sortDown,
                  color: Styles.gray,
                )
              : Container(
                  height: 0,
                  width: 0,
                ),
        ]),
        color: widget.isSortBy
            ? Styles.white
            : isPressed ? Styles.orange : Styles.white,
        onPressed: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      )),
    );
  }
}

class CustomSmallButton extends StatefulWidget {
  final String text;
  final bool isClear;

  const CustomSmallButton({Key key, this.text, this.isClear = false})
      : super(key: key);

  @override
  _CustomSmallButtonState createState() => new _CustomSmallButtonState();
}

class _CustomSmallButtonState extends State<CustomSmallButton> {
  bool isPressed = false;

  @override
  void didUpdateWidget(CustomSmallButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.isClear) {
      setState(() {
        isPressed = false;
      });
      print("Passed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      child: (FlatButton(
        child: Text(widget.text,
            maxLines: 1,
            style: isPressed
                ? Styles.customStyle("mediumWhite")
                : Styles.customStyle("mediumGray")),
        color: isPressed ? Styles.orange : Styles.white,
        onPressed: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      )),
    );
  }
}
