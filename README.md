Focality - Application de Focus et Productivité

Focality est une application SwiftUI conçue pour aider les utilisateurs à se concentrer sur leurs objectifs, à gérer leur temps efficacement et à maintenir leur productivité. L’application propose des fonctionnalités telles que des timers de focus, la gestion des tâches, des rappels et des objectifs, ainsi que des éléments de gamification pour motiver les utilisateurs.

Fonctionnalités

	•	Inscription et Authentification : Les utilisateurs peuvent créer un compte, se connecter, et réinitialiser leur mot de passe.
	•	Gestion des Objectifs : Les utilisateurs peuvent ajouter, visualiser et suivre leurs objectifs personnels.
	•	Timers de Focus : L’application propose des timers pour aider les utilisateurs à se concentrer pendant une durée déterminée.
	•	Rappels : Les utilisateurs peuvent configurer des rappels pour gérer leurs tâches quotidiennes.
	•	Gamification : Gagnez des points et suivez votre progression pour rester motivé.
	•	Mode Focus Cœur : Une fonctionnalité dédiée pour des exercices de respiration guidée.
	•	Profile Utilisateur : Les utilisateurs peuvent voir leurs informations de profil, y compris leur photo, leur nom et leurs points accumulés.

Prérequis

	•	Xcode 13.0 ou supérieur
	•	iOS 15.0 ou supérieur
	•	Swift 5.0 ou supérieur

Installation

	1.	Cloner le projet

git clone https://github.com/votre-repo/focality.git
cd focality

	2.	Ouvrir le projet dans Xcode
	•	Double-cliquez sur le fichier Focality.xcodeproj pour ouvrir le projet dans Xcode.
	3.	Compiler et exécuter l’application
	•	Sélectionnez votre simulateur ou appareil cible et cliquez sur le bouton “Run” pour compiler et exécuter l’application.

Utilisation

	1.	Inscription
	•	Sur l’écran d’accueil, cliquez sur “S’inscrire” pour créer un nouveau compte utilisateur.
	2.	Connexion
	•	Utilisez votre email et mot de passe pour vous connecter à l’application.
	3.	Ajouter des Objectifs
	•	Accédez à l’onglet “Objectifs” pour ajouter de nouveaux objectifs à atteindre.
	4.	Utiliser les Timers
	•	Dans l’onglet “Timer”, configurez des périodes de focus pour travailler sans distraction.
	5.	Configurer des Rappels
	•	Utilisez l’onglet “Rappels” pour ajouter et gérer vos rappels de tâches.
	6.	Accéder à votre Profil
	•	Consultez vos informations de profil, y compris les points accumulés dans l’onglet “Profil”.

Structure du Projet

	•	ContentView.swift : La vue principale qui gère la navigation entre les différentes fonctionnalités de l’application.
	•	AuthViewModel.swift : Gère la logique d’authentification des utilisateurs.
	•	UserViewModel.swift : Gère les données et la logique liées aux utilisateurs.
	•	OnboardingView.swift : Interface utilisateur pour l’accueil et la navigation vers les principales sections de l’application.
	•	FocusHeartCoherence.swift : Vue dédiée aux exercices de respiration guidée.
	•	GoalViewModel.swift : Gère la logique pour la gestion des objectifs.
	•	ReminderViewModel.swift : Gère les rappels.
	•	ChallengeViewModel.swift : Gère les défis et la gamification.
	•	Assets.xcassets : Contient les ressources graphiques de l’application, telles que les images et les icônes.

Contribuer

Les contributions sont les bienvenues ! Si vous souhaitez contribuer à ce projet, veuillez suivre ces étapes :

	1.	Fork le projet.
	2.	Créez une branche pour votre fonctionnalité ou correction de bug (git checkout -b feature/nom-fonctionnalité).
	3.	Commitez vos modifications (git commit -m 'Ajout de la fonctionnalité X').
	4.	Push la branche (git push origin feature/nom-fonctionnalité).
	5.	Ouvrez une Pull Request.

License

Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus d’informations.

Auteurs

	•	Johan
 •	Dembo
 •	Emiliano
 •	Patrice
 •	Sophian

Ce README donne un bon aperçu de votre application et fournit les informations nécessaires pour que d’autres développeurs ou utilisateurs puissent commencer à utiliser et contribuer à votre projet.


