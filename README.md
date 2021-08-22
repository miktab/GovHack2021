# To trust or not to trust?
Is telling survey participants that their answers will remain anonymous really enough to 
elicit truthful responses from participants about sensitive issues?

In this project, we implement protocols to give participants a provably anonymous way to respond
truthfully to such questions without relying on a mere promise of anonymity. 
[![video](www/thumbnail.jpg)](https://www.youtube.com/watch?v=681m-uxrN0w)

## Challenges
### [ Safeguarding citizens privacy and ownership of their personal data ](https://hackerspace.govhack.org/challenges/safeguarding_citizens_privacy_and_ownership_of_their_personal_data)

The pandemic has seen a massive shift to government digital services. Increasing amounts of personal data are required from citizens to support the pandemic response like QR code contact tracing apps, post vaccine surveys and business support grants.

### [Reimagining Digital Government Services](https://hackerspace.govhack.org/challenges/reimagining_digital_government_services)

While working on this challenge, participants are expected to reimagine digital government services and how these could be better made available to citizens by seamlessly integrating services that support people’s needs across life events. Participants will need to think of ideas to deliver digital government services that are simple and personalised across multiple agencies.

### [ Building Citizen’s Trust in this Digital World ](https://hackerspace.govhack.org/challenges/building_citizen_s_trust_in_this_digital_world)
There has always been concerns around data governance and citizens having no visibility of what data is being collected from them, in which way and how it is being used. The terms and conditions might list these details, but it is not always the case that the citizens read (due to the length of it) or understand (due to the way it is written) it. This ties back to the trust that citizens have that the data is being used for bettering the systems and products.

## Intro
When asked about a sensitive issue, and told "This is an anonymous survey."...

Are you as carefree as bender?

![bender](www/bender.jpg "Title")

Or as suspicious as Fry?

![fry](www/fry.jpeg "Title")

The issue this Project aims to solve pertains to surveys of sensitive issues on groups of people. Questions like
"Do you think you're smarter than your friends?", "Have you been faithful to your partner?"
Or how about, "have you broken the lock down orders in Melbourne during the past week?"

Can participants really be expected to trust the word of the surveyer, and answer honestly, when the
implications of admission can be so deadly?

# Trust, but Verify
To "trust, but verify" comes from the rhyming Russian Proverb and is in my opinion a very wise philosophy.

So this weekend I explored 2 methods for the anonymous submission of survey responses that aims to protect the privacy or all participants.

## [Method I: Randomised Response (Click here)](https://tomson.shinyapps.io/demo_poly/)

Randomised response is an easy to understand procedure, used in structured survey interviews, to protect the participants responses. 
The methodology comes from the 1965 paper by Warner and is regularly used in surveys about
doping in sports.


## [Method II: Secure Multiparty Computation (Click here)](https://tomson.shinyapps.io/secure-multiparty-computation/)
Secure Multiparty Computation is a subfield of cryptography which aims to compute functions while keeping inputs private.
The methodology comes from the 1989 paper by Ben-Or. M , Goldwasser. S, Wigderson. A
and is one of the most fundamental results of secure computation.


## Conclusion:
Randomised Response and Secure Multiparty Computation both have their place in the area of surveys.

Secure Multiparty computation doesn't add noise but Randomises response does not require long computations.

This project seeks to be an accessible educational resource so people can learn, understand
and verify the methodologies described. Only that way can people understand, rather than be expected to trust, in the privacy 
they are guaranteed with these methods.

## About me:
![bender](www/tom.jpeg "Title")
Hi and Welcome! My name's Tom and I'm a recent graduate living in the Melbourne Lockdown. If you would like to contact or collaborate with me, reach out to me on [Linkedin](https://www.linkedin.com/in/tomson-qin-43bb44190/).


## Bibiliography
https://www.math.ias.edu/~avi/PUBLICATIONS/MYPAPERS/GBW88/GBW88.pdf

https://eprint.iacr.org/2011/136.pdf

https://rpubs.com/aaronsc32/lagrangian-polynomial-interpolation-r

https://www.jstor.org/stable/2283137

https://imai.fas.harvard.edu/research/files/randresp.pdf

STOC '89: Proceedings of the twenty-first annual ACM symposium on Theory of computingFebruary 1989 Pages 73–85https://doi.org/10.1145/73007.73014