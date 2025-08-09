import subprocess
import os
import sys
import shutil
from glob import glob

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OBFUSCATOR_PATH = os.path.join(PROJECT_ROOT, "obfuscator_core")

def clean_output_dir():
    output_parent = os.path.join(PROJECT_ROOT, "SwiftSamplesResultTmp")
    if os.path.exists(output_parent):
        shutil.rmtree(output_parent)
    os.makedirs(output_parent)
    print(f"Cleaned and created output directory: {output_parent}")

def build_obfuscator():
    print("Building obfuscator_core...")
    result = subprocess.run(
        ["cargo", "build", "--release"],
        cwd=OBFUSCATOR_PATH
    )
    if result.returncode != 0:
        print("Build failed.")
        sys.exit(1)

def run_obfuscator_for_test_case(test_name, input_dir, output_dir):
    binary = os.path.join(OBFUSCATOR_PATH, "target", "release", "obfuscator_core")
    if not os.path.isfile(binary):
        print("Binary not found, did build fail?")
        sys.exit(1)

    input_files = sorted(glob(os.path.join(input_dir, "*.swift")))
    output_files = [os.path.join(output_dir, os.path.basename(f)) for f in input_files]

    if not input_files:
        print(f"No .swift files found in {input_dir}")
        return False

    os.makedirs(output_dir, exist_ok=True)
    
    args = [binary, "--input"] + input_files + ["--output"] + output_files
    print(f"\n🔧 Running obfuscator for {test_name}...")
    print(f"  Input files: {len(input_files)} files")
    result = subprocess.run(args)
    if result.returncode != 0:
        print(f"❌ Obfuscation failed for {test_name}")
        return False
    print(f"✅ Obfuscated files written to {output_dir}")
    return True

def compare_results():
    test_cases = [
        ("classes", "SwiftSamples/classes", "SwiftSamplesResultTmp/classes", "SwiftSamplesResult/classes"),
        ("classes-multiple", "SwiftSamples/classes-multiple", "SwiftSamplesResultTmp/classes-multiple", "SwiftSamplesResult/classes-multiple")
    ]
    
    overall_success = True
    
    for test_name, input_dir, output_dir, reference_dir in test_cases:
        print(f"\n🧪 Testing {test_name}...")
        
        # Check if directories exist
        output_full_path = os.path.join(PROJECT_ROOT, output_dir)
        reference_full_path = os.path.join(PROJECT_ROOT, reference_dir)
        
        if not os.path.exists(output_full_path):
            print(f"❌ Output directory missing: {output_dir}")
            overall_success = False
            continue
            
        if not os.path.exists(reference_full_path):
            print(f"❌ Reference directory missing: {reference_dir}")
            overall_success = False
            continue
        
        tmp_files = sorted([f for f in os.listdir(output_full_path) if f.endswith(".swift")])
        ref_files = sorted([f for f in os.listdir(reference_full_path) if f.endswith(".swift")])
        
        test_ok = True
        for fname in tmp_files:
            tmp_path = os.path.join(output_full_path, fname)
            ref_path = os.path.join(reference_full_path, fname)
            if not os.path.exists(ref_path):
                print(f"❌ [FAIL] Reference file missing: {fname}")
                test_ok = False
                continue
            with open(tmp_path, "r", encoding="utf-8") as f1, open(ref_path, "r", encoding="utf-8") as f2:
                if f1.read() == f2.read():
                    print(f"✅ [OK]   {fname}")
                else:
                    print(f"❌ [FAIL] {fname} differs")
                    test_ok = False
        
        for fname in ref_files:
            if fname not in tmp_files:
                print(f"❌ [FAIL] Output file missing: {fname}")
                test_ok = False
        
        if test_ok:
            print(f"🎉 {test_name} - All files match.")
        else:
            print(f"⚠️ {test_name} - Some files do not match.")
            overall_success = False
    
    print(f"\n{'='*50}")
    if overall_success:
        print("🎉 ALL TESTS PASSED!")
    else:
        print("⚠️ SOME TESTS FAILED!")

def run_all_tests():
    test_cases = [
        ("classes", "SwiftSamples/classes", "SwiftSamplesResultTmp/classes"),
        ("classes-multiple", "SwiftSamples/classes-multiple", "SwiftSamplesResultTmp/classes-multiple")
    ]
    
    for test_name, input_rel_dir, output_rel_dir in test_cases:
        input_dir = os.path.join(PROJECT_ROOT, input_rel_dir)
        output_dir = os.path.join(PROJECT_ROOT, output_rel_dir)
        
        success = run_obfuscator_for_test_case(test_name, input_dir, output_dir)
        if not success:
            sys.exit(1)

if __name__ == "__main__":
    clean_output_dir()
    build_obfuscator()
    run_all_tests()
    compare_results()
