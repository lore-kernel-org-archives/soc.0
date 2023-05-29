Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3880C77B7A
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 18:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BC35C433D2; Mon, 29 May 2023 18:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB3C433EF;
	Mon, 29 May 2023 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685383246;
	bh=vi2xctN3CK3uPsWaCuUocWHcD/LuyN1ltyEEPt3iNOY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=YpX7Z6+GNRRHa1XHK4+nvJy/oOG9Ca4XgrTqwLjZPYo86MUn6ROeBFj9BABVJ5Dq9
	 xhqtOKAdEXkCzmmZVZxLFkgthH1YI9AKA3Rfh7nl5sm0ii8+9pMIXSt5wFP4WcmHiW
	 pdMTpPVetIiJZVhnlcyT3EDcVZTMKhnv4lx7iWwFh+exJigmHEBKfEswMNoxyg9hnD
	 JwoetkaOGtJ6IHfzsM1MWNLJfAKdEagjv3PuDN5I+szw+zG8F/cLN0Eww6YWJIIWtZ
	 lDxjMHl9TDGmAw5NoTIQe9DE0/wDMmAfPmBVhaPGeFzqsCdmBEjLG7AwyBQrljFgmt
	 6pyXFbEhmmWSQ==
Date: Mon, 29 May 2023 19:00:40 +0100
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
Subject: Re: [PATCH 01/11] dt-bindings: pinctrl: stm32: support for
 stm32mp257 and additional packages
Message-ID: <20230529-contrite-smoking-17248b00ae75@spud>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-2-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+gGo4p1wZB1XxafT"
Content-Disposition: inline
In-Reply-To: <20230529162034.20481-2-alexandre.torgue@foss.st.com>


--+gGo4p1wZB1XxafT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 06:20:24PM +0200, Alexandre Torgue wrote:
> Add support for st,stm32mp257-pinctrl and st,stm32mp257-z-pinctrl.
> Add packages AI, AK and AL (values : 0x100, 0x400 and 0x800)
>=20
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 1ab0f8dde477..2120ef71a78d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -27,6 +27,8 @@ properties:
>        - st,stm32mp135-pinctrl
>        - st,stm32mp157-pinctrl
>        - st,stm32mp157-z-pinctrl
> +      - st,stm32mp257-pinctrl
> +      - st,stm32mp257-z-pinctrl
> =20
>    '#address-cells':
>      const: 1
> @@ -56,7 +58,7 @@ properties:
>        Indicates the SOC package used.
>        More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [1, 2, 4, 8]
> +    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
> =20
>  patternProperties:
>    '^gpio@[0-9a-f]*$':
> diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bin=
dings/pinctrl/stm32-pinfunc.h
> index e6fb8ada3f4d..28ad0235086a 100644
> --- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
> +++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> @@ -37,6 +37,9 @@
>  #define STM32MP_PKG_AB	0x2
>  #define STM32MP_PKG_AC	0x4
>  #define STM32MP_PKG_AD	0x8
> +#define STM32MP_PKG_AI	0x100
> +#define STM32MP_PKG_AK	0x400
> +#define STM32MP_PKG_AL	0x800
> =20
>  #endif /* _DT_BINDINGS_STM32_PINFUNC_H */
> =20
> --=20
> 2.17.1
>=20

--+gGo4p1wZB1XxafT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHToSAAKCRB4tDGHoIJi
0iyDAP9/JVSOQbuG+a+VQLRIv4gIrd2FEzYzb+RcrYSAtPyttQEA91RuoS1J3vTo
oGcXIU9YaSSWjOk8dr4JdUJYYLlmLQ8=
=mUUh
-----END PGP SIGNATURE-----

--+gGo4p1wZB1XxafT--
