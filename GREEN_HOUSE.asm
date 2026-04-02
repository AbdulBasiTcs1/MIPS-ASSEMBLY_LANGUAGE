##################################################
# Name   : ABDUL BASIT
# Uni    : COMSATS UNIVERSITY ISLAMABAD, ATTOCK CAMPUS
# Program: #1 - The Smart Greenhouse
# Desc   : Turn ON cooling fan if temperature > 30
##################################################

.text
.globl main

main:
    # Imagine $s0 holds the temperature sensor reading
    # Let's pretend the sensor says 35°C
    li   $s0, 35          # Load temperature = 35 into $s0

    # slt = "Set Less Than"
    # $t1 = 1 if $s0 < 30, else $t1 = 0
    slti $t1, $s0, 31   # Is temperature <= 30?

    # If $t1 == 1, temperature is COOL, jump to FAN_OFF
    bne  $t1, $zero, FAN_OFF

FAN_ON:
    li   $t0, 1            # Fan = ON (too hot!)
    j    DONE

FAN_OFF:
    li   $t0, 0            # Fan = OFF (temperature is fine)

DONE:
    # Exit program gracefully
    li   $v0, 10
    syscall