.. image:: https://img.shields.io/badge/dmtn--301-lsst.io-brightgreen.svg
   :target: https://dmtn-301.lsst.io
.. image:: https://github.com/lsst-dm/dmtn-301/workflows/CI/badge.svg
   :target: https://github.com/lsst-dm/dmtn-301/actions/

#################################################################################
Using Felis to Represent the Semantics and Metadata of Astronomical Data Catalogs
#################################################################################

DMTN-301
========

Data catalogs are a fundamental part of modern astronomical research, allowing scientists to view, search, and filter data according to their requirements. Tabular data models described by SQL Data Definition Language (DDL) are a common way to represent such catalogs. However, DDL does not provide a way to describe the semantics of the data, such as the meaning of a data column, units of measurement, or the relationships between columns. The International Virtual Observatory Alliance (IVOA) has developed several standards in this area, including VOTable and Table Access Protocol (TAP), which are widely used within astronomy for representing such information.

The Data Engineering group of the Vera C. Rubin Observatory has developed a data description language and toolset, Felis, for defining the semantics of its Science Data Model schemas, which represent its public-facing data catalogs. Felis uses a rich Pydantic data model for describing and validating catalog metadata, represented as a human-readable and -editable YAML format. Felis provides a Python library and application for working with these data models. The metadata is used to populate the TAP_SCHEMA tables for the IVOA TAP services that power the table UI of the Rubin Science Platform (RSP). The toolset is also being used to assist in data migrations and will be utilized in testing the conformance of LSST data products to the data model. Felis's current capabilities will be discussed, as well as recent developments and future plans.

Links
=====

- Live drafts: https://dmtn-301.lsst.io
- GitHub: https://github.com/lsst-dm/dmtn-301

Build
=====

This repository includes lsst-texmf_ as a Git submodule.
Clone this repository::

    git clone --recurse-submodules https://github.com/lsst-dm/dmtn-301

Compile the PDF::

    make

Clean built files::

    make clean

Updating acronyms
-----------------

A table of the technote's acronyms and their definitions are maintained in the `acronyms.tex` file, which is committed as part of this repository.
To update the acronyms table in ``acronyms.tex``::

    make acronyms.tex

*Note: this command requires that this repository was cloned as a submodule.*

The acronyms discovery code scans the LaTeX source for probable acronyms.
You can ensure that certain strings aren't treated as acronyms by adding them to the `skipacronyms.txt <./skipacronyms.txt>`_ file.

The lsst-texmf_ repository centrally maintains definitions for LSST acronyms.
You can also add new acronym definitions, or override the definitions of acronyms, by editing the `myacronyms.txt <./myacronyms.txt>`_ file.

Updating lsst-texmf
-------------------

`lsst-texmf`_ includes BibTeX files, the ``lsstdoc`` class file, and acronym definitions, among other essential tooling for LSST's LaTeX documentation projects.
To update to a newer version of `lsst-texmf`_, you can update the submodule in this repository::

   git submodule update --init --recursive

Commit, then push, the updated submodule.

.. _lsst-texmf: https://github.com/lsst/lsst-texmf
