# CLRS Chapter 18 — B-Trees (Concise Summary)

## 1. What Is a B-Tree?
A **B-tree** is a **balanced multi-way search tree** optimized for systems that read/write large blocks of data (e.g., disks, SSDs).

Key goal:
> Minimize disk I/O operations.

---

## 2. Motivation
- Disk access is expensive
- Binary search trees are too tall
- B-trees keep tree height very small

Height:
\[
O(\log_t n)
\]
where `t` is the minimum degree.

---

## 3. B-Tree Properties
A B-tree of minimum degree `t ≥ 2` satisfies:

1. Every node has at most `2t − 1` keys
2. Every internal node (except root) has at least `t − 1` keys
3. Every internal node has `t` to `2t` children
4. Keys in a node are stored in sorted order
5. All leaves appear at the same depth

---

## 4. Structure of a B-Tree Node
Each node contains:
- Keys: `k₁ < k₂ < ... < k_m`
- Children pointers
- Boolean leaf flag

---

## 5. Searching in a B-Tree
- Similar to binary search
- Search within a node
- Descend to appropriate child

Time complexity:
- **O(log n)** disk accesses

---

## 6. Insertion
Steps:
1. Always insert into a leaf
2. If node overflows (`2t` keys), **split**
3. Promote middle key to parent
4. Repeat up the tree if necessary

Guarantee:
- Tree remains balanced

---

## 7. Deletion
More complex than insertion:
- Ensure nodes never drop below `t − 1` keys
- Borrow from siblings or merge nodes
- May shrink tree height

---

## 8. Why B-Trees Are Efficient
- High branching factor
- Shallow height
- Fewer disk reads

Used in:
- Databases
- File systems
- Key-value stores

---

## 9. B-Tree vs Binary Search Tree

| B-Tree | BST |
|------|----|
| Wide, shallow | Tall |
| Disk-friendly | Memory-friendly |
| Fewer I/O ops | Many I/O ops |

---

## 10. Correctness Invariants
- Node size constraints maintained
- Sorted order preserved
- Equal leaf depth

---

## 11. Takeaway
B-trees are the **standard indexing structure** for external memory systems.

> **“B-trees trade width for height to win on disk.”**

---

## 12. Exam / Interview Tips
- Understand split and merge
- Know min/max keys per node
- Explain why height is small
- Contrast with B+ trees

---

**End of Chapter 18 Summary**
