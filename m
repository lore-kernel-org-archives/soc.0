Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F39C636CC
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 15:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA39CC433D2; Mon, 13 Feb 2023 15:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A25C433EF;
	Mon, 13 Feb 2023 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676303283;
	bh=JJ2XddRBBZBI3CrvECKzu6G0uLdCFe6bWZWUyTb48eU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=JCFq7JZpxhWFhMHbP8/Ku6YKu91jP26AdZF4Kswz6hvKDgQzsFX3RG1fMr3d7gTzC
	 ks2vBs3u8CiDAz+17gFzuvecXbnns5vWWj/Vq+tVQNdH2+eQQ1CAaXw0/V0/jx4shj
	 VBZr02U6JAzarwZit0q/UD9LziJqGx453HqIb1fdDdPQ/WIXNGUgU9Xs5tXpceeIvy
	 /yDTp0j8MP9A7r7kaF9rxmOBN3Rk6e5ND8G/OpbQl9774m0TsQfQEU1B6VzSpIDQqN
	 nwk5axpyDlKzxJJc1lQRnoOpJI0SJ3SYaG2rE6HkNadsHxcU27h7OvuEdJD9vPI1Qq
	 3AqMRlAlkM6zA==
Date: Mon, 13 Feb 2023 15:48:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, soc@kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: configs: Add virtconfig
Message-ID: <Y+pbsFgIy84xleNK@sirena.org.uk>
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
 <20230203-arm64-defconfigs-v1-3-cd0694a05f13@kernel.org>
 <CAK7LNASRz-apG_pNwvNOqxXy+-tp+WGHV--g6yYU-UQnZx5tgA@mail.gmail.com>
 <467e7a7f-1703-4f13-8604-6d582e4f9b3e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BhvbPMx6qAoOYHdI"
Content-Disposition: inline
In-Reply-To: <467e7a7f-1703-4f13-8604-6d582e4f9b3e@app.fastmail.com>
X-Cookie: Serving suggestion.


--BhvbPMx6qAoOYHdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 13, 2023 at 04:15:52PM +0100, Arnd Bergmann wrote:

> We could still combine this with another Kconfig option that
> just hides all the real SoC options, which would turn this fragment
> into a one-line file and avoid having to update it whenever platforms
> get added.

I think if people are OK with this approach we'll want to extend
it so that it's cutting out more than just the platforms -
there's quite a lot of drivers and subsystems that aren't
platform specific but are clearly not something we'd want as
default for running in a virtual environment, enough to make a
difference to build times.  That doesn't mean that a "disable all
the platform support" Kconfig isn't useful, just that I don't
think we'd want this to be a one liner long term.

--BhvbPMx6qAoOYHdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPqW68ACgkQJNaLcl1U
h9B0+Af8De6dUkPsiaUw6vpnmbd+a9KsppGMi1WA0uOj65hCOIOXXObDCSgqG4g0
IPPd7qdoy6POxs2bZIJlWppXPOciQvoyewUTl5yGQvoD6xM9RgDCMW8Z+mMq432G
BFDlj71aD9W8PVjtpakW4zC4iRtq9kdGKxOIvq9BccL3bu02h3R8BAzas9akoIY1
Y13Kpdn0sy+X9GPkQlVkiXnJcBqG8FAo6SYJnE6y3A8JjGFRe/vj9aazECTPA00L
ChP6NP9794s4I23AdDyAbInB/KihbP33if9KRnR1MBW8Es9SzG6/SGYJ73+f4uMU
CaZGWr5MWb1r83aqAhT8fMLVj2CaDQ==
=KLBz
-----END PGP SIGNATURE-----

--BhvbPMx6qAoOYHdI--
