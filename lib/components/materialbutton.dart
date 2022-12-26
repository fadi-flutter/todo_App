import 'package:flutter/material.dart';
import '../const.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {super.key, this.text = 'Sign up', required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Container(
      height: sizeh * 0.07,
      width: sizew * 0.82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [purple, pink],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: white, fontSize: sizew * 0.042),
          )),
        ),
      ),
    );
  }
}

class SmallMaterialButton extends StatelessWidget {
  const SmallMaterialButton({
    super.key,
    this.networkImage = googleIamge,
    required this.text,
    required this.imageheight,
    required this.imagewidth,
    this.color = darkwhite, required this.onpressed,
  });
  final double imageheight;
  final double imagewidth;
  final String networkImage;
  final Widget text;
  final Color color;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return MaterialButton(
      elevation: 0,
      height: sizeh * 0.07,
      minWidth: sizew * 0.33,
      color: color,
      onPressed: onpressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(
            networkImage,
            height: imageheight,
            width: imagewidth,
          ),
          SizedBox(
            width: sizew * 0.01,
          ),
          text
          //text of callback
        ],
      ),
    );
  }
}
