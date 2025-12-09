# Chapter 4: Divide-and-Conquer

[cite_start]This chapter explores the **divide-and-conquer** method for algorithm design and provides mathematical tools for analyzing the **recurrences** that characterize their running times[cite: 2113].

## 4.1 Multiplying Square Matrices

* **The Problem:** Multiply two $n \times n$ matrices $A$ and $B$ to produce $C = A \cdot B$. [cite_start]The standard algorithm performs $\Theta(n^3)$ scalar multiplications[cite: 2125].
* **Simple Divide-and-Conquer:**
    * Partitions an $n \times n$ matrix into four $n/2 \times n/2$ submatrices.
    * [cite_start]Computes the product using 8 recursive multiplications of size $n/2$ and 4 matrix additions[cite: 2125].
    * **Recurrence:** $T(n) = 8T(n/2) + \Theta(n^2)$.
    * **Solution:** $T(n) = \Theta(n^3)$. [cite_start]This simple recursive approach does not improve upon the standard algorithm[cite: 2127].

## 4.2 Strassen’s Algorithm

* [cite_start]**Key Insight:** Strassen discovered a way to compute the matrix product using only **7** recursive multiplications instead of 8, at the cost of performing more matrix additions (18 additions/subtractions)[cite: 2129, 2130].
* **Method:**
    1.  Divide input matrices into submatrices of size $n/2$.
    2.  Create 10 matrices ($S_1, \dots, S_{10}$) using sums and differences of the submatrices.
    3.  Recursively compute 7 matrix products ($P_1, \dots, P_7$) using the $S$ matrices.
    4.  Compute the result submatrices $C_{11}, C_{12}, C_{21}, C_{22}$ by adding and subtracting various $P$ matrices.
* **Recurrence:** $T(n) = 7T(n/2) + \Theta(n^2)$.
* **Solution:** $T(n) = \Theta(n^{\lg 7}) \approx \Theta(n^{2.81})$. [cite_start]This is asymptotically faster than the standard $\Theta(n^3)$ algorithm[cite: 2129].

## 4.3 The Substitution Method

[cite_start]This method is used to solve recurrences by guessing the form of the bound and using mathematical induction to prove it correct[cite: 2131].
* **Steps:**
    1.  **Guess** the form of the solution (e.g., guess $T(n) = O(n \lg n)$).
    2.  **Verify** by induction that the guess holds for the recurrence (find constants $c$ and $n_0$).
    3.  **Solve** for boundary conditions (base cases).
* [cite_start]**Pitfalls:** Often requires a stronger inductive hypothesis (e.g., subtracting a lower-order term like $cn - b$) to make the math work[cite: 2133].

## 4.4 The Recursion-Tree Method

[cite_start]This method visualizes the recurrence as a tree to help generate a good guess for the substitution method[cite: 2134].
* **Structure:** Each node represents the cost of a single subproblem.
* **Process:**
    1.  Expand the recurrence into a tree.
    2.  Sum the costs across each level of the tree.
    3.  [cite_start]Sum the costs of all levels to determine the total cost[cite: 2135].
* **Example:** For $T(n) = 3T(n/4) + cn^2$, the cost at the root is $cn^2$, the cost at level 1 is $3c(n/4)^2$, and so on. [cite_start]The series is summed to find the total running time[cite: 2135].

## 4.5 The Master Method

[cite_start]The Master Method provides a "cookbook" for solving recurrences of the form $T(n) = aT(n/b) + f(n)$, where $a \ge 1$ and $b > 1$ are constants[cite: 2138]. It compares the driving function $f(n)$ with the watershed function $n^{\log_b a}$.

* [cite_start]**Case 1:** If $f(n) = O(n^{\log_b a - \epsilon})$ for some $\epsilon > 0$ (the watershed grows polynomially faster), then **$T(n) = \Theta(n^{\log_b a})$**[cite: 2139].
* **Case 2:** If $f(n) = \Theta(n^{\log_b a})$ (growth rates are equal), then **$T(n) = \Theta(n^{\log_b a} \lg n)$**.
    * [cite_start]*Extended Case 2:* If $f(n) = \Theta(n^{\log_b a} \lg^k n)$ for $k \ge 0$, then $T(n) = \Theta(n^{\log_b a} \lg^{k+1} n)$[cite: 2139].
* [cite_start]**Case 3:** If $f(n) = \Omega(n^{\log_b a + \epsilon})$ for some $\epsilon > 0$ (driving function grows polynomially faster) *and* $f(n)$ satisfies the regularity condition ($af(n/b) \le cf(n)$ for $c < 1$), then **$T(n) = \Theta(f(n))$**[cite: 2139].

## Advanced Topics
* [cite_start]**Akra-Bazzi Method:** A general method (Section 4.7) for solving divide-and-conquer recurrences where subproblems have different sizes (e.g., $T(n) = T(n/3) + T(2n/3) + \Theta(n)$)[cite: 2147].
