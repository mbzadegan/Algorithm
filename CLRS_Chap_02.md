# Chapter 2: Getting Started

## 2.1 Insertion Sort

* [cite_start]**The Sorting Problem:** The goal is to take a sequence of $n$ numbers (keys) as input and output a permutation of the sequence such that $a'_1 \le a'_2 \le \dots \le a'_n$.
* **Algorithm Logic:** Insertion sort works like sorting a hand of playing cards. It iterates through the input array, maintaining a sorted subarray to the left. [cite_start]For each new element (the "key"), it compares it with elements in the sorted subarray and shifts them to the right until the correct position for the key is found.
* **Pseudocode:** The algorithm uses nested loops. [cite_start]The outer loop selects the key, and the inner `while` loop shifts elements to make space[cite: 1699].
* [cite_start]**Loop Invariant:** To prove correctness, a **loop invariant** is used, which must satisfy three properties:
    1.  **Initialization:** It is true before the first iteration.
    2.  **Maintenance:** If true before an iteration, it remains true before the next.
    3.  **Termination:** Upon termination, the invariant provides a property that helps show correctness.
    * [cite_start]For insertion sort, the invariant is that the subarray $A[1..i-1]$ consists of the elements originally in those positions, but in sorted order[cite: 1702].

## 2.2 Analyzing Algorithms

* [cite_start]**RAM Model:** Algorithms are analyzed assuming a generic one-processor, random-access machine (RAM) model where instructions execute sequentially and take constant time.
* [cite_start]**Input Size & Running Time:** Running time is described as a function of the input size $n$ (e.g., number of items to sort)[cite: 1743, 1745].
* **Analysis of Insertion Sort:**
    * **Best Case:** Occurs when the array is already sorted. [cite_start]The running time is linear, expressed as $an+b$ or $\Theta(n)$[cite: 1758].
    * **Worst Case:** Occurs when the array is reverse sorted. [cite_start]The running time is quadratic, expressed as $an^2+bn+c$ or $\Theta(n^2)$[cite: 1762].
    * [cite_start]**Average Case:** Often roughly as bad as the worst case, also $\Theta(n^2)$[cite: 1766].
* **Order of Growth:** Analysis focuses on the rate of growth (leading term), ignoring constant factors and lower-order terms. [cite_start]$\Theta$-notation is used to describe asymptotic behavior (e.g., $\Theta(n^2)$)[cite: 1767, 1769].

## 2.3 Designing Algorithms

* **Divide-and-Conquer:** An alternative design approach to the incremental method used in insertion sort. [cite_start]It involves three steps:
    1.  **Divide:** Break the problem into smaller subproblems.
    2.  **Conquer:** Solve subproblems recursively (base case is solved directly).
    3.  [cite_start]**Combine:** Merge the subproblem solutions into the final solution[cite: 1776].
* **Merge Sort:** A sorting algorithm using this paradigm:
    * [cite_start]**Divide:** Split the $n$-element sequence into two subsequences of $n/2$ elements.
    * [cite_start]**Conquer:** Sort the two subsequences recursively using merge sort[cite: 1778].
    * [cite_start]**Combine:** Merge the two sorted subsequences using the `MERGE` procedure, which takes $\Theta(n)$ time.
* **Analysis of Merge Sort:**
    * [cite_start]The running time is described by a recurrence equation: $T(n) = 2T(n/2) + \Theta(n)$ (for $n > 1$)[cite: 1881].
    * [cite_start]Using a recursion tree analysis, the total cost is shown to be $\Theta(n \lg n)$[cite: 1882, 1897].
    * [cite_start]Merge sort ($\Theta(n \lg n)$) outperforms insertion sort ($\Theta(n^2)$) for large inputs because the logarithmic factor grows much slower than the linear factor[cite: 1882].
```Based on Chapter 2 of *Introduction to Algorithms* (CLRS), here is the concise summary formatted as a Markdown file:

```markdown
# Chapter 2: Getting Started

## 2.1 Insertion Sort

* [cite_start]**The Sorting Problem:** The goal is to take a sequence of $n$ numbers (keys) as input and output a permutation of the sequence such that $a'_1 \le a'_2 \le \dots \le a'_n$.
* **Algorithm Logic:** Insertion sort works like sorting a hand of playing cards. It iterates through the input array, maintaining a sorted subarray to the left. [cite_start]For each new element (the "key"), it compares it with elements in the sorted subarray and shifts them to the right until the correct position for the key is found.
* **Pseudocode:** The algorithm uses nested loops. [cite_start]The outer loop selects the key, and the inner `while` loop shifts elements to make space[cite: 1699].
* [cite_start]**Loop Invariant:** To prove correctness, a **loop invariant** is used, which must satisfy three properties[cite: 1711]:
    1.  **Initialization:** It is true before the first iteration.
    2.  **Maintenance:** If true before an iteration, it remains true before the next.
    3.  **Termination:** Upon termination, the invariant provides a property that helps show correctness.
    * [cite_start]For insertion sort, the invariant is that the subarray $A[1..i-1]$ consists of the elements originally in those positions, but in sorted order[cite: 1702].

## 2.2 Analyzing Algorithms

* [cite_start]**RAM Model:** Algorithms are analyzed assuming a generic one-processor, random-access machine (RAM) model where instructions execute sequentially and take constant time.
* [cite_start]**Input Size & Running Time:** Running time is described as a function of the input size $n$ (e.g., number of items to sort)[cite: 1743, 1745].
* **Analysis of Insertion Sort:**
    * **Best Case:** Occurs when the array is already sorted. [cite_start]The running time is linear, expressed as $an+b$ or $\Theta(n)$[cite: 1758].
    * **Worst Case:** Occurs when the array is reverse sorted. [cite_start]The running time is quadratic, expressed as $an^2+bn+c$ or $\Theta(n^2)$[cite: 1762].
    * [cite_start]**Average Case:** Often roughly as bad as the worst case, also $\Theta(n^2)$[cite: 1766].
* **Order of Growth:** Analysis focuses on the rate of growth (leading term), ignoring constant factors and lower-order terms. [cite_start]$\Theta$-notation is used to describe asymptotic behavior (e.g., $\Theta(n^2)$)[cite: 1767, 1769].

## 2.3 Designing Algorithms

* **Divide-and-Conquer:** An alternative design approach to the incremental method used in insertion sort. [cite_start]It involves three steps:
    1.  **Divide:** Break the problem into smaller subproblems.
    2.  **Conquer:** Solve subproblems recursively (base case is solved directly).
    3.  [cite_start]**Combine:** Merge the subproblem solutions into the final solution[cite: 1776].
* **Merge Sort:** A sorting algorithm using this paradigm:
    * [cite_start]**Divide:** Split the $n$-element sequence into two subsequences of $n/2$ elements.
    * [cite_start]**Conquer:** Sort the two subsequences recursively using merge sort[cite: 1778].
    * [cite_start]**Combine:** Merge the two sorted subsequences using the `MERGE` procedure, which takes $\Theta(n)$ time.
* **Analysis of Merge Sort:**
    * [cite_start]The running time is described by a recurrence equation: $T(n) = 2T(n/2) + \Theta(n)$ (for $n > 1$)[cite: 1881].
    * [cite_start]Using a recursion tree analysis, the total cost is shown to be $\Theta(n \lg n)$[cite: 1882, 1897].
    * [cite_start]Merge sort ($\Theta(n \lg n)$) outperforms insertion sort ($\Theta(n^2)$) for large inputs because the logarithmic factor grows much slower than the linear factor[cite: 1882].
