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
      "checked": false,
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
}

class Blocks {
  final Map<String, Object?> _json;

  Blocks() : _json = jsonDecode(documentJson);

  List<Block> getBlocks() {
    if (_json case {'blocks': List blocksJson}) {
      return <Block>[
        for (var blockJson in blocksJson) Block.fromJson(blockJson)
      ];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

void main() {
  var blocks = Blocks().getBlocks();
   print(blocks);
}
