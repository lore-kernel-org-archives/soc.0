Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE424EB64DD
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 18:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88098C433CB; Mon, 24 Jul 2023 18:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79276C433C8;
	Mon, 24 Jul 2023 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690223485;
	bh=Zozk2DM+YhlD+xi7yWMefeHAyWOc1Wz/LPyy1fz/0O4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=GRKUcSeVZn2/sb91jEw7SCPkuFaVMULd/F4e8fcHXnM7UKrwYNToVbohHrLzmWD+y
	 PVIn/N7AgZgUd+qVpVO8YIegdJpDgVuVSb9WDe9HJw11IrW2+AOItBQcL3MuFqjR/Q
	 ucyopmMpz4IMO4fNfA2jCfbRmjjWx4GXdQamC04lZEsHuHcVpTcf6xhAxtuJPcfJRM
	 MsCXWWRTebMJvspMBEBPhBvMGqkaJ2fb8lKMvwOwAhKDzuLPGYgnp9NYrSVi1hPVEH
	 bZJy0qHqXXNs6Oh6AzPmNxMS4myxwJ3bNYQIY4ZDZU3u5gf3qNpB5LVZ0djHJ/ebl9
	 QtTQ6olteliCw==
Date: Mon, 24 Jul 2023 19:31:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, arm@kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 1/3] MAINTAINERS: soc: reference maintainer profile
Message-ID: <20230724-guzzler-grueling-4c69348d02e9@spud>
References: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9++3k7xAY/ioan4N"
Content-Disposition: inline
In-Reply-To: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>


--9++3k7xAY/ioan4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 23, 2023 at 03:19:22PM +0200, Krzysztof Kozlowski wrote:
> Mention the SoC maintainer profile in P: entry.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for fixing this up.

--9++3k7xAY/ioan4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL7DdwAKCRB4tDGHoIJi
0r0NAQDweREBYiW4sb7uiOTKpnf2oPEgUdQ7KJLAfn1MTVXKogEAz1dG0dmg2c/Y
MezTk/pu3hr+kuIMaCb+o1f5m3R16go=
=0iyE
-----END PGP SIGNATURE-----

--9++3k7xAY/ioan4N--
