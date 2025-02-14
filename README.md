# 🏰 Binary Search Tree (BST) Implementation in Ruby

## 📌 Project Overview

This project is a **Balanced Binary Search Tree (BST)** implementation in Ruby. It follows **The Odin Project's Binary Search Tree Assignment** and ensures the tree remains balanced for **efficient operations**.

## 🚀 Features

- **Build a Balanced BST** from an array of integers
- **Insertion & Deletion** of values while maintaining BST properties
- **Search (Find) Functionality**
- **Tree Traversals:**
  - Level-Order (Breadth-First Search)
  - Inorder, Preorder, and Postorder (Depth-First Search)
- **Height & Depth Calculations**
- **Tree Balancing:**
  - Detect if the tree is unbalanced
  - Rebalance the tree when necessary

## 📺 Project Structure

```
bst/
│── lib/
│   │── node.rb          # Represents a single BST node
│   │── tree.rb          # Main BST implementation
│   │── tree_traversals.rb # DFS traversals module
│   │── tree_utils.rb    # BFS & tree utility functions
│── test/                # Contains test scripts (ignored by Git)
│── main.rb              # Driver script to demonstrate BST functions
│── .gitignore           # Ignores test files
│── README.md            # Project documentation
```

## 🍼 How to Use

### 🛠️ Run the Driver Script

1. **Clone the Repository**  

   ```sh
   git clone https://github.com/your-username/bst.git
   cd bst
   ```

2. **Run the script**  

   ```sh
   ruby main.rb
   ```

This will **build a balanced BST, insert/delete values, rebalance if necessary, and print tree traversals**.

## ✅ Example Output

```
🌱 Initial Balanced BST:
│   ┌── 90
│   │   └── 85
│   ┌── 75
│   │   └── 60
└── 50
    └── 30
        │   ┌── 25
        └── 10
            └── 5

Balanced? true

📊 Level-order Traversal:
[50, 30, 75, 10, 60, 90, 5, 25, 85]

⚠️ Tree After Insertions (Unbalancing)
...
✅ Tree After Rebalancing:
...
```

## 📚 Credits

- **Project inspired by** [The Odin Project](https://www.theodinproject.com/)
- **Implemented by**: **Your Name** 🚀

---
🔹 Feel free to fork and modify this project! 😊  
