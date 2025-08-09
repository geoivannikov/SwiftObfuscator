use regex::Regex;
use std::collections::HashMap;

/// Stores mapping from original class and struct names to obfuscated names.
pub struct ObfuscationMap {
    mapping: HashMap<String, String>,
}

impl ObfuscationMap {
    /// Creates a new mapping from a list of file contents.
    pub fn from_contents(contents: &[String]) -> Result<Self, regex::Error> {
        let class_re = Regex::new(r"class\s+([A-Za-z_][A-Za-z0-9_]*)")?;
        let struct_re = Regex::new(r"struct\s+([A-Za-z_][A-Za-z0-9_]*)")?;
        
        let mut class_counter = 1;
        let mut struct_counter = 1;
        let mut mapping = HashMap::new();

        // First collect all classes
        for content in contents {
            for caps in class_re.captures_iter(content) {
                let orig = &caps[1];
                mapping.entry(orig.to_string()).or_insert_with(|| {
                    let name = format!("ObfClass{}", class_counter);
                    class_counter += 1;
                    name
                });
            }
        }

        // Then collect all structs
        for content in contents {
            for caps in struct_re.captures_iter(content) {
                let orig = &caps[1];
                mapping.entry(orig.to_string()).or_insert_with(|| {
                    let name = format!("ObfStruct{}", struct_counter);
                    struct_counter += 1;
                    name
                });
            }
        }

        Ok(Self { mapping })
    }

    /// Obfuscates all class and struct names in the given source string.
    pub fn obfuscate_source(&self, source: &str) -> String {
        let mut result = source.to_string();
        for (orig, new_name) in &self.mapping {
            let re = Self::class_regex(orig);
            result = re.replace_all(&result, new_name.as_str()).to_string();
        }
        result
    }

    fn class_regex(class_name: &str) -> Regex {
        Regex::new(&format!(r"\b{}\b", regex::escape(class_name)))
            .expect("Failed to build class name regex")
    }
}
