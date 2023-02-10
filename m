Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2236C05027
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 23:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 679BBC433D2; Fri, 10 Feb 2023 23:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AA9C433EF;
	Fri, 10 Feb 2023 23:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676073074;
	bh=f8YMpC4cTwaXZAjRfIHKgwCSThebAz3M1m+wTa1DfD4=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=cvE5JX7WSHdEZruL805RkrXdBT7xXZZWaalJllE7rT7ByWMskTEA6yLtYlcyT5Bop
	 F8eSUx5NC+uTBBqricua+m0cBu+L92F6g2/UXyVkha74THcdHipkg4r5Upnvvk7uD3
	 0TwX7WSyot10o//7xUrTMfamM2x7eN3Yq9e7CpydK3Sq1XhpRosuimBpdsGH4Y6Z9G
	 PSc9qabSRlhDC4Yiow4ppFrhLaWuO7GoaN7uO/azBW8/CBgw5uQQ+wpvx+EjdFweWi
	 otbbJI/r/Tenq5zQ4eFgOV+Q6OmeYWIqxXQatILpdFJUTKNNVggwVB7pu+/XLVyRdS
	 VcrBTB5Gk9Gsw==
Date: Fri, 10 Feb 2023 23:51:07 +0000
From: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, soc@kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: configs: Provide slimmed down configuration
 for guests
Message-ID: <Y+bYaxJfbeiTRGsU@sirena.org.uk>
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gJ7ywnByFIz/hWJh"
Content-Disposition: inline
In-Reply-To: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
X-Cookie: Brain fried -- Core dumped


--gJ7ywnByFIz/hWJh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2023 at 07:52:46PM +0000, Mark Brown wrote:
> It has been noted that due to the extensive platform support it
> enables the arm64 defconfig is rather large and takes a while to
> build in comparison with other architectures which can be a
> burden when doing cross architecture work, especially when
> testing is mainly in emulation.  We can mitigate this by providing
> a configuration that only enables the support required to run in
> mach-virt, this will be much smaller and quicker to build.

Sorry, this is v2 of=20

   https://lore.kernel.org/linux-arm-kernel/20230203-arm64-defconfigs-v1-0-=
6d0d03a6dbd2@kernel.org/#r

but it seems b4 didn't pick up that it was v2 (I think due to me messing
up moving between machines).

--gJ7ywnByFIz/hWJh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPm2GoACgkQJNaLcl1U
h9BQHwf/THjhUC/aJucKpSTA0Wz5GHbnPLtKOJ9LbFjt9ySjNntrLcijFkxP7RCG
8+ZT0+7yGARcOHQK2IF1hSEJRxShIgFWXC4wIXky/yi43NoKh3qakk/a2MGBTipM
AhD8tqGLTlhBDRxaI14nFU/8Dez4tZB4q6z6ySmBD2EsTr90fjwc5yl33I35lwFa
D2dCzbjEeoMK6dRdK4StQBM3N5Ao9vngkIVc2EYf5bDDJBdmyTVAOOvKR3ekSCVp
nHgKDJf4JE/jgdWnZMay39NC+irux2GD2cEv+INI5Hbqve1fBOEMLnC2X0jV1xKo
oJcNunkrCeIqg8ZAX5Zhvl3VkbQiWQ==
=Fqhd
-----END PGP SIGNATURE-----

--gJ7ywnByFIz/hWJh--
