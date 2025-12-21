# Chapter 1: The Role of Algorithms in Computing

## 1.1 Algorithms

* **Definition:** An algorithm is a well-defined computational procedure that takes input values and produces output values, effectively describing specific steps to solve a computational problem.
* **Problem Specification:** Problems (like sorting) define a desired input/output relationship. An "instance" of a problem is specific input data (e.g., a specific sequence of numbers to sort).
* **Correctness:** An algorithm is correct if it halts with the correct output for every input instance. Incorrect algorithms may not halt or may produce wrong answers, though they can sometimes be useful (e.g., for finding primes) if the error rate is controlled.
* **Practical Applications:** Algorithms solve problems in diverse fields, such as sequencing human DNA, routing internet traffic, securing e-commerce via cryptography, and optimizing manufacturing resource allocation.
* **Hard Problems (NP-Complete):** There exists a class of interesting problems (like the Traveling Salesperson Problem) for which no efficient algorithm has been found. If an efficient algorithm exists for one, it exists for all of them. These often require approximation algorithms in practice.

## 1.2 Algorithms as a Technology

* **Efficiency as a Resource:** Computing time and memory are bounded resources; algorithms should be used efficiently.
* **Impact of Algorithmic Efficiency:** The choice of algorithm often matters more than hardware speed. For example, **Insertion Sort** takes time proportional to $n^2$, while **Merge Sort** takes time proportional to $n \lg n$. For large inputs ($n$), Merge Sort is significantly faster, even if Insertion Sort runs on a computer 1000 times faster.
* **Core Technology:** Algorithms are foundational to other modern technologies. Hardware, graphical user interfaces (GUIs), routing networks, and compilers all rely heavily on efficient algorithms to function.

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

# Chapter 3: Characterizing Running Times

This chapter focuses on **asymptotic efficiency**, studying how the running time of an algorithm increases with the size of the input in the limit (as the size increases without bound).

## 3.1 $O$-notation, $\Omega$-notation, and $\Theta$-notation

* **Asymptotic Efficiency:** For large inputs, the order of growth of the running time is more important than constant factors or lower-order terms. Algorithms are compared based on these asymptotic growth rates.
* **$\Theta$-notation (Theta):** Describes an **asymptotically tight bound**.
        * $f(n) = \Theta(g(n))$ if there exist positive constants $c_1, c_2, n_0$ such that $0 \le c_1 g(n) \le f(n) \le c_2 g(n)$ for all $n \ge n_0$.
        * Intuitively, the function $f(n)$ grows at the same rate as $g(n)$ within constant factors.
* **$O$-notation (Big-Oh):** Describes an **asymptotic upper bound**.
        * $f(n) = O(g(n))$ if there exist positive constants $c, n_0$ such that $0 \le f(n) \le c g(n)$ for all $n \ge n_0$.
        * It bounds the worst-case running time. Note that $\Theta(g(n))$ implies $O(g(n))$, but not vice versa.
* **$\Omega$-notation (Big-Omega):** Describes an **asymptotic lower bound**.
        * $f(n) = \Omega(g(n))$ if there exist positive constants $c, n_0$ such that $0 \le c g(n) \le f(n)$ for all $n \ge n_0$.
        * It is often used to describe best-case running times or lower bounds on algorithmic problems.

## 3.2 Asymptotic Notation: Formal Definitions

    * **Definitions as Sets:** Formally, $O, \Omega, \Theta$ are sets of functions. Writing $f(n) = O(g(n))$ is an abuse of notation for $f(n) \in O(g(n))$.
    * **Theorem 3.1:** For any two functions $f(n)$ and $g(n)$, $f(n) = \Theta(g(n))$ if and only if $f(n) = O(g(n))$ and $f(n) = \Omega(g(n))$.
    * **$o$-notation (Little-oh):** Denotes an upper bound that is **not asymptotically tight**.
        * $f(n) = o(g(n))$ implies that $\lim_{n \to \infty} \frac{f(n)}{g(n)} = 0$.
        * Intuitively, $f(n)$ becomes insignificant relative to $g(n)$ as $n$ gets large.
    * **$\omega$-notation (Little-omega):** Denotes a lower bound that is **not asymptotically tight**.
        * $f(n) = \omega(g(n))$ implies that $\lim_{n \to \infty} \frac{f(n)}{g(n)} = \infty$.
    * **Properties of Asymptotic Notation:**
        * **Transitivity:** Holds for all five notations (e.g., if $f=O(g)$ and $g=O(h)$, then $f=O(h)$).
        * **Reflexivity:** Holds for $\Theta, O, \Omega$ (e.g., $f(n) = O(f(n))$).
        * **Symmetry:** Holds for $\Theta$ (i.e., $f=\Theta(g)$ iff $g=\Theta(f)$).
        * **Transpose Symmetry:** Holds between $O$ and $\Omega$, and between $o$ and $\omega$ (e.g., $f=O(g)$ iff $g=\Omega(f)$).
        * **Trichotomy:** Does **not** hold. Two functions may be incomparable (e.g., $n$ and $n^{1+\sin n}$).

## 3.3 Standard Notations and Common Functions

    * **Monotonicity:** A function is monotonically increasing if $m \le n \implies f(m) \le f(n)$.
    * **Floors and Ceilings:** $\lfloor x \rfloor$ is the greatest integer $\le x$; $\lceil x \rceil$ is the least integer $\ge x$.
    * **Polynomials vs. Exponentials:** Any exponential function with base strictly greater than 1 grows faster than any polynomial function ($n^b = o(a^n)$ for $a > 1$).
    * **Logarithms:**
        * $\lg n = \log_2 n$ (binary logarithm).
        * $\ln n = \log_e n$ (natural logarithm).
        * Any positive polynomial function grows faster than any polylogarithmic function ($lg^b n = o(n^a)$ for $a > 0$).
    * **Factorials:** Stirling's approximation gives a tight approximation for $n!$: $n! \approx \sqrt{2\pi n} (n/e)^n$.
        * $n! = o(n^n)$ and $n! = \omega(2^n)$.
    * **Iterated Logarithm ($\lg^* n$):** The number of times the logarithm function must be applied to $n$ before the result is $\le 1$. It grows extremely slowly (e.g., $\lg^* 2^{65536} = 5$).
    * **Fibonacci Numbers:** Defined by the recurrence $F_0=0, F_1=1, F_i = F_{i-1} + F_{i-2}$. They grow exponentially related to the golden ratio $\phi$.

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

# Chapter 5: Probabilistic Analysis and Randomized Algorithms

    This chapter introduces probabilistic analysis and randomized algorithms, using the **hiring problem** as a motivating example to demonstrate how randomness can design better algorithms.

## 5.1 The Hiring Problem

    * **The Problem:** You need to hire a new office assistant. You interview $n$ candidates one by one. After each interview, if the candidate is better than the current assistant, you fire the current one and hire the new one.
    * **Cost Model:** Interviewing has a low cost ($c_i$), but hiring has a high cost ($c_h$).
    * **Worst-Case Analysis:** In the worst case (candidates appear in increasing order of quality), you hire every candidate, costing $O(n c_h)$.
    * **Probabilistic Analysis:** Assumes the input (order of candidates) comes from a specific probability distribution.
        * **Uniform Random Permutation:** We assume any of the $n!$ permutations of candidate ranks is equally likely.
        * **Randomized Algorithm:** Instead of relying on the input distribution, the algorithm itself introduces randomness (e.g., by randomly permuting the list of candidates before processing) to enforce the uniform distribution assumption.

## 5.2 Indicator Random Variables

    * **Definition:** An indicator random variable $I\{A\}$ is defined as:
        * $1$ if event $A$ occurs.
        * $0$ if event $A$ does not occur.
    * **Property:** The expected value of an indicator random variable is the probability of the event: $E[I\{A\}] = \Pr\{A\}$.
    * **Analysis of Hiring Problem:**
        * Let $X_i$ be the indicator variable that candidate $i$ is hired.
        * Candidate $i$ is hired only if they are better than all previous $i-1$ candidates.
        * $\Pr\{X_i = 1\} = 1/i$.
        * Expected number of hires $E[X] = \sum_{i=1}^n E[X_i] = \sum_{i=1}^n (1/i) = \ln n + O(1)$.
        * Thus, the expected hiring cost is only $O(c_h \ln n)$, which is much better than the worst-case $O(n c_h)$.

## 5.3 Randomized Algorithms

    * **Distinction:**
        * **Probabilistic Analysis:** Used when we assume the input is random. The running time is an "average-case" running time.
        * **Randomized Algorithm:** The algorithm itself makes random choices (uses a random number generator). The running time is an "expected" running time over the random choices made by the algorithm, valid for *any* input.
    * **Randomly Permuting Arrays:** Two common methods to generate a uniform random permutation:
        1.  **Permute by Sorting:** Assign each element a random priority $P[i]$ and sort the array based on these priorities. Time: $\Theta(n \lg n)$.
        2.  **Randomize-In-Place:** Swap element $A[i]$ with a random element $A[\text{RANDOM}(i, n)]$ for $i = 1$ to $n$. Time: $\Theta(n)$. This is generally preferred.

## 5.4 Probabilistic Analysis and Further Uses of Indicator Random Variables

    * **Birthday Paradox:** How many people must be in a room before there is a 50% chance that two share a birthday? Analysis using indicator variables shows the answer is roughly $\sqrt{2 \cdot 365} \approx 23$.
    * **Balls and Bins:** Throwing $n$ balls into $b$ bins randomly.
        * expected number of balls in a given bin is $n/b$.
        * If $n=b$, the expected maximum number of balls in any bin is $\Theta(\frac{\ln n}{\ln \ln n})$.
    * **Streaks:** Flipping a fair coin $n$ times. The expected length of the longest streak of consecutive heads is $\Theta(\lg n)$.
    * **The On-Line Hiring Problem:** A variant where you must decide immediately whether to hire a candidate or discard them forever.
        * **Strategy:** Reject the first $k$ candidates (to establish a baseline), then hire the first subsequent candidate who is better than all previous ones.
        * **Optimal $k$:** The probability of selecting the best candidate is maximized when $k = n/e$. The probability of success is approximately $1/e$.
