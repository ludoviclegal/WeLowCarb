<?php

namespace App\Controller\Admin;

use App\Entity\IngredientCategory;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class IngredientCategoryCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return IngredientCategory::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
