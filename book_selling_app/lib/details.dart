import 'package:flutter/material.dart';
import 'models/book.dart';
import 'package:flutter_rating/flutter_rating.dart';

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
              TopContainer(widget: widget),
              AuthorContainer(widget: widget)
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

class AuthorContainer extends StatelessWidget {
  final DetailsPageBody widget;

  const AuthorContainer({
    @required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          top: 20, left: 10, right: 10, bottom: 0,
        ),
        width: MediaQuery.of(context).size.width / 2,
        height: 110,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            widget.bookObject.authorImg,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.bookObject.author,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      StarRating(
                        rating: widget.bookObject.rating,
                        size: 20,
                        color: Colors.yellow.shade700,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        widget.bookObject.rating.toString(),
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}