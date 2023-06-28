import tkinter as tk
from tkinter import messagebox, simpledialog
import subprocess

def execute_option(option):
    if option == "Backup":
        password = get_password()
        command = f"sudo ./backups.sh /home/emy {password}"
        result = subprocess.call(command, shell=True)
    elif option == "Sync":
        password = get_password()
        command = f"sudo ./sync.sh {password}"
        result = subprocess.call(command, shell=True)
    elif option == "Cleanup":
        password = get_password()
        command = f"sudo ./cleanup.sh /home/emy {password}"
        result = subprocess.call(command, shell=True)
    elif option == "Updates":
        password = get_password()
        command = f"sudo ./updates.sh {password}"
        result = subprocess.call(command, shell=True)
    elif option == "EXIT":
        print("Programul se va inchide in 3 secunde")
        window.after(3000, window.destroy)
        return

    if result == 0:
        messagebox.showinfo("Script Result", f"{option} script finished successfully!")
    else:
        messagebox.showerror("Script Result", f"{option} script encountered an error!")

def get_password():
    password = simpledialog.askstring("Password", "Enter your password:", show="*")
    return password

window = tk.Tk()
window.title("Script Selector by Orsan")
window.geometry("400x400")

options = ["Backup", "Sync", "Cleanup", "Updates", "EXIT"]

for option in options:
    button = tk.Button(
        window,
        text=option,
        width=20,
        height=3,
        command=lambda opt=option: execute_option(opt),
    )
    button.pack(pady=5)

window.mainloop()
