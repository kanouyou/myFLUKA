#ifndef IFLUKAEvent_HH
#define IFLUKAEvent_HH

#include <vector>
#include <TObject.h>

namespace COMET
{ class IFLUKAEvent; }

class COMET::IFLUKAEvent
{
  public:
    IFLUKAEvent();
    ~IFLUKAEvent();

    // set event number
    void SetEventNum(int num) { fEventNum = num; }

    // get event number
    double GetEventNum() const { return fEventNum; }

    ClassDef(COMET::IFLUKAEvent, 1);

  private:
    int fEventNum;
};

#endif
