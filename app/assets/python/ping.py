import psycopg2

import os
import time
import datetime
import glob
import RPi.GPIO as GPIO

sensor = 4

GPIO.setmode(GPIO.BCM)
GPIO.setup(sensor, GPIO.IN, GPIO.PUD_DOWN)

previous_state = False
current_state = False
new_state = "OPENTEST"
date = datetime.datetime.strftime(datetime.datetime.now(), '%Y-%m-%d %H:%M:%S')

while True:
    time.sleep(0.1)
    previous_state = current_state
    current_state = GPIO.input(sensor)
    if current_state != previous_state:
        new_state = "BUSY" if current_state else "OPEN"
        date = datetime.datetime.strftime(datetime.datetime.now(), '%Y-%m-%d %H:%M:%S')
        #date = "2014-05-26T18:54:59-05:00"
    #date = date
    con = psycopg2.connect("dbname='ddacpc4ubccjh3' user='ibfnutsuvnkjkm' host='ec2-184-73-254-144.compute-1.amazonaws.com' password='dr6LSFUfpA8L_X6BQAXdMxUkhs'")
    curs = con.cursor()

    curs.execute("INSERT INTO sensors (status, date_time, created_at, updated_at) VALUES (%s, %s, %s, %s)",(new_state, date, date, date))
    print('DATABASE UPDATED')
    print(new_state, date)

    con.commit()

    con.close()