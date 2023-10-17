Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEECDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 20:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4B56C433C7; Tue, 17 Oct 2023 20:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5554FC433C8;
	Tue, 17 Oct 2023 20:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697573785;
	bh=rb+RBJoFu6bvYnzyaQ5XWl34+6cDQNkGCsQRGexkiWk=;
	h=Date:From:To:List-Id:Cc:Subject:From;
	b=ZVRTlHH5iPfxTuvFEM+8ldu/CYGuEpuwSpwMy94Mnc3msZ02knKOKE+GtmIDFQONi
	 e1om+CidRC6TYKioKh2Zq9ugop2TCmH/LTDRF1sLAhjNyTonvnEIOW5h7dm7D5dDVu
	 nQabI4rYdXkWqf8FhVshWteXf7+02dyhyaTOuKYK0pv4EK6M2G4KTKgF25/8m05F5X
	 CRorLy0PrMC1F/J0WAMeFDKOy5ZTNsaa2K4DvhbqX6X+l1lHJYPeAzHTTUxFIPsEyJ
	 RpVCJWvX8rKzegwuAHtdshJDmpRJzYmo5Ay355WD0UfTfsM3xIcLZQRdJEe4IU+FoA
	 EcLnY6+kmTmKg==
Date: Tue, 17 Oct 2023 21:16:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: <soc.lore.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	soc@kernel.org
Subject: Covering DT build in -next merge
Message-ID: <ZS7rlTZLr0m1OEv8@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5e8TdPFi0AOXwHz1"
Content-Disposition: inline
X-Cookie: Santa Claus is watching!


--5e8TdPFi0AOXwHz1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

I was wondering if it might be possible to add DTB builds for relevant
architecutres to the -next merge checks (everything except x86 AFAIK)?
Some current experience suggested to me that it might be helpful for
bisecting problems found in testing, breakage building the DTBs causes
hassle since where they're used in tree DTs are required to boot the
kernel.

At least for arm and arm64 the DT build is quick enough to be negligable
in the context of building the kernel itself so hopefully it shouldn't
add too much load to do this - it's just adding a 'make dtbs' (with
appropriate cross build options) to the kernel build.

Thanks,
Mark

--5e8TdPFi0AOXwHz1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUu65QACgkQJNaLcl1U
h9AXXQf+JueBGiDUb84votKCZmtH/y0Q8UvVgZgZsM7XCIB1Zvjzb+eTpoS04YpZ
vFebb9ZXdscUxCRU3Z4cpxntmeDSAAS/secmJzFAjRBkZroumQIoREcZjvbwBEg+
jnfKYilr7pf/YMNzqgncY8pnMg76GzHYpOfiUdSdqVjURimyHr1+remcFb53Qjpi
tCNSsN5WT26ODmIFBgf2MeXDDjFBdOmL3fN5oDSrFYAARhqePk37woCiwx1j5G/7
5Qi4DU1lYp1eikm4M5mLuIxKsDWlUbrvZTxY9GDecyp5izqNRcmXcXUtXCCkMgI/
V707Rfgy07kuj1Q4mAHEC9vJsuesdA==
=nt+M
-----END PGP SIGNATURE-----

--5e8TdPFi0AOXwHz1--
