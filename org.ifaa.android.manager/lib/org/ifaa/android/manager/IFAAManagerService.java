package org.ifaa.aidl.manager;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
/* loaded from: classes.dex */
public interface IFAAManagerService extends IInterface {
    String getDeviceModel() throws RemoteException;

    int getEnabled(int i) throws RemoteException;

    String getExtInfo(int i, String str) throws RemoteException;

    int[] getIDList(int i) throws RemoteException;

    int getSupportBIOTypes() throws RemoteException;

    int getVersion() throws RemoteException;

    byte[] processCmd(byte[] bArr) throws RemoteException;

    void setExtInfo(int i, String str, String str2) throws RemoteException;

    int startBIOManager(int i) throws RemoteException;

    /* loaded from: classes.dex */
    public static abstract class Stub extends Binder implements IFAAManagerService {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, "org.ifaa.aidl.manager.IfaaManagerService");
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i != 1598968902) {
                switch (i) {
                    case 1:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        int supportBIOTypes = getSupportBIOTypes();
                        parcel2.writeNoException();
                        parcel2.writeInt(supportBIOTypes);
                        return true;
                    case 2:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        int startBIOManager = startBIOManager(parcel.readInt());
                        parcel2.writeNoException();
                        parcel2.writeInt(startBIOManager);
                        return true;
                    case 3:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        String deviceModel = getDeviceModel();
                        parcel2.writeNoException();
                        parcel2.writeString(deviceModel);
                        return true;
                    case 4:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        byte[] createByteArray = parcel.createByteArray();
                        byte[] processCmd = processCmd(createByteArray);
                        parcel2.writeNoException();
                        parcel2.writeByteArray(processCmd);
                        parcel2.writeByteArray(createByteArray);
                        return true;
                    case 5:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        int version = getVersion();
                        parcel2.writeNoException();
                        parcel2.writeInt(version);
                        return true;
                    case 6:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        String extInfo = getExtInfo(parcel.readInt(), parcel.readString());
                        parcel2.writeNoException();
                        parcel2.writeString(extInfo);
                        return true;
                    case 7:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        setExtInfo(parcel.readInt(), parcel.readString(), parcel.readString());
                        parcel2.writeNoException();
                        return true;
                    case 8:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        int enabled = getEnabled(parcel.readInt());
                        parcel2.writeNoException();
                        parcel2.writeInt(enabled);
                        return true;
                    case 9:
                        parcel.enforceInterface("org.ifaa.aidl.manager.IfaaManagerService");
                        int[] iDList = getIDList(parcel.readInt());
                        parcel2.writeNoException();
                        parcel2.writeIntArray(iDList);
                        return true;
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                }
            } else {
                parcel2.writeString("org.ifaa.aidl.manager.IfaaManagerService");
                return true;
            }
        }
    }
}
