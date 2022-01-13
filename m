Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964C0C433F5
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DA38C36AEC; Thu, 13 Jan 2022 12:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7576C36AED;
	Thu, 13 Jan 2022 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642078761;
	bh=9akpPd87QndJXAEIErhwmX7/WXgkPEFFcIviFIgvw2s=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=EsvL3HOGb8ffzyJOlshOu4EgXsM7m473MszsUS60E9P4Xr+AHM803bQdVLoHXxnTR
	 xUGfISnlk4ZjEUyNRj36y834cvPL8aqnZ79k8JjH1g+IWr6jfBSEq5EO7tbEltb5NL
	 lXQBL44lZ0xGfGe8nGg3EDhBYbLm+eoOU3l3MFP6eoJLfnLZJ92jPBXqKeQqCNbbI1
	 ZN01aBox1RA4QnDFduvLcV5RxwxkbpKswo++gAGBPgE6vpsNuV8BT1q4tcTLqg9+1x
	 FpSyVrnVHTnV6segpjyJYPFuTRqW3NinYtycngmc+3BpZ/5cQpDrfSI8blQAIGfTxo
	 N849aGiIXZ3wg==
Date: Thu, 13 Jan 2022 12:59:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	soc@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, olof@lixom.net,
	linus.walleij@linaro.org, catalin.marinas@arm.com,
	robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
	s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org,
	pankaj.dubey@samsung.com, linux-fsd@tesla.com,
	linux-spi@vger.kernel.org, Aswani Reddy <aswani.reddy@samsung.com>
Subject: Re: [PATCH 18/23] spi: s3c64xx: Add spi port configuration for Tesla
 FSD SoC
Message-ID: <YeAiIhfN216pRWhn@sirena.org.uk>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122435epcas5p18e6a2699f193b9e1287588278a570235@epcas5p1.samsung.com>
 <20220113121143.22280-19-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RWRxhWSMr9/Wu0eT"
Content-Disposition: inline
In-Reply-To: <20220113121143.22280-19-alim.akhtar@samsung.com>
X-Cookie: Slow day.  Practice crawling.


--RWRxhWSMr9/Wu0eT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 13, 2022 at 05:41:38PM +0530, Alim Akhtar wrote:

> +	{ .compatible = "tesla,fsd-spi",
> +			.data = (void *)&fsd_spi_port_config,
> +	},

This needs a DT bindings update to match.

--RWRxhWSMr9/Wu0eT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHgIiEACgkQJNaLcl1U
h9BrXQf/XYBFoegVzQjZtaYfLubTV4gYZThsRBGMwdWJA6xdSgMg/tmpsCN9XxJL
4eHD0+9JkXUhJEuXZUvTLzohAeGxXMWgAWcv9syVyAet+XWz93c4NXac9BG0T6xD
fyiIo+zQYoO/0BeqK4+YSru4q2YblqX9c1tL2rOndqifrkgQx3XuoyK++trALdfm
14j4waRS79i69CyP+ZCkaIPND4b7BxfkwtKtEeWpeopxmI6KsHjrL+6UM4Myq7wh
3+x6uPPaRnMcFTtTbwN+obcz6u+Twhjrg30J47pGqtjEDayJvMHBrnHBdXmB/jp8
pkRqi52cqdNM7VsGuMqxN0bLsz9nwQ==
=lkDq
-----END PGP SIGNATURE-----

--RWRxhWSMr9/Wu0eT--
