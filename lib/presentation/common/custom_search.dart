import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles.dart';
import '../../util_method.dart';

class CustomSearch extends StatelessWidget {
  final String? hintText;
  final Color? backgroundColor;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final int? maxLength;
  final bool readOnly;
  final bool isKeyboardNumericType;
  final Function()? onTap;
  final TextInputType? textInputType;
  final bool isWidthMatchParent;
  final int? numberOfRows;
  final VoidCallback onEvent;

  const CustomSearch(
      {Key? key,
        this.textInputType,
        required this.hintText,
        required this.onChanged,
        this.isWidthMatchParent = true,
        this.isKeyboardNumericType = false,
        this.maxLength,
        this.numberOfRows = 1,
        this.onTap,
        this.backgroundColor ,
        this.readOnly = false,
        @required this.controller, required this.onEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: isWidthMatchParent ? size.width : null,
      //   height: 50,
      padding:  EdgeInsets.symmetric(horizontal: UtilMethod.mediaSize(context).width*0.04, vertical: UtilMethod.mediaSize(context).height*0.015,),
      decoration: BoxDecoration(
        color: backgroundColor?.withOpacity(0.2),
        border:
        Border.all(color: Styles.primaryColor.withOpacity(0.6), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntrinsicWidth(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: Theme.of(context).textTheme.bodyText2,
                autofocus: false,
                maxLength: maxLength,
                onTap: onTap,
                readOnly: readOnly,
                controller: controller,
                onChanged: onChanged,
                cursorColor: Styles.whiteColors,
                keyboardType: textInputType ??
                    (isKeyboardNumericType
                        ? TextInputType.number
                        : TextInputType.text),
                maxLines: numberOfRows,
                minLines: numberOfRows,
                inputFormatters: isKeyboardNumericType
                    ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ]
                    : null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  isDense: true,
                  hintText: hintText,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Styles.blackColors),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: UtilMethod.mediaSize(context).height*0.001,),
              child: controller!.text.isEmpty
                  ? Icon(
                  Icons.search,color: Styles.blackColors,
              )
                  : InkWell(onTap: onEvent, child: Icon(Icons.clear, color: Styles.blackColors,)),
            )
          ],
        ),
      ),
    );
  }
}
