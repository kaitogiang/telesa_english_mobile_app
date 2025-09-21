import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/features/shared/presentation/base/widget_view.dart';
import 'package:telesa_english_app/telesa_english.dart';

class CustomFilter extends StatefulWidget {
  final List<String> options;
  final Widget? trailingIcon;
  final Function(ValueNotifier<String>)? customAction;

  const CustomFilter({
    super.key,
    required this.options,
    this.trailingIcon,
    this.customAction,
  });

  @override
  State<CustomFilter> createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  late String selectedValue;
  late ValueNotifier<String> value;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.options.isNotEmpty ? widget.options[0] : '';
    value = ValueNotifier('Select Date');
  }

  @override
  Widget build(BuildContext context) => _CustomFilterView(this);
}

class _CustomFilterView extends WidgetView<CustomFilter, _CustomFilterState> {
  const _CustomFilterView(super.state);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashFactory: NoSplash.splashFactory,
        highlightColor: AppColors.transparent,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              print('Perform custom Action');
              widget.customAction?.call(state.value);
            },
            child: AbsorbPointer(
              absorbing: widget.customAction != null || widget.options.isEmpty,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                ),
                padding: AppSizes.px1.allPadding.copyWith(right: 30),
                child: ValueListenableBuilder(
                  valueListenable: state.value,
                  builder: (context, hintValue, child) {
                    return DropdownButton<String>(
                      value: state.selectedValue,
                      hint: widget.options.isEmpty ? Text(hintValue) : null,
                      isDense: true,
                      underline: Container(),
                      isExpanded: false,
                      icon: SizedBox.shrink(),
                      style: AppTextStyle.textSize16(),
                      iconSize: 30,
                      onChanged: (value) {
                        if (value != null) {
                          state.setState(() {
                            state.selectedValue = value;
                          });
                        }
                      },
                      items: state.widget.options
                          .map(
                            (option) => DropdownMenuItem(
                              value: option,
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: Text(option),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 2,
            child: Listener(
              behavior: HitTestBehavior.translucent,
              onPointerDown: (event) {
                print('object');
              },
              child:
                  widget.trailingIcon ??
                  AppAssets.iconsDropdownArrowIcon.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.grey,
                      BlendMode.srcIn,
                    ),
                    width: 30,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
