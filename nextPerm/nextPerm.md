# Find the next smallest permutation of a given number whose digits are represented by an array of numbers.

Given a number represented by a list of digits, find the next greater permutation of a number, in terms of lexicographic ordering. If there is not greater permutation possible, return the permutation with the lowest value/ordering.

For example, the list [1,2,3] should return [1,3,2]. The list [1,3,2] should return [2,1,3]. The list [3,2,1] should return [1,2,3].

Can you perform the operation without allocating extra memory (disregarding the input memory)?

---

Ideas:

- Digits of higher significance are to the left of the array/number.
- Digits of lower significance are to the right.
- Therefore a sorted array represents the smallest possible number and a reverse-sorted array represents the largest possible number.
- In more general terms, if a number A has a permutation B where B > A, then A must have at least one pair of numbers A[i] and A[j] that are in sorted order. That is to say
  > `i < j` and `A[i] < A[j]` or vice versa
- Thus, breaking the **least significant** such pair will logically yield the **next larger** representation.
- We thus perform a double scan from the right side of the array and--upon finding the first pair that is in sorted order--swap them.

> ALERT: A regular two-number swap would move two digits in a number. One of those moves would break only one sorted order (as intended), the other is not guaranteed to behave in any predictable way. Thus a 'swap' here actually only moves one digit from the right side to the left side and pushes other digits one position to the right.
