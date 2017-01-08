# coding=utf-8
from setuptools import setup

setup(
    name="xonsh-vox-tabcomplete",
    version="0.4",
    license="MIT",
    url="https://github.com/Granitosaurus/xonsh-vox-tabcomplete",
    description="vox tabcomplete support for the Xonsh shell",
    author="Bernardas Ališauskas",
    author_email="bernardas.alisauskas@gmail.com",
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    zip_safe=False,
    classifiers=[
        "Development Status :: 4 - Beta",
        "Environment :: Console",
        "Environment :: Plugins",
        "Intended Audience :: End Users/Desktop",
        "Operating System :: POSIX",
        "Programming Language :: Python",
        "License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)",
    ]
)
