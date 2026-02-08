# REPLAY ATTEMPT FIXTURES

This directory contains **synthetic artifacts simulating a replay scenario**.

A valid authority and command exist,  
but a **prior execution has already been recorded**.

---

## PURPOSE

These fixtures verify that CORPIFORM:

- enforces execute-once semantics
- detects prior execution via receipts or locks
- refuses replay deterministically
- emits a denial instead of re-executing
- never performs duplicate external actions

Replay is forbidden.

---

## CHARACTERISTICS

Each fixture here includes:

- a valid single-use authority seal
- an execution command
- a prior receipt proving execution already occurred

Nothing else is invalid.

---

## EXPECTED OUTCOME

- Execution is refused
- A denial is emitted
- No new receipt is emitted
- No external action occurs

---

## CRITICAL GUARANTEE

If a replay attempt:
- executes again
- emits a new receipt

then **CORPIFORM IS BROKEN**.

---

## DECLARATION

Execution is a one-time event.

History cannot be replayed.
