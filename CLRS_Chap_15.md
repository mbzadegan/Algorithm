# CLRS Chapter 15 — Dynamic Programming (Concise Summary)

## 1. What Is Dynamic Programming?
Dynamic Programming (DP) is an algorithmic technique for solving problems that have:
- **Optimal substructure**: an optimal solution can be built from optimal solutions of subproblems.
- **Overlapping subproblems**: the same subproblems are solved repeatedly.

DP solves each subproblem **once**, stores the result, and reuses it.

---

## 2. Steps to Design a Dynamic Programming Algorithm
CLRS outlines a standard methodology:

1. **Characterize the structure of an optimal solution**
2. **Define the value of an optimal solution recursively**
3. **Compute the value of an optimal solution**  
   - Bottom-up (tabulation)  
   - Top-down (memoization)
4. **Construct an optimal solution** from computed values

---

## 3. Memoization vs Bottom-Up DP

| Method | Description | Notes |
|------|------------|-------|
| Memoization | Recursive with caching | Simple, may incur recursion overhead |
| Bottom-up | Iterative table filling | More efficient, preferred in practice |

---

## 4. Key Examples in Chapter 15

### 4.1 Rod Cutting
- Maximize revenue by cutting a rod into pieces.
- Demonstrates exponential vs polynomial improvement.
- Time complexity reduced from **O(2ⁿ)** to **O(n²)**.

---

### 4.2 Matrix-Chain Multiplication
- Finds optimal parenthesization of matrix products.
- Classic DP problem.
- Time complexity: **O(n³)**.

---

### 4.3 Longest Common Subsequence (LCS)
- Finds longest subsequence common to two sequences.
- Time complexity: **O(mn)**.
- Demonstrates reconstructing the solution.

---

### 4.4 Optimal Binary Search Trees
- Minimizes expected search cost.
- Uses probabilities of successful and unsuccessful searches.
- Time complexity: **O(n³)**.

---

## 5. DP vs Divide-and-Conquer

| Divide & Conquer | Dynamic Programming |
|------------------|--------------------|
| Independent subproblems | Overlapping subproblems |
| Recomputes subproblems | Stores and reuses |
| Often exponential | Often polynomial |

---

## 6. When to Use Dynamic Programming
Use DP when:
- A recursive formulation exists.
- Subproblems overlap.
- Optimal substructure is provable.

Avoid DP if subproblems are independent or state space is too large.

---

## 7. Common Pitfalls
- Incorrect state definition
- Missing base cases
- Excessive memory usage
- Forgetting to reconstruct solution

---

## 8. Time–Space Tradeoffs
- DP can trade memory for speed.
- Space optimization is often possible (e.g., Fibonacci, LCS).

---

## 9. Takeaway
Dynamic Programming transforms exponential-time recursive algorithms into efficient polynomial-time solutions by exploiting structure and reuse.

> **“DP is recursion + memory.”**

---

## 10. Exam / Interview Tips
- Clearly define DP state and transition.
- Justify optimal substructure.
- Analyze time and space complexity.
- Know classic examples by heart.

---

**End of Chapter 15 Summary**