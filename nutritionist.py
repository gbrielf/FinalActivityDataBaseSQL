from django.db import models
from .consultant import Consultant
from .contract import Contract

class Diet(models.Model):

    objective = models.CharField(max_length=100)
    date = models.DateField()
    is_active = models.BooleanField(default=True)
    nutritionist = models.ForeignKey(Consultant, on_delete=models.CASCADE, related_name='diets')
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE, related_name='diet')

    def __str__(self):

        return f"Dieta do {self.contract.client.user.first_name} com o objetivo de {self.objective} com começo no dia {self.date}"

class Meals(models.Model):

    name = models.CharField(max_length=50)
    schedule = models.IntegerField(choices=[
        (1, 'Café da manhã'),
        (2, 'Lanche da manhã'),
        (3, 'Almoço'),
        (4, 'Lanche da tarde'),
        (5, 'Jantar'),
        (6, 'Ceia'),
    ],)
    diet = models.ManyToManyField(Diet, related_name='meals')

    def __str__(self):

        return self.name

class MealItem(models.Model):

    name = models.CharField(max_length=50)
    weight = models.FloatField()  # Weight in grams
    portion = models.FloatField()  # Portion size in grams
    meal = models.ManyToManyField(Meals, related_name='items')

    def __str__(self):

        return self.name