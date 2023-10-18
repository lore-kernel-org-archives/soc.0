Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA4ACDB47E
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 12:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35D78C433C8; Wed, 18 Oct 2023 12:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52005C433C7;
	Wed, 18 Oct 2023 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697631129;
	bh=GNSNBuoi8bXQFAqtj0OcNBLL8Yx5igtHWQBXtmRYAMk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=RGuJHmLKUFtKLXMlHtqLYyRo4jc7gE8obyGF/WlFgrCmsVoyfXqEgde3F+j8Ig1EY
	 OP0BKp8VfeoTy+ppmsNLgruB1XU1tu2it8zAjNiTUtVPAkutiOh3moN/9amqOcFihe
	 4EUQWmU24HhjT5yROp/Pd97I+Gp4VL+yclKuEYCqYx5WaoaVIYTosxTRHf/cq6tG6h
	 YWyqOBB2ozCCAvy8/6dLECqPCUCp8BV9Nft8BdK3i5NlRWuChO93oSq99dOzA8xhi8
	 WL2P8NR/e/MD/IZVHqbsI+kqu6x17ya4A8WVYT7wNGegsWl4LIjK9S2KrHVKaxiOVr
	 9onSfNLI65JMw==
Date: Wed, 18 Oct 2023 13:12:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: <soc.lore.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	soc@kernel.org
Subject: Re: Covering DT build in -next merge
Message-ID: <b3659452-dfe6-4b41-8519-b74d1052f20d@sirena.org.uk>
References: <ZS7rlTZLr0m1OEv8@sirena.org.uk>
 <20231018171101.26b8dbcf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W863xjY2YyCL2q8P"
Content-Disposition: inline
In-Reply-To: <20231018171101.26b8dbcf@canb.auug.org.au>
X-Cookie: Santa Claus is watching!


--W863xjY2YyCL2q8P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 18, 2023 at 05:11:01PM +1100, Stephen Rothwell wrote:
> On Tue, 17 Oct 2023 21:16:21 +0100 Mark Brown <broonie@kernel.org> wrote:

> > I was wondering if it might be possible to add DTB builds for relevant
> > architecutres to the -next merge checks (everything except x86 AFAIK)?
> > Some current experience suggested to me that it might be helpful for
> > bisecting problems found in testing, breakage building the DTBs causes
> > hassle since where they're used in tree DTs are required to boot the
> > kernel.

> Ummm, arm builds (and many others) select CONFIG_OF_EARLY_FLATTREE (in
> the case of arm, only if CONFIG_OF is set), and the top level Makefile
> does this:

> ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/boot/dts/),)
> dtstree := arch/$(SRCARCH)/boot/dts
> endif

> So won't this be the same as doing a separate "make dtbs"?

Huh, yes - then I'm not sure how we're managing to see such extensive
breakage with the bisects I'm running - I've been running into lerge
ranges of commits which don't build due to missing header files.  I'll
have to check into it, sorry for the noise.

--W863xjY2YyCL2q8P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUvy5IACgkQJNaLcl1U
h9AHcQf/SpTLvC/ca55odnLsysHNI7zhux/l43mI+5Z9sYlryuWok21BAAwDuYOO
WVmTSjn6mlALuYYO4x5UM1soVX4JpsLRQmUh02ieShzYfvCq0vkbmFzn/uogtGGh
JcPBSFxVNFA8phf26xorbG4Hys08DTu6evi7qjBky+Kum77t0FEbP5r6cqXsYmgO
AeWHRGT4eF/hSdhfRiq6Dgek+yKwZr6cUqjc04aQ+DIzqHjWUP8FY6aQQWt+0Vz9
JBZxaKJPaBT2l2SiU1urP/nPg6cd1mxF3HTmCfNHVkNY1zAwNFiIGrsRc0NqPwfQ
cE/JD1JayCJbGRRB5wbntGQXS9ZONA==
=QZf5
-----END PGP SIGNATURE-----

--W863xjY2YyCL2q8P--
