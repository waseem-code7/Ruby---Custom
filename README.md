# 🐒 Monkey Patching Ruby's Array Class

This project demonstrates **monkey patching** in Ruby by adding several custom methods to the built-in `Array` class. The new methods mimic or enhance native behavior, as well as introduce some algorithmic functionality like binary search.

## 📦 Features

The following methods have been added to the `Array` class:

### 🔍 Search & Indexing

- **`custom_include?(value)`**  
  Returns `true` if the value is present in the array, `false` otherwise.

- **`custom_at(index)`**  
  Returns the element at the specified index. Handles negative indices and returns `-1` for out-of-bound access.

### 🧬 Cloning

- **`copy`**  
  Returns a deep copy of the array using `Marshal`.

### 🪆 Flattening

- **`custom_flatten(depth = nil)`**  
  Returns a new array with nested arrays flattened up to the given `depth`.

- **`custom_flatten!(depth = nil)`**  
  Destructively flattens the array in place up to the given `depth`.

### 🔁 Reversing

- **`custom_reverse`**  
  Returns a new array with the elements in reverse order.

- **`custom_reverse!`**  
  Destructively reverses the array in place.

### 🔎 Binary Search

- **`bsearch_excat { |x| block }`**  
  Performs a binary search and returns `0` if an exact match is found using a block (e.g. `{ |x| x <=> value }`).

- **`bsearch_minimum { |x| block }`**  
  Finds the *minimum* element that satisfies the given condition using binary search.
