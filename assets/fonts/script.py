
#:usr/bin/python3
#:autor Saidino
import os
import re
import json
from time import sleep
dir=os.path.abspath(__file__)#os.path.abspath()))
print(dir)
def cls(t:int):
    if 'y' in input('cls ?').lower():
        os.system('clear')

def generate_comple():
    print(dir)
    print(os.path.abspath(__file__))
    print(os.path.exists('stocky'))
    cls(2)

    fonts={}

    for folder in os.listdir('.'):
        not_ext=['.txt','.json','.py']
        dont_scan=['Righteous','Sacramento','Ubuntu','Fuggles']
        if os.path.isdir(folder) and folder not in dont_scan :
            print(folder)
            sleep(1)
            _fonxt=[]

            for file in os.listdir(folder):
                sleep(1)
                if file.endswith('.ttf'):
                    # rename_file_with_rgx(file)

                    root_=os.path.join(folder,file)
                    print(root_)
                    input('>>>>>>')
                    renamed=rename_manual(root_)
                    _fonxt.append(renamed)
            fonts[folder]=_fonxt
    print(fonts)
    js_ob=json.dumps(fonts,indent=4)
    with open('done.json','w') as dada:
        dada.write(js_ob)
        print('write done !!!')


    cls(2)

def rename_file_with_rgx(filena):
    renamed=re.sub(r"\(\)?x-","_",filena)
    print(f'{filena}  = {renamed}')
def rename_manual(filename):
    renamed=filename.replace(' ','_').replace('-','_').replace(' ','_').replace('(','_').replace(')','_').replace('_',"").lower()
    print(filename+" = "+renamed)
    try:
        rename =os.rename(filename,renamed)
        return renamed.split('/')[-1]
    except Exception as e:
        print(e)






'''
{
'fontname':'urgauy','fonts':['otstts.ttf','font-bolder.ttf']
}

'''
generate_comple()
print('rename done')
os.system('sl')
dados=['ana','xico','jels']
print(dados[-1])
