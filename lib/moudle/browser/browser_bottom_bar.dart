import 'package:flutter/material.dart';

typedef OnBackCallback = void Function();
typedef OnMoreCallback = void Function();

class BrowserBottomBar extends StatefulWidget {
  OnBackCallback backCallback = null;
  OnMoreCallback moreCallback;

  BrowserBottomBar({
    Key key,
    this.backCallback,
    this.moreCallback,
  }) : super(key: key);

  @override
  BrowserBottomBarState createState() => BrowserBottomBarState();
}

class BrowserBottomBarState extends State<BrowserBottomBar> {
  String _title = '';
  String _url = '';
  bool _showUrl = false;

  void setTitle(String title) {
    this._title = title;
    setState(() {});
  }

  void setUrl(String url) {
    this._url = url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    this.widget.backCallback();
                  })),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                border: Border.all(
                    color: Color(0xFFFAFAFA), style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: GestureDetector(
                      child: Text(
                        this._showUrl ? this._url : this._title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        this._showUrl = !this._showUrl;
                        setState(() {});
                      },
                    )),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: IconButton(
                icon: Icon(
                  Icons.clear_all,
                  color: Colors.black,
                ),
                onPressed: () {
                  this.widget.moreCallback();
                }),
          )
        ],
      ),
    );
  }
}
