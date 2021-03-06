//::///////////////////////////////////////////////
//:: cl_cern_vvliv.nss
//:://////////////////////////////////////////////
//:: Cernokneznik -vabivy vliv
//::
//:://////////////////////////////////////////////
//:: Created By: Shaman88
//:: Created On: 25.6.2011
//:://////////////////////////////////////////////
#include "x0_i0_spells"
#include "sh_classes_inc"
void main()
{
    if (GetArcaneSpellFailure(OBJECT_SELF)> 20)
    {
        return;
    }
    //Declare major variables
    int iBonus = 6;
    effect eEf1 = EffectSkillIncrease(SKILL_BLUFF,iBonus);
    effect eEf2 = EffectSkillIncrease(SKILL_INTIMIDATE,iBonus);
    effect eEf3 = EffectSkillIncrease(SKILL_PERSUADE,iBonus);
    effect eLink = EffectLinkEffects(eEf1,eEf2);
    eLink = EffectLinkEffects(eLink,eEf3);
    SetEffectSpellId(eLink,EFFECT_CERNOKNEZNIK_VABIVY_VLIV);
    effect eImpact = EffectVisualEffect(VFX_IMP_PDK_GENERIC_HEAD_HIT);// Get VF
    effect eLoop=GetFirstEffect(OBJECT_SELF);
    while (GetIsEffectValid(eLoop))
    {
        if (GetEffectSpellId(eLoop)==EFFECT_CERNOKNEZNIK_VABIVY_VLIV)
        {
            SendMessageToPC(OBJECT_SELF,"Jiz na sobe mas bonus ze schopnosti vabivy vzhled.");
            return;
        }
        eLoop=GetNextEffect(OBJECT_SELF);
    }
    DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpact, OBJECT_SELF));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, HoursToSeconds(24));

}
