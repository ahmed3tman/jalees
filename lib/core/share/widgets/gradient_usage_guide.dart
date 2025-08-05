/*
  طريقة استخدام خلفية التدرج الجميلة في التطبيق:

  1. استخدام GradientScaffold بدلاً من Scaffold العادي:
  
  GradientScaffold(
    appBar: AppBar(title: Text('العنوان')),
    body: YourBodyWidget(),
  )

  2. أو استخدام GradientBackground لأي widget:
  
  GradientBackground(
    child: YourWidget(),
  )

  3. التدرج المستخدم:
  - اللون الأفتح في الأعلى: #FEE4A6
  - اللون الأغمق في الأسفل: #FDB774
  
  هذا يعطي تأثير شروق/غروب الشمس جميل ومهدئ في كل التطبيق!
*/
