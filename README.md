## OOD TensorBoard

This [Tensorboard](https://www.tensorflow.org/tensorboard) OnDemand app runs through an authenticating reverse proxy.

### About
TensorBoard normally starts on a defined port and requires no authentication.
Anyone that can access the compute node by ssh can then also access TensorBoard.
TensorBoard uses [Werkzeug](https://werkzeug.palletsprojects.com/en/2.0.x/), which supports Unix sockets, but this functionality is not made available by TensorBoard as passing a Unix socket as host makes it crash when trying to parse the URL for printing it to the user.

After patching `tensorboard/program.py` with `template/tensorboard.patch`, TensorBoard on an Unix socket is fully functional and can be launched as `tensorboard --host=unix:///path/to/socket`.
We can then use a Nginx reverse proxy to the Unix socket that checks that the authentication cookie is correct.
This way we can have a fully authenticated TensorBoard available through OOD.


