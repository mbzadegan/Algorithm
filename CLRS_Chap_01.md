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
