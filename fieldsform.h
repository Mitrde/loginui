#ifndef FIELDSFORM_H
#define FIELDSFORM_H
#include <QObject>
#include "fields.h"
#include <vector>
#include <string>

class FieldsForm : public QObject
{
    Q_OBJECT
public:
    enum fieldsType{
        OPTIONALFIELD,
        MANDATORYFIELD,
        CHECKBOXFIELD,
        COMBOBOXFIELD
    };
    //explicit FieldsForm(QObject *parent = nullptr);
    Q_INVOKABLE bool isFormValid();

    Q_INVOKABLE bool isFieldValid(QString  fieldData,int fType,bool isUsed);
    Q_INVOKABLE void resetNotValidCount();


private:   

    int notValidCount = 0;

};

#endif // FIELDSFORM_H
