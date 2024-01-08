#ifndef INTERFACENETWORKCHECKER_H
#define INTERFACENETWORKCHECKER_H

class InterfaceNetworkChecker {
public:
    virtual bool check() = 0;
};

Q_DECLARE_INTERFACE(InterfaceNetworkChecker, "InterfaceNetworkChecker")

#endif // INTERFACENETWORKCHECKER_H
