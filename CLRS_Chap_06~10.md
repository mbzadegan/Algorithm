# Chapter 6: Heapsort

This chapter introduces the **Heap** data structure, which combines the best attributes of the two sorting algorithms discussed previously: the optimal $O(n \lg n)$ running time of merge sort and the spatial efficiency (sorting in place) of insertion sort.

## 6.1 Heaps

* **Definition:** A heap is a nearly complete binary tree. It is usually implemented as an array object where each node corresponds to an array element.
* **Array Representation:** The root is at index 1. For any node at index $i$:
    * `PARENT(i)`: returns $\lfloor i/2 \rfloor$
    * `LEFT(i)`: returns $2i$
    * `RIGHT(i)`: returns $2i + 1$
* **Heap Properties:**
    * **Max-Heap Property:** $A[\text{PARENT}(i)] \ge A[i]$. The largest element is at the root. Used for the Heapsort algorithm.
    * **Min-Heap Property:** $A[\text{PARENT}(i)] \le A[i]$. The smallest element is at the root. Used for priority queues.
* **Height:** The height of an $n$-element heap is $\Theta(\lg n)$.

## 6.2 Maintaining the Heap Property

* **MAX-HEAPIFY Procedure:**
    * **Goal:** Maintains the max-heap property. It assumes the binary trees rooted at `LEFT(i)` and `RIGHT(i)` are max-heaps, but $A[i]$ might be smaller than its children.
    * **Logic:** It lets the value at $A[i]$ "float down" in the max-heap so the subtree rooted at index $i$ obeys the max-heap property.
    * **Time Complexity:** $O(\lg n)$, or more precisely $O(h)$ where $h$ is the height of the node.

## 6.3 Building a Heap

* **BUILD-MAX-HEAP Procedure:**
    * **Logic:** Converts an array $A[1..n]$ into a max-heap. It calls `MAX-HEAPIFY` on all non-leaf nodes, iterating from index $\lfloor n/2 \rfloor$ down to 1.
    * **Time Complexity:** While a simple bound is $O(n \lg n)$, a tighter analysis shows that the running time is **linear**, or **$O(n)$**.

## 6.4 The Heapsort Algorithm

* **Algorithm Steps:**
    1.  Call `BUILD-MAX-HEAP` to build a max-heap on the input array.
    2.  Swap the root (maximum element) with the last element in the heap.
    3.  Discard the last node from the heap (decrement heap size).
    4.  Call `MAX-HEAPIFY` on the new root.
    5.  Repeat until the heap size is 1.
* **Performance:** Heapsort runs in **$O(n \lg n)$** time and sorts **in place** (only a constant number of array elements are stored outside the input array).

## 6.5 Priority Queues

A priority queue is a data structure for maintaining a set of elements, each with an associated value called a *key*.
* **Max-Priority Queue Operations:**
    * `INSERT(S, x)`: Inserts element $x$ into set $S$.
    * `MAXIMUM(S)`: Returns the element with the largest key.
    * `EXTRACT-MAX(S)`: Removes and returns the element with the largest key.
    * `INCREASE-KEY(S, x, k)`: Increases the value of element $x$'s key to the new value $k$.
* **Implementation:** Using a max-heap, all operations run in **$O(\lg n)$** time.

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

# Chapter 8: Sorting in Linear Time

    This chapter explores sorting algorithms that run in time faster than $O(n \lg n)$ by making assumptions about the input data, thereby bypassing the lower bound that applies to comparison sorts.

## 8.1 Lower Bounds for Sorting

    * **Comparison Sorts:** Algorithms like merge sort and heapsort determine the sorted order solely by comparing input elements.
    * **Decision-Tree Model:**
        * Any comparison sort can be viewed abstractly as a decision tree where each internal node represents a comparison ($a_i \le a_j$) and each leaf represents a permutation of the input.
        * Because a correct sorting algorithm must be able to produce any of the $n!$ possible permutations, the decision tree must have at least $n!$ leaves.

    * **The Lower Bound:**
        * A binary tree with height $h$ has at most $2^h$ leaves.
        * Thus, $n! \le 2^h$, which implies $h \ge \lg(n!) = \Omega(n \lg n)$.
        * **Theorem:** Any comparison sort requires $\Omega(n \lg n)$ comparisons in the worst case. This means merge sort and heapsort are asymptotically optimal comparison sorts.

## 8.2 Counting Sort

    * **Assumption:** The input consists of $n$ integers in the range $0$ to $k$.
    * **Method:**
        1.  Create an array $C[0..k]$ to store the count of each element.
        2.  Count the frequency of each input element $x$ and store it in $C[x]$.
        3.  Modify $C$ such that $C[i]$ contains the number of elements less than or equal to $i$.
        4.  Place each element into its correct sorted position in output array $B$ using the cumulative counts in $C$.
    * **Running Time:** $\Theta(n + k)$.
    * **Properties:** It is a **stable** sort (elements with the same value appear in the output in the same order as in the input). It is often used as a subroutine for radix sort.

## 8.3 Radix Sort

    * **History:** Used by card-sorting machines (Hollerith cards).
    * **Assumption:** Sorts $n$ integers where each integer has $d$ digits.
    * **Method:**
        * Sort the numbers on their least significant digit first.
        * Then sort on the next least significant digit, and so on, up to the most significant digit.
        * Crucially, the sort used for each digit must be **stable** (like counting sort).
    * **Running Time:** $\Theta(d(n+k))$ if using counting sort on each digit, where $k$ is the range of a single digit.
    * **Efficiency:** If $b$-bit numbers are broken into $r$-bit chunks (digits), radix sort runs in $\Theta((b/r)(n + 2^r))$. With optimal $r \approx \lg n$, this can be $\Theta(n)$.

## 8.4 Bucket Sort

    * **Assumption:** The input is drawn from a uniform distribution over the interval $[0, 1)$.
    * **Method:**
        1.  Divide the interval $[0, 1)$ into $n$ equal-sized sub-intervals, or **buckets**.
        2.  Distribute the $n$ input numbers into the buckets.
        3.  Sort the numbers in each bucket (typically using insertion sort).
        4.  Concatenate the sorted lists from the buckets to produce the output.
    * **Analysis:**
        * Since inputs are uniform, the expected number of elements in each bucket is small ($O(1)$).
        * The expected running time is **$\Theta(n)$**.
        * Even if the input isn't uniform, bucket sort runs in linear time as long as the sum of the squares of the bucket sizes is linear in the total number of elements.

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

# Chapter 10: Elementary Data Structures

            This chapter presents fundamental data structures used to represent dynamic sets, detailing their implementation using arrays, pointers, and objects.

## 10.1 Simple Array-Based Data Structures

            * **Arrays:**
                * Basic tool for storing data contiguously in memory.
                * **Matrices:** Can be represented using **row-major order** (contiguous rows) or **column-major order** (contiguous columns).
            * **Stacks (LIFO):**
                * **Policy:** Last-In, First-Out. The element deleted is the one most recently inserted.
                * **Operations:**
                    * `PUSH(S, x)`: Adds element $x$ to the top.
                    * `POP(S)`: Removes and returns the top element.
                    * `STACK-EMPTY(S)`: Checks if the stack is empty.
                * **Implementation:** Using an array $S[1..n]$ and an attribute $S.top$. All operations run in **$O(1)$** time.
            * **Queues (FIFO):**
                * **Policy:** First-In, First-Out. The element deleted is the one waiting the longest.
                * **Operations:**
                    * `ENQUEUE(Q, x)`: Adds element $x$ to the tail.
                    * `DEQUEUE(Q)`: Removes and returns the element at the head.
                * **Implementation:** Using an array $Q[1..n]$ treated as circular (wrapping around), with attributes $Q.head$ and $Q.tail$. All operations run in **$O(1)$** time.

## 10.2 Linked Lists

            * **Definition:** A data structure where objects are arranged in a linear order, determined by a pointer in each object.
            * **Types:**
                * **Doubly Linked List:** Each object has a `key`, `next` pointer, and `prev` pointer.
                * **Singly Linked List:** Each object has only a `key` and `next` pointer.
                * **Circular List:** The `prev` pointer of the head points to the tail, and the `next` pointer of the tail points to the head.
            * **Operations:**
                * `LIST-SEARCH(L, k)`: Finds the first element with key $k$ by linear scan. Time: $\Theta(n)$.
                * `LIST-INSERT(L, x)`: Splices $x$ onto the front of the list. Time: $O(1)$.
                * `LIST-DELETE(L, x)`: Removes element $x$ from the list by updating pointers. Time: $O(1)$ (assuming we are given a pointer to $x$).
            * **Sentinels:** A dummy object (nil) placed at the head (and/or tail) to simplify boundary conditions and code, essentially turning a linear list into a circular one.

## 10.3 Representing Rooted Trees

            * **Binary Trees:**
                * Represented by objects with `key`, `p` (parent), `left`, and `right` attributes.
                * If a child is missing, the corresponding attribute contains NIL.
            * **Trees with Unbounded Branching:**
                * If the number of children can be large and variable, using a fixed number of fields is inefficient.
                * **Left-Child, Right-Sibling Representation:** Each node has only two pointers:
                    1.  `left-child`: Points to the leftmost child.
                    2.  `right-sibling`: Points to the sibling immediately to the right.
                * This allows a tree of arbitrary degree to be represented using only $O(n)$ space.
