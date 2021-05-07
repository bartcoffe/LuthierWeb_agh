from django import template

register=template.Library()

@register.filter(name="get_dict_value_for_key")
def get_dict_value_for_key(dictionary, key):
    if dictionary.get(key)!=None:
        return dictionary.get(key)
    else :
        return 'image-not-available.jpg'

@register.filter(name="to_round_num")
def to_round_num(value):
    return str(int(value)) + '$'