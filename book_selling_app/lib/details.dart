import 'package:flutter/material.dart';
import 'models/book.dart';

class Details extends StatefulWidget {
  final Book bookObject;

  Details(this.bookObject);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 25,
            ),
            ),
            actions: <Widget>[
              Icon(
                Icons.file_upload,
                color: Colors.black87,
                size: 25,
              ),
              SizedBox(width: 25),
              Icon(
                Icons.favorite_border,
                color: Colors.black87,
                size: 25,
              ),
              SizedBox(width: 25)
            ],
          ),
        ),
      ),
      body: DetailsPageBody(widget.bookObject),
    );
  }
}

class DetailsPageBody extends StatefulWidget {
  final Book bookObject;

  DetailsPageBody(this.bookObject);

  @override
  _DetailsPageBodyState createState() => _DetailsPageBodyState();
}

class _DetailsPageBodyState extends State<DetailsPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new TopContainer(widget: widget)
            ],
          ),
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailsPageBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xfff8f8f8), Colors.white]
        ),
        border: Border(bottom: BorderSide(
          color: Color(0xfff0f0f0),
          width: 2
        ))
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                widget.bookObject.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  fontSize: 25
                ),
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}