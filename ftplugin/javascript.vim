" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint', "prettier"]

" Enable ESLint only for JavaScript.
let b:ale_linters = ['eslint', "prettier"]
