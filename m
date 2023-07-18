Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ED7EB64DA
	for <soc@archiver.kernel.org>; Tue, 18 Jul 2023 11:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AEB5C433C7; Tue, 18 Jul 2023 11:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BF7C433C8;
	Tue, 18 Jul 2023 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689678780;
	bh=LoaeTrLEb/GlXeN6zGTPzQT45QYJf0N2Cp3U2wUVPOM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=N9b0INbeAqUMk7FdJK5yjxH2zJx34m9LRSXrZ7lyMmIg4zIzd+gQE1taN+FTm5T33
	 RBjrep/PTdB4iHwOwX1armBfGyQTa3NvlrT6uQ4Ox9OgwVtuhl9F2papPKErlmlmeQ
	 cqRhqdQYVzCH8Rfip6mz0SxUFulmECw6MZwaJGTsHbypqWz3tC9fKCJ3rHsaAo5IQb
	 wJxV5XhoeGLbaWZRB5of340peXnNZlXLkSgxTciu/lR1/huJF/4BRxXZGzs+Fk2IXx
	 Tj+Hpg1Syix7D0Dt/aqavPcN26j0xOCz0EBV8tMJ8muT1qOWdXjAlaQ5ljBNC7sL1h
	 nMMM0YQSPWStw==
Date: Tue, 18 Jul 2023 12:12:50 +0100
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
	jesper.nilsson@axis.com, andre.przywara@arm.com, ada@thorsis.com,
	radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
	gregkh@linuxfoundation.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCHv3 1/2] dt-bindings: serial: atmel,at91-usart: update
 compatible for sam9x60
Message-ID: <20230718-confidant-good-b85bad860beb@spud>
References: <20230718065735.10187-1-durai.manickamkr@microchip.com>
 <20230718065735.10187-2-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OC4nvGxE2VKL0zEq"
Content-Disposition: inline
In-Reply-To: <20230718065735.10187-2-durai.manickamkr@microchip.com>


--OC4nvGxE2VKL0zEq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 12:27:34PM +0530, Durai Manickam KR wrote:
> There is only one debug unit in the sam9x60 SOC and it has the chipid
> register. So, the dbgu compatible strings are valid only for debug usart.
> Defining these dbgu compatible strings are not valid for flexcom usart.
> So adding the items which is valid only for flexcom usart and removing
> the microchip,sam9x60-usart compatible string from the enum list as no
> usart node defines only this specific compatible string.

It may have been worth pointing out that had any DTS used the compatible
that is being disallowed in isolation after this change, no driver in
Linux would have bound to it anyway.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  .../devicetree/bindings/serial/atmel,at91-usart.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.ya=
ml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> index 30b2131b5860..65cb2e5c5eee 100644
> --- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> +++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> @@ -16,13 +16,15 @@ properties:
>        - enum:
>            - atmel,at91rm9200-usart
>            - atmel,at91sam9260-usart
> -          - microchip,sam9x60-usart
>        - items:
>            - const: atmel,at91rm9200-dbgu
>            - const: atmel,at91rm9200-usart
>        - items:
>            - const: atmel,at91sam9260-dbgu
>            - const: atmel,at91sam9260-usart
> +      - items:
> +          - const: microchip,sam9x60-usart
> +          - const: atmel,at91sam9260-usart
>        - items:
>            - const: microchip,sam9x60-dbgu
>            - const: microchip,sam9x60-usart
> --=20
> 2.25.1
>=20

--OC4nvGxE2VKL0zEq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLZzsgAKCRB4tDGHoIJi
0vkRAPoDZkPGjuUic3vZ6lriKyzgw0zYDGG4wGUAgLAF4nZlDQEA4INVjnz7f5v+
zqyUvgBeOGUAy4+bLYeTHjO3IzoJ4Ao=
=e0i6
-----END PGP SIGNATURE-----

--OC4nvGxE2VKL0zEq--
