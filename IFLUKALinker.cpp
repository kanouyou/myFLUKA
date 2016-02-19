#include "IFLUKALinker.h"

COMET::IFLUKALinker::IFLUKALinker()
{
  fFile = new TFile("output.root", "recreate");
  fTree = new TTree("tree", "Monte Carlo Output");
  fTree->Branch("Event", "COMET::IFLUKAEvent", &fEvent, 64000, 1);
}

COMET::IFLUKALinker::~IFLUKALinker()
{
  delete fEvent;
}

void COMET::IFLUKALinker::Fill(int& pdg, double& x, double& y, double& z)
{
  if (fEvent) {
    delete fEvent;
    fEvent = NULL;
  }

  fEvent = new IFLUKAEvent();
  fEvent->SetPdgCode(pdg);
  fEvent->SetPosition(x, y, z);
  fTree->Fill();
}

void COMET::IFLUKALinker::Close()
{
  if (fEvent) {
    delete fEvent;
    fEvent = NULL;
  }

  fTree->Write();
  fFile->Close();
}
