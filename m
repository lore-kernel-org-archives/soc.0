Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10342C05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 15:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7433C433EF; Fri, 20 Jan 2023 15:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437D1C433D2;
	Fri, 20 Jan 2023 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674226912;
	bh=tgRNWRZnm0qPxu1Gq2XAQ1Bk96QE7CWUfZgSFfcjpCA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=OYBvTDhz2HA2Ci9Mn8+mRuL7/+cwoKMQnF38+UgCc2slDO9a8usa8rbZ6qPQJQvXa
	 Y3wD+pCG2NDcnmspr7Ed+RgTuuU8GB647OMoFod1FJMUa2F4YB0++sDApM7Sg1v7zq
	 zw3kVCGJjnErERkjhE605PHsqMR7h6O7r4+2N2kiM3bT+VlQfkFup8M1CUQWAdWpL1
	 +gAK7a1qyv2bv6MqxjGGq3ZcFI7Dat8hp7RTbkrlpqSGQ+tlkFJDy5xJvDoVOm5x57
	 Be4Vmn0zFldRRg5DZyGmK+z0pefuebJbwNVF4oRSg48gJQyU5OX67NX7+GeB+Ub6LH
	 /y4vVvj7CQqQg==
Date: Fri, 20 Jan 2023 15:01:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Markuss Broks <markuss.broks@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm: dts: Add device-tree for Samsung Galaxy S5
 (Exynos)
Message-ID: <Y8qs3W3Je9jB9fkY@sirena.org.uk>
References: <20230119185848.156502-1-markuss.broks@gmail.com>
 <20230119185848.156502-3-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vYAQXAEdhAO3yRXw"
Content-Disposition: inline
In-Reply-To: <20230119185848.156502-3-markuss.broks@gmail.com>
X-Cookie: Serving suggestion.


--vYAQXAEdhAO3yRXw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2023 at 08:58:44PM +0200, Markuss Broks wrote:

> +			buck2_reg: BUCK2 {
> +				regulator-name = "VDD_ARM_1V0";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1500000>;

The naming and constraints on this and a number of the other
regulators don't seem consistent - the naming implies a specific
voltage but there's a fairly wide range permitted.

--vYAQXAEdhAO3yRXw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPKrNoACgkQJNaLcl1U
h9Co+Qf/bDoiSufuszsKQRykGCNhiZKiVrp90DgBWkvqcbbO92fqKthpJ01HfDju
uinJimkHda/wi6P+ej/EOAQrElJh+fhBpqh7yVK8N+4D8PvFrnBao0euQyB5RgJT
VhpeX/PLxH5py36nkX5cATbYU6HWewOCJE9BU6VGD4isbUzTX2uKmNDcCkKCXPOB
NeOJZ4NtJJi3470LHZCh7MbBNpcuZdmUERGE6mfBZYLEjgQEr4JL/WAVjP+Y7RxM
gfts0VJf/ir2JinzZog+t1YoLK2H4iGQV+dFxaTqy/tfbsc3ZvQbMv+k7RPtVR17
sE2NZAnoZ0NKsK1jMDDS3pcA2vaiaA==
=StHV
-----END PGP SIGNATURE-----

--vYAQXAEdhAO3yRXw--
