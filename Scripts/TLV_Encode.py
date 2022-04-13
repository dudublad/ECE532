from RequestTLV import *
from datetime import datetime
from uttlv import TLV

firstDose = vaxDose(datetime(2021, 5, 5), 5)
secondDose = vaxDose(datetime(2021, 8, 5), 5)
user = DBUser("Eduardo", "Ortenblad", datetime(1999, 2, 20), 3, 1, [firstDose, secondDose])
request = DBRequest(requestType.POST, 0, user)

request.print()
requestTLV = request.TlvEncode()
print([hex(z)[2:] for z in requestTLV.to_byte_array()])
input("Press Enter to continue...")