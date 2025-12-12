# Chapter 12: Binary Search Trees

This chapter introduces **binary search trees (BSTs)**, a data structure that supports dynamic set operations like `SEARCH`, `MINIMUM`, `MAXIMUM`, `PREDECESSOR`, `SUCCESSOR`, `INSERT`, and `DELETE`.

## 12.1 What is a Binary Search Tree?

* **Definition:** A binary tree where each node $x$ satisfies the **binary-search-tree property**:
    * If $y$ is in the **left** subtree of $x$, then $y.key \le x.key$.
    * If $y$ is in the **right** subtree of $x$, then $y.key \ge x.key$.
* **Representation:** Nodes contain fields `key`, `left`, `right`, and `p` (parent).
* **Inorder Tree Walk:**
    * Prints keys in sorted order by recursively printing the left subtree, then the root, then the right subtree. 
    * **Time:** $\Theta(n)$ for a tree with $n$ nodes.

## 12.2 Querying a Binary Search Tree

All query operations run in **$O(h)$** time, where $h$ is the height of the tree.
* **Searching (`TREE-SEARCH`):**
    * Recursively or iteratively compares $k$ with the current node's key.
    * If $k$ is smaller, go left; if larger, go right.
* **Minimum and Maximum:**
    * **Minimum:** Follow `left` pointers until a NIL is reached.
    * **Maximum:** Follow `right` pointers until a NIL is reached.
* **Successor (`TREE-SUCCESSOR`):**
    * The node with the smallest key greater than $x.key$.
    * **Case 1:** If the right subtree is nonempty, the successor is the minimum in the right subtree.
    * **Case 2:** If the right subtree is empty, go up the tree using `p` pointers until we encounter a node that is the *left* child of its parent.

## 12.3 Insertion and Deletion

These operations also run in **$O(h)$** time.
* **Insertion (`TREE-INSERT`):**
    * Traces a path downward from the root, similar to searching, to find the correct NIL position for the new key $z$.
    * Modifies the pointers to link $z$ into the tree.
* **Deletion (`TREE-DELETE`):**
    * **Case 1 (No children):** Simply remove the node.
    * **Case 2 (One child):** Splice the node out by linking its parent directly to its child.
    * **Case 3 (Two children):** Find the node's **successor** (which has no left child). Replace the node's content with the successor's content, and then delete the successor.

## 12.4 Randomly Built Binary Search Trees

* **Performance Issue:** In the worst case (e.g., inserting sorted data), the tree becomes a linear chain with height $h = n$, making operations $\Theta(n)$.
* **Average Case:**
    * If $n$ distinct keys are inserted in **random order**, the expected height of the tree is **$O(\lg n)$**.
    * Therefore, operations on a randomly built BST take **$O(\lg n)$** on average.
