#ifndef FIELDS_H
#define FIELDS_H

#include <QString>

class Fields
{
public:
    QString  data;
    virtual bool isValid(){return false;}
};

class CheckBoxField : Fields
{
public:
    CheckBoxField(QString  Data){this->data = Data;}

    virtual bool isValid() override
    {
        return (this->data == "2");//2 means Qt.Checked
    }
};

class OptionalField : Fields
{
public:
    OptionalField(QString  Data){this->data = Data;}
    virtual bool isValid() override
    {
        return true;
    }
};

class MandatoryField : Fields
{
public:
    MandatoryField(QString Data){this->data = Data;}

    virtual bool isValid() override
    {
        return !(this->data.isEmpty());
    }
};

class ComboboxField : Fields
{
public:
    ComboboxField(QString Data){this->data = Data;}
    virtual bool isValid() override
    {
        if(!(this->data == "0"))
            return true;
        else
        {
            return false;
        }
    }
};

#endif // FIELDS_H
