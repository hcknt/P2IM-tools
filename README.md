# P2IM Tools

Enhanced tools for [P2IM](https://github.com/RiS3-Lab/p2im) (Peripheral Interface Modeling) firmware fuzzing automation.

## Files

### setup_fuzzing.sh

Automated setup script for P2IM real firmware fuzzing campaigns.

**Features:**
- Automatically sets up fuzzing environments for [all real firmwares](https://github.com/RiS3-Lab/p2im-real_firmware/tree/master/binary)
- Creates individual tmux sessions for each firmware (isolated working directories)
- Copies firmware binaries, seed files, and configuration templates
- Configures `fuzz.cfg` based on firmware requirements

### fuzz.py

**New options:**

#### `--resume`

Resume previous fuzzing session using AFL's `-i-` option.

#### `--reset`

Reset fuzzing environment while preserving essential files.

**Preserved files:**
- `inputs/`
- `fuzz.cfg`
- Firmware ELF binary

**Removed files:**
- `outputs/` directory (AFL results)
- Model instantiation directories (`0/`, `1/`, etc.)
- Log files (`me.log`)
- Scripts (`run_fw.py`)
- Core dump files (`core.*`)

## Requirements / Notes

- The default `REPO_PATH` is set to `/opt/p2im`, so make sure to update it according to your environment before running.
- GNU Arm Embedded Toolchain at `/opt/p2im/gcc-arm-none-eabi-10.3-2021.10/`
- tmux