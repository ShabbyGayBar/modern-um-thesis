# modern-um-thesis

## Typst Thesis Template for University of Macau

This repository provides a modern and easy-to-use thesis template for the University of Macau, built with [Typst](https://typst.app/). The template supports both Doctoral and Master's theses, offering a clean and professional layout that meets UM requirements.

---

## Why Typst?

Typst is a next-generation typesetting system designed for simplicity, speed, and flexibility. Compared to Microsoft Word and LaTeX:

- **User-Friendly**: Typst uses a clean, readable markup language that is easy to learn, even for beginners.
- **Live Preview**: See your changes instantly as you write, with no need for manual compilation.
- **Modern Features**: Built-in support for references, equations, figures, and more—without the complexity of LaTeX or the formatting headaches of Word.
- **Cross-Platform**: Works on Windows, macOS, Linux, and in the browser.

## Why This Template?

- **Official UM Style**: Follows the University of Macau's thesis formatting guidelines.
- **Supports Doctoral & Master Theses**: Easily switch between thesis types with a single option.
- **Multilingual**: Supports English, Chinese, and Portuguese.
- **Customizable**: Clean code and modular layouts make it easy to adapt for your needs.
- **Ready-to-Use**: Includes cover pages, declarations, table of contents, lists of figures/tables/algorithms, and more.

---

## Usage

There are two ways to use this template in your Typst project.

### Online via Typst Webapp

Go to [the template's homepage on Typst Web App](https://typst.app/universe/package/modern-um-thesis) and click on `Create project in app`.

You can then start editing your document directly in the web interface.

### Locally via Typst Universe

Before proceeding, ensure you have Typst installed on your machine. You can download it from the [official Typst website](https://typst.app/open-source/#download) or install it via a package manager.

In your working directory, run:

```bash
typst init @preview/modern-um-thesis:0.1.1 my-thesis
```

This will create a new Typst project with the `modern-um-thesis` template set up under the directory `my-thesis`.

---

## Feedback & Contributions

Found a bug, have a suggestion, or want to contribute?

- Open an issue or pull request on [GitHub](https://github.com/ShabbyGayBar/modern-um-thesis/issues).
- For template-specific questions, please include your Typst version and a minimal code example.

---

**Happy writing, and good luck with your thesis!**

---

## Roadmap

- Global Settings
  - [x] LaTeX-style `documentclass` options for easy configuration
  - [ ] Blind review mode, replace personal info with black stripes, and hide acknowledgements
  - [x] Print mode, add margins to binding side
  - [x] Double sided mode, adjust margins for duplex printing
- Template Features
  - [x] Doctoral thesis
    - [x] Cover page
    - [x] Declaration page
    - [x] Abstract page
    - [x] Table of contents
    - [x] List of figures/tables
    - [x] References
    - [x] Appendices
    - Language Support
      - [x] English
      - [x] Chinese
      - [x] Portuguese
  - [x] Master's thesis
    - [x] Cover page
    - [x] Declaration page
    - [x] Abstract page
    - [x] Table of contents
    - [x] List of figures/tables
    - [x] References
    - [x] Appendices
  - [ ] Bachelor's thesis
  - [x] Symbol abbreviations for mathematical notation (i, e, pi, etc.)
  - [x] Lines for three line tables
- Documentation
  - [x] `main.typ` as template usage guide
  - [x] Documentation generated with `tidy`
  - [ ] Detailed documentation on correspondance with UM thesis guidelines

Have a feature request? Please open an issue or discussion!

---

## Acknowledgement

This template draws inspiration from the [modern-nju-thesis](https://github.com/nju-lug/modern-nju-thesis), the [modern-sjtu-thesis](https://github.com/tzhtaylor/modern-sjtu-thesis) repository, and the University of Macau's thesis guidelines. Special thanks to the [Typst](https://typst.app/) community and all contributors for their support and feedback.

--- 

## License

The university logo in the `src/assets` folder and the thesis guidelines in the `documentation/guidelines` folder are the property of the University of Macau.

The rest of the project is licensed under the [MIT License](LICENSE).
