Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80359EB64DA
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 18:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D156C433C9; Wed, 12 Jul 2023 18:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09371C433C7;
	Wed, 12 Jul 2023 18:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689187440;
	bh=PsAlULJuH6UW5kcZkyXQ5TrHE5voEJmX75wGwCU1vfM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ceENPspyTjxTjkoOwe6Ni7m3xIHohGqvL044yTOeeyIGgTEjIQFH/WuQIGdC0KJaZ
	 OoFoZ05z2oBb0/gU6V/eTmbjflJqdEbLqFtni5HTz2r+77Cpokg8UN5EfzS3MT2Tsr
	 nr9pXC4+19QhNYb7OYolcbZT7AcazgZ4zBzWwO9uylgXCnYaHevAg3CQZn6TlENvsg
	 ntKvY7VcmVND9wQEvrlQnd97PxTwo5wsKN9jCCm8inp9CUgCpgqZpFpQPKgyTwNkzn
	 j58woJ/zMpounWqE4d0ebnYKL8UsSUlQaSH3NEK/96NrU2DQIJnUp4yY4j4s/lgB2X
	 jJa0VmAXYMt3w==
Date: Wed, 12 Jul 2023 19:43:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Durai Manickam KR <durai.manickamkr@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Hari.PrasathGE@microchip.com, balamanikandan.gunasundar@microchip.com,
	manikandan.m@microchip.com, varshini.rajendran@microchip.com,
	dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
	balakrishnan.s@microchip.com, cristian.birsan@microchip.com,
	nicolas.ferre@microchip.com, krzysztof.kozlowski@linaro.org,
	alexandre.belloni@bootlin.com, davem@davemloft.net, arnd@arndb.de,
	olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kavyasree.Kotagiri@microchip.com, Horatiu.Vultur@microchip.com,
	robh+dt@kernel.org, andrew@lunn.ch, michael@walle.cc,
	jerry.ray@microchip.com, conor+dt@kernel.org,
	jesper.nilsson@axis.com, sergiu.moga@microchip.com,
	andre.przywara@arm.com, ada@thorsis.com
Subject: Re: [PATCH] ARM: dts: at91: sam9x60: fix the SOC detection
Message-ID: <20230712-dweeb-suspend-27d0f7292a2d@spud>
References: <20230712100042.317856-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WylxPJXq69Bocws8"
Content-Disposition: inline
In-Reply-To: <20230712100042.317856-1-durai.manickamkr@microchip.com>


--WylxPJXq69Bocws8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jul 12, 2023 at 03:30:42PM +0530, Durai Manickam KR wrote:
> Remove the dbgu compatible strings in the UART submodule of the
> flexcom for the proper SOC detection.

I am afraid that I do not understand what this means. The first
compatible, before and after your patch, is a sam9x60 one, so I don't
see how the SoC comes into it. Grepping to try and understand:
rg microchip,sam9x60-usart drivers/

rg microchip,sam9x60-dbgu drivers/

rg atmel,at91sam9260-dbgu drivers/
drivers/soc/atmel/soc.c
259:					     "atmel,at91sam9260-dbgu");

rg atmel,at91sam9260-usart drivers/
drivers/tty/serial/atmel_serial.c
2723:OF_EARLYCON_DECLARE(atmel_serial, "atmel,at91sam9260-usart",

drivers/mfd/at91-usart.c
50:	{ .compatible =3D "atmel,at91sam9260-usart" },

It looks like you are trying to avoid the atmel soc driver from
detecting the atmel,at91sam9260-dbgu compatible?
Is this not actually compatible with the sam9260's debug uart?

Please try to explain things in more detail so that people unfamiliar
with at91 hardware are not confused. As an outsider, removing
compatibles to fix detection seems like it would not work - the sam9x60
compatibles are first in the list. To me it seems like this removes,
rather than fixes detection, and to fix detection you would need to
make some changes to the driver?

Also, the binding says:
      - items:
          - const: microchip,sam9x60-dbgu
          - const: microchip,sam9x60-usart
          - const: atmel,at91sam9260-dbgu
          - const: atmel,at91sam9260-usart

Your patch here makes the dts non-compliant with the bindings, as far as
I can tell, so you will need to go and modify the bindings to do this
either way.

Thanks,
Conor.

>=20
> Fixes: 99c808335877 (ARM: dts: at91: sam9x60: Add missing flexcom definit=
ions)
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sam9x60.dtsi | 26 ++++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts=
/microchip/sam9x60.dtsi
> index 8b53997675e7..73d570a17269 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -172,7 +172,7 @@ flx4: flexcom@f0000000 {
>  				status =3D "disabled";
> =20
>  				uart4: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <13 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -240,7 +240,7 @@ flx5: flexcom@f0004000 {
>  				status =3D "disabled";
> =20
>  				uart5: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					atmel,usart-mode =3D <AT91_USART_MODE_SERIAL>;
>  					interrupts =3D <14 IRQ_TYPE_LEVEL_HIGH 7>;
> @@ -370,7 +370,7 @@ flx11: flexcom@f0020000 {
>  				status =3D "disabled";
> =20
>  				uart11: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <32 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -419,7 +419,7 @@ flx12: flexcom@f0024000 {
>  				status =3D "disabled";
> =20
>  				uart12: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <33 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -576,7 +576,7 @@ flx6: flexcom@f8010000 {
>  				status =3D "disabled";
> =20
>  				uart6: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <9 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -625,7 +625,7 @@ flx7: flexcom@f8014000 {
>  				status =3D "disabled";
> =20
>  				uart7: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -674,7 +674,7 @@ flx8: flexcom@f8018000 {
>  				status =3D "disabled";
> =20
>  				uart8: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <11 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -723,7 +723,7 @@ flx0: flexcom@f801c000 {
>  				status =3D "disabled";
> =20
>  				uart0: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -791,7 +791,7 @@ flx1: flexcom@f8020000 {
>  				status =3D "disabled";
> =20
>  				uart1: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <6 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -859,7 +859,7 @@ flx2: flexcom@f8024000 {
>  				status =3D "disabled";
> =20
>  				uart2: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -927,7 +927,7 @@ flx3: flexcom@f8028000 {
>  				status =3D "disabled";
> =20
>  				uart3: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -1050,7 +1050,7 @@ flx9: flexcom@f8040000 {
>  				status =3D "disabled";
> =20
>  				uart9: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <15 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> @@ -1099,7 +1099,7 @@ flx10: flexcom@f8044000 {
>  				status =3D "disabled";
> =20
>  				uart10: serial@200 {
> -					compatible =3D "microchip,sam9x60-dbgu", "microchip,sam9x60-usart",=
 "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
> +					compatible =3D "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
>  					reg =3D <0x200 0x200>;
>  					interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH 7>;
>  					dmas =3D <&dma0
> --=20
> 2.25.1
>=20

--WylxPJXq69Bocws8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK70ZwAKCRB4tDGHoIJi
0u1zAQCGmPL3fkn4rP5lSZjtwEmp2x2fJUQPdOzrgXto64agngEAsN7FRlqn90re
HKgHFtenCcDTAs+4ynoLhjUYJ9uZewU=
=aKXP
-----END PGP SIGNATURE-----

--WylxPJXq69Bocws8--
