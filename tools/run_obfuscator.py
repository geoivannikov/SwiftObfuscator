import subprocess
import os
import sys
import shutil
from glob import glob

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OBFUSCATOR_PATH = os.path.join(PROJECT_ROOT, "obfuscator_core")
INPUT_DIR = os.path.join(PROJECT_ROOT, "SwiftSamples", "classes")
OUTPUT_DIR = os.path.join(PROJECT_ROOT, "SwiftSamplesResult", "classes")

def clean_output_dir():
    if os.path.exists(OUTPUT_DIR):
        shutil.rmtree(OUTPUT_DIR)
    # Remove everything in SwiftSamplesResult
    parent = os.path.dirname(OUTPUT_DIR)
    if os.path.exists(parent):
        for entry in os.listdir(parent):
            entry_path = os.path.join(parent, entry)
            if os.path.isfile(entry_path):
                os.remove(entry_path)
            elif os.path.isdir(entry_path):
                shutil.rmtree(entry_path)
    os.makedirs(OUTPUT_DIR)
    print(f"Cleaned and created output directory: {OUTPUT_DIR}")

def build_obfuscator():
    print("Building obfuscator_core...")
    result = subprocess.run(
        ["cargo", "build", "--release"],
        cwd=OBFUSCATOR_PATH
    )
    if result.returncode != 0:
        print("Build failed.")
        sys.exit(1)

def run_obfuscator():
    binary = os.path.join(OBFUSCATOR_PATH, "target", "release", "obfuscator_core")
    if not os.path.isfile(binary):
        print("Binary not found, did build fail?")
        sys.exit(1)

    input_files = sorted(glob(os.path.join(INPUT_DIR, "*.swift")))
    output_files = [os.path.join(OUTPUT_DIR, os.path.basename(f)) for f in input_files]

    if not input_files:
        print("No .swift files found in input directory.")
        sys.exit(1)

    args = [binary, "--input"] + input_files + ["--output"] + output_files
    print(f"Running obfuscator_core for files:\n  " + "\n  ".join(input_files))
    result = subprocess.run(args)
    if result.returncode != 0:
        print("Obfuscation failed.")
        sys.exit(1)
    print(f"Obfuscated files written to {OUTPUT_DIR}")

if __name__ == "__main__":
    clean_output_dir()
    build_obfuscator()
    run_obfuscator()
