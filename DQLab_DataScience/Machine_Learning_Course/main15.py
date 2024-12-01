import streamlit as st
import pandas as pd
import pickle
import time
from PIL import Image

st.set_page_config(page_title="Halaman Modelling", layout="wide")
st.write("""
# Welcome to my machine learning dashboard

This dashboard created by : [@abelkristanto](https://www.linkedin.com/in/abelkristanto/)
""")
add_selectitem = st.sidebar.selectbox("Want to open about?", ("Iris species!", "Heart Disease!"))

def iris():
    st.write("""
    This app predicts the **Iris Species**
    
    Data obtained from the [iris dataset](https://www.kaggle.com/uciml/iris) by UCIML. 
    """)
    st.sidebar.header('User Input Features:')
    # Collects user input features into dataframe
    uploaded_file = st.sidebar.file_uploader("Upload your input CSV file", type=["csv"])
    if uploaded_file is not None:
        input_df = pd.read_csv(uploaded_file)
    else:
        def user_input_features():
            st.sidebar.header('Input Manual')
            SepalLengthCm = st.sidebar.slider('Sepal Length (cm)', 4.3,10.0,6.5)
            SepalWidthCm = st.sidebar.slider('Sepal Width (cm)', 2.0,5.0,3.3)
            PetalLengthCm = st.sidebar.slider('Petal Length (cm)', 1.0,9.0,4.0)
            PetalWidthCm = st.sidebar.slider('Petal Width (cm)', 0.1,5.0,1.4)
            data = {'SepalLengthCm': SepalLengthCm,
                    'SepalWidthCm': SepalWidthCm,
                    'PetalLengthCm': PetalLengthCm,
                    'PetalWidthCm': PetalWidthCm}
            features = pd.DataFrame(data, index=[0])
            return features
    
    input_df = user_input_features()
    img = Image.open("iris.JPG")
    st.image(img, width=500)
    if st.sidebar.button('Predict!'):
        df = input_df
        st.write(df)
        with open("model_iris.pkl", 'rb') as file:  
            loaded_model = pickle.load(file)
        prediction = loaded_model.predict(df)
        result = ['Iris-setosa' if prediction == 0 else ('Iris-versicolor' if prediction == 1 else 'Iris-virginica')]
        st.subheader('Prediction: ')
        output = str(result[0])
        with st.spinner('Wait for it...'):
            time.sleep(4)
            st.success(f"Prediction of this app is {output}")
            
def heart():
    st.write("""
    This app predicts the **Heart Disease**
    
    Data obtained from the [Heart Disease dataset](https://archive.ics.uci.edu/dataset/45/heart+disease) by UCIML. 
    """)
    st.sidebar.header('User Input Features:')
    # Collects user input features into dataframe
    uploaded_file = st.sidebar.file_uploader("Upload your input CSV file", type=["csv"])
    if uploaded_file is not None:
        input_df = pd.read_csv(uploaded_file)
    else:
        def user_input_features():
            st.sidebar.header('Manual Input')
            cp = st.sidebar.slider('Chest pain type', 1,4,2)
            if cp == 1.0:
                wcp = "Nyeri dada tipe angina"
            elif cp == 2.0:
                wcp = "Nyeri dada tipe nyeri tidak stabil"
            elif cp == 3.0:
                wcp = "Nyeri dada tipe nyeri tidak stabil yang parah"
            else:
                wcp = "Nyeri dada yang tidak terkait dengan masalah jantung"
            st.sidebar.write("Jenis nyeri dada yang dirasakan oleh pasien", wcp)
            thalach = st.sidebar.slider("Maximum heart rate achieved", 71, 202, 80)
            slope = st.sidebar.slider("Kemiringan segmen ST pada elektrokardiogram (EKG)", 0, 2, 1)
            oldpeak = st.sidebar.slider("Seberapa banyak ST segmen menurun atau depresi", 0.0, 6.2, 1.0)
            exang = st.sidebar.slider("Exercise induced angina", 0, 1, 1)
            ca = st.sidebar.slider("Number of major vessels", 0, 3, 1)
            thal = st.sidebar.slider("Hasil tes thalium", 1, 3, 1)
            sex = st.sidebar.selectbox("Jenis Kelamin", ('Perempuan', 'Pria'))
            if sex == "Perempuan":
                sex = 0
            else:
                sex = 1 
            age = st.sidebar.slider("Usia", 29, 77, 30)
            data = {'cp': cp,
                    'thalach': thalach,
                    'slope': slope,
                    'oldpeak': oldpeak,
                    'exang': exang,
                    'ca':ca,
                    'thal':thal,
                    'sex': sex,
                    'age':age}
            features = pd.DataFrame(data, index=[0])
            return features
    
    input_df = user_input_features()
    img = Image.open("heart-disease.jpg")
    st.image(img, width=500)
    if st.sidebar.button('Predict!'):
        df = input_df
        st.write(df)
        with open("generate_heart_disease.pkl", 'rb') as file:  
            loaded_model = pickle.load(file)
        prediction = loaded_model.predict(df)        
        result = ['No Heart Disease' if prediction == 0 else 'Yes Heart Disease']
        st.subheader('Prediction: ')
        output = str(result[0])
        with st.spinner('Wait for it...'):
            time.sleep(4)
            st.success(f"Prediction of this app is {output}")

if add_selectitem == "Iris species!":
    iris()
elif add_selectitem == "Heart Disease!":
    heart()

