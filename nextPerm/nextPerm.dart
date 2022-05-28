import 'dart:math';

main() {
  runTest();
}

void checkSort(List<int> list) {
  var isSorted = true;
  for (var i = 1; i < list.length; i++) {
    if (list[i] < list[i - 1]) {
      isSorted = false;
      print('${list[i - 1]} appears before ${list[i]}');
    }
  }
  print(isSorted ? 'list is properly in sorted order' : '');
}

void runTest() {
  List<int> list = [1, 2, 3, 4];
  List<int> testList = <int>[];
  int permLength = factorial(list.length) - 1;
  print('original list: $list');
  print('next $permLength permutations:');
  for (int i in List.generate(permLength, (index) => index)) {
    list = breakLeastSignificantSortedOrder(list);
    print(list);
    int listSum = 0;
    for (var i = 0; i < list.length; i++) {
      listSum += list[i] * pow(10, (list.length - 1) - i).toInt();
    }
    testList.add(listSum);
  }
  checkSort(testList);
}

List<int> breakLeastSignificantSortedOrder(List<int> list) {
  // start from the least significant digits for both i and j
  for (int i = list.length - 2; i >= 0; i--) {
    for (int j = list.length - 1; j >= i; j--) {
      if (list[i] < list[j]) {
        swap(list, i, j);
        list = subsort(list, i + 1);
        return list;
      }
    }
  }
  // done searching, no sortedness found
  return list.reversed.toList();
}

void swap(List<int> list, int i, int j) {
  // push j into i's position, shifting the rest over by 1 position
  list.insert(i, list.removeAt(j));
}

List<int> subsort(List<int> list, int i) {
  // sort from i to the end of array
  return list.sublist(0, i)..addAll(list.sublist(i)..sort());
}

int factorial(int n) {
  if (n == 1) {
    return n;
  } else {
    return n * factorial(n - 1);
  }
}
