<?php

namespace App\Controller\Admin;

use App\Entity\ReceipeCategory;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ReceipeCategoryCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return ReceipeCategory::class;
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
