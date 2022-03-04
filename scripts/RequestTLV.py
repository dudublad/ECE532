from enum import Enum
from unittest import case
from uttlv import TLV
import datetime

class RequestTlvType(Enum):
    Header = 0x01
    Body = 0x02

class UserTlvType(Enum):
    UID = 0x00
    FirstName = 0x01
    LastName = 0x02
    DoB = 0x03
    VaxStatus = 0x04
    FirstDose_Vax = 0x05
    FirstDose_Date = 0x06
    SecondDose_Vax = 0x07
    SecondDose_Date = 0x08
    ThirdDose_Vax = 0x09
    ThirdDose_Date = 0x0a

class requestType(Enum):
    GET = 0x01
    POST = 0x02
    PUT = 0x03
    DELETE = 0x04
    Response = 0x05

vax_status_dict = {
    1: "Unvaccinated",
    2: "Partially Vaccinated",
    3: "Fully Vaccinated"
}

vax_type_dict = {
    1: "AstraZenca",
    2: "Bharat Biotech",
    3: "Janssen",
    4: "Moderna",
    5: "Pfizer-BioNTech",
    6: "Sinopharm BIBP",
    7: "Sinovac",
    8: "Other"
}


class vaxDose:
    def __init__(self, date, type):
        self.date = date
        self.type = type

class DBUser:
    def __init__(self, firstName = None, lastName = None, DoB = None, vaxStatus = None, UID = None, vaxDoses = []):
        self.UID = UID
        self.firstName = firstName
        self.lastName = lastName
        self.DoB = DoB
        self.vaxStatus = vaxStatus
        self.vaxDoses = vaxDoses
    
    def TlvEncode(self):
        userTLV = TLV()
        if self.UID:
            userTLV[UserTlvType.UID.value] = self.UID
        userTLV[UserTlvType.FirstName.value] = self.firstName
        userTLV[UserTlvType.LastName.value] = self.lastName
        userTLV[UserTlvType.DoB.value] = int(self.DoB.timestamp())
        userTLV[UserTlvType.VaxStatus.value] = bytes([self.vaxStatus])
        for i in range(len(self.vaxDoses)):
            userTLV[UserTlvType.FirstDose_Vax.value + 2*i] = bytes([self.vaxDoses[i].type])
            userTLV[UserTlvType.FirstDose_Date.value + 2*i] = int(self.vaxDoses[i].date.timestamp())
        return userTLV

    def TlvDecode(self, tlv_array):
        #Clear current data
        self.__init__()

        userTLV = TLV()
        userTLV.parse_array(tlv_array)
        self.vaxDoses = []
        for type in userTLV:
            if type == UserTlvType.UID.value:
                self.UID = int.from_bytes(userTLV[type], "big")
            elif type == UserTlvType.FirstName.value:
                self.firstName = str(userTLV[type].decode("utf-8"))
            elif type == UserTlvType.LastName.value:
                self.lastName = str(userTLV[type].decode("utf-8"))
            elif type == UserTlvType.DoB.value:
                self.DoB = datetime.datetime.fromtimestamp(int.from_bytes(userTLV[type], "big"))
            elif type == UserTlvType.VaxStatus.value:
                self.vaxStatus = int.from_bytes(userTLV[type], "big")
        for i in range(3):
            if (UserTlvType.FirstDose_Vax.value + 2*i) in userTLV and (UserTlvType.FirstDose_Date.value + 2*i) in userTLV:
                vax_date = datetime.datetime.fromtimestamp(int.from_bytes(userTLV[UserTlvType.FirstDose_Date.value + 2*i], "big"))
                vax_type = int.from_bytes(userTLV[UserTlvType.FirstDose_Vax.value + 2*i], "big")
                self.vaxDoses.append(vaxDose(vax_date, vax_type))
        return self
            

    def print(self):
        print("DBUser")
        print("UID: %d" % self.UID)
        print("First Name: %s" % self.firstName)
        print("Last Name: %s" % self.lastName)
        print("Date of Birth: %s" % str(self.DoB.date()))
        print("Vaccination Status: %s" % vax_status_dict[self.vaxStatus])
        for i in range(len(self.vaxDoses)):
            print("Dose %d Date = %s" % (i+1, str(self.vaxDoses[i].date.date())))
            print("Dose %d Type = %s" % (i+1, vax_type_dict[self.vaxDoses[i].type]))
        



class DBRequest:
    def __init__(self, requestType = None, statusCode = None, user = DBUser()):
        self.requestType = requestType
        self.statusCode = statusCode
        self.userData = user

    def TlvEncode(self):
        assert(self.statusCode != None and self.requestType != None)

        requestTLV = TLV()
        requestTLV[RequestTlvType.Header.value] = bytes([self.statusCode, self.requestType.value])
        requestTLV[RequestTlvType.Body.value] = self.userData.TlvEncode()
        return requestTLV

    def TlvDecode(self,tlv_array):
        #Clear out all members
        self.__init__()

        requestTLV = TLV()
        requestTLV.parse_array(tlv_array)
        for type in requestTLV:
            if type == RequestTlvType.Header.value:
                assert(len(requestTLV[type]) == 2)
                self.statusCode = requestTLV[type][0]
                self.requestType = requestType(requestTLV[type][1])
            if type == RequestTlvType.Body.value:
                self.userData = DBUser().TlvDecode(requestTLV[type])
        return self

    def print(self):
        print("DBRequest")
        print("HEADER:")
        print("Request Type = %s" % self.requestType.name)
        print("Status Code = %d" % self.statusCode)
        print("BODY:")
        self.userData.print()