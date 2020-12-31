<?php
// src/Controller/LuckyController.php
namespace App\Controller;

use App\Entity\Receipe;
use App\Entity\ReceipeHasIngredient;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

//use Symfony\Component\HttpClient\HttpClient;
//use Symfony\Component\HttpClient\CurlHttpClient;

class ReceipeController extends AbstractController
{
    /**
     * @Route("/receipe/", name="receipe_list")
     */
    public function list(Request $request)
    {
        $allAttributes = $request->attributes->all();

        return $this->render('receipe/list.html.twig', [
        ]);
    }

    /**
     * @Route("/receipe/{id}", name="receipe_show")
     */
    public function show(int $id): Response
    {
        $receipeRepository = $this->getDoctrine()->getRepository(Receipe::class);
        $receipe = $receipeRepository->find($id);
        $ingredientRepository = $this->getDoctrine()->getRepository(ReceipeHasIngredient::class);
        $ingredients = $ingredientRepository->findBy([
            'receipe' => $receipe
        ]);

        return $this->render('receipe/show.html.twig', [
            'receipe' => $receipe,
            'ingredients' => $ingredients,
        ]);
    }
}