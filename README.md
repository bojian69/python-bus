# python-bus

## 项目配置

- Python 3.7+
- mysql5.7

## 项目结构

```bash
python-bus
├── app
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
├── config
│   ├── __init__.py
│   ├── settings 数据连接配置
│   ├── urls.py
│   ├── wsgi.py
├── manage.py
├── requirements
```

## 项目依赖

```bash
pip install -r requirements
```

## 数据库配置

```bash
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'HOST': '127.0.0.1',
        'PORT': '3306',
        'NAME': 'bus',
        'USER': 'root',
        'PASSWORD': 'xingzai-test',
        'OPTIONS': {
            'charset': 'utf8mb4'
        }
    }
}
```

## 数据库迁移

```bash
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic
```

## 启动项目

```bash
python3 manage.py runserver
```