from RequestTLV import *
from datetime import datetime
from uttlv import TLV

#Encode dummy user
firstDose = vaxDose(datetime(2021, 5, 5), 5)
secondDose = vaxDose(datetime(2021, 8, 5), 5)
user = DBUser("Eduardo", "Ortenblad", datetime(1999, 2, 20), 3, 1, [firstDose, secondDose])
request = DBRequest(requestType.POST, 0, user)
print("Encoding the following request:")
request.print()

#Decode uzer data from byte array
requestTLV = request.TlvEncode().to_byte_array()
decoded_request = DBRequest().TlvDecode(requestTLV)
print("\nDecoded Request:")
decoded_request.print()