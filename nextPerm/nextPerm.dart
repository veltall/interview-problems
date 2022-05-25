main() {
  runTest();
}

void runTest() {
  List<int> list = [1, 2, 3, 4];
  print('original list: $list');
  print('next 15 permutations:');
  for (int i in List.generate(15, (index) => index)) {
    list = breakLeastSignificantSortedOrder(list);
    print(list);
  }
}

List<int> breakLeastSignificantSortedOrder(List<int> list) {
  // start from the least significant digits for both i and j
  for (int i = list.length - 2; i >= 0; i--) {
    for (int j = list.length - 1; j >= i; j--) {
      if (list[i] < list[j]) {
        swap(list, i, j);
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
