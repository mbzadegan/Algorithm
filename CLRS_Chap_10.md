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
