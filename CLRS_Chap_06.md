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
