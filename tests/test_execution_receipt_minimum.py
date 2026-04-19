import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def load(rel: str):
    return json.loads((ROOT / rel).read_text(encoding="utf-8"))

def test_execution_receipt_minimum():
    receipt = load("receipts/current/execution-receipt-0001.json")
    index = load("receipts/current/index.json")
    canonical = load("evidence/artifact-0005/receipt/receipt.json")

    assert receipt["execution_receipt_object_id"] == "execution-receipt-0001"
    assert receipt["canonical_receipt_ref"] == "evidence/artifact-0005/receipt/receipt.json"
    assert receipt["authority_seal_id"] == canonical["authority_seal_id"]
    assert receipt["receipt_id"] == canonical["receipt_id"]

    assert receipt["authority_object_ref"] == "https://github.com/Verifrax/AUCTORISEAL/blob/main/authorities/current/authority-object-0001.json"
    assert receipt["verification_result_ref"] == "https://github.com/Verifrax/VERIFRAX/blob/main/verification/results/current/verification-result-0001.json"
    assert receipt["recognition_object_ref"] == "https://github.com/Verifrax/ANAGNORIUM/blob/main/recognitions/current/recognition-object-0001.json"
    assert receipt["recourse_object_ref"] == "https://github.com/Verifrax/REGRESSORIUM/blob/main/claims/current/recourse-object-0001.json"
    assert receipt["continuity_ref"] == "https://github.com/Verifrax/VERIFRAX/blob/main/evidence/continuity/current/continuity-object-0001.json"
    assert receipt["transfer_ref"] == "https://github.com/Verifrax/VERIFRAX/blob/main/evidence/transfer/current/transfer-object-0001.json"

    assert index["object_type"] == "ExecutionReceiptIndex"
    assert index["status"] == "ACTIVE_TRUTH"
    assert index["historical"] is False
    assert index["current_execution_receipt_ref"] == "receipts/current/execution-receipt-0001.json"
    assert index["entries"][0]["execution_receipt_object_id"] == "execution-receipt-0001"
    assert index["entries"][0]["path"] == "receipts/current/execution-receipt-0001.json"
    assert index["entries"][0]["receipt_id"] == canonical["receipt_id"]
