import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../entities/credit.dart';

class CreditsCard extends StatelessWidget {
  final Credit credit;

  CreditsCard(this.credit);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(8),
            image: (credit.profilePath == null)
                ? DecorationImage(
                    image: AssetImage("assets/default-pp.jpg"),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: NetworkImage("https://image.tmdb.org/t/p/" +
                        "w185" +
                        credit.profilePath!),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6),
          width: 70,
          child: Text(
            credit.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
