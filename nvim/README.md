A neovim configuration created with the aim of optimising the workflow. 
```text
NOTE: When editing C projects with the current neovim configuration, it is recommended to use bear to generate compile_commands.json, and not to delete the .cache directory with previously indexed files.    

ALSO: the configuration stores manually preconfigured lsp servers. To ensure they work correctly, make sure you have the required dependencies (pyright and clang) installed
and a version of nvim higher than v0.11.
```

### Startup speed of nvim for Python files:
```text
--- Startup times for process: Embedded ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.001  000.001: --- NVIM STARTING ---
116.583  003.763: first screen update
116.586  000.002: --- NVIM STARTED ---
```

### Startup speed of nvim for C files:

```text
--- Startup times for process: Embedded ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.001  000.001: --- NVIM STARTING ---
067.352  003.360: first screen update
067.353  000.002: --- NVIM STARTED ---
```
