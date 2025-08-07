use std::fs;

pub fn read_files(paths: &[&str]) -> Vec<String> {
    paths
        .iter()
        .map(|path| {
            fs::read_to_string(path)
                .unwrap_or_else(|_| panic!("Failed to read input file: {}", path))
        })
        .collect()
}

pub fn write_files(paths: &[&str], contents: &[String]) {
    for (path, content) in paths.iter().zip(contents.iter()) {
        fs::write(path, content)
            .unwrap_or_else(|_| panic!("Failed to write output file: {}", path));
    }
}
