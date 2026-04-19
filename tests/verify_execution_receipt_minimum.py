#!/usr/bin/env python3
import json
import sys
from pathlib import Path

root = Path(__file__).resolve().parents[1]
errors = []

def need(cond, name):
    if cond:
        print(f"[VERIFY] {name}")
    else:
        print(f"[FAIL] {name}")
        errors.append(name)

def load(rel):
    return json.loads((root / rel).read_text(encoding="utf-8"))

need((root / "receipts/current/execution-receipt-0001.json").is_file(), "receipt-object-present")
need((root / "receipts/current/index.json").is_file(), "receipt-index-present")
need((root / "receipts/history/README.md").is_file(), "receipt-history-present")
need((root / "tests/test_execution_receipt_minimum.py").is_file(), "outsider-receipt-test-present")

receipt = load("receipts/current/execution-receipt-0001.json")
index = load("receipts/current/index.json")
canonical = load("evidence/artifact-0005/receipt/receipt.json")

need(receipt.get("execution_receipt_object_id") == "execution-receipt-0001", "receipt-object-id")
need(receipt.get("canonical_receipt_ref") == "evidence/artifact-0005/receipt/receipt.json", "receipt-canonical-ref")
need(receipt.get("historical_archive_ref") == "receipts/history/", "receipt-history-ref")
need(receipt.get("receipt_id") == canonical.get("receipt_id"), "receipt-id-match")
need(receipt.get("authority_seal_id") == canonical.get("authority_seal_id"), "receipt-authority-seal-match")

need(receipt.get("authority_object_ref") == "https://github.com/Verifrax/AUCTORISEAL/blob/main/authorities/current/authority-object-0001.json", "receipt-authority-object-ref")
need(receipt.get("verification_result_ref") == "https://github.com/Verifrax/VERIFRAX/blob/main/verification/results/current/verification-result-0001.json", "receipt-verification-result-ref")
need(receipt.get("recognition_object_ref") == "https://github.com/Verifrax/ANAGNORIUM/blob/main/recognitions/current/recognition-object-0001.json", "receipt-recognition-ref")
need(receipt.get("recourse_object_ref") == "https://github.com/Verifrax/REGRESSORIUM/blob/main/claims/current/recourse-object-0001.json", "receipt-recourse-ref")
need(receipt.get("continuity_ref") == "https://github.com/Verifrax/VERIFRAX/blob/main/evidence/continuity/current/continuity-object-0001.json", "receipt-continuity-ref")
need(receipt.get("transfer_ref") == "https://github.com/Verifrax/VERIFRAX/blob/main/evidence/transfer/current/transfer-object-0001.json", "receipt-transfer-ref")

notes = " ".join(receipt.get("notes", []))
need("without becoming authority issuance or verification" in notes.lower(), "receipt-nonrole-authority-verification")
need("recognition and recourse remain terminal downstream objects" in notes.lower(), "receipt-nonrole-recognition-recourse")
need("continuity and transfer remain verifrax survivability surfaces" in notes.lower(), "receipt-nonrole-continuity-transfer")

need(index.get("object_type") == "ExecutionReceiptIndex", "receipt-index-type")
need(index.get("status") == "ACTIVE_TRUTH", "receipt-index-status")
need(index.get("historical") is False, "receipt-index-historical-false")
need(index.get("current_execution_receipt_ref") == "receipts/current/execution-receipt-0001.json", "receipt-index-binding")

entries = index.get("entries", [])
need(len(entries) == 1, "receipt-index-entry-present")
if entries:
    first = entries[0]
    need(first.get("execution_receipt_object_id") == "execution-receipt-0001", "receipt-index-entry-id")
    need(first.get("path") == "receipts/current/execution-receipt-0001.json", "receipt-index-entry-path")
    need(first.get("receipt_id") == canonical.get("receipt_id"), "receipt-index-entry-receipt-id")
    need(first.get("authority_seal_id") == canonical.get("authority_seal_id"), "receipt-index-entry-authority-seal-id")

if errors:
    print("[FAIL] PHASE 4 / STEP 69 execution-receipt minimum verification failed")
    for e in errors:
        print(f" - {e}")
    sys.exit(1)

print("[PASS] PHASE 4 / STEP 69 execution-receipt minimum verified")
