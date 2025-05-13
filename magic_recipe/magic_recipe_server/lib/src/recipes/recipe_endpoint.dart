import "dart:async";

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:magic_recipe_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RecipeEndpoint extends Endpoint 
{
  Future<Recipe> generateRecipe(Session session, String ingredients) async
  {
    final geminiApikey = session.passwords['gemini'];

    if (geminiApikey == null)
    {
      throw Exception("Gemini API key not found!");
    }

    final gemini = GenerativeModel(
      model: "gemini-1.5-flash-latest",
      apiKey: geminiApikey,
    );

    final prompt = 
    'Generate a recipe using the following ingredients: $ingredients, always put the title'
    'of the recipe in the first line and then the instructions. The recipe should be easy'
    'to follow anbd include all necessary steps. Please provide a detailed recipe.';

    final response = await gemini.generateContent([Content.text(prompt)]);

    final responseText = response.text;

    if (responseText == null || responseText.isEmpty)
    {
      throw Exception('No response from Gemini API');
    }

    final recipe = Recipe(
      author: "Gemini",
      text: responseText,
      date: DateTime.now(),
      ingredients: ingredients,
    );

    return recipe;
  }
}