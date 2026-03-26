#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

set -a
source ci/identity.expected
set +a

node <<'NODE'
const fs = require("fs");

function fail(msg) {
  console.error(msg);
  process.exit(1);
}

function readText(path) {
  return fs.readFileSync(path, "utf8");
}

function mustEqual(label, actual, expected) {
  if (String(actual) !== String(expected)) {
    fail(`${label}: expected=${expected} actual=${actual}`);
  }
}

function mustInclude(label, text, needle) {
  if (!text.includes(needle)) {
    fail(`${label}: missing ${needle}`);
  }
}

const pkg = JSON.parse(readText("package.json"));

mustEqual("PACKAGE_NAME", pkg.name, process.env.PACKAGE_NAME);
mustEqual("PACKAGE_VERSION", pkg.version, process.env.PACKAGE_VERSION);
mustEqual("PACKAGE_PRIVATE", String(pkg.private), process.env.PACKAGE_PRIVATE);
mustEqual("PACKAGE_LICENSE", pkg.license, process.env.PACKAGE_LICENSE);
mustEqual("PACKAGE_BIN_PATH", pkg.bin?.[process.env.PACKAGE_BIN_NAME], process.env.PACKAGE_BIN_PATH);

if (!fs.existsSync(process.env.TAG_BOUNDARY_FILE)) {
  fail(`TAG_BOUNDARY_FILE missing: ${process.env.TAG_BOUNDARY_FILE}`);
}

if (!fs.existsSync(process.env.PACKAGE_BIN_PATH)) {
  fail(`PACKAGE_BIN_PATH missing: ${process.env.PACKAGE_BIN_PATH}`);
}

const readme = readText("README.md");
const status = readText("STATUS.md");
const scope = readText("SCOPE.md");
const contract = readText("CONTRACT.md");
const authority = readText("AUTHORITY.md");
const version = readText("VERSION.md");

mustInclude("README_VERSION", readme, `Version: **${process.env.README_VERSION}**`);
mustInclude("README_STATE", readme, `State: **${process.env.README_STATE}**`);
mustInclude("README_RELEASE_TYPE", readme, `Release type: **${process.env.README_RELEASE_TYPE}**`);
mustInclude("README_AUTHORITY_MODEL", readme, `Authority model: **${process.env.README_AUTHORITY_MODEL}**`);
mustInclude("README_COMPATIBILITY", readme, `Compatibility: **${process.env.README_COMPATIBILITY}**`);
mustInclude("README_NPM_PACKAGE", readme, process.env.NPM_PACKAGE);

mustInclude("STATUS_VERSION", status, `**Version:** \`${process.env.STATUS_VERSION}\``);
mustInclude("SCOPE_VERSION", scope, `**Version:** \`${process.env.SCOPE_VERSION}\``);
mustInclude("CONTRACT_VERSION", contract, `**Version:** \`${process.env.CONTRACT_VERSION}\``);
mustInclude("AUTHORITY_VERSION", authority, `**Version:** \`${process.env.AUTHORITY_VERSION}\``);
mustInclude("VERSION_VERSION", version, `**VERSION:** ${process.env.VERSION_VERSION}`);

console.log("identity: verified");
NODE
