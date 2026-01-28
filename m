Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0168433031E;
	Wed, 28 Jan 2026 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632033; cv=none; b=TGl5/FTV4qmX/HJGYjmTVJHsX9Nt9ZBc9fEAHur7cjsukU2uW/91RprLY9JVcKbncWJfCFEWebNeB60FWi6+Hw13Dpk/i5Hm/qSyAfcDbpUYVfnewHHsbuxby+ghEfnf44mOXrzcolGP8po3KlkoMqVPCXUOPvltAtDseC93wzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632033; c=relaxed/simple;
	bh=LcPr/gHObVG39MRocW2Kwf2/O5IzC7hdpjuApF6qQx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VwAETi1lGmGEsm+Dmf77aihLhBolh+edsjU9qccxzsmrct3EkDJH7IQ3T4rcDtTTBCwwL/lJILlJ6K6fALChzO9K3oXW37jDvKrN1Ckht+oDMQydXJFJZocZHaf8QBdd3dW1Y2hjLJ6Uu0mdzVsuQyURaKJK/9pRUYpSmkku0N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCIA8O7Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCIA8O7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33C2C4CEF1;
	Wed, 28 Jan 2026 20:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632032;
	bh=LcPr/gHObVG39MRocW2Kwf2/O5IzC7hdpjuApF6qQx8=;
	h=Date:From:To:Cc:Subject:From;
	b=iCIA8O7QkTd7rGccPeDaq1JZjYder1hAiN0MajGHaEoq4TYrmbi4I9M3/g2Kx9Sq9
	 cmEFP4qqxGb/l//Y1t1Tj0aU5mYMixWkK1jEPiXYMOYGpFgdScPg+PxVsbifkPoBop
	 ka07tjX/gaOXbXIil+UGrjr6dmpvYDc108RprNql7I3HR9Zq3C2DupvfJ4uQ1Aap+z
	 HBPccplxQ2Y4IcV8c5QNURORdiAdG8SbEfRGDFnQ5DE2UXOjAOz3XISPA9aHvlxa1z
	 bYbiHO62zi5clXLf6Yd8ft01rZDUHHEtNg15Q8xGT0yu7m0N0wetlpDZnwWs2gyQmV
	 K0tL7PEzn2x7w==
Date: Wed, 28 Jan 2026 20:27:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the arm-soc tree
Message-ID: <aXpxHIgiFDSJ6XPm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eS7A3kXFh1ToR5e8"
Content-Disposition: inline


--eS7A3kXFh1ToR5e8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes tag

  Fixes: 312189ebb802 ("arm64: dts: mt7986: add overlay for SATA power  socket on BPI-R3")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--eS7A3kXFh1ToR5e8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6cRwACgkQJNaLcl1U
h9DHlwf9Gn8kJhBwTyucJAwBtYvIIKS5gLWqfN46k6UbEoTXyEMR4CiIBd1T0OqQ
cOZI/tow2USfVi9RgPRz6FeX9LKbRec/NzlIyQ12TiVTVEuuek8eVkChyh17t1ue
o4g93QXTTW6sUBNu3mfOnP8vFHq4iOUWemIhxQOiQRw/r0gu1fMpd/+DKZHsaQ54
uEOEiAA6kuAc/67o7ox6SoLl5Uji+b1Hi7OalLEkjlbOv2SlnP0r3TN01l0SUP56
xbArUvUCiLq0LKdPl89z4YeRGtq/LKuvYLCTPRcCEDw/QpttpF24zRj96tU8j5TZ
W4WsYAGg3qx+EZSOxHkig0jGzFzPEQ==
=HVLJ
-----END PGP SIGNATURE-----

--eS7A3kXFh1ToR5e8--
