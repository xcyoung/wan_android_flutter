import 'package:flutter/material.dart';

class XTextField extends StatefulWidget {
  final BorderRadius cornerRadius;
  final double width, height, wordSpacing;
  final Color backgroundColor, accentColor, textColor, placeHolderColor;
  final String placeHolder, fontFamily;
  final Icon prefixIcon, suffixIcon;
  final TextInputType inputType;
  final EdgeInsets margin;
  final Duration duration;
  final VoidCallback onClickListener;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final bool autoFocus, autoCorrect, enabled, obscureText, isShadow;
  final FocusNode focusNode;
  final int maxLength, minLines, maxLines;
  final ValueChanged<String> onChanged, onSubmitted;
  final GestureTapCallback onTap;

  const XTextField(
      {@required this.prefixIcon,
      @required this.width,
      @required this.height,
      @required this.inputType,
      this.cornerRadius = const BorderRadius.all(Radius.circular(5)),
      this.wordSpacing,
//      this.backgroundColor = const Color(0xff111823),
      this.backgroundColor = Colors.white,
      this.textColor = const Color(0xff5c5bb0),
      this.accentColor = Colors.white,
      this.placeHolderColor = Colors.grey,
      this.placeHolder = "Placeholder",
      this.fontFamily,
      this.suffixIcon,
      this.margin,
      this.duration = const Duration(milliseconds: 500),
      this.onClickListener,
      this.fontStyle,
      this.fontWeight,
      this.autoFocus = false,
      this.autoCorrect = false,
      this.enabled = true,
      this.obscureText = false,
      this.isShadow = false,
      this.focusNode,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.onChanged,
      this.onSubmitted,
      this.onTap})
      : assert(width != null),
        assert(height != null),
        assert(inputType != null),
        assert(prefixIcon != null);

  @override
  _XTextFieldState createState() => _XTextFieldState();
}

class _XTextFieldState extends State<XTextField> {
  bool _onChange = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          boxShadow: widget.isShadow
              ? [BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1)]
              : [BoxShadow(spreadRadius: 0, blurRadius: 0)],
          borderRadius: widget.cornerRadius,
          color: widget.backgroundColor),
      child: Stack(
        children: <Widget>[
//          widget.suffixIcon == null
//              ? Container()
//              : _onChange
//                  ? Align(
//                      alignment: Alignment.centerRight,
//                      child: AnimatedContainer(
//                        width: 40,
//                        height: 40,
//                        margin: EdgeInsets.only(right: 7),
//                        duration: widget.duration,
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(60)),
//                          color: widget.backgroundColor,
//                        ),
//                      ))
//                  : Container(),
          widget.suffixIcon == null
              ? Container()
              : _onChange
                  ? GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          widget.suffixIcon.icon,
                          color: widget.accentColor,
                        ),
                      ),
                    )
                  : Container(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    widget.prefixIcon.icon,
                    color: widget.accentColor,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.only(right: 50, top: 3),
                    child: TextField(
                      cursorWidth: 2,
                      obscureText: widget.obscureText,
                      keyboardType: widget.inputType,
                      style: TextStyle(
                        fontFamily: widget.fontFamily,
                        fontStyle: widget.fontStyle,
                        fontWeight: widget.fontWeight,
                        wordSpacing: widget.wordSpacing,
                        fontSize: 18,
                        letterSpacing: 2,
                        color: widget.textColor,
                      ),
                      autofocus: widget.autoFocus,
                      autocorrect: widget.autoCorrect,
                      focusNode: widget.focusNode,
                      enabled: widget.enabled,
                      maxLength: widget.maxLength,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      onChanged: (str) {
                        if (str.length > 0) {
                          if (!_onChange) {
                            setState(() {
                              _onChange = true;
                            });
                          }
                        } else {
                          setState(() {
                            _onChange = false;
                          });
                        }
                      },
                      onTap: () {
                        if (widget.onTap != null) {
                          widget.onTap();
                        }
                      },
                      onSubmitted: (t) {
                        widget.onSubmitted(t);
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: widget.placeHolderColor),
                          hintText: widget.placeHolder,
                          border: InputBorder.none),
                      cursorColor: widget.textColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
