# GR-Lean: Formal Verification of General Relativity Relations

A reproducible Lean 4 + Mathlib project exploring mathematically verified statements arising in general relativity, starting with the Schwarzschild horizon relation.

## Current scope

The Lean file `GRLean/Schwarzschild.lean` defines `rₛ = 2GM/c²` over real numbers and provides proofs of:

- The algebraic horizon relation `c² rₛ = 2GM` when `c ≠ 0`.
- Uniqueness of the solution to that relation.
- Linear scaling with mass.
- Positivity for positive gravitational constant and mass.

**Scientific honesty:** These results are algebraic consequences of the Schwarzschild-radius relation. They do not yet formalize tensor calculus, Einstein's field equations, or derive the Schwarzschild metric. No theorem establishes that the model describes a particular observed object.

## Reproducibility

Install [elan](https://github.com/leanprover/elan), then run:

```sh
lake update
lake exe cache get
lake build
python3 scripts/schwarzschild.py
```

Lean is pinned to 4.20.0 with Mathlib v4.20.0. CI is configured to check proofs on GitHub Actions. The proofs have **not** been compiled in this development environment; compilation remains to be confirmed.

## Data provenance

`data/physical_constants.csv` provides SI light speed, CODATA 2022 gravitational constant, and an approximate solar-mass reference. Numerical results are illustrative; the solar-mass reference is rounded and its uncertainty is not propagated. The Lean proofs use symbolic real numbers, not these CSV values.

## Research roadmap

1. Verify current proofs in CI and lock Mathlib dependency resolution.
2. Add geometrized units and rigorous interval arithmetic for measured constants.
3. Formalize static spherically symmetric metrics and the horizon condition.
4. Develop Christoffel symbols, curvature tensors, and the vacuum Einstein equations.
5. Prove the Schwarzschild metric satisfies the vacuum equations under explicit assumptions.
6. Explore null radial geodesics and observational comparisons with uncertainty propagation.

## License

MIT, see `LICENSE`.
