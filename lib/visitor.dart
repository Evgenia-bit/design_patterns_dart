abstract interface class Block {
  String accept(Visitor visitor);
}

abstract interface class Visitor {
  String exportHeadingBlock(HeadingBlock block);
  String exportListBlock(ListBlock block);
  String exportParagraphBlock(ParagraphBlock block);
}

class HeadingBlock implements Block {
  @override
  String accept(Visitor visitor) {
    return visitor.exportHeadingBlock(this);
  }
}

class ListBlock implements Block {
  @override
  String accept(Visitor visitor) {
    return visitor.exportListBlock(this);
  }
}

class ParagraphBlock implements Block {
  @override
  String accept(Visitor visitor) {
    return visitor.exportParagraphBlock(this);
  }
}

class HtmlExportVisitor implements Visitor {
  @override
  String exportHeadingBlock(HeadingBlock block) {
    return '<h1>Heading</h1>';
  }

  @override
  String exportListBlock(ListBlock block) {
    return '<ul><li>Item 1</li><li>Item 2</li></ul>';
  }

  @override
  String exportParagraphBlock(ParagraphBlock block) {
    return '<p>Paragraph</p>';
  }
}
