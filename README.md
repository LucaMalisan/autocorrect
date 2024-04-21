# Half-Automatic Autocorrector

This AutoHotkey Project lets you use a customizable auto-corrector. 

How to use:
- Detect a typo
- Mark the misspelled word
- Press the shortcut you set for ``openGUI``. If nothing happens, the word is already registered. In this case, press the shortcut defined for ``replaceTextUnderCursor``
- Enter the correct word in the input field that was opened
- Press the shortcut defined for ``saveAndclose``

How to install:
- Download Autohotkey Software v2.0 from https://www.autohotkey.com/ or search in the Windows Store for "AutoHotkey v2 Store Edition"
- Set your own Key Combinations here:

https://github.com/LucaMalisan/autocorrect/blob/78185e653cd8336b54e0d58221ad754814b49072/Autocorrect.ahk#L57-L59

- Compile Autocorrect.ahk to an .exe using Autohotkey Software (AutoHotkey Dash -> Compile). Make sure to use or use v2.x.x as Base File. 
Alternatively, you can use the .exe appended to the latest version (https://github.com/LucaMalisan/autocorrect/releases)
- Make sure to use the typos.ahk file form this repository and to store it in the same place as the .exe 
