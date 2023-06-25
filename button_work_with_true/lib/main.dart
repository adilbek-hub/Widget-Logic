import 'package:button_work_with_true/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
/*
1.Создание класса MyForm, который является состоянием виджета StatefulWidget.
2. В классе MyForm мы определяем глобальный ключ GlobalKey<FormState> _formKey, который
 будет использоваться для управления состоянием формы.
3. Создание экземпляра TextEditingController для управления значением ввода текста в
 TextFormField. Мы также добавляем слушатель _checkInputText для отслеживания изменений в 
 текстовом поле.
4. В методе initState мы добавляем слушатель _checkInputText, чтобы проверять вводимый 
текст и обновлять состояние кнопки.
5. В методе dispose мы удаляем слушатель _checkInputText и освобождаем ресурсы контроллера.
6. Метод _checkInputText вызывается каждый раз при изменении текста в TextFormField. Он
 проверяет, является ли текстовое поле пустым или содержит текст, и обновляет состояние 
 _isButtonEnabled в зависимости от результата.
7. Метод _saveTextValue вызывается при нажатии на кнопку "Сохранить". Он проверяет, проходит 
ли текущее состояние формы (валидация) и если да, то сохраняет значение текстового поля.
8. В методе build создается виджет Scaffold, который содержит AppBar и body с формой.
9. Внутри Form мы используем TextFormField для ввода текста. Мы указываем контроллер 
_textEditingController для управления значением и определяем функцию validator, которая 
проверяет, что поле не пустое. Если поле пустое, она возвращает сообщение об ошибке.
10.Внутри ElevatedButton мы устанавливаем onPressed равным
 _isButtonEnabled ? _saveTextValue : null, что означает, что кнопка будет активной только
  в том случае, если _isButtonEnabled равно true. Если текстовое поле пустое или введенное 
  значение не проходит валидацию, кнопка будет отключена (null).
11) В методе main мы запускаем приложение, используя MaterialApp и устанавливаем MyForm 
в качестве начального экрана.
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    _textEditingController.addListener(_checkInputText);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_checkInputText);
    _textEditingController.dispose();
    super.dispose();
  }

  void _checkInputText() {
    setState(() {
      _isButtonEnabled = _textEditingController.text.isNotEmpty;
    });
  }

  void saveTextValue() {
    if (_formKey.currentState!.validate()) {
      final textValue = _textEditingController.text;
      if (textValue.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => const SecondPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyHomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Текст жаз';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        saveTextValue();
                      }
                    : null,
                child: const Text('Отправить'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
