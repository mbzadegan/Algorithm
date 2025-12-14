# Chapter 14: Dynamic Programming

**Dynamic Programming (DP)** is a technique for solving optimization problems by breaking them into simpler subproblems. It typically applies to problems that exhibit **optimal substructure** and **overlapping subproblems**.

## 14.1 Rod Cutting

* **The Problem:** Given a rod of length $n$ and a table of prices $p_i$ for rods of length $i$, determine the maximum revenue $r_n$ obtainable by cutting up the rod and selling the pieces.
* **Naive Recursion:**
    * $r_n = \max_{1 \le i \le n} (p_i + r_{n-i})$.
    * This approach is inefficient ($O(2^n)$) because it solves the same subproblems repeatedly.
* **DP Solution:**
    * **Memoization (Top-Down):** Write the recursive procedure but store the result of each subproblem in a table. Check the table before computing.
    * **Bottom-Up:** Sort the subproblems by size and solve them in order (from smallest to largest), storing results in a table.
    * **Time Complexity:** Both DP approaches run in **$\Theta(n^2)$**.

## 14.2 Matrix-Chain Multiplication

* **The Problem:** Given a chain of matrices $\langle A_1, A_2, \dots, A_n \rangle$, fully parenthesize the product $A_1 A_2 \dots A_n$ in a way that minimizes the total number of scalar multiplications.
* **Key Insight:** The cost depends heavily on the parenthesization order because matrix multiplication is associative but not commutative.
* **Optimal Substructure:** An optimal parenthesization of $A_i \dots A_j$ splits the product between $A_k$ and $A_{k+1}$ for some $k$. The cost is the cost of computing $A_i \dots A_k$, plus the cost of $A_{k+1} \dots A_j$, plus the cost of multiplying the two resulting matrices.
* **DP Approach:**
    * Let $m[i, j]$ be the minimum number of scalar multiplications needed to compute $A_{i \dots j}$.
    * $m[i, j] = \min_{i \le k < j} \{ m[i, k] + m[k+1, j] + p_{i-1}p_kp_j \}$.
    * **Time Complexity:** **$\Theta(n^3)$**.

## 14.3 Elements of Dynamic Programming

* **Optimal Substructure:** An optimal solution to the problem contains within it optimal solutions to subproblems.
* **Overlapping Subproblems:** The recursive algorithm visits the same subproblems repeatedly (unlike divide-and-conquer, where subproblems are usually distinct). DP exploits this by solving each subproblem once.
* **Reconstruction:** To find the actual solution (e.g., the cuts or the parentheses), we store the choices made (like the index $k$) in a separate table alongside the optimal values.

## 14.4 Longest Common Subsequence (LCS)

* **The Problem:** Given two sequences $X = \langle x_1, \dots, x_m \rangle$ and $Y = \langle y_1, \dots, y_n \rangle$, find a maximum-length common subsequence.
* **Recurrence:** Let $c[i, j]$ be the length of the LCS of prefixes $X_i$ and $Y_j$.
    * If $x_i = y_j$, then $c[i, j] = c[i-1, j-1] + 1$.
    * If $x_i \neq y_j$, then $c[i, j] = \max(c[i-1, j], c[i, j-1])$.
* **Time Complexity:** **$\Theta(mn)$**.

## 14.5 Optimal Binary Search Trees

* **The Problem:** Given a set of keys with associated probabilities of being searched, construct a binary search tree that minimizes the expected search cost.
* **Structure:** The optimal tree typically places keys with higher probabilities closer to the root.
* **DP Formulation:** Let $e[i, j]$ be the expected cost of searching an optimal BST containing keys $k_i \dots k_j$.
    * We try all possible roots $k_r$ (where $i \le r \le j$) for the subtree.
    * $e[i, j] = \min_{i \le r \le j} \{ e[i, r-1] + e[r+1, j] + w(i, j) \}$, where $w(i, j)$ is the sum of probabilities for the range.
* **Time Complexity:** **$\Theta(n^3)$**.
