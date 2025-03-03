# HerFuture Coding Challenge

For the sake of time, I will write my README in **notes format** and then use **LLMs to generate properly formatted Markdown**. This way, I can focus my time and attention on **coding** rather than formatting.

## **📝 Thought Process**

In this README, I will document my thought process and each decision along the way. This means it won’t necessarily act or look like a formal documentation file but rather as a **log of my actions and thoughts**.

I decided on this approach because I found this on the assignment page:

> _“It’s recommended to create a git repository and commit your changes frequently, so that we can follow your thought process. We will give personalised feedback for every submission.”_

So, this README will reflect exactly that—how I approached the problem, the decisions I made, and why I made them.

---

## **Development Setup**

For development, I will use:

- **VS Code** as my IDE
- **iPhone simulator** for testing the app

I started by creating the app from **VS Code** and deciding on a design and architecture.

---

## **🖌️ Design Choices**

For the UI, I decided to keep things simple:

- **One screen** that includes:
  - An **input field** where users enter words or phrases
  - A **list** below it that stores the history of checked words

I went with this design because I’ve built something similar before, and I found it to be a **fast and effective** approach.

Additionally, since this is a **HerFuture** challenge, I thought it would be nice to use **HerFuture's color theme** for the app 🎨. So, I will also create a **theme** for the app to match it.

---

## **📌 Features**

I plan to implement **all required features** plus the **optional ones**, including:

- **Persistent history** using `SharedPreferences`
- **Unit tests** (focusing on testing the `Bloc` logic)

For the tests, I will mainly **test the Bloc layer** since writing **widget tests for the entire project** would take significantly more time than the suggested **120 minutes**.

---

## **📌 Architecture Decision**

I decided to **apply Clean Architecture principles** and follow the **Domain-Driven Design (DDD) pattern**.

### **❗DISCLAIMER**:

I am aware that this is **overengineering for such a small app**, but since the app is being used to **assess my skills as a developer**, I think this is a good way to showcase best practices.

---

## **📂 Folder Structure**

Now that I have a **clear vision** for the app’s design and architecture, I will set up the **folder structure**.

Since **there is only one feature**, I will create a **`features/` folder**. Inside, I will add the **`palindrome_checker/` feature**, which will have the following three main folders:

```plaintext
features/
│── palindrome_checker/
│   ├── domain/         # Business logic (Entities, Use Cases, Repositories)
│   ├── data/           # Data sources, Models, Repository Implementations
│   ├── presentation/   # UI (Widgets, Bloc, Screens)
```

Even though this app **only has one feature**, structuring it this way ensures that:

1. **The code remains modular and scalable.**
2. **If I ever add more features, they will be easy to integrate.**
3. **It follows industry best practices.**

---

### **Next Steps**

Now that the initial **architecture and folder structure** are in place, I will:

1. **Implement the domain layer** (Entities, Use Cases, and Repository interfaces).
2. **Implement the data layer** (Storage, Models, Repository implementation).
3. **Set up the presentation layer** (UI & Bloc logic).
4. **Write tests for critical parts of the app.**

---

## **🚀 Implementing the Domain Layer**

Now that I will start with the actual coding, I need to add the necessary **packages**. If needed, I will add more packages later as development progresses.

I will begin by implementing the **Domain Layer**, as it is the **innermost part of the architecture** and has **no dependencies** on other layers. Here, I will need to implement:

- **Entities**
- **Repository Interfaces**
- **Use Cases**

---

### **📌 Creating the `PalindromeEntity`**

I will start with the **Entities**, which represent the core data models of the app.  
For this app, I think there is **only one entity** needed: `PalindromeEntity`.

#### **🔹 Why This Structure?**

- **Contains the input word and a boolean** for whether it is a palindrome.
- **Uses `Equatable`** to make comparisons easier.

✅ **Now, the app has its core data model.**

---

### **📌 Creating the Repository Interface**

Next, I will create the **Repository Interface**, which defines **what actions** the app can perform with data.

For this app, the repository should:

- **Save a palindrome result**
- **Get past history**
- **Clear history**

Thus, the repository will reflect these actions.

✅ **Now, the repository defines how the app should interact with data.**

---

### **📌 Implementing the Use Cases**

Finally, I need to implement **Use Cases**, which define the app’s business logic.  
I will start by adding **boilerplate code** for all Use Cases.

#### **🔹 Why This Boilerplate?**

- **Standardizes how Use Cases work**.
- **Makes code modular and easy to extend**.
- **Ensures all Use Cases follow the same structure**.

---

### **📌 Listing the Required Use Cases**

Now, I will implement the **specific Use Cases** that this app needs.

1. **Check if a word is a palindrome**

   - This will contain the **logic for checking if an input is a palindrome**.
   - The assignment says:
     > _A string is a palindrome when its reverse is exactly equal to its original form. For example, “madam” is a palindrome string because its original and reverse are exactly the same. Similarly, “car” is not a palindrome because its reverse (“rac”) is not the same as its original value. Some other examples for a palindrome are: “race car”, “don’t nod”, “Anna”._
   - However, I have made a **small modification**:
     - Instead of filtering only alphanumeric characters, I will **consider all characters**.
     - If I filtered everything, I might end up with `"\.,/."` being considered a palindrome, which doesn’t seem intuitive.
     - Thus, **my implementation will keep special characters**.
     - Example: `"don't nod"` → My app will say **this is NOT a palindrome**.

2. **Clear the history**

   - This one is straightforward and will remove all stored history.

3. **Get the history**

   - This will retrieve past results from storage.

4. **Save a palindrome check**
   - This stores a checked word in the history.

---

### **📌 Next Steps**

Now that the **Domain Layer** is set up, the next step is to:

1. **Implement the Data Layer (Repositories, Models, Local Storage).**
2. **Connect the Data Layer with `SharedPreferences` for persistence.**
3. **Set up the Presentation Layer (UI & Bloc) to use this logic.**

🚀 **Now the foundation is ready! Time to move forward.**

---
