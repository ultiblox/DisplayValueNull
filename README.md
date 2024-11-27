# UltiBlox DisplayValueNull Library

*Provides no-operation (no-op) implementations of display methods for scenarios without a display.*

[UltiBlox on GitHub](https://github.com/UltiBlox/DisplayValueNull) | [UltiBlox Home](https://ultiblox.org)

## Overview

The `DisplayValueNull` library implements the same method signatures as the `DisplayValueLCD` and `DisplayValueOLED` libraries but performs no actions. This allows seamless substitution of `DisplayValueNull` when no display is required, without altering display-related code in your project.

## Features

- Implements all display functions with no-op (no operation) behavior.
- Allows code to be display-agnostic, reducing the need for conditional display checks.

## Compatibility

This library is compatible with the `DisplayValueLCD` and `DisplayValueOLED` libraries, offering interchangeable functionality for LCD, OLED, and "no display" setups.

## Installation

### Option 1: Arduino Library Manager Installation (Recommended)

1. Open the **Arduino IDE**.
2. Go to **Tools > Manage Libraries**.
3. Search for **UltiBlox-DisplayValueNull** and click **Install**.
4. Access example sketches under **File > Examples > UltiBlox-DisplayValueNull**.

### Option 2: Manual Installation (for Development and Customization)

1. **Clone the Repository**:

   ```bash
   git clone git@github.com:UltiBlox/DisplayValueNull.git ~/workspace/DisplayValueNull
   cd ~/workspace/DisplayValueNull
   ```

2. **Prepare the Environment**:
   Run the `prepare.sh` script to set up dependencies:

   ```bash
   bash prepare.sh
   ```

3. **Install the Library**:

   - **Copy Installation**:

     ```bash
     bash install.sh
     ```
   - **Symlink Installation** (for active development):

     ```bash
     bash install-symlink.sh
     ```

4. **Build Examples**:
   Compile example sketches with:

   ```bash
   bash build.sh
   ```

## License

[This project is licensed under the UltiBlox License.](https://ultiblox.org/license)
