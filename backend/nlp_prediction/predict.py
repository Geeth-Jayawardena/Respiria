import numpy as np  # linear algebra
import tensorflow as tf
from tensorflow import keras
import matplotlib.pyplot as plt
import seaborn as sns
import librosa as lb
import librosa.display as lbd
from sklearn.preprocessing import LabelEncoder
import tensorflow.keras.backend as K
import decimal
from re import split

d_list = ['Asthma', 'Bronchiectasis', 'Bronchiolitis',
          'COPD', 'Healthy', 'LRTI', 'Pneumonia', 'URTI']

net = keras.models.load_model("ml/data/MLModel")


def getFeatures(path):
    soundArr, sample_rate = lb.load(path)
    mfcc = lb.feature.mfcc(y=soundArr, sr=sample_rate)
    cstft = lb.feature.chroma_stft(y=soundArr, sr=sample_rate)
    mSpec = lb.feature.melspectrogram(y=soundArr, sr=sample_rate)

    return mfcc, cstft, mSpec


def get_value(f):
    ctx = decimal.Context()
    ctx.prec = 50
    d1 = ctx.create_decimal(repr(f))
    dl = format(d1, 'f')
    dl = split("^0\.(0*)", dl)
    return int(dl[-1][0])


def normalize(x, newRange=(0, 1)):
    xmin, xmax = np.min(x), np.max(x)
    norm = (x - xmin)/(xmax - xmin)

    if newRange == (0, 1):
        return (norm)
    elif newRange != (0, 1):
        return norm * (newRange[1] - newRange[0]) + newRange[0]


def get_prediction(file_url):
    mfcc, cstft, mSpec = [], [], []

    a, b, c = getFeatures(file_url)
    mfcc.append(a)
    cstft.append(b)
    mSpec.append(c)

    mfcc_val = np.array(mfcc)
    cstft_val = np.array(cstft)
    mSpec_val = np.array(mSpec)

    pred = net.predict(
        {"mfcc": mfcc_val, "croma": cstft_val, "mspec": mSpec_val})
    pred = [get_value(p) for p in pred.flatten()]
    pred = np.round(normalize(pred, newRange=(0, 7))).astype(int)
    return {
        'status': 200,
        'prediction': d_list[pred[0]]
    }
