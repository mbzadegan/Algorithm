# CLRS Chapter 16 — Greedy Algorithms (Concise Summary)

## 1. What Is a Greedy Algorithm?
A **greedy algorithm** builds a solution step by step by **always making the locally optimal choice**, hoping it leads to a globally optimal solution.

Key idea:
> Make the best choice *now*, without reconsidering later.

---

## 2. When Do Greedy Algorithms Work?
Greedy algorithms are correct when a problem has:

### 2.1 Greedy-Choice Property
A globally optimal solution can be reached by making a locally optimal choice first.

### 2.2 Optimal Substructure
An optimal solution contains optimal solutions to subproblems.

⚠️ Unlike DP, greedy algorithms **do not explore all subproblems**.

---

## 3. Greedy vs Dynamic Programming

| Greedy | Dynamic Programming |
|------|--------------------|
| Makes local choices | Explores all subproblems |
| Usually faster | Often more expensive |
| No backtracking | Full state exploration |
| Harder to prove correctness | Easier to justify |

---

## 4. How to Design a Greedy Algorithm
CLRS suggests:
1. Show the problem has optimal substructure
2. Prove the greedy-choice property
3. Develop an algorithm
4. Prove correctness (often via exchange argument)

---

## 5. Classic Examples in Chapter 16

### 5.1 Activity-Selection Problem
- Select maximum number of non-overlapping activities.
- Greedy choice: choose activity with **earliest finishing time**.
- Time complexity: **O(n log n)** (or **O(n)** if sorted).

---

### 5.2 Huffman Coding
- Optimal prefix-free encoding.
- Greedy choice: merge two least frequent symbols.
- Uses a min-priority queue.
- Time complexity: **O(n log n)**.

---

### 5.3 Fractional Knapsack
- Items can be divided.
- Greedy choice: highest value/weight ratio.
- Time complexity: **O(n log n)**.
- ⚠️ Does NOT work for 0/1 knapsack.

---

### 5.4 Minimum Spanning Trees (Preview)
- Kruskal’s and Prim’s algorithms.
- Greedy edge selection.
- Proven using cut property.

---

## 6. Proof Techniques
Greedy algorithms require **strong correctness proofs**:
- **Exchange argument** (swap local choice with optimal)
- **Cut property**
- **Matroid theory** (advanced)

---

## 7. Limitations of Greedy Algorithms
- Not always optimal
- Small mistake → wrong solution
- Must prove correctness explicitly

Example:
- Coin change fails for arbitrary denominations
- 0/1 Knapsack fails greedily

---

## 8. When to Use Greedy Algorithms
Use greedy when:
- Fast solution is needed
- Problem structure guarantees correctness
- Proof exists

Avoid greedy when:
- Choices interact globally
- Counterexamples exist

---

## 9. Takeaway
Greedy algorithms are **simple, fast, and elegant**, but correctness depends entirely on problem structure.

> **“Greedy algorithms work because the future doesn’t regret the present.”**

---

## 10. Exam / Interview Tips
- Always justify the greedy choice
- Give a counterexample if greedy fails
- Compare with DP solutions
- Know Huffman and Activity Selection deeply

---

**End of Chapter 16 Summary**
