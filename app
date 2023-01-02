import openai
import streamlit as st
import os

# Autenticación de OpenAI (oculta la clave en una variable de entorno)
openai.api_key = os.environ.get("OPENAI_API_KEY")

def generate_article(title, outline):
  model_engine = "text-davinci-003"
  prompt = (f"Escribe un artículo titulado '{title}' basado en el siguiente esquema:\n{outline}")

  completions = openai.Completion.create(
      engine=model_engine,
      prompt=prompt,
      max_tokens=3024,
      n=1,
      stop=None,
      temperature=0.7,
  )

  article = completions.choices[0].text
  return article

st.title("Generador de artículos cortos")

title = st.text_input("Ingresa el título del artículo:")
outline = st.text_area("Ingresa el esquema del artículo:")

if st.button("Generar artículo"):
  article = generate_article(title, outline)
  st.success(article)
