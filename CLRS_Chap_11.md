# Chapter 11: Hash Tables

This chapter covers **hash tables**, a highly efficient data structure used to implement dictionaries (supporting `INSERT`, `SEARCH`, `DELETE`) with an average-case running time of $O(1)$.

## 11.1 Direct-Address Tables

* **Concept:** If the universe $U$ of keys is small (e.g., $0$ to $m-1$) and no two elements have the same key, we can use an array $T[0..m-1]$ where slot $k$ points directly to the element with key $k$.
* **Performance:** All dictionary operations take **$O(1)$** time.
* **Limitations:** Impractical if the universe $U$ is large (requires too much memory) or if the set of actual keys $K$ is small relative to $U$ (wastes space).

## 11.2 Hash Tables

* **Concept:** Instead of using the key $k$ directly as an index, we compute the index using a **hash function** $h(k)$. The element is stored in slot $h(k)$ of the hash table $T[0..m-1]$, where $m \ll |U|$.
* **Collisions:** A collision occurs when two distinct keys $k_1, k_2$ hash to the same slot ($h(k_1) = h(k_2)$). Since $|U| > m$, collisions are inevitable.
* **Collision Resolution by Chaining:**
    * **Method:** Place all elements that hash to the same slot into a linked list. The slot $T[j]$ contains a pointer to the head of the list for all keys where $h(k) = j$. 
    * **Analysis:**
        * **Load Factor ($\alpha$):** Defined as $\alpha = n/m$, the average number of elements per slot.
        * **Performance:** Under the assumption of **simple uniform hashing** (any key is equally likely to hash to any slot), an unsuccessful search takes $\Theta(1+\alpha)$ time on average, and a successful search also takes $\Theta(1+\alpha)$ time. If $n = O(m)$, then $\alpha = O(1)$, and all operations run in **$O(1)$** average time.

## 11.3 Hash Functions

A good hash function distributes keys uniformly across the slots to minimize collisions.
* **The Division Method:** $h(k) = k \mod m$. fast, but requires careful choice of $m$ (e.g., a prime not close to a power of 2).
* **The Multiplication Method:** $h(k) = \lfloor m (kA \mod 1) \rfloor$, where $0 < A < 1$. The choice of $m$ is less critical; typically $m$ is a power of 2.
* **Universal Hashing:** To prevent a malicious adversary from choosing keys that all hash to the same slot (worst-case $\Theta(n)$), we choose the hash function **randomly** from a carefully designed class of functions at runtime. This guarantees good average-case performance independent of the input keys.

## 11.4 Open Addressing

* **Concept:** All elements are stored directly in the hash table array (no linked lists). If a collision occurs, we systematically probe the table until an empty slot is found.
* **Probe Sequence:** The sequence of slots examined for a key $k$ is $\langle h(k, 0), h(k, 1), \dots, h(k, m-1) \rangle$, a permutation of $\langle 0, \dots, m-1 \rangle$.
* **Probing Strategies:**
    * **Linear Probing:** $h(k, i) = (h'(k) + i) \mod m$. Simple but suffers from **primary clustering** (long runs of occupied slots).
    * **Quadratic Probing:** $h(k, i) = (h'(k) + c_1 i + c_2 i^2) \mod m$. Avoids primary clustering but can have **secondary clustering**.
    * **Double Hashing:** $h(k, i) = (h_1(k) + i h_2(k)) \mod m$. Uses two hash functions. Produces the best permutation distributions.
* **Performance:** Performance degrades as the load factor $\alpha$ approaches 1. Deletion is difficult in open addressing (cannot simply mark slot as empty or it breaks the probe sequence for others).

## 11.5 Perfect Hashing

* **Concept:** A technique for **static** sets of keys (keys are known in advance).
* **Method:** Uses a two-level hashing scheme with universal hashing at each level.
* **Performance:** Guarantees **$O(1)$** memory usage and **$O(1)$** worst-case search time.
