import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class WishlistButton extends StatefulWidget {
  final Color buttonColor;
  final bool isWishlisted;
  final void Function() onAddWishlist;

  const WishlistButton({
    Key? key,
    required this.buttonColor,
    required this.onAddWishlist,
    this.isWishlisted = false,
  }) : super(key: key);

  @override
  _WishlistButtonState createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onAddWishlist,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isWishlisted ? widget.buttonColor : null,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 1.5, color: widget.buttonColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            widget.isWishlisted
                ? Ionicons.bag_check_outline
                : Ionicons.bag_add_outline,
            color: widget.isWishlisted ? Colors.white : widget.buttonColor,
            size: 28,
          ),
        ),
      ),
    );
  }
}
