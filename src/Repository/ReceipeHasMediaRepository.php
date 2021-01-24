<?php

namespace App\Repository;

use App\Entity\ReceipeHasMedia;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ReceipeHasMedia|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReceipeHasMedia|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReceipeHasMedia[]    findAll()
 * @method ReceipeHasMedia[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReceipeHasMediaRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReceipeHasMedia::class);
    }

    // /**
    //  * @return ReceipeHasMedia[] Returns an array of ReceipeHasMedia objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ReceipeHasMedia
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
