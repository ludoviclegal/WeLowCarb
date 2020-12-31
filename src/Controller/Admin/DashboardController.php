<?php

namespace App\Controller\Admin;

use App\Entity\Unit;
use App\Entity\Opinion;
use App\Entity\Receipe;
use App\Entity\Allergen;
use App\Entity\Ingredient;
use App\Entity\UnitCategory;
use App\Entity\ReceipeCategory;
use App\Entity\IngredientCategory;
use App\Entity\ReceipeHasIngredient;
use App\Entity\IngredientHasAllergen;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Controller\Admin\AllergenCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Router\CrudUrlGenerator;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        return parent::index();
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('WeLowCarb')
        ;
    }

    public function configureMenuItems(): iterable
    {
        return [
            MenuItem::linktoDashboard('Tableau de bord', 'fa fa-home'),

            //MenuItem::section('Recettes'),
            MenuItem::subMenu('Recettes', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Recettes', 'fa fa-tags', Receipe::class),
                MenuItem::linkToCrud('Catégories de recettes', 'fa fa-tags', ReceipeCategory::class),
            ]),

            MenuItem::subMenu('Ingrédients', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Catégories d\'ingrédients', 'fa fa-tags', IngredientCategory::class),
                MenuItem::linkToCrud('Ingrédients', 'fa fa-tags', Ingredient::class),
                MenuItem::linkToCrud('Allergènes', 'fa fa-tags', Allergen::class),
            ]),

            MenuItem::subMenu('Unités', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Unités', 'fa fa-tags', Unit::class),
                MenuItem::linkToCrud('Catégories d\'unité', 'fa fa-tags', UnitCategory::class),
            ]),

            MenuItem::subMenu('Divers', 'fa fa-article')->setSubItems([
                MenuItem::linkToCrud('Avis', 'fa fa-tags', Opinion::class),
            ]),
            
        ];
    }
}
