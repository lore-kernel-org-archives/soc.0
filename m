Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85B0C77B7A
	for <soc@archiver.kernel.org>; Thu, 18 May 2023 21:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7626AC4339E; Thu, 18 May 2023 21:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2C7C433EF;
	Thu, 18 May 2023 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684445509;
	bh=lNL+k3H/SyeTgTh2EpoRKz5agGIKPRGDOyv9RjDde/k=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=aaFzyI0f913j2MuXEolyeEXyyc3GO3pW0zoivzOinIgt0IUPrtY6y8q7HEKovqoHm
	 GPVlFg2HU3jtAu/3KV3FSoxC8DA0KMt0rCqpRzSiIlab2gn+s6cav+dY3agrRUFOhz
	 BWzzElqhAglQtMdHlloDa3J3IBeDM4iXg+Tj1gYpojvxTCb6zsN3jSJ95rYYSjGXpu
	 82d98mYr4fnhYbSuASnyjpD9Pz/Ix5t37QFg4+MiZWH6aulDBBaWtIzgreZTHtWiT/
	 34ziEwc2fbwtVPHFXbwrzgvmfV/dfFkvUhrOH4ioQNd7100l34z7QbXTFSYsMhk2YK
	 rI84FHpuRFXEw==
Date: Thu, 18 May 2023 22:31:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com
Subject: Re: [GIT PULL 1/2] arm64: dts: cleanup and fixes for v6.5
Message-ID: <20230518-tactile-outback-f4ceeb36d68c@spud>
References: <20230517131255.471002-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2BWurFb0z5GwQBwE"
Content-Disposition: inline
In-Reply-To: <20230517131255.471002-1-krzysztof.kozlowski@linaro.org>


--2BWurFb0z5GwQBwE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2023 at 03:12:54PM +0200, Krzysztof Kozlowski wrote:

> There is ongoing discussion how to improve a bit Microchip ARM64 SparX-5 patch
> handling process, so the contributions won't get lost.

Aye, should be sorted. We'll add some arm64 specific branches in the
at91 repo & a patch has been sent for the related maintainers entries:
https://lore.kernel.org/all/20230517-shimmer-retry-34596c637882@spud/

Thanks Krzysztof for picking up these ones.

Cheers,
Conor.


--2BWurFb0z5GwQBwE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaZQAAKCRB4tDGHoIJi
0ucFAP9FsBSzbfasREHu4YtbKs0mqnzV4QTMrMIwRhuqfU8fzwEA6IrkQ3ZvCcKO
C7Nmi+N7Eycv/T352FFSEQVJX1Btwgo=
=IgHa
-----END PGP SIGNATURE-----

--2BWurFb0z5GwQBwE--
