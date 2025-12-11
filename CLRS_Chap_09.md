# Chapter 9: Medians and Order Statistics

This chapter addresses the problem of **selection**: finding the $i$-th smallest element in a set of $n$ distinct numbers (the $i$-th *order statistic*). Common examples include finding the minimum ($i=1$), maximum ($i=n$), and median ($i = \lceil (n+1)/2 \rceil$ or $i = \lfloor (n+1)/2 \rfloor$).

## 9.1 Minimum and Maximum

* **Minimum (or Maximum):** To find the minimum of $n$ elements, we must inspect every element.
    * **Upper Bound:** $n-1$ comparisons are sufficient.
    * **Lower Bound:** $n-1$ comparisons are necessary (as every element except the winner must lose at least one "match").
* **Simultaneous Minimum and Maximum:** Finding both the minimum and maximum can be done more efficiently than just running two independent passes ($2n-2$ comparisons).
    * **Method:** Process elements in pairs. Compare the pair's elements with each other, then compare the smaller to the current minimum and the larger to the current maximum.
    * **Cost:** Only $3 \lfloor n/2 \rfloor$ comparisons.

## 9.2 Selection in Expected Linear Time

* **Algorithm (RANDOMIZED-SELECT):** A divide-and-conquer algorithm modeled after Quicksort.
    * **Logic:**
        1.  Randomly partition the array around a pivot (like Quicksort).
        2.  Determine which side of the partition the $i$-th element lies in.
        3.  Recursively recurse **only** on that one side (unlike Quicksort, which recurses on both).
    * **Running Time:**
        * **Worst-Case:** $\Theta(n^2)$ (rare, occurs with unlucky pivots).
        * **Expected-Case:** **$\Theta(n)$**. Because it recurses on only one side, the problem size decreases geometrically on average.

## 9.3 Selection in Worst-Case Linear Time

* **Algorithm (SELECT):** A deterministic algorithm that guarantees linear running time even in the worst case.
    * **Method:**
        1.  **Divide:** Group the $n$ elements into $\lfloor n/5 \rfloor$ groups of 5 elements.
        2.  **Median of Medians:** Find the median of each group (by sorting the 5 elements). Then, recursively find the median of these group medians (call it $x$).
        3.  **Partition:** Use $x$ as the pivot to partition the input array.
        4.  **Recurse:** Recurse on the appropriate subarray to find the $i$-th element.
* **Performance:**
    * Using groups of 5 ensures the pivot $x$ is "good enough" (greater than at least 30% of elements and less than at least 30% of elements).
    * **Recurrence:** $T(n) \le T(\lceil n/5 \rceil) + T(7n/10 + 6) + O(n)$.
    * **Solution:** **$O(n)$**. While asymptotically linear, the constant factors are large, so `RANDOMIZED-SELECT` is often faster in practice.
