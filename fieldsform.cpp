#include <QObject>
#include "fields.h"
#include <vector>
#include <QString>
#include "fieldsform.h"




bool FieldsForm::isFormValid()
{
    if (notValidCount ==0 )
        return true;
    else
        return false;
}



bool FieldsForm::isFieldValid(QString fieldData, int fType, bool isUsed)
{
    switch (fType) {
    case OPTIONALFIELD:
    {
        if(!isUsed)
        {
            OptionalField tmpField("");

            return tmpField.isValid();
        }
        else
        {
            OptionalField tmpField(fieldData);

            return tmpField.isValid();
        }
    }
    case MANDATORYFIELD:
    {
        if(!isUsed)
        {            
            MandatoryField tmpField("");
            ++notValidCount;
            return tmpField.isValid();
        }
        else
        {
            MandatoryField tmpField(fieldData);
            if (!tmpField.isValid())
                    ++notValidCount;
            return tmpField.isValid();
        }
    }
    case COMBOBOXFIELD:
    {
        if(!isUsed)
        {
            ComboboxField tmpField("1");
            ++notValidCount;
            return tmpField.isValid();
        }
        else
        {
            ComboboxField tmpField(fieldData);
            if (!tmpField.isValid())
                    ++notValidCount;
            return tmpField.isValid();
        }
    }
    case CHECKBOXFIELD:
    {
        if(!isUsed)
        {
            CheckBoxField tmpField("false");
            ++notValidCount;
            return tmpField.isValid();
        }
        else
        {
            CheckBoxField tmpField(fieldData);
            if (!tmpField.isValid())
                    ++notValidCount;
            return tmpField.isValid();
        }
    }
    }
}

void FieldsForm::resetNotValidCount()
{
    notValidCount = 0;
}
