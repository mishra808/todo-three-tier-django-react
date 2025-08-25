## Postgres Setup

#### 

```bash
psql postgres
\l ## to list databases
\du+ ## to list all users
 CREATE DATABASE django_todo_react with owner rahul;
 GRANT ALL PRIVILEGES ON DATABASE django_todo_react to rahul;
 psql -h localhost -p 5432 rahul -d django_todo_react
```
 ## Django Setup
```bash
django-admin startproject api
python manage.py startapp todo
python manage.py migrate
python manage.py runserver
```
#### Register todo Application

###### Open the backend/settings.py file in your code editor and add todo to the INSTALLED_APPS:

# Application definition

    INSTALLED_APPS = [
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'todo',
    ]

##### Open the todo/models.py file in your code editor and add the following lines of code:

    from django.db import models

    # Create your models here.

    class Todo(models.Model):
        title = models.CharField(max_length=120)
        description = models.TextField()
        completed = models.BooleanField(default=False)

        def _str_(self):
            return self.title

    ```bash
        python manage.py makemigrations todo
        python manage.py migrate todo
    ```

##### Open the todo/admin.py file with your code editor and add the following lines of code:

    from django.contrib import admin
    from .models import Todo

    class TodoAdmin(admin.ModelAdmin):
        list_display = ('title', 'description', 'completed')

    # Register your models here.

    admin.site.register(Todo, TodoAdmin)

    ```bash
        python manage.py createsuperuser
    ```

### Setting up APIs

    ```bash
        pip install djangorestframework django-cors-headers
    ```
    Open api/settings.py

    Add into INSTALLED_APPS

        'corsheaders',
        'rest_framework',
        'todo',
    Add into MIDDLEWARE

        'corsheaders.middleware.CorsMiddleware',
    
    Then, add these lines of code to the bottom of the backend/settings.py file:

        CORS_ORIGIN_WHITELIST = [
            'http://localhost:3000'
        ]

#### Creating Serializer 

    Create a todo/serializers.py file with your code editor. Open the serializers.py file and update it with the following lines of code:

        todo/serializers.py

            from rest_framework import serializers
            from .models import Todo

            class TodoSerializer(serializers.ModelSerializer):
                class Meta:
                    model = Todo
                    fields = ('id', 'title', 'description', 'completed')

#### Creating the View

    You will need to create a TodoView class in the todo/views.py file.

        from django.shortcuts import render
        from rest_framework import viewsets
        from .serializers import TodoSerializer
        from .models import Todo

        # Create your views here.

        class TodoView(viewsets.ModelViewSet):
            serializer_class = TodoSerializer
            queryset = Todo.objects.all()

#### Creating URLs

    Open the api/urls.py file with your code editor and replace the contents with the following lines of code:

        from django.contrib import admin
        from django.urls import path, include
        from rest_framework import routers
        from todo import views

        router = routers.DefaultRouter()
        router.register(r'todos', views.TodoView, 'todo')

        urlpatterns = [
            path('admin/', admin.site.urls),
            path('api/v1/todos/', include('todo.urls')),
        ]

## Creating FrontEnd

```bash
    npm create vite@latest frontend -- --template react
    cd frontend
    npm install
    npm run dev
```

    Next, install bootstrap and reactstrap to provide user interface tools.

    ```bash
      npm install bootstrap
      npm install react-bootstrap
    ```

#### checking container
docker exec -it -u root fb6f28d5b5eef8470ebb0bf6f09fb41c7b6a242252e7fddc4d306930886312b1 bash
