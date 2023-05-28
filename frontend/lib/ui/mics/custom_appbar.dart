import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.child,
    required this.title,
    this.actionList,
    this.isResponsive = true,
    this.isBackButtonVisible = true,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool isResponsive;
  final bool isBackButtonVisible;
  final String title;
  final List<Widget>? actionList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: size.width,
            child: NavigationToolbar(
              leading: isBackButtonVisible
                  ? AutoBackButton(
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : const SizedBox.shrink(),
              middle: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                ),
              ),
              trailing: (actionList != null && actionList!.isNotEmpty)
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: actionList!,
                    )
                  : null,
              centerMiddle: true,
              middleSpacing: NavigationToolbar.kMiddleSpacing,
            ),
          ),
          Expanded(
            child: isResponsive
                ? Row(
                    children: [
                      SizedBox(
                        width: size.width < 500 ? 0 : size.width * 0.1,
                      ),
                      Expanded(
                        child: child,
                      ),
                      SizedBox(
                        width: size.width < 500 ? 0 : size.width * 0.1,
                      ),
                    ],
                  )
                : child,
          ),
        ],
      ),
    );
  }
}
