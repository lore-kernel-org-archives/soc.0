Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C6EEB64DA
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 19:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67A18C433CB; Wed, 12 Jul 2023 19:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B0CC433C7;
	Wed, 12 Jul 2023 19:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689190928;
	bh=545tueX5+zamYvioZk2VuBepfdHGpHi8ra8a1UqM4uw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=HEnnk0qHrXu9ofR3glc0ZHMslneo+AJo7AiCrdKTEB1Mw9K6pyiOzGkDZ2Eysr4Kg
	 rY/Sf0FXHPPIy7qLkSLoY2kybF2OTMTx+HbeApSmeF1L391pTgttI0W6gqaunhDi/N
	 m6tYEium9Wt3cjpIs6yeV1FrkS2KVEzyb6eKd4BmgD5Q0sswQrEGydONYZIqEIOJxp
	 quZcNvyMuDyn8qVB0RV/VfcylXJvGkyhWbBhTIgdRehraZ7RRZBBNm55tzBMh0BLJ5
	 ZwHEyuNYOEGcpH3moolSBDde1pn3zwwqBrvt6+9igBFmMqgc2x8jLEVWXOF9ZXhn68
	 rrBi2O0FDdBPg==
Date: Wed, 12 Jul 2023 20:42:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Durai Manickam KR <durai.manickamkr@microchip.com>,
	Hari.PrasathGE@microchip.com,
	balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
	varshini.rajendran@microchip.com, dharma.b@microchip.com,
	nayabbasha.sayed@microchip.com, balakrishnan.s@microchip.com,
	cristian.birsan@microchip.com, nicolas.ferre@microchip.com,
	krzysztof.kozlowski@linaro.org, davem@davemloft.net, arnd@arndb.de,
	olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kavyasree.Kotagiri@microchip.com, Horatiu.Vultur@microchip.com,
	robh+dt@kernel.org, andrew@lunn.ch, michael@walle.cc,
	jerry.ray@microchip.com, conor+dt@kernel.org,
	jesper.nilsson@axis.com, sergiu.moga@microchip.com,
	andre.przywara@arm.com, ada@thorsis.com
Subject: Re: [PATCH] ARM: dts: at91: sam9x60: fix the SOC detection
Message-ID: <20230712-revolving-tactful-67cdb02c664b@spud>
References: <20230712100042.317856-1-durai.manickamkr@microchip.com>
 <20230712-dweeb-suspend-27d0f7292a2d@spud>
 <202307121930333019a9d5@mail.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Lbrj8CQF8WTKbfU"
Content-Disposition: inline
In-Reply-To: <202307121930333019a9d5@mail.local>


--1Lbrj8CQF8WTKbfU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 09:30:33PM +0200, Alexandre Belloni wrote:
> On 12/07/2023 19:43:51+0100, Conor Dooley wrote:
> > On Wed, Jul 12, 2023 at 03:30:42PM +0530, Durai Manickam KR wrote:
> > > Remove the dbgu compatible strings in the UART submodule of the
> > > flexcom for the proper SOC detection.
> >=20
> > I am afraid that I do not understand what this means. The first
> > compatible, before and after your patch, is a sam9x60 one, so I don't
> > see how the SoC comes into it. Grepping to try and understand:
> > rg microchip,sam9x60-usart drivers/
> >=20
> > rg microchip,sam9x60-dbgu drivers/
> >=20
> > rg atmel,at91sam9260-dbgu drivers/
> > drivers/soc/atmel/soc.c
> > 259:					     "atmel,at91sam9260-dbgu");
> >=20
> > rg atmel,at91sam9260-usart drivers/
> > drivers/tty/serial/atmel_serial.c
> > 2723:OF_EARLYCON_DECLARE(atmel_serial, "atmel,at91sam9260-usart",
> >=20
> > drivers/mfd/at91-usart.c
> > 50:	{ .compatible =3D "atmel,at91sam9260-usart" },
> >=20
> > It looks like you are trying to avoid the atmel soc driver from
> > detecting the atmel,at91sam9260-dbgu compatible?
> > Is this not actually compatible with the sam9260's debug uart?
> >=20
> > Please try to explain things in more detail so that people unfamiliar
> > with at91 hardware are not confused. As an outsider, removing
> > compatibles to fix detection seems like it would not work - the sam9x60
> > compatibles are first in the list. To me it seems like this removes,
> > rather than fixes detection, and to fix detection you would need to
> > make some changes to the driver?
> >=20
> > Also, the binding says:
> >       - items:
> >           - const: microchip,sam9x60-dbgu
> >           - const: microchip,sam9x60-usart
> >           - const: atmel,at91sam9260-dbgu
> >           - const: atmel,at91sam9260-usart
> >=20
> > Your patch here makes the dts non-compliant with the bindings, as far as
> > I can tell, so you will need to go and modify the bindings to do this
> > either way.
>=20
> There can be only one dbgu on a SoC and it has the chipid register. It
> has always been wrong to have a dbgu compatible on the flexcom uart as
> they are not dbgu.

Ahh, thanks for the explanation. Sounds like stuff that might be obvious
to those working on arm stuff all the time, but not all of those CCed on
the patch ;)
The correct thing to do would seem to be updating the dt-binding to
something that permits what is listed below, or just removing the second
compatible, to leave "microchip,sam9x60-usart" in isolation, since that
is permitted also.

> Anyway, my advice has always been that you must not do chipid detection
> on at91 because there is no point in doing it because you need to have
> a correct dts to be able to find the dbgu chipid register so you either
> you already know what you are running on or you are going to read bogus
> registers anyway.

I won't claim to have an opinion on any of that, but sounds like you'd
be better off just reading the board/SoC level compatibles to figure out
what you are running on...

Thanks,
Conor.

> > > Fixes: 99c808335877 (ARM: dts: at91: sam9x60: Add missing flexcom def=
initions)
> > > Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> > > ---
> > >  arch/arm/boot/dts/microchip/sam9x60.dtsi | 26 ++++++++++++----------=
--
> > >  1 file changed, 13 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot=
/dts/microchip/sam9x60.dtsi
> > > index 8b53997675e7..73d570a17269 100644
> > > --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> > > +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> > > @@ -172,7 +172,7 @@ flx4: flexcom@f0000000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart4: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <13 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -240,7 +240,7 @@ flx5: flexcom@f0004000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart5: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					atmel,usart-mode =3D <AT91_USART_MODE_SERIAL>;
> > >  					interrupts =3D <14 IRQ_TYPE_LEVEL_HIGH 7>;
> > > @@ -370,7 +370,7 @@ flx11: flexcom@f0020000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart11: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <32 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -419,7 +419,7 @@ flx12: flexcom@f0024000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart12: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <33 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -576,7 +576,7 @@ flx6: flexcom@f8010000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart6: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <9 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -625,7 +625,7 @@ flx7: flexcom@f8014000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart7: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -674,7 +674,7 @@ flx8: flexcom@f8018000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart8: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <11 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -723,7 +723,7 @@ flx0: flexcom@f801c000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart0: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -791,7 +791,7 @@ flx1: flexcom@f8020000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart1: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <6 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -859,7 +859,7 @@ flx2: flexcom@f8024000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart2: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -927,7 +927,7 @@ flx3: flexcom@f8028000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart3: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -1050,7 +1050,7 @@ flx9: flexcom@f8040000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart9: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <15 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > @@ -1099,7 +1099,7 @@ flx10: flexcom@f8044000 {
> > >  				status =3D "disabled";
> > > =20
> > >  				uart10: serial@200 {
> > > -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usa=
rt", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> > > +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-us=
art";
> > >  					reg =3D <0x200 0x200>;
> > >  					interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH 7>;
> > >  					dmas =3D <&dma0
> > > --=20
> > > 2.25.1
> > >=20
>=20
>=20
>=20
> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--1Lbrj8CQF8WTKbfU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK8CCAAKCRB4tDGHoIJi
0kjnAPsFY0CtkyXMUSBfbMQ5Jqpa3b1YGQfn+Oz/kFBiyjqxqAEA7stFok5w7aT5
cBUR+z6WUY6HI9IS8aB/RgbCGsZcpAE=
=Wi9C
-----END PGP SIGNATURE-----

--1Lbrj8CQF8WTKbfU--
