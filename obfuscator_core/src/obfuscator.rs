use regex::Regex;
use std::collections::HashMap;

/// Collects all class names from a list of file contents.
pub fn collect_class_names(contents: &[String]) -> HashMap<String, String> {
    let class_re = Regex::new(r"class\s+([A-Za-z_][A-Za-z0-9_]*)").unwrap();
    let mut counter = 1;
    let mut mapping = HashMap::new();

    for content in contents {
        for caps in class_re.captures_iter(content) {
            let orig = &caps[1];
            mapping.entry(orig.to_string()).or_insert_with(|| {
                let name = format!("ObfClass{}", counter);
                counter += 1;
                name
            });
        }
    }
    mapping
}

/// Replaces all class names in the source string using the provided mapping.
pub fn obfuscate_class_names_with_map(source: &str, mapping: &HashMap<String, String>) -> String {
    let mut result = source.to_string();
    for (orig, new_name) in mapping {
        let re = Regex::new(&format!(r"\b{}\b", regex::escape(orig))).unwrap();
        result = re.replace_all(&result, new_name.as_str()).to_string();
    }
    result
}
