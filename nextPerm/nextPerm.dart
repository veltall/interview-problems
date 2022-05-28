main() {
  runTest();
}

void runTest() {
  List<int> list = [1, 2, 3, 4];
  int permLength = quickfactorial(list.length);
  print('original list: $list');
  print('next $permLength permutations:');
  for (int i in List.generate(permLength, (index) => index)) {
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

// sort from i to the end of array
List<int> subsort(List<int> list, int i) {
  final List<int> tempList = list.sublist(i);
  tempList.sort();
  return list.sublist(0, i)..addAll(tempList);
}

int quickfactorial(int n) {
  int factorial = 1;
  int i = 1;
  while (i <= n) {
    factorial *= i;
    i++;
  }
  return factorial;
}
