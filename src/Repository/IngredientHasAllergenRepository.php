<?php

namespace App\Repository;

use App\Entity\IngredientHasAllergen;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method IngredientHasAllergen|null find($id, $lockMode = null, $lockVersion = null)
 * @method IngredientHasAllergen|null findOneBy(array $criteria, array $orderBy = null)
 * @method IngredientHasAllergen[]    findAll()
 * @method IngredientHasAllergen[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class IngredientHasAllergenRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, IngredientHasAllergen::class);
    }

    // /**
    //  * @return IngredientHasAllergen[] Returns an array of IngredientHasAllergen objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('i.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?IngredientHasAllergen
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
