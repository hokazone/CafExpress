import 'package:flutter/material.dart';

class VariableHeightListTile extends StatelessWidget {
  const VariableHeightListTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.endtitle,
    this.trailing,
    this.onTap,
    this.height,
  }) : super(key: key);

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? endtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _leading = leading ?? const SizedBox.shrink();
    final _trailing = trailing ?? const SizedBox.shrink();
    const double _padding = 16.0;
    final _height = (height ?? 56.0) - _padding * 2;
    final MainAxisAlignment _mainAxisAlignment =
        (_leading is SizedBox || _trailing is SizedBox)
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.start;

    SizedBox _margin(Widget widget) {
      return (widget is SizedBox)
          ? const SizedBox.shrink()
          : const SizedBox(width: 32.0);
    }

    Widget _texts({
      required Widget title,
      Widget? subtitle,
      Widget? endtitle,
    }) {
      final _title = title;
      final _subtitle = subtitle ?? const SizedBox.shrink();
      final _endtitle = endtitle ?? const SizedBox.shrink();
      final _defaultTitleStyle = theme.textTheme.bodyText1!;
      final _defaultSubtitleStyle = theme.textTheme.subtitle1!;
      final _defaultEndtitleStyle = theme.textTheme.subtitle1!;

      return LayoutBuilder(builder: (context, size) {
        bool _isMultiLine = false;

        if (_title is Text) {
          final style = _title.style ?? _defaultTitleStyle;
          final span = TextSpan(text: _title.data, style: style);
          final tp = TextPainter(
            text: span,
            maxLines: 1,
            textDirection: TextDirection.ltr,
          );
          tp.layout(maxWidth: size.maxWidth);
          _isMultiLine |= tp.didExceedMaxLines;
        }
        if (_subtitle is Text) {
          final style = _subtitle.style ?? _defaultSubtitleStyle;
          final span = TextSpan(text: _subtitle.data, style: style);
          final tp = TextPainter(
            text: span,
            maxLines: 1,
            textDirection: TextDirection.ltr,
          );
          tp.layout(maxWidth: size.maxWidth);
          _isMultiLine |= tp.didExceedMaxLines;
        }
        if (_endtitle is Text) {
          final style = _endtitle.style ?? _defaultEndtitleStyle;
          final span = TextSpan(text: _endtitle.data, style: style);
          final tp = TextPainter(
            text: span,
            maxLines: 1,
            textDirection: TextDirection.ltr,
          );
          tp.layout(maxWidth: size.maxWidth);
          _isMultiLine |= tp.didExceedMaxLines;
        }
        double _padding = (_isMultiLine) ? 5.0 : 16.0;
        CrossAxisAlignment _crossAxisAlignment = (_title is Text)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: _padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: _crossAxisAlignment,
            children: [
              Align(
                alignment: Alignment.center,
                child: _title,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _subtitle,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: _endtitle,
              ),
            ],
          ),
        );
      });
    }

    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: _padding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: _height,
          ),
          child: Row(
            mainAxisAlignment: _mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _leading,
              _margin(_leading),
              Expanded(
                child: _texts(
                  title: title,
                  subtitle: subtitle,
                  endtitle: endtitle,
                ),
              ),
              _margin(_trailing),
              _trailing,
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
