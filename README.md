# ECG-based-Biometric-Authentication


## Overview

* Dataset Used: [PhysioBank](https://physionet.org/physiobank/database/#ecg)
* The electrocardiogram (ECG) is an emerging novel biometric approach for human identification. The ECG is unique to an individual, with benefits such as resilience to replay attacks and spoofing.
* ORS Complex is an important characteristic of ECG Signals.
![alt text](https://res.mdpi.com/sensors/sensors-16-00570/article_deploy/html/images/sensors-16-00570-g007.png "QRS")
* Firstly, I contributed to the development of an algorithm to identify ECG uniquely. I used AD8232 ECG sensor to acquire ECG Signals in real-time.
* Then, my team acquired Digital ECG Signals of 50 individuals and stored them using Serial Communication (MATLAB).
* This was followed by the Signal Preprocessing step for noise reduction. Finally, Classification methods were used for pattern recognition. Additionally, I developed a C# based Folder Locker and executed MATLAB Script for ECG Authentication

### Stages of Authentication

![alt text](https://www.researchgate.net/profile/Yogendra_Singh21/publication/258404446/figure/fig2/AS:668912215666694@1536492508277/Schematic-of-ECG-enabled-biometric-authentication-system.png "ECG Auth")
