# CLRS Chapter 17 — Amortized Analysis (Concise Summary)

## 1. What Is Amortized Analysis?
Amortized analysis studies the **average cost per operation over a sequence of operations**, guaranteeing performance **in the worst case over the entire sequence**, not probabilistically.

Key idea:
> Expensive operations are rare and paid for by many cheap ones.

---

## 2. Why Amortized Analysis?
Worst-case analysis may be misleading for data structures where:
- Some operations are occasionally expensive
- Most operations are cheap

Amortized analysis shows the **overall efficiency**.

---

## 3. Three Methods of Amortized Analysis

### 3.1 Aggregate Method
- Compute total cost of `n` operations
- Divide by `n`

Example:
- Stack operations with occasional resizing → **O(1)** amortized

---

### 3.2 Accounting Method
- Assign “credits” to operations
- Cheap operations store credits
- Expensive operations consume credits

Invariant:
> Credits never go negative

---

### 3.3 Potential Method
- Define a potential function Φ(state)
- Amortized cost = actual cost + ΔΦ

\[
\hat{c_i} = c_i + Φ(D_i) - Φ(D_{i-1})
\]

Most powerful and formal method.

---

## 4. Classic Examples in Chapter 17

### 4.1 Stack Operations
- PUSH, POP, MULTIPOP
- Worst-case MULTIPOP is O(n)
- Amortized cost per operation: **O(1)**

---

### 4.2 Binary Counter Increment
- Incrementing binary counter
- Flipping bits is costly occasionally
- Total flips ≤ 2n
- Amortized cost: **O(1)**

---

### 4.3 Dynamic Table (Array Doubling)
- Table doubles when full
- Insert may cost O(n)
- Amortized insert cost: **O(1)**

---

## 5. Potential Function Intuition
- Φ measures “stored work”
- High potential = future expensive operations paid for

Example:
\[
Φ = 2 \cdot \text{num\_items} - \text{table\_size}
\]

---

## 6. Amortized vs Average-Case

| Amortized Analysis | Average-Case Analysis |
|-------------------|----------------------|
| Deterministic | Probabilistic |
| Worst-case guarantee | Depends on distribution |
| No randomness | Requires input assumptions |

---

## 7. When to Use Amortized Analysis
Use when:
- Operations vary widely in cost
- Resizing or rebuilding occurs
- You want guaranteed bounds

Common in:
- Dynamic arrays
- Union-Find
- Splay trees

---

## 8. Common Pitfalls
- Choosing wrong potential function
- Forgetting Φ ≥ 0
- Mixing amortized with average-case

---

## 9. Takeaway
Amortized analysis explains why many data structures are efficient **over time**, even when some operations are expensive.

> **“You pay a little extra now to avoid paying a lot later.”**

---

## 10. Exam / Interview Tips
- Know all three methods
- Be able to define a potential function
- Explain dynamic array amortization clearly
- Distinguish amortized vs average-case

---

**End of Chapter 17 Summary**
