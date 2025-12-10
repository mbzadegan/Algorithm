# Chapter 7: Quicksort

This chapter describes **Quicksort**, a highly efficient sorting algorithm often used in practice. Although its worst-case running time is $\Theta(n^2)$, its expected running time is $\Theta(n \lg n)$, and it sorts in place with small constant factors.

## 7.1 Description of Quicksort

* **Divide-and-Conquer Strategy:**
    1.  **Divide:** Partition the array $A[p..r]$ into two (possibly empty) subarrays $A[p..q-1]$ and $A[q+1..r]$ such that each element in the left subarray is less than or equal to $A[q]$, and each element in the right subarray is greater than or equal to $A[q]$. The index $q$ is computed as part of this step.
    2.  **Conquer:** Sort the two subarrays recursively by calling quicksort.
    3.  **Combine:** Because the subarrays are already sorted in place, no work is needed to combine them.
* **Partitioning:** The key operation is the `PARTITION` procedure, which rearranges the subarray in place.
    * It selects an element $x = A[r]$ as the **pivot**.
    * It scans the subarray from left to right, maintaining four regions: values $\le x$, values $> x$, "unknown" values, and the pivot itself. 
    * Upon termination, the pivot is placed in its correct sorted position.
    * Running time is $\Theta(n)$ for a subarray of size $n$.

## 7.2 Performance of Quicksort

The running time depends on whether the partitioning is balanced.
* **Worst-Case Partitioning:**
    * Occurs when the partition routine produces one subproblem with $n-1$ elements and one with 0 elements (e.g., when the input is already sorted).
    * Recurrence: $T(n) = T(n-1) + \Theta(n)$.
    * Solution: **$\Theta(n^2)$**.
* **Best-Case Partitioning:**
    * Occurs when `PARTITION` produces two subproblems of size roughly $n/2$.
    * Recurrence: $T(n) = 2T(n/2) + \Theta(n)$.
    * Solution: **$\Theta(n \lg n)$**.
* **Balanced Partitioning:** Even a 9-to-1 split yields a recursion tree depth of $\Theta(\lg n)$, resulting in $O(n \lg n)$ time. Thus, the average case is much closer to the best case than the worst case.

## 7.3 A Randomized Version of Quicksort

To prevent the worst-case scenario (e.g., on sorted input), we introduce randomness.
* **Random Sampling:** Instead of always using $A[r]$ as the pivot, we randomly select an element from the subarray $A[p..r]$ and swap it with $A[r]$.
* **Benefit:** This ensures that the pivot is equally likely to be any of the $r-p+1$ elements. The behavior is determined by the random-number generator, not the input order.
* **Expected Running Time:** With random pivots, the expected running time is **$O(n \lg n)$**.

## 7.4 Analysis of Quicksort

* **Worst-Case Analysis:** Can be proved formally to be $O(n^2)$.
* **Expected Running Time:**
    * Let $X$ be the number of comparisons performed in line 4 of `PARTITION` over the entire execution.
    * The total running time is $O(n + X)$.
    * Using indicator random variables, the probability that two elements $z_i$ and $z_j$ are compared is $2/(j-i+1)$.
    * Summing these probabilities shows that the expected number of comparisons is $O(n \lg n)$.
