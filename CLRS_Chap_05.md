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
