# Chapter 13: Red-Black Trees

This chapter introduces **Red-Black Trees**, a type of self-balancing binary search tree that guarantees $O(\lg n)$ worst-case performance for all major dynamic set operations (`INSERT`, `DELETE`, `SEARCH`).

## 13.1 Properties of Red-Black Trees

A red-black tree is a binary search tree in which every node is either red or black, satisfying the following five properties:

1.  **Root Property:** The root is black.
2.  **External Property (Leaves):** Every leaf (NIL) is black.
3.  **Red Property (Red Constraint):** If a node is red, then both its children are black.
4.  **Black-Height Property:** For each node, all simple paths from the node to descendant leaves contain the same number of black nodes.
5.  **BST Property:** It is a binary search tree.

* **Sentinel:** A single sentinel node (`T.nil`), which is always black, is used to represent all NILs (leaves and the root's parent) to simplify boundary conditions. 
* **Black-Height ($\text{bh}(x)$):** The number of black nodes on any simple path from node $x$ (not including $x$) down to a leaf.
* **Height Bound:** A red-black tree with $n$ internal nodes has a height $h$ of at most $2 \lg(n+1)$. This logarithmic height guarantee is what ensures the $O(\lg n)$ worst-case time for all operations.

## 13.2 Rotations

Rotations are local operations that preserve the BST property while changing the depth of certain nodes. They are the fundamental building blocks for balancing a red-black tree during insertion and deletion.

* **Types:** There are two types of rotation:
    * **LEFT-ROTATE:** Moves a node down and to the left, making its right child its new parent.
    * **RIGHT-ROTATE:** Moves a node down and to the right, making its left child its new parent.
* **Time Complexity:** Both operations take **$O(1)$** time.

## 13.3 Insertion

The process of inserting a node $z$ into a red-black tree:

1.  **Standard BST Insertion:** Insert $z$ into the tree as a red node, using the same `TREE-INSERT` procedure as a standard BST.
2.  **Color Violation:** This may violate the red-black properties (specifically, the Red Property, if $z$'s parent is also red).
3.  **Fixup (`RB-INSERT-FIXUP`):**
    * Uses rotations and color changes to restore the red-black properties.
    * It is structured in three cases based on the color of $z$'s uncle (the sibling of $z$'s parent).
* **Time Complexity:** The fixup loop runs for $O(\lg n)$ iterations in the worst case, but each step involves only $O(1)$ work (a few rotations and color changes). Therefore, insertion takes **$O(\lg n)$** worst-case time.

## 13.4 Deletion

The process of deleting a node $z$ from a red-black tree:

1.  **Standard BST Deletion:** Perform the deletion using the same logic as a standard BST (`TREE-DELETE`).
2.  **Double Black/Color Violation:** If the node removed or moved was black, it may cause a violation, specifically creating a "double black" effect on the node $x$ that moved into the deleted node's position.
3.  **Fixup (`RB-DELETE-FIXUP`):**
    * Uses rotations and color changes to propagate the "extra black" up the tree until the violation is fixed or reaches the root.
* **Time Complexity:** Deletion, including the fixup procedure, also takes **$O(\lg n)$** worst-case time.

## Summary of Performance

Red-black trees guarantee logarithmic worst-case time for all dictionary operations, making them highly effective for dynamic storage:

| Operation | Worst-Case Time |
| :--- | :--- |
| `SEARCH` | $O(\lg n)$ |
| `MINIMUM` / `MAXIMUM` | $O(\lg n)$ |
| `SUCCESSOR` / `PREDECESSOR` | $O(\lg n)$ |
| `INSERT` | $O(\lg n)$ |
| `DELETE` | $O(\lg n)$ |
