library canvas;

import 'dart:html';

void main() {
  Element body = query('body');
  CanvasElement canvas = new CanvasElement(width: 200, height: 200);
  CanvasRenderingContext c = canvas.getContext('2d');
  drawLine(c, 0, 0, 0, 50);
  drawLine(c, 0, 50, 50, 50);
  drawLine(c, 80, 0, 80, 50);
  body.nodes.add(canvas);
}

void drawLine(c, x, y, begin, end) {
  c.beginPath();
  c.moveTo(x,y);
  c.lineTo(begin,end);
  c.stroke();
}
