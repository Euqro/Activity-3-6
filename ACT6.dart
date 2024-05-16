class Stack<T> {
  List<T> _stack = [];

  void push(T element) {
    _stack.add(element);
  }

  T pop() {
    if (isEmpty()) {
      throw Exception('Stack is empty');
    }
    return _stack.removeLast();
  }

  bool isEmpty() {
    return _stack.isEmpty;
  }
}

void main() {
  var stack = Stack<int>();

  stack.push(1);
  stack.push(2);
  stack.push(3);

  print('Is stack empty? ${stack.isEmpty()}');

  var poppedElement = stack.pop();
  print('Popped element: $poppedElement');

  print('Is stack empty? ${stack.isEmpty()}');
}
