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
