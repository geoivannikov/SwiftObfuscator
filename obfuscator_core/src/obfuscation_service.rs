use crate::file_utils;
use crate::obfuscator;
use std::env;

pub fn run() {
    let args: Vec<String> = env::args().collect();

    let input_idx = args.iter().position(|x| x == "--input");
    let output_idx = args.iter().position(|x| x == "--output");

    if let (Some(i), Some(o)) = (input_idx, output_idx) {
        let input_files: Vec<&str> = args[i + 1..o].iter().map(|s| s.as_str()).collect();
        let output_files: Vec<&str> = args[o + 1..].iter().map(|s| s.as_str()).collect();

        if input_files.len() != output_files.len() || input_files.is_empty() {
            eprintln!("Number of input and output files must match and be non-zero.");
            std::process::exit(1);
        }

        // Read all input files once
        let contents = file_utils::read_files(&input_files);

        // Build mapping using file contents, not file paths
        let mapping = obfuscator::collect_class_names(&contents);

        // Obfuscate each file content
        let obfuscated: Vec<String> = contents
            .iter()
            .map(|c| obfuscator::obfuscate_class_names_with_map(c, &mapping))
            .collect();

        file_utils::write_files(&output_files, &obfuscated);

        for (input, output) in input_files.iter().zip(output_files.iter()) {
            println!("Class names obfuscated in {} -> {}", input, output);
        }
    } else {
        eprintln!("Usage: obfuscator_core --input <file1> <file2> ... --output <out1> <out2> ...");
        std::process::exit(1);
    }
}
