import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'webpage.dart';

class DocCard extends StatefulWidget {
  // var libName = '';
  // var libImage = '';
  // var libLink = '';
  final libName;
  final libImage;
  final libLink;

  DocCard(this.libName, this.libImage, this.libLink);

  @override
  _DocCardState createState() => _DocCardState(this.libName, this.libImage, this.libLink);
}

class _DocCardState extends State<DocCard> {
  var libName;
  var libImage;
  var libLink;
  _DocCardState(this.libName, this.libImage, this.libLink);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.black,
        elevation: 10,
        shadowColor: Colors.white70,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () async {
            print('Card Clicked');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WebPage(widget.libLink, widget.libName),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              new Image(
                image: AssetImage('assets/${widget.libImage}'),
                height: 130.0,
                width: 130.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${widget.libName}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

