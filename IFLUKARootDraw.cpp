#ifndef IFLUKARootDraw_HH
#define IFLUKARootDraw_HH

#include <iostream>
#include <TFile.h>
#include <TTree.h>
#include "IFLUKAEvent.h"

static TFile* fFile = NULL;
static TTree* fTree = NULL;
static COMET::IFLUKAEvent* fEvent = NULL;

extern "C" {
  void openfile_();
  void filefill_(int &pdg, double &x , double &y , double &z,
                           double &px, double &py, double &pz);
  void fileclose_();
}

void openfile_()
{
  fFile = new TFile("output.root", "recreate");
  fTree = new TTree("tree", "Monte Carlo Output");
  // open a branch and initialize the stored class
  fTree->Branch("Event", "COMET::IFLUKAEvent", &fEvent, 64000, 1);

  std::cout << "Note: Root Tree file has been opened!!" << std::endl;
}

void filefill_(int &pdg, double &x , double &y , double &z,
                         double &px, double &py, double &pz)
{
  // if IFLUKAEvent exists, delete it
  if (fEvent) {
    delete fEvent;
    fEvent = NULL;
  }

  fEvent = new COMET::IFLUKAEvent();
  fEvent->SetPdgCode(pdg);
  fEvent->SetPosition(x, y, z);
  fTree->Fill();
}

void fileclose_()
{
  if (fEvent) {
    delete fEvent;
    fEvent = NULL;
  }
  fTree->Write();
  fFile->Close();
}

#endif
