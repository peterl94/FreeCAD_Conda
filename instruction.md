## INSTALL MINICONDA:

- first get miniconda: http://conda.pydata.org/miniconda.html choose python3 (it's not necessary, you could also choose python2 but you can have a python2 env anyway)
- install miniconda: bash <miniconda-file>.sh (not as root!!!)
- at the end of the install it will ask you if you want to add the anaconda-dir to the $PATH, say yes.
- if you do not want anaconda to be the default python open the ~/.bashrc and edit the new line:
    -from this: __export PATH="path_to_anaconda/bin:$PATH"__
    -to this: __alias initConda='export PATH="path_to_anaconda/bin:$PATH" '__
    this way conda isn't perpended by default. As soon as you call "initConda" python will be the anaconda version.



## INSTALL FREECAD

- first we have to add some channels to get all the necesarry packages:
  - you can add them one by one with: conda config --add channels <name>
  - or you can open the ~/.condarc and add them directly to this file
at the end this file have to look like this.
__open ~.condarc with a editor and make the channels section look like this__

```
channels:
  - conda-forge
  - defaults
  - freecad
```

 - the channels hosting this libraries:
    - freecad: freecad, coin, pivy, boost, occt, ...
    - conda-forge: pyside, shiboken, ...



### CREATE A NEW ENV
- type in terminal: __initConda__ (now the "conda" command should be available)
- create an env: __conda create -n env-name freecad__ # with <env-name> is the name of the env, eg. fc_test
    (this will install all necessary packages needed to run FreeCAD)
- at the end of this process a short statement is printed how to activate the new env.: source activate <env-name>

- start freecad: FreeCAD

Most likely there will be some library linking errors... If you encounter one of these, pleasecreate a new issue at: https://github.com/looooo/FreeCAD_Conda/issues


##TESTING AND DEBUGGING
This section is for testing new branches, or your own implementations/additions of Freecad with conda. This is nice, because conda gives us a nice way to gather all the sources we need to build FreeCAD. No need to download all the necessary libraries which have conflicts all over. Simple use the develop branch of this repo and follow this instruction:


- git clone https://github.com/looooo/FreeCAD_Conda # this branch
- git checkout develop
- go to FreeCAD_Conda/FreeCAD/build.sh and modify the FREECAD_SOURCE Variable at the top of the document

- in the terminal go to FreeCAD_Conda/FreeCAD/
- conda build . --python=3.5  # or 2.7

when you have an error you can go to the build directory something like
~/miniconda3/conda-bld/FreeCAD_123423342/work
- source activate . # to activate the build enviroment
- make # to build again

you can also use the --dirty flag but this will run cmake again, so there are more things getting rebuild
in the build directory you can also use cmake-gui.