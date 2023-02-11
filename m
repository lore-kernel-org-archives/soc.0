Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8F9C61DA4
	for <soc@archiver.kernel.org>; Sat, 11 Feb 2023 23:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04632C433A1; Sat, 11 Feb 2023 23:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414ACC4339C;
	Sat, 11 Feb 2023 23:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676157024;
	bh=Vpk0kzPmLqOB9iqNdDvWYiTR6ancyGu+HM3rMaZPgtM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=YxMJQZElih6rCSXB7YBlVBrWAMmQzXkIzdAnm2BwZN/znBgBdEwfvApfPmMZCCfal
	 54lUX8CqdMh0LA42QMFgBxaZ9MB/7BvwQybcCob4pMCxlRvI5zjFRYz+EVusFSCsFp
	 quDidUDYvZMSb0IRjjrgPHIZS+kt1kRfyJL7wu4LliRa8TmPId7fDfdHISzMqMk2Gj
	 un2pXCpUX27+XP7Wj8ZQtWb72rhNVodlrmyPXSGhleYsKlrzZJADHKpAGlwmUHcd85
	 64wcrqL/DetEjtE3K+xrqiTkWiCdKVMeAUwpKuvTXTVMcw3Cxl5SHxsyi43+rg3m8h
	 t0thZJkffq03A==
Date: Sat, 11 Feb 2023 23:10:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, soc@kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: configs: Add virtconfig
Message-ID: <Y+ggXgUnEXHWjeLw@sirena.org.uk>
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
 <20230203-arm64-defconfigs-v1-3-cd0694a05f13@kernel.org>
 <CAK7LNASRz-apG_pNwvNOqxXy+-tp+WGHV--g6yYU-UQnZx5tgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Y1mJBoovkaRa8jS"
Content-Disposition: inline
In-Reply-To: <CAK7LNASRz-apG_pNwvNOqxXy+-tp+WGHV--g6yYU-UQnZx5tgA@mail.gmail.com>
X-Cookie: Serving suggestion.


--8Y1mJBoovkaRa8jS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 11, 2023 at 04:37:02PM +0900, Masahiro Yamada wrote:

> Yeah, I have a _local_ script to apply
> a similar config fragragment.

> When I run QEMU, I disable unneeded CONFIG_ARCH_*,
> and also disable unneeded sub-systems.

> Not only me, many people are doing similar in their local env,
> I guess.

Me too - I've got a config I actually use when doing development
that's slimmed down a lot (it's a bit bigger due to me using the
Arm FVPs for some things).  I suspect you're right that many
people who do this stuff regularly have one, it's mostly when
someone is doing cross architecture work rather than specifically
targetting arm64 that it'd make an immediate difference though
it's possible some of us will decide we can stop bothering
maintianing our own configs.

> Of course, I will not upstream my set of CONFIG options
> since it is just my preference.
> After all, this depends on people in my opinion.

There's definitely room for opinion with this, for example with
some of the virtio devices which are less frequently used in
development.

> BTW, the minimal set for booting + minimal features
> might be similar to what Buildroot provides?
> I do not know... It booted at least when I tried some years ago.

> https://github.com/buildroot/buildroot/blob/master/board/qemu/aarch64-virt/linux.config

It does look pluasible - it looks like it might be slightly
bigger than just mach-virt since it's got ARCH_VEXPRESS and thing
slike the SMMU and PL320 turned on which I suspect means it's
intended to support the Arm models too.  There might be some
other stuff needed for common test programs or systemd though.

--8Y1mJBoovkaRa8jS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPoIF0ACgkQJNaLcl1U
h9D3NAgAg4vpXANWCqovcZHQRjzuMCRqDWImVNNDvkp2PbBYk0180ckSEV9qFdpN
jm0cDKC88fV4RG4FrpNJyTv2sZPkhKI+3htcbbrBqKcWrju95KmswxpHntfklTDA
qz3amUdXcwt6Yn6JxXaHq91aKGhfnWX/bYN1POjx0xx7XIiqGTj5Nd6TXP7AwolX
Dg7CQkWoyhjfBi1HS/mPn2Q9kZ4QH7dVOQ32zYx+QwcxYKPnFwuczwxfKXXvJsXt
fPigP7Xc2pjVeNIA89qblcqnLIMTVET/bFOwRsuwNsAtWv+N3ypyTbb/bnsf0mUL
0QV2v0Lz5E/2EfnjOVkHhJwCoUTnFw==
=ROtj
-----END PGP SIGNATURE-----

--8Y1mJBoovkaRa8jS--
