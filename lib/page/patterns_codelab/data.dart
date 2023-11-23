import 'dart:convert';

class Document {
  final Map<String, Object?> _json;

  Document() : _json = jsonDecode(documentJson);

  (String, {DateTime modified}) getMetadata() {
    var title = "My Document";
    var now = DateTime.now();

    return (title, modified: now);
  }

  (String, {DateTime modified2}) getMetadata2() {
    if (_json.containsKey('metadata')) {
      var metadataJson = _json['metadata'];
      if (metadataJson is Map) {
        var title = metadataJson['title'] as String;
        var localModified = DateTime.parse(metadataJson['modified'] as String);
        return (title, modified2: localModified);
      }
    }
    throw const FormatException('Unexpected JSON');
  }

  (String, {DateTime modified3}) getMetadata3() {
    if (_json
        case {
          'metadata': {
            'title': String title,
            'modified': String localModified,
          }
        }) {
      return (title, modified3: DateTime.parse(localModified));
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * getBlocks() 函数会返回 Block 对象列表，您稍后将使用这些对象来构建界面。熟悉的 if-case 语句会执行验证，
   * 并将 blocks 元数据的值转换为名为 blocksJson 的新 List（如果没有模式，则需要使用 toList() 方法进行转换）。
      列表文字包含一个集合，以便用 Block 对象填充新列表。
   */
  List<Block> getBlocks() {
    if (_json case {'blocks': List blocksJson}) {
      return <Block>[
        for (var blockJson in blocksJson) Block.fromJson(blockJson)
      ];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }

  List<Block2> getBlocks2() {
    if (_json case {'blocks': List blocksJson}) {
      return <Block2>[
        for (var blockJson in blocksJson) Block2.fromJson(blockJson)
      ];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": true,
      "text": "Learn Dart 3"
    }
  ]
}
''';

class Block {
  final String type;
  final String text;

  Block({required this.type, required this.text});

  factory Block.fromJson(Map<String, dynamic> json) {
    if (json case {'type': var type, 'text': var text}) {
      return Block(type: type, text: text);
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }

  @override
  String toString() {
    return '{type: $type, text: $text}';
  }
}

class HeaderBlock extends Block2 {
  final String text;

  HeaderBlock(this.text);
}

class ParagraphBlock extends Block2 {
  final String text;

  ParagraphBlock(this.text);
}

class CheckboxBlock extends Block2 {
  final String text;
  final bool isChecked;

  CheckboxBlock(this.text, this.isChecked);
}

sealed class Block2 {
  Block2();

  factory Block2.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'type': 'h1', 'text': String text} => HeaderBlock(text),
      {'type': 'p', 'text': String text} => ParagraphBlock(text),
      {'type': 'checkbox', 'text': String text, 'checked': bool checked} =>
        CheckboxBlock(text, checked),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}
