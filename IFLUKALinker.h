#ifndef IFLUKALinker_HH
#define IFLUKALinker_HH

#include <TFile.h>
#include <TTree.h>
#include "IFLUKAEvent.h"

namespace COMET
{ class IFLUKALinker; }

class COMET::IFLUKALinker
{
  public:
    IFLUKALinker();
    ~IFLUKALinker();
    void Fill(int&, double&, double&, double&);
    void Close();

  private:
    TFile* fFile;
    TTree* fTree;
    COMET::IFLUKAEvent* fEvent;
};

#endif
