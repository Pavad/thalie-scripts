//::///////////////////////////////////////////////
//:: Magic Weapon
//:: X2_S0_MagcWeap
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Grants a +1 enhancement bonus.
*/
//:://////////////////////////////////////////////
//:: Created By: Andrew Nobbs
//:: Created On: Nov 28, 2002
//:://////////////////////////////////////////////
//:: Updated by Andrew Nobbs May 08, 2003
//:: 2003-07-07: Stacking Spell Pass, Georg Zoeller
//:: 2003-07-17: Complete Rewrite to make use of Item Property System


#include "x2_inc_spellhook"
#include "sh_classes_const"
#include "nwnx_funcs"
#include "sh_deity_inc"


void  AddAttackEffectToWeapon(object oMyWeapon, float fDuration)
{
   IPSafeAddItemProperty(oMyWeapon,ItemPropertyAttackBonus(1), fDuration, X2_IP_ADDPROP_POLICY_KEEP_EXISTING ,TRUE,TRUE);
   return;
}

void main()
{

    /*
      Spellcast Hook Code
      Added 2003-07-07 by Georg Zoeller
      If you want to make changes to all spells,
      check x2_inc_spellhook.nss to find out more

    */

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook



    //Declare major variables
    effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    int nDuration = GetCasterLevel(OBJECT_SELF);
    object oMyWeapon;
    int nMetaMagic = GetMetaMagicFeat();
    object oTarget = GetSpellTargetObject();
    nDuration = GetThalieCaster(OBJECT_SELF,oTarget,nDuration);
    // object oMyWeapon   =  IPGetTargetedOrEquippedMeleeWeapon();

    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration * 2; //Duration is +100%
    }
    if (GetClericDomain(OBJECT_SELF,1) ==DOMENA_KOV || GetClericDomain(OBJECT_SELF,2)==DOMENA_KOV)
    {
        nDuration = nDuration * 2; //Duration is +100%
    }

    oMyWeapon = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oTarget);
    if(GetIsObjectValid(oMyWeapon) )
    {
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));
        if (nDuration>0)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), HoursToSeconds(nDuration));
            AddAttackEffectToWeapon(oMyWeapon, TurnsToSeconds(nDuration));
        }

    }


    oMyWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oTarget);
    if(GetIsObjectValid(oMyWeapon) )
    {
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));
        if (nDuration>0)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), HoursToSeconds(nDuration));
            AddAttackEffectToWeapon(oMyWeapon, TurnsToSeconds(nDuration));
        }

    }


    oMyWeapon = GetItemInSlot(INVENTORY_SLOT_ARMS,oTarget);
    if(GetIsObjectValid(oMyWeapon) && GetBaseItemType(oMyWeapon) == BASE_ITEM_GLOVES )
    {
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));
        if (nDuration>0)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), HoursToSeconds(nDuration));
            AddAttackEffectToWeapon(oMyWeapon, TurnsToSeconds(nDuration));
        }

    }




}
