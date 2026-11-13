"""Illustrative numerical companion to the Lean algebraic proofs."""
import csv
from pathlib import Path

DATA = Path(__file__).resolve().parents[1] / "data" / "physical_constants.csv"
with DATA.open(newline="", encoding="utf-8") as f:
    values = {row["symbol"]: float(row["value"]) for row in csv.DictReader(f)}

G, c, M = (values[s] for s in ("G", "c", "M_sun"))
radius = 2 * G * M / c**2
print(f"Schwarzschild radius for reference solar mass: {radius:.6f} m")
print("This is a numerical calculation, not a Lean proof or observational validation.")
