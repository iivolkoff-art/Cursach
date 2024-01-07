#include "ServerStruct.h"
#include<QHostAddress>


ServerData::ServerData() : ip(QHostAddress("127.0.0.1")), port(55555)
{

}

