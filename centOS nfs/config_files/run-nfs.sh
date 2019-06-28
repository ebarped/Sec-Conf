#!/bin/bash
stunnel
mount --bind /exports_real/export_staff /exports/export_staff
mount --bind /exports_real/export_workers /exports/export_workers
rpcbind
exportfs -ar
rpc.nfsd
rpc.mountd --foreground



