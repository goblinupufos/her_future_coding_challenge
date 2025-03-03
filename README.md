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
