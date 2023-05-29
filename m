Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78845C77B7E
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 18:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5968FC4339C; Mon, 29 May 2023 18:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B376C433EF;
	Mon, 29 May 2023 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685383583;
	bh=JlOqYA5PNKYDRGnDc492lVyo/u//gPIhjtNje7m6WP8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=eHny8rGDrvxGzhzs3IUkg3qiVVQ+bYdI7+/J3Q8mu6+t9+5zjQcRYnaBwE7bAhdHK
	 /8YW43Ff4vcOJZmtqiauWNxS79q1gV1HQ9dCut0KCvjQQ5uA3zmG2aiQHqXPUM1Qqo
	 tjqesHGqrJAOaxutZC9/88kK7qFjLo5gq0UTNneFbBb/ODC9h9tadAh3TJ8jFsKsth
	 5Gvah0fhAd9zNFW+OdIBWGateyhwR1lxByoNaPnrYR/Rq0+0jipkN3QToa4xGeXCFT
	 UYS/fy/xjOoMVfoIBI5sRWozykV+8xl2MdCkxtr8A8oof4eDejweRTCYWUyvvGmrjR
	 vgC6cVNulgGxw==
Date: Mon, 29 May 2023 19:06:17 +0100
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
Subject: Re: [PATCH 08/11] dt-bindings: stm32: document stm32mp257f-ev1 board
Message-ID: <20230529-dictation-subtract-54f4c0a97cef@spud>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-9-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wmDZkNNWuAgDypap"
Content-Disposition: inline
In-Reply-To: <20230529162034.20481-9-alexandre.torgue@foss.st.com>


--wmDZkNNWuAgDypap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 06:20:31PM +0200, Alexandre Torgue wrote:
> Add new entry for stm32mp257f-ev1 board.
>=20
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--wmDZkNNWuAgDypap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTpmQAKCRB4tDGHoIJi
0tdXAQDJKRZXXiz4bnG/DxWM1ywcpxVOAEoI19A5hBLfTLrDawD9HjJvOwtVe0Kz
tHW42t+uehGwmJ07RO7JcQywVXt0aAQ=
=/XQj
-----END PGP SIGNATURE-----

--wmDZkNNWuAgDypap--
