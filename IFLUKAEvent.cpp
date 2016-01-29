#include "IFLUKAEvent.h"

ClassImp(COMET::IFLUKAEvent)

COMET::IFLUKAEvent::IFLUKAEvent()
    : fPdgCode(0), fPos(new TVector3())
{}

COMET::IFLUKAEvent::~IFLUKAEvent()
{
  delete fPos;
}

void COMET::IFLUKAEvent::SetPosition(double x, double y, double z)
{
  fPos->SetXYZ(x, y, z);
}
