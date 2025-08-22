from django.shortcuts import render
from rest_framework import generics
from .serializers import TodoSerializer
from .models import Todo

# Create your views here.

class ListTodo(generics.ListCreateAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer


class DetailTodo(generics.RetrieveUpdateDestroyAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer