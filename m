Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB756C77B7A
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 18:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65AE7C433EF; Mon, 29 May 2023 18:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533C5C433D2;
	Mon, 29 May 2023 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685383552;
	bh=AZRdPQt1r/FGQvfF0fX+wuaBd3GnTe6Njx9eZY7jpB8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=tp2VEC5vSXC0t5v9H5aNkz+JINl418Pu+gxnuexZPReHEPbcF5Bbrld8dCN7gF/oX
	 bSAmkLbjxxrZEYlAXfts5hIgPPvc2SiMU8XuReW1/kgtJuynrdgV9/2/BJBikOyoCF
	 WAhaMYt3VXlGxgvCFgRBuVAWsvtq1ycl3bQpXgSg5LE5NTSrYy7zoeFKrMCKNxGcen
	 gohuS5UdR17D24k7jH/AhMtT95GnTKcDttegWMO8RFErMmGKXGpWx72PYwBnEc+eXU
	 L2vvYl0PghdDidZHXmquZeBFKOdcXMA1KzX2Y7mwiUTV1ztm103acnhXW1uZuW9fly
	 X5pTesP2+PAQw==
Date: Mon, 29 May 2023 19:05:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 04/11] dt-bindings: stm32: add st,stm32mp25 compatibles
 to the stm32 family
Message-ID: <20230529-backlit-dealing-b099e4eb5210@spud>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-5-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g/aPNMyoKyHSJ2S4"
Content-Disposition: inline
In-Reply-To: <20230529162034.20481-5-alexandre.torgue@foss.st.com>


--g/aPNMyoKyHSJ2S4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 06:20:27PM +0200, Alexandre Torgue wrote:
> STM32 family is extended by the addition of the STM32MP25 SoCs. It is com=
posed
> of 4 SoCs: STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>=20
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Doc=
umentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 4af5b8f4f803..7d7ca33d2e61 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -161,6 +161,15 @@ properties:
>            - const: phytec,phycore-stm32mp157c-som
>            - const: st,stm32mp157
> =20
> +      - items:
> +          - const: st,stm32mp251
> +      - items:
> +          - const: st,stm32mp253
> +      - items:
> +          - const: st,stm32mp255
> +      - items:
> +          - const: st,stm32mp257

I assume the slightly odd format is just to avoid churn when adding
the board compatibles.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +
>  additionalProperties: true
> =20
>  ...
> --=20
> 2.17.1
>=20

--g/aPNMyoKyHSJ2S4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTpegAKCRB4tDGHoIJi
0ubOAQDekXaYZ/amJx7D8FUr2DifW+kUXwNrdgGFzxAkuR459wD/ao13mBBk4zRX
4oklgSPdn0wVI3rlVxTNozxPyp3mmwY=
=BwAV
-----END PGP SIGNATURE-----

--g/aPNMyoKyHSJ2S4--
