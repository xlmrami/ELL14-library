# ELL14 Rotational Mount Controller (MATLAB)

This repository provides a MATLAB class for controlling the **ELL14 rotational mount** via a serial port connection. The `ell14` class simplifies interaction with the mount, enabling you to rotate it, home it, change step precision, and assign device addresses.

## 🔌 Requirements

- ELL14 rotational mount connected via USB/serial
- Correct **COM port** (check Device Manager under "Ports (COM & LPT)")
- MATLAB R2019b or later

## 📁 Class: `ell14.m`

### Initialization

```matlab
port = 'COM3';              % Replace with actual COM port
mount = ell14(port);        % Instantiate the controller
```

### Main Methods

| Method                      | Description                                   |
|----------------------------|-----------------------------------------------|
| `setaddress(curr, new)`    | Set/change the device address                 |
| `rotate_foward()`          | Rotate mount forward                          |
| `rotate_Backward()`        | Rotate mount backward                         |
| `Home()`                   | Send the mount to home position               |
| `change_step(degree)`      | Change step size in degrees (e.g., 0.5°)      |

## 💡 Example Usage

```matlab
mount = ell14('COM3');          % Connect to the device
mount.setaddress(1, 2);         % Set address from 1 to 2
mount.rotate_foward();          % Rotate forward
mount.rotate_Backward();        % Rotate backward
mount.change_step(0.5);         % Set step size to 0.5 degrees
```

## ⚙️ Serial Settings

- Baud Rate: 9600
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Terminator: CR/LF

## 📬 Contact

Developed by **Rami Lameche**  
📧 xlmrami@gmail.com
