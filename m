Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC5C7EE2C
	for <soc@archiver.kernel.org>; Sun, 28 May 2023 08:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B954AC433A7; Sun, 28 May 2023 08:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9AAC433EF;
	Sun, 28 May 2023 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685263631;
	bh=mSAFYjFK3Msc+CKxPMX79YD0dd5HqbJfJuslyqAjF78=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=jNy0ziajDDEz1i77YnHbB+tBCCRdhuJnwasCpzdJLoC18Op3AX344nnIsO4i0csLC
	 soHHec5AEgkSDrPUvImCWoinZ48zCcsXVDnR1WT6slOym3hVJN+ydzd9mRrlzcIZRg
	 ccxko067Ilqr9jRzdpu/SmACoFA4eU1/DD2OTCFM7LDEcsExqhZ14BH7SDwPmWRC7x
	 41TgBqpMNz+l9NqiypMfWJqad1ej/giK3EfEDwoFbeoHf4B+X0KvF/aB5tykwRSVgu
	 G1nP1t1laF8eMCHjEGWS4X7QQmsUk+CZ2FAFjNuDZ1aV8B269k0gvJPfJAk1jsomA2
	 AyqxWnko7ZFYQ==
Date: Sun, 28 May 2023 09:47:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: Add qcom,usb-hs-phy-msm8960
Message-ID: <20230528-afar-upside-39eba9813480@spud>
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-3-guptarud@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Emy5jck/mGLYOFyE"
Content-Disposition: inline
In-Reply-To: <20230528001010.47868-3-guptarud@gmail.com>


--Emy5jck/mGLYOFyE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 08:10:07PM -0400, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
>=20
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Emy5jck/mGLYOFyE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHMVCQAKCRB4tDGHoIJi
0m2xAQCzqjss3CYZuldnRYb2iA4q16UMQIeEQSplcO/r+dHWHwD/R6PZoNKqVxYi
e7wSiUvjqtso4nvraqUIhYN1Uu5/WQM=
=C7T+
-----END PGP SIGNATURE-----

--Emy5jck/mGLYOFyE--
