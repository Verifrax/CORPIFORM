import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_execution_receipt_object_minimum():
    data = json.loads((ROOT / "receipts/current/execution-receipt-0001.json").read_text())
    receipt = json.loads((ROOT / "evidence/artifact-0005/receipt/receipt.json").read_text())

    assert data["object_type"] == "ExecutionReceipt"
    assert data["status"] == "ACTIVE_TRUTH"
    assert data["canonical_receipt_ref"] == "evidence/artifact-0005/receipt/receipt.json"
    assert data["canonical_receipt_canonical_ref"] == "evidence/artifact-0005/receipt/receipt.canonical.txt"
    assert data["canonical_receipt_digest_ref"] == "evidence/artifact-0005/receipt/receipt.digest.txt"
    assert data["receipt_schema_ref"] == "interfaces/receipt.output.schema.json"
    assert data["command_schema_ref"] == "interfaces/execution.command.schema.json"
    assert data["authority_input_schema_ref"] == "interfaces/authority.input.schema.json"
    assert data["historical_archive_ref"] == "receipts/history/"
    assert data["receipt_id"] == receipt["receipt_id"]
    assert data["command_id"] == receipt["command_id"]
    assert data["authority_seal_id"] == receipt["authority_seal_id"]
    assert data["system"] == receipt["system"]
    assert data["version"] == receipt["version"]
    assert data["body"] == receipt["body"]
    assert data["action"] == receipt["action"]
    assert data["adapter"] == receipt["adapter"]
    assert data["outcome"] == receipt["outcome"]
    assert data["timestamp"] == receipt["timestamp"]
