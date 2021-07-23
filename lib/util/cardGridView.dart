import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:smart_home_yt/models/initData.dart';
import 'package:smart_home_yt/util/appColors.dart';

class CardGridView extends StatefulWidget {
  final List<IotDevice> data;
  const CardGridView({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _CardGridViewState createState() => _CardGridViewState();
}

class _CardGridViewState extends State<CardGridView> {
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.95,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: List.generate(widget.data.length, (index) => Stack(
        children: [
          Container(
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                colors: AppColors.cardGradeantColors,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight
              ),
              shape: SquircleBorder(
                radius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(120),
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(80),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 8,
                  offset: Offset(0, 6)
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    widget.data[index].iconePath,
                    color: AppColors.mainTextColor,
                    width: devWidth * 0.08,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.data[index].name,
                    style: TextStyle(
                      fontSize: devWidth * 0.04,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.data[index].status ? "on" : "off",
                        style: TextStyle(
                          fontSize: devWidth * 0.04,
                          color: AppColors.minorTextColor,
                        ),
                      ),
                      Switch(
                        value: widget.data[index].status,
                        activeColor: Color(0xFFf0a08c),
                        inactiveThumbColor: Color(0xFFa182f5),
                        activeTrackColor: AppColors.backgroundColor,
                        inactiveTrackColor: AppColors.backgroundColor,
                        onChanged: (value) {
                          setState(() {
                            widget.data[index].status = value;
                          });
                        }
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          widget.data[index].notify != 0 ? Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFa182f5),
                    Color(0xFFa182f5).withRed(120),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    spreadRadius: 8,
                    offset: Offset(0, 6)
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                widget.data[index].notify.toString(),
                style: TextStyle(
                  fontSize: devWidth * 0.03,
                  color: AppColors.mainTextColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ) : Container(),
        ],
      )),
    );
  }
}