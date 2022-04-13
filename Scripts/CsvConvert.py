import csv
from unicodedata import name
from RequestTLV import *
from datetime import datetime

def csvRowToUser(csv_row):
    firstName = ""
    lastName = ""
    DoB = datetime(1971, 1, 1)
    vaxStatus = 0
    UID = 0
    curr_dose = vaxDose(0, 0)
    vaxDoses = []
    for i in range(len(csv_row)):
        if(len(csv_row[i]) == 0):
            continue
        if i == 0:
            UID = int(csv_row[i])
        elif i == 1:
            firstName = csv_row[i]
        elif i == 2:
            lastName = csv_row[i]
        elif i == 3:
            portions = csv_row[i].split('-')
            DoB = datetime(int(portions[0]), int(portions[1]), int(portions[-1]))
        elif i == 4:
            vaxStatus = int(csv_row[i])
        elif i >= 5 and i%2 == 1:
            curr_dose.type = int(csv_row[i])
        elif i >= 6 and i%2 == 0:
            portions = csv_row[i].split('-')
            curr_dose.date = datetime(int(portions[0]), int(portions[1]), int(portions[-1]))
            vaxDoses.append(vaxDose(curr_dose.date, curr_dose.type))
    return DBUser(firstName, lastName, DoB, vaxStatus, UID, vaxDoses)

def csvToDBUsers(filename):
    with open(filename) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        line_count = 0
        dbUsers = []
        for row in csv_reader:
            if line_count == 0:
                line_count += 1
            else:
                user = csvRowToUser(row)
                dbUsers.append(user)
                line_count += 1
        return dbUsers

if __name__ == "__main__":
    users = csvToDBUsers('database_cheatsheet.csv')
    print("Users Found:")
    for user in users:
        user.print()