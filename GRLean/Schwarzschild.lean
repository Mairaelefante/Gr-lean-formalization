import Mathlib

/-!
# Algebraic properties of the Schwarzschild radius

These are algebraic consequences of the horizon relation, not a derivation
of the Schwarzschild metric from the Einstein field equations.
-/

namespace GRLean

noncomputable def schwarzschildRadius (G M c : ℝ) : ℝ := 2 * G * M / c ^ 2

/-- The horizon relation `c² rₛ = 2 G M` for nonzero light speed. -/
theorem horizon_relation (G M c : ℝ) (hc : c ≠ 0) :
    c ^ 2 * schwarzschildRadius G M c = 2 * G * M := by
  unfold schwarzschildRadius
  field_simp

/-- Uniqueness of a radius satisfying the algebraic horizon relation. -/
theorem horizon_unique (G M c r : ℝ) (hc : c ≠ 0)
    (hr : c ^ 2 * r = 2 * G * M) :
    r = schwarzschildRadius G M c := by
  unfold schwarzschildRadius
  apply (eq_div_iff (pow_ne_zero 2 hc)).2
  nlinarith [hr]

/-- Radius scales linearly with mass for fixed G and c. -/
theorem radius_mass_scaling (G M c k : ℝ) :
    schwarzschildRadius G (k * M) c = k * schwarzschildRadius G M c := by
  unfold schwarzschildRadius
  ring

/-- A positive mass gives a positive Schwarzschild radius. -/
theorem radius_positive (G M c : ℝ)
    (hG : 0 < G) (hM : 0 < M) (hc : c ≠ 0) :
    0 < schwarzschildRadius G M c := by
  unfold schwarzschildRadius
  positivity

end GRLean
