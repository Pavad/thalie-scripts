//::///////////////////////////////////////////////
//:: cl_cern_eslept
//:://////////////////////////////////////////////
/*
   Cernokneznik - leptava esence
*/
//:://////////////////////////////////////////////
//:: Created By: Shaman88
//:: Created On:

//:://////////////////////////////////////////////
#include "sh_classes_inc"
void main()
{
    if (GetArcaneSpellFailure(OBJECT_SELF)> 20)
    {
        return;
    }
    object oSaveItem = GetSoulStone(OBJECT_SELF);
    SetLocalInt(OBJECT_SELF,ULOZENI_CERNOKNEZNIK_TYP_ESENCE,ESENCE_LEPTAVA);
    SendMessageToPC(OBJECT_SELF,"Tajemny vybuch tvori leptava esence.");

}
