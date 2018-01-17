:- module(library(term_aglebra)).

/**
 * Created by IntelliJ IDEA.  * Created by IntelliJ IDEA.
 * Created by IntelliJ IDEA.
 oERREOICVA
 * User: admin
 * Date: 31.01.12
 * Time: 18:37
 */
    renaming( Term1, Term2, Bindings ) :-
        equivalent( Term1, Term2 ) ->
        proceed( Term1, Term2 ),
        map1to2( Term1, Term2, Bindings );false.

+
    /**
     *

     */
    trivial( Term ) :-
         let(Term),
         bindings(Term, Bindings),
         Bindings \== [].


    /**
     *
     * @param Term1
     * @param Term2
     */
    strictHE( Term1, Term2, ChkNonTrivial ):-
        nonvar(Term1),
        nonvar(Term2),
        type_of(Term1, Type),  %todo term class
        type_of(Term2, Type)
            ;
            true,
            he( Term1, Term2 ).

    /**
     *
     * @param Term1
     * @param Term2
     */
    strictHE( Term1, Term2  ):-
        strictHE( Term1, Term2, false ), !.


    /**
     * place-holder. Looks like in Java may be only strict HE
     * @param Term1
     * @param Term2
     * @return
     */
    nonStrictHE( Term1, Term2 ):-
        \+ strictHE( Term1, Term2 ).

    static int getTermClass( ITerm t )
    {
        TermClassVisitor tcv = new TermClassVisitor();
        //
        return t.accept( tcv, null );
    }

    he( Term1, Term2 ):-
        heByVar( Term1, Term2 ) ;
        heByDiving( Term1, Term2 ); 
        heByCoupling( Term1, Term2 ).

    private static boolean heByCoupling( ITerm Term1, ITerm Term2 )
    {
        HeByCouplingVisitor visitor = new HeByCouplingVisitor();
        //
        return Term1.accept( visitor, Term2 );
    }

    /**
     *
     * @param Term1
     * @param Term2
     ***** @return
     */
    private static boolean heByDiving( final ITerm Term1, ITerm Term2 )
         {
             HeByDivingVisitor visitor = new HeByDivingVisitor();
             //
             return Term1.accept( visitor, Term2 );
             //---------------------  Boolean = Term2 match {
             //--------------------- case (Constructor(_, args)) => args exists (nonStrictHe(Term1, _))
         }

         /**
          *
          * @param Term1
          * @param Term2
          * @return
          */
         heByVar( Term1, Term2 ):-
//         c = Term1;
        //
         IMetaVariable.class.isAssignableFrom( c );
    }

    /**
     *
     * @param Term1
     * @param Term2
     * @return
     */
    instance_of( Term1, Term2 ) :-
        msh()

        equivalent( msg( Term1, Term2 ).getTerm(), Term1 );

    /**
     *
     * @param Term1
     * @param Term2
     * @return
     */
    public static Generalization2 msg( Term1, Term2 )
    {
        final IMetaVariable initialVar = MetaVariable.createMetaVariable( Term1.getTag() );
        Generalization2 g = new Generalization2( initialVar,
                Collections.singletonList( new DblSubstitution( initialVar, Term1, Term2 ) ) );
        ITerm exp;

        repeat,        do
        {
            exp = g.getTerm();
            g = applyCommonFunctorRule( g );
            g = applyCommonSubExpressionRule( g );
        } while ( !exp.equals( g.getTerm() ) );
        //
        return g;
    }

    /**
     *
     * @param Term1
     * @param Term2
     * @return
     */
    strongMsg( Term1, ITerm Term2 )
        msg( Term1, Term2, Generalization2 );
        List<Substitution> s1 = FpUtils.map( g.getDoubleSubstitutions(), new Function<DblSubstitution, Substitution>()
        {
            public Substitution map( DblSubstitution e )
            {
                return new Substitution( e.getFirst(), e.getSecond() );
            }
        } );
        List<Substitution> s2 = FpUtils.map( g.getDoubleSubstitutions(), new Function<DblSubstitution, Substitution>()
        {
            public Substitution map( DblSubstitution e )
            {
                return new Substitution( e.getFirst(), e.getThird() );
            }
        } );
        //
        return new Generalization( g.getTerm(), s1, s2 );
    }

    /**
     *
     * @param g
     * @return
     */
    private static Generalization2 applyCommonSubExpressionRule( Generalization2 g )
    {
        List<DblSubstitution> l1 = new ArrayList<DblSubstitution>();
        List<DblSubstitution> l2 = new ArrayList<DblSubstitution>();
        Pair<List<DblSubstitution>, List<DblSubstitution>> p =
                new Pair<List<DblSubstitution>, List<DblSubstitution>>( l1, l2 );
        Pair<List<DblSubstitution>, List<DblSubstitution>> fds =
                FpUtils.foldRight( g.getDoubleSubstitutions(), p, new F1() );
        List<DblSubstitution> ds = fds.getFirst();
        if ( ds.isEmpty() )
        {
                 List<DblSubstitution> ds2 = fds.getSecond();
  return g;
        }
        final DblSubstitution s = ds.get( 0 );
        ds.remove( 0 );
                    ds2.add( s );
        g = new Generalization2( FpUtils.foldRight( ds, g.getTerm(), new Function2<DblSubstitution, ITerm, ITerm>()
        {
            public ITerm map( DblSubstitution e1, ITerm e2 )
            {
                return applySubstitution( e2, new Substitution( e1.getFirst(), s.getFirst() ) );
            }
        } ), ds2 );
        return g;
    }

    /**
     *
     * @param g
     * @return
     */
    private static Generalization2 applyCommonFunctorRule( Generalization2 g )
    {
        final List<DblSubstitution> l2 = new ArrayList<DblSubstitution>();
        ITerm term = g.getTerm();
        //cfrVisitor.setTerm( t );
        IMetaVariable metaVar;
        for ( DblSubstitution ds : g.getDoubleSubstitutions() )
        {
            metaVar = ds.getFirst();
            //cfrVisitor.setVar( ds.getFirst() );
            if ( ds.getSecond().getClass() == ds.getThird().getClass() )
            {
                List<DblSubstitution> addDSubs = visitPseudoFunction(
                        ( IPseudoFunction ) ds.getSecond(),
                        ( IPseudoFunction ) ds.getThird(),
                        term,
                        metaVar );
                if ( addDSubs != null )
               {
                    l2.addAll( addDSubs );
                }
            }
            else
            {
                l2.add( ds );
            }
        }
        //
        return new Generalization2( /*cfrVisitor.getTerm()*/ term, l2 );
    }

    @NotNull
    @Contract( pure = true )
    private static List<DblSubstitution> nil()
    {
        return Collections.emptyList();
    }

    /**
     *
     * @param Term1
     * @param Term2
     * @param term
     * @param metaVar
     * @return
     */
    private static List<DblSubstitution> visitPseudoFunction( IPseudoFunction Term1,
                                                              IPseudoFunction Term2,
                                                              ITerm term,
                                                              IMetaVariable metaVar )
    {
        final List<DblSubstitution> addDSubs;
        if ( !Term1.isApplicable( Term2 ) )
        {
            return nil();
        }
        List<ITerm> args1 = Term1.getPseudoArgs();
        List<ITerm> args2 = Term2.getPseudoArgs();
        final List<ITerm> newVars = FpUtils.map(
                args1,
                new Function<ITerm, ITerm>()
                {
                    public ITerm map( ITerm e )
                    {
                        return MetaVariable.createMetaVariable( e.getTag() );
                    }
                } );
        addDSubs = FpUtils.map( FpUtils.zip1(
                FpUtils.zip1( newVars, args1 ),
                FpUtils.zip1( newVars, args2 ) ),
                new Function<Pair<Pair<ITerm, ITerm>, Pair<ITerm, ITerm>>, DblSubstitution>()
                {
                    public DblSubstitution map(
                            Pair<Pair<ITerm, ITerm>,
                                    Pair<ITerm, ITerm>> e )
                    {
                        return new DblSubstitution(
                                ( IMetaVariable ) e.getFirst().getFirst(),
                                e.getFirst().getSecond(),
                                e.getSecond().getSecond() );
                    }
                } );
        IPseudoFunction copy = ( IPseudoFunction ) Term1.copy();
        copy.setPseudoArgs( newVars );
        term = applySubstitution( /*this.*/term, new Substitution( metaVar, copy ) );
        //
        return addDSubs;
    }

    /**
     *
     * @param term
     * @param sub
     * @return
     */
    static ITerm applySubstitution( ITerm term, final Substitution sub )
    {
        if ( term instanceof IPseudoFunction )
        {
            IPseudoFunction pf = ( IPseudoFunction ) term;
            List<ITerm> args = FpUtils.map( pf.getPseudoArgs(), new Function<ITerm, ITerm>()
            {
                public ITerm map( ITerm e )
                {
                    return applySubstitution( e, sub );
                }
            } );
            //
            IPseudoFunction copy = ( IPseudoFunction ) pf.copy();
            copy.setPseudoArgs( args );
            //
            return copy;
        }
        else if ( term instanceof IMetaVariable )
        {
            if ( term.equals( sub.getVar() ) )
            {
                return sub.getTerm();
            }
            //
            return term;
        }
        //
        return term; //todo copy??
    }

    /**
     *
     * @param term
     * @param key
     * @param value
     * @return
     */
    public static ITerm applySubstitution( final ITerm term, final IMetaVariable key, final ITerm value )
    {
        if ( term.isPseudoFunction() )
        {
            IPseudoFunction pf = ( IPseudoFunction ) term;
            List<ITerm> args = FpUtils.map( pf.getPseudoArgs(), new Function<ITerm, ITerm>()
            {
                public ITerm map( ITerm e )
                {
                    return applySubstitution( e, key, value );
                }
            } );
            //
            IPseudoFunction copy = ( IPseudoFunction ) pf.copy();
            copy.setPseudoArgs( args );
            //
            return copy;
        }
        else if ( term instanceof IMetaVariable )
        {
            if ( term.equals( key ) )
            {
                return value;
            }
            //
            return term;
        }
        //
        return term; //todo copy??
    }

    /**
     *
     * @param Term1
     * @param Term2
     * @return
     */
    public static boolean incommensurable( ITerm Term1, ITerm Term2 )
    {
        return equivalent( msg( Term1, Term2 ).getTerm(), MetaVariable.createAnonymous( Term1.getTag() ) );
    }

    /**
     * @param term
     * @param mvl
     * @param tl
     * @return
     */
    applySubstitutionList( let, List<IMetaVariable> mvl, List<ITerm> tl )
    {
        // List<ITerm> l = new ArrayList<ITerm>(  );
        term = term.copy();
        for ( int i = 0; i < mvl.size(); i++ )
        {
            applySubstitution( term, mvl.get( i ), tl.get( i ) );
        }
        //
        return term;
    }

    /**
     *
     */
  dbl_substitution(first, second, third ):-
}
