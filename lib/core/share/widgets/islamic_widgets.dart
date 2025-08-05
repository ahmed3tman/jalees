import 'package:flutter/material.dart';
import '../../theme/app_fonts.dart';

/// كارد مخصص للنصوص الإسلامية مع تصميم أنيق
class IslamicTextCard extends StatelessWidget {
  final String text;
  final String? title;
  final String? subtitle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool showShadow;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  const IslamicTextCard({
    super.key,
    required this.text,
    this.title,
    this.subtitle,
    this.textStyle,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.showShadow = true,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        elevation: showShadow ? 4 : 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color:
                borderColor ??
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                backgroundColor ?? Theme.of(context).colorScheme.surface,
                (backgroundColor ?? Theme.of(context).colorScheme.surface)
                    .withOpacity(0.9),
              ],
            ),
          ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // العنوان الرئيسي
                if (title != null) ...[
                  Text(
                    title!,
                    style: AppFonts.suraNameStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                ],

                // النص الرئيسي
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (leading != null) ...[
                      leading!,
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.1),
                          ),
                        ),
                        child: ArabicTextWidget(
                          text: text,
                          style:
                              textStyle ??
                              AppFonts.quranTextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    if (trailing != null) ...[
                      const SizedBox(width: 12),
                      trailing!,
                    ],
                  ],
                ),

                // العنوان الفرعي
                if (subtitle != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    subtitle!,
                    style: AppFonts.captionStyle(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// عنوان قسم مزخرف بالطراز الإسلامي
class IslamicSectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  const IslamicSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.color,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          // خط علوي مزخرف
          Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  color ?? Theme.of(context).colorScheme.primary,
                  Colors.transparent,
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // العنوان مع الأيقونة
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (color ?? Theme.of(context).colorScheme.primary)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: color ?? Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Text(
                title,
                style: AppFonts.suraNameStyle(
                  fontSize: 24,
                  color: color ?? Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          // العنوان الفرعي
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: AppFonts.captionStyle(),
              textAlign: TextAlign.center,
            ),
          ],

          const SizedBox(height: 16),

          // خط سفلي مزخرف
          Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  color ?? Theme.of(context).colorScheme.primary,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// زر بتصميم إسلامي أنيق
class IslamicButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isOutlined;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const IslamicButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.isOutlined = false,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        backgroundColor ?? Theme.of(context).colorScheme.primary;

    if (isOutlined) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon != null ? Icon(icon, size: 18) : const SizedBox.shrink(),
        label: Text(text),
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor ?? primaryColor,
          textStyle: AppFonts.buttonTextStyle(),
          side: BorderSide(color: primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, size: 18) : const SizedBox.shrink(),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: textColor ?? Colors.white,
        textStyle: AppFonts.buttonTextStyle(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        elevation: 3,
      ),
    );
  }
}

/// شريط بحث بتصميم إسلامي
class IslamicSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;

  const IslamicSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textDirection: TextDirection.rtl,
        style: AppFonts.generalTextStyle(),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.captionStyle(),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}

/// حاوية معلومات مع أيقونة
class InfoContainer extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  const InfoContainer({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: (color ?? Theme.of(context).colorScheme.primary).withOpacity(
          0.1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: color ?? Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppFonts.captionStyle(fontSize: 12)),
              Text(
                value,
                style: AppFonts.generalTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color ?? Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
