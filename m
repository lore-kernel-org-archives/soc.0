Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BF4C77B7E
	for <soc@archiver.kernel.org>; Sun, 28 May 2023 19:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18B09C433A7; Sun, 28 May 2023 19:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91588C433EF;
	Sun, 28 May 2023 19:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685301061;
	bh=hOz9hD+Qyhnd1vOnZysFE0qkO2g8ZUW2/VZIxzTQinU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Bj9VHur48hn+DH9GpdTEwFanj5YVcsIuo8NBT1ajmn7/SSEQ+7a8LrVoZtck9G2eX
	 rCqUKAQisgcUYqM6cHFwQTQhb2ofgAV/oq5SSMtW4xv1bcyan39GBKNxp5RfAhy+8+
	 cMj3ZZp/vFJ6SYMClCczrKZ/h1kHH4KgFQx9nnehpvhpUixmFZWDJ++3xTZp8IrGKs
	 qvXFRU61TQirFZsyczehhy2cNy1s6vQaAWS8/Yy9tUPlqNIfxdVW4GxEoOWt9s+BJC
	 cNCTp3sAKtNooQ1orbkrA/t4DQDwvSVBnMOU0KZVsKjoxPfEDlLX7hcOMrhsngPymU
	 cQuSkIiCcMTJA==
Date: Sun, 28 May 2023 20:10:56 +0100
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
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Message-ID: <20230528-bridged-shingle-a6b0868d19bb@spud>
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-2-guptarud@gmail.com>
 <20230528-decode-creasing-f5b3996163e5@spud>
 <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ncz8jVJ3EUWXtc3T"
Content-Disposition: inline
In-Reply-To: <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>


--Ncz8jVJ3EUWXtc3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 28, 2023 at 09:36:37AM -0400, Rudraksha Gupta wrote:
> > Where did the "att" come from in the compatible. Is this some carrier
> specific model of the phone?
>=20
> This is the code name for the device. Since there are usually multiple
> variants of a device, using the code name differentiates between those
> variants. For example, if I left this as "samsung,express", it would be
> unclear if I am referring to the GT-I8730 (code name: expresslte) or the
> SGH-I437 model. This is typically done in postmarketOS:
> https://wiki.postmarketos.org/wiki/Devices and XDA developers. I believe =
it
> is a carrier specific model of the Samsung Galaxy Express.

Okay, thanks for the information. I'll not dispute the codename, was
wondering whether there were other devices or not. I'll let the qcom
folks decide whether or not that is the right codename..
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--Ncz8jVJ3EUWXtc3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHOnQAAKCRB4tDGHoIJi
0u33AQDCJAEDCua8W9b2gTd5FV0dRkv7E2gtKrPliQlXCn6TVQD+JqzD5gyUUcRQ
Tz4bDlSBE5eg6ppwmglKOys4LeBzFAQ=
=NPpL
-----END PGP SIGNATURE-----

--Ncz8jVJ3EUWXtc3T--
