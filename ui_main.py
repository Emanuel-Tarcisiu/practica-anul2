import tkinter as tk
from tkinter import messagebox
import subprocess



def execute_option(option):
    if option == "Backup":
        result = subprocess.call(["./backups.sh", "/home/emy"])
    elif option == "Sync":
        result = subprocess.call(["./sync.sh"])
    elif option == "Cleanup":
        result = subprocess.call(["./cleanup.sh", "/home/emy"])
    elif option == "Updates":
        result = subprocess.call(["sudo", "./updates.sh"])
    elif option == "EXIT":
        print("Programul se va inchide in 3sec")
        window.after(3000, window.destroy)
        return


    if result == 0:
        messagebox.showinfo("Script Result", f"{option} script finished successfully!")
    else:
        messagebox.showerror("Script Result", f"{option} script encountered an error!")


window = tk.Tk()
window.title("Script Selector by Orsan")
window.geometry("400x400")


options = ["Backup", "Sync", "Cleanup", "Updates", "EXIT"]


for option in options:
    button = tk.Button(window, text=option, width=20, height=2,
                       command=lambda opt=option: execute_option(opt))
    button.pack(pady=5)


window.mainloop()