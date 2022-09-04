# https://gitlab.com/jitesoft/dockerfiles/tesseract
FROM jitesoft/tesseract-ocr:20.04

RUN train-lang chi_sim --best && train-lang chi_tra --best && train-lang chi_sim_vert --best && train-lang chi_tra_vert --best
