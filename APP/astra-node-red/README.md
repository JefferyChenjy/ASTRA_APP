# OEE SYSTEM – GENERAL MANUAL INPUT

![Project Status](https://img.shields.io/badge/status-completed-brightgreen)
[![License](https://img.shields.io/badge/license-MIT-blue)](./LICENSE)

A comprehensive **Overall Equipment Effectiveness (OEE)** monitoring system built using **Node-RED 2.0**, integrating **manual input forms**, **automatic OEE calculation**, and **real-time visualization dashboards**.
This project provides a **universal Node-RED flow** adaptable for any **production line**, **machine type**, or **manufacturing environment**.

---

## **Project Overview**

This project simulates a **Manufacturing Data Collection System** that allows operators and engineers to input key production data, track losses, and automatically calculate **OEE (Availability, Performance, Quality)** in real-time.

It supports:

* Manual data entry via **Node-RED Dashboard 2.0**
* **Automatic OEE computation**
* **Integrated MySQL database storage**
* **Maintenance & downtime tracking**
* **Loss breakdown visualization**

Designed for flexible deployment across **any production process** — from **assembly lines** to **CNC operations**.

---

## **System Architecture**

### **Technologies Used**

* **Node-RED 2.0+**
* **MySQL Database**
* **Node-RED Dashboard 2.0**
* **Function Nodes (OEE Calculation)**
* **Inject / Change Nodes (Auto Save)**
* **Timestamp & Template Nodes**
* **Web UI – Form, Table, Chart, Gauge**

---

## **Demo**

### **Machine Work Order**

  <img src="https://github.com/user-attachments/assets/0c62a965-166f-4026-9471-2beebec5a603" alt="Production Input Dashboard" width="700" />

### **OEE Time Data**

  <img src="https://github.com/user-attachments/assets/36cc0737-8038-4e6f-8220-d374d1828960" alt="Loss Monitoring Dashboard" width="700" />

### **Production Result**

  <img src="https://github.com/user-attachments/assets/01697f77-237f-40bd-a9b6-32c141605801" alt="OEE Monitoring Dashboard" width="700" />

---

## **Setup Guide**

1. **Clone the Repository**

   ```sh
   git clone https://github.com/username/oee-node-red.git
   cd oee-node-red
   ```

2. **Install Node-RED**

   ```sh
   npm install -g node-red
   ```

3. **Import Node-RED Flow**

   * Open [http://localhost:1880](http://localhost:1880)
   * Import `oee-flow.json`
   * Deploy the flow

4. **Configure Database**

   * Setup MySQL Database
   * Update credentials in Node-RED MySQL Node

5. **Start the System**

   ```sh
   node-red
   ```

---

## **Usage**

1. Access the **Node-RED Dashboard** via [http://localhost:1880/ui](http://localhost:1880/ui)
2. Input production, machine, and work order data.
3. Observe **OEE calculations** update automatically.
4. View **Loss Breakdown** and **OEE trends**.
5. Record maintenance logs and downtime events in real time.

---

## **Project Status**

This project is **completed** and ready for deployment as a **universal OEE data collection system** in any manufacturing environment.

---

## **License**

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
