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
