// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'data.dart';

class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({required this.block, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle;
    /* switch (block.type) {
      case 'h1':
        textStyle = Theme.of(context).textTheme.displayMedium;
      case 'p' || 'checkbox':
        textStyle = Theme.of(context).textTheme.bodyMedium;
      case _:
        textStyle = Theme.of(context).textTheme.bodySmall;
    }*/
    textStyle = switch (block.type) {
      'h1' => Theme.of(context).textTheme.displayMedium,
      'p' || 'checkbox' => Theme.of(context).textTheme.bodyMedium,
      _ => Theme.of(context).textTheme.bodySmall
    };
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        block.text,
        style: textStyle,
      ),
    );
  }
}

/**
 * 此方法会返回一个 switch 表达式，该表达式可打开值 difference（一个 Duration 对象）。它表示 today 与 JSON 数据中的 modified 值之间的时间跨度。
    switch 表达式的每个 case 语句都使用一个对象模式，该模式通过在对象的属性 inDays 和 isNegative 上调用 getter 来进行匹配。语法看起来像是在构建一个 Duration 对象，但它实际上是访问 difference 对象的字段。
    前三个 case 语句使用常量子模式 0、1 和 -1 来匹配对象属性 inDays，并返回相应的字符串。
    最后两个 case 处理在今天、昨天和明天之外的持续时间：
    如果 isNegative 属性匹配布尔常量模式 true，则意味着修改日期是过去的日期，它会显示“days ago”。
    如果该 case 语句没有发现差异，则持续时间肯定为正数天数（无需使用 isNegative: false 明确验证），因此修改日期是未来的日期，它会显示“days from now”。
    为格式化函数添加两个新 case，用于识别超过 7 天的持续时间，以便界面可以将其显示为“weeks”：
 */
String formatDate(DateTime dateTime) {
  var today = DateTime.now();
  var difference = dateTime.difference(today);

  return switch (difference) {
    Duration(inDays: 0) => 'today',
    Duration(inDays: 1) => 'tomorrow',
    Duration(inDays: -1) => 'yesterday',
    Duration(inDays: var days, isNegative: true) => '${days.abs()} days ago',
    Duration(inDays: var days) => '$days days from now',
  };
}

/**
 * 这段代码引入了 guard 子句：
    guard 子句在 case 模式之后使用 when 关键字。
    它们可用在 if-case、switch 语句和 switch 表达式中。
    它们只会向匹配的模式添加条件。
    如果 guard 子句求值为 false，则整个模式会被反驳，并接着执行下一个 case。
 */
String formatDate_2(DateTime dateTime) {
  var today = DateTime.now();
  var difference = dateTime.difference(today);

  return switch (difference) {
    Duration(inDays: 0) => 'today',
    Duration(inDays: 1) => 'tomorrow',
    Duration(inDays: -1) => 'yesterday',
    Duration(inDays: var days) when days > 7 =>
      '${days ~/ 7} weeks from now', // New
    Duration(inDays: var days) when days < -7 =>
      '${days.abs() ~/ 7} weeks ago', // New
    Duration(inDays: var days, isNegative: true) => '${days.abs()} days ago',
    Duration(inDays: var days) => '$days days from now',
  };
}

class DocumentScreenDemo extends StatelessWidget {
  DocumentScreenDemo({Key? key}) : super(key: key);
  final Document document = Document();

  @override
  Widget build(BuildContext context) {
    var (title, :modified) = document.getMetadata();
    var blocks = document.getBlocks(); // New
    var formattedModifiedDate = formatDate(modified); // New

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Last modified $formattedModifiedDate'),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: blocks.length,
            itemBuilder: (context, index) {
              return BlockWidget(block: blocks[index]);
            },
          ),
        ),
      ])),
    );
  }
}
