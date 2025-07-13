# Vim Cheatsheet

*"Vim is for programmers who want to raise their game. In the hands of an expert, Vim shreds text at the speed of thought."*

---

- [Vim Cheatsheet](#vim-cheatsheet)
  - [🚀 Getting Started](#-getting-started)
    - [Baby Steps](#baby-steps)
  - [🏃‍♂️ Movement \& Navigation](#️-movement--navigation)
    - [Word by Word Movement](#word-by-word-movement)
    - [Character Search](#character-search)
    - [Line Movement](#line-movement)
    - [Vertical Movement](#vertical-movement)
    - [Search Movement](#search-movement)
    - [Counts \& Multipliers](#counts--multipliers)
    - [Semantic Movement](#semantic-movement)
    - [File Navigation](#file-navigation)
  - [✂️ Editing \& Operators](#️-editing--operators)
    - [Basic Operators](#basic-operators)
    - [Line Operators (Double Letter)](#line-operators-double-letter)
    - [Strong Operators (Capital Letters)](#strong-operators-capital-letters)
    - [Text Objects](#text-objects)
      - [Examples](#examples)
    - [Repeat Last Change](#repeat-last-change)
  - [📝 Character Editing](#-character-editing)
  - [⏪ Undo \& Redo](#-undo--redo)
  - [📥 Insert Mode](#-insert-mode)
    - [Entering Insert Mode](#entering-insert-mode)
    - [Insert Mode Shortcuts](#insert-mode-shortcuts)
  - [👁️ Visual Mode](#️-visual-mode)
    - [Visual Mode Types](#visual-mode-types)
    - [Visual Mode Workflow](#visual-mode-workflow)
  - [🔍 Search \& Replace](#-search--replace)
    - [Search on Next Match](#search-on-next-match)
  - [📋 Copying \& Pasting](#-copying--pasting)
    - [Basic Copy/Paste](#basic-copypaste)
    - [Named Registers](#named-registers)
  - [💻 Command-Line Mode](#-command-line-mode)
    - [File Operations](#file-operations)
    - [Range Operations](#range-operations)
    - [Command Ranges](#command-ranges)
    - [Substitute Command](#substitute-command)
      - [Flags](#flags)
  - [🪟 Windows \& Tabs](#-windows--tabs)
    - [Split Windows](#split-windows)
    - [Tabs](#tabs)
  - [🎯 Vim Surround](#-vim-surround)
    - [Surround Operations](#surround-operations)
      - [Examples](#examples-1)
  - [🏃‍♂️ Enhanced Movement Plugins](#️-enhanced-movement-plugins)
    - [Vim-sneak](#vim-sneak)
    - [EasyMotion](#easymotion)
  - [👥 Multiple Cursors](#-multiple-cursors)
    - [Search-Based](#search-based)
    - [Block Selection](#block-selection)
  - [🎬 Macros](#-macros)
    - [Recording \& Playback](#recording--playback)
  - [🔧 Advanced Ex Commands](#-advanced-ex-commands)
    - [Line Operations](#line-operations)
  - [🎮 Custom Mappings](#-custom-mappings)
    - [Insert Mode](#insert-mode)
    - [Normal Mode](#normal-mode)
  - [📚 VSCode-Specific Features](#-vscode-specific-features)
    - [Unique to VSCode](#unique-to-vscode)
  - [🔍 Text Objects Extensions](#-text-objects-extensions)
    - [Entire \& Arguments](#entire--arguments)
  - [💡 Tips \& Tricks](#-tips--tricks)
    - [Efficiency Tips](#efficiency-tips)
    - [Learning Strategy](#learning-strategy)
  - [🔗 References](#-references)

---

## 🚀 Getting Started

### Baby Steps
- `h` - Move cursor left
- `j` - Move cursor down
- `k` - Move cursor up
- `l` - Move cursor right
- `i` - Enter Insert mode
- `<ESC>` / `<C-C>` / `<C-[>` - Return to Normal mode

---

## 🏃‍♂️ Movement & Navigation

### Word by Word Movement
- `w` - Move to beginning of next word
- `b` - Move to beginning of previous word
- `e` - Move to end of next word
- `ge` - Move to end of previous word
- `W` - Move to beginning of next WORD (includes punctuation)
- `B` - Move to beginning of previous WORD
- `E` - Move to end of next WORD
- `gE` - Move to end of previous WORD

### Character Search
- `f{char}` - Find next occurrence of character
- `F{char}` - Find previous occurrence of character
- `t{char}` - Move to just before next occurrence of character
- `T{char}` - Move to just before previous occurrence of character
- `;` - Repeat last character search forward
- `,` - Repeat last character search backward

### Line Movement
- `0` - Move to first character of line
- `^` - Move to first non-blank character of line
- `$` - Move to end of line
- `g_` - Move to last non-blank character of line

### Vertical Movement
- `}` - Jump to next paragraph
- `{` - Jump to previous paragraph
- `<C-D>` - Move down half page
- `<C-U>` - Move up half page

### Search Movement
- `/{pattern}` - Search forward for pattern
- `?{pattern}` - Search backward for pattern
- `/` - Repeat last search forward
- `?` - Repeat last search backward
- `n` - Go to next search match
- `N` - Go to previous search match
- `*` - Search for word under cursor

### Counts & Multipliers
- `{count}{motion}` - Repeat motion count times
- `2w` - Jump 2 words forward
- `4f"` - Jump to 4th occurrence of "
- `3/cucumber` - Jump to 3rd match of "cucumber"

### Semantic Movement
- `gd` - Go to definition
- `gf` - Go to file (under cursor)

### File Navigation
- `gg` - Go to top of file
- `{line}gg` - Go to specific line
- `G` - Go to end of file
- `%` - Jump to matching bracket/parenthesis

---

## ✂️ Editing & Operators

```plain
{operator}{count}{motion}
```

### Basic Operators

- `d` - Delete
- `c` - Change (delete and enter insert mode)
- `y` - Yank (copy)
- `p` - Put (paste) after cursor
- `P` - Put (paste) before cursor
- `g~` - Switch case
- `>` - Shift right
- `<` - Shift left
- `=` - Format/indent

### Line Operators (Double Letter)

- `dd` - Delete line
- `cc` - Change line
- `yy` - Yank line
- `g~~` - Switch case of line
- `>>` - Shift line right
- `<<` - Shift line left
- `==` - Format line

### Strong Operators (Capital Letters)

- `D` - Delete from cursor to end of line
- `C` - Change from cursor to end of line
- `Y` - Yank line (same as `yy`)
- `P` - Put before cursor

### Text Objects

```plain
{operator}{a|i}{text-object}
```

- `w` - Word
- `s` - Sentence
- `p` - Paragraph
- `"` / `'` - Quoted text
- `(` / `)` / `b` - Parentheses block
- `{` / `}` / `B` - Braces block
- `[` / `]` - Brackets block
- `t` - HTML/XML tag

#### Examples

- `diw` - Delete inner word
- `daw` - Delete a word (including whitespace)
- `ci"` - Change inside quotes
- `da"` - Delete quoted text including quotes
- `cit` - Change inside HTML tag
- `dap` - Delete a paragraph

### Repeat Last Change

- `.` - Repeat last change

---

## 📝 Character Editing

- `x` - Delete character (like `dl`)
- `X` - Delete character before cursor (like `dh`)
- `s` - Change character (like `cl`)
- `~` - Switch case of character

---

## ⏪ Undo & Redo

- `u` - Undo last change
- `<C-R>` - Redo last undo
- `{count}u` - Undo last {count} changes

---

## 📥 Insert Mode

### Entering Insert Mode

- `i` - Insert before cursor
- `a` - Insert after cursor
- `I` - Insert at beginning of line
- `A` - Insert at end of line
- `o` - Insert new line below and enter insert mode
- `O` - Insert new line above and enter insert mode
- `gi` - Insert at last insert position

### Insert Mode Shortcuts

- `<C-H>` - Delete last character
- `<C-W>` - Delete last word
- `<C-U>` - Delete last line

---

## 👁️ Visual Mode

### Visual Mode Types

- `v` - Character-wise visual mode
- `V` - Line-wise visual mode
- `<C-V>` - Block-wise visual mode

### Visual Mode Workflow

1. Enter visual mode
2. Move to select text
3. Apply operator

---

## 🔍 Search & Replace

### Search on Next Match

- `{operator}gn` - Apply operator on next match
- `.` - Repeat last change on next match

---

## 📋 Copying & Pasting

### Basic Copy/Paste

- `y{motion}` - Yank text covered by motion
- `p` - Put after cursor
- `P` - Put before cursor
- `yy` - Copy line
- `Y` - Copy line
- `yyp` - Duplicate line
- `ddp` - Swap lines
- `xp` - Swap characters

### Named Registers

- `"ay{motion}` - Copy to register 'a'
- `"Ay{motion}` - Append to register 'a'
- `"ap` - Paste from register 'a'
- `"0` - Yank register (last yank)
- `"1-9` - Delete registers
- `"[a-z]` - Named registers
- `<C-R>a` - Paste from register 'a' in insert mode

---

## 💻 Command-Line Mode

### File Operations

- `:edit {file}` / `:e {file}` - Create/edit file
- `:write` / `:w` - Save file
- `:quit` / `:q` - Close file
- `:write!` / `:w!` - Force save
- `:quit!` / `:q!` - Close without saving
- `:wq` - Save and close
- `:wall` / `:wa` - Save all files
- `:qall` / `:qa` - Close all files
- `:wqall` / `:wqa` - Save and close all files
- `:qall!` / `:qa!` - Close all without saving

### Range Operations

- `:[range]delete [register]` - Delete lines into register
- `@:` - Repeat last ex command
- `@@` - Repeat last repeated command

### Command Ranges

- `:{start},{end}` - Line range (e.g., `:1,2d`)
- `:{start},+{offset}` - Start + offset (e.g., `:1,+2d`)
- `.` - Current line (e.g., `:.+2d`)
- `%` - Whole file (e.g., `:%d`)
- `0` - Beginning of file
- `$` - End of file
- `'<,'>` - Visual selection

### Substitute Command

```plain
:[range]s/{pattern}/{substitute}/[flags]
```

#### Flags

- `g` - Replace all matches in line
- `i` - Case insensitive
- `c` - Confirm each substitution

---

## 🪟 Windows & Tabs

### Split Windows

- `:sp {file}` - Open horizontal split
- `:vsp {file}` - Open vertical split
- `<C-W>s` - Split current file horizontally
- `<C-W>v` - Split current file vertically
- `<C-W>h` - Move to left split
- `<C-W>j` - Move to split below
- `<C-W>k` - Move to split above
- `<C-W>l` - Move to right split

### Tabs

- `:tabnew {file}` - Open file in new tab
- `:tabnext` / `:tabn` - Next tab
- `:tabprev` / `:tabp` - Previous tab
- `:tabonly` / `:tabo` - Close all other tabs

---

## 🎯 Vim Surround

### Surround Operations

- `ds{char}` - Delete surrounding characters
- `cs{old}{new}` - Change surrounding characters
- `ys{motion}{char}` - Add surrounding characters
- `S{char}` - Surround selection (in visual mode)

#### Examples

- `ds"` - Delete surrounding quotes
- `cs\*<em>` - Change surrounding `*` to `<em>` tags
- `ysiw"` - Surround word with quotes
- `S<p>` - Surround selection with `<p>` tags

---

## 🏃‍♂️ Enhanced Movement Plugins

### Vim-sneak

- `s{char}{char}` - Jump to next occurrence of two characters
- `S{char}{char}` - Jump to previous occurrence
- `;` - Next occurrence
- `,` - Previous occurrence
- `{op}z{char}{char}` - Apply operator with sneak motion

### EasyMotion

- `<leader><leader>w` - Start of words
- `<leader><leader>b` - Start of words backward
- `<leader><leader>bdw` - Start of words everywhere
- `<leader><leader>e` - End of words
- `<leader><leader>ge` - End of words backward
- `<leader><leader>j` - Beginning of lines
- `<leader><leader>k` - Beginning of lines backward
- `<leader><leader>f{char}` - Find character
- `<leader><leader>s{char}` - Search character everywhere

---

## 👥 Multiple Cursors

### Search-Based

- `<CMD-D>` / `<C-D>` / `gb` - Add cursor on next match
- `I` - Insert before multiple cursors
- `A` - Append after multiple cursors

### Block Selection

- `<C-V>` - Visual block mode
- Select with motions
- `I` - Insert before selection
- `A` - Append after selection

---

## 🎬 Macros

### Recording & Playback

- `q{register}` - Start recording macro
- `q` - Stop recording
- `@{register}` - Play macro
- `@@` - Repeat last macro

---

## 🔧 Advanced Ex Commands

### Line Operations

- `:[range]copy {address}` - Copy lines after address
- `:[range]move {address}` - Move lines after address
- `:[range]normal {commands}` - Apply normal commands to range
- `:execute "{command}"` - Execute string as command
- `:[range]global/{pattern}/{command}` - Execute command on matching lines
- `:[range]global!/{pattern}/{command}` - Execute command on non-matching lines

---

## 🎮 Custom Mappings

### Insert Mode

- `jk` - Go to normal mode

### Normal Mode

- `J` - Go down faster
- `K` - Go up faster
- `<leader>j` - Join lines
- `<leader>/` - Clear search highlight
- `<leader>w` - Save file
- `<leader>p` - Open command palette
- `<leader>t` - Go to symbol
- `<C-H>` - Move to left window
- `<C-J>` - Move to window below
- `<C-K>` - Move to window above
- `<C-L>` - Move to right window
- `<leader>tt` - Create new tab
- `<leader>tn` - Next tab
- `<leader>tp` - Previous tab
- `<leader>to` - Close other tabs

---

## 📚 VSCode-Specific Features

### Unique to VSCode

- `af` - Select increasingly larger text blocks
- `gh` - Hover (equivalent to mouse hover)
- `gb` - Add cursor on next matching word

---

## 🔍 Text Objects Extensions

### Entire & Arguments

- `dae` - Delete entire buffer
- `yae` - Yank entire buffer
- `cia` - Change function argument
- `daa` - Delete function argument with separator

---

## 💡 Tips & Tricks

### Efficiency Tips

1. Use `.` to repeat actions
2. Combine operators with text objects
3. Use counts to multiply actions
4. Search and operate with `gn`
5. Use visual mode for complex selections
6. Master `f`, `t`, `;`, and `,` for horizontal movement
7. Use `*` to search for word under cursor
8. Combine search with `.` for powerful find-and-replace

### Learning Strategy

1. Start with basic motions (`hjkl`, `w`, `b`, `e`)
2. Learn operators (`d`, `c`, `y`, `p`)
3. Master text objects (`iw`, `aw`, `i"`, `a"`, etc.)
4. Practice operator + text object combinations
5. Add counts and more complex motions
6. Gradually incorporate plugins and advanced features

---

## 🔗 References

- [Cheatsheet](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/cheatsheet/)
- [VSCodeVim Extension](https://github.com/VSCodeVim/Vim)
