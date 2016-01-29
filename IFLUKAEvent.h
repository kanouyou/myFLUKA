#ifndef IFLUKAEvent_HH
#define IFLUKAEvent_HH

#include <vector>
#include <TVector3.h>
#include <TObject.h>

namespace COMET
{ class IFLUKAEvent; }

class COMET::IFLUKAEvent : public TObject
{
  public:
    IFLUKAEvent();

    // deconstruct
    virtual ~IFLUKAEvent();

    // set particle pdgcode
    virtual void SetPdgCode(const int pdg) { fPdgCode = pdg; }

    // set particle position
    virtual void SetPosition(double x, double y, double z);

    // get pdgcode
    virtual int  GetPdgCode() const { return fPdgCode; }

    // get particle position
    virtual TVector3* GetPosition() const { return fPos; }

    ClassDef(COMET::IFLUKAEvent, 1);

  private:
    int fPdgCode;
    TVector3* fPos;

};

#endif
