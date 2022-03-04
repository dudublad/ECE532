# This is a sample Python script.
import connection

host = '1.1.X.1'
port = 5000

new_connection = connection.Connection(host=host, port=port)

msg = "abcdefghijkl"
new_connection.add_message(msg=msg, save_img=False)

# option 1: send bin matrix directly
new_connection.send_bin_matrix(selection=2)

# option 2: image to bin matrix and send
img = new_connection.get_img_path() # ignore this if you have used the add_message function
new_connection.image_to_bin_matrix(img_path=img)
new_connection.send_bin_matrix(selection=2)

# option 3: send image directly (under construction)
new_connection.send_image(img_path=img, selection=1)