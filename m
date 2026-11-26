Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702446;
	b=3hGpig89EjG7ikpgmkJ4zmAahh5RHrifBdqwhzWCBJrJilIhf1hphN/ao13y1R8hkdo/
	 eeXJHUze8qR2AAmcnxWQmfz3BNRptY7MtiNScsjAvKGDLxslufMVvW44Be+NkNM2192Tn
	 T0/XKvIc8MqZaKPZ1s01XJduBKMg2TY90f81pmPPb3hzrYfxQ+KpZsB2JqxkL3Vq5Y5st
	 /ZcHkglaABFP/AOl2lhwPnehs1bhBwi2BE+sc5c2u9m0FIZ1hjvnz1nWo5Kd1RQb/k3J7
	 77j/yXLVp9lg3zb4RITYgrBwMK2UDKxTzUuqOoC3go9M7lB8Mc5ajletjDNQy8K5d6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702446;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=unoPs7xtQ5MF1x7IuGq02jNg5rd2kg+olh3lRYLWtXs=;
	b=Vm0ttM5av/AFjvyOaXthvCIahWR4nhwnTJP+PBxZfG6sTDjm6PQ+jwHeoafiM/rrlvjr
	 MnnKuvJhPsGUhMQOsYFOn2RCRiJyPRm0cuMAaW65dQVdq+VI1kCqObTOE2cYC9DlNpshT
	 xUcxLoouYTGEj+DDH5ufvT0pvTME1JHClNlxGSVkhD9UhGmBgSFStks0Tmu2UHsSz4aUB
	 ZN6b8Wfw/gsZRbN/rOjFz9VxE5PPa5RPtuel52lRSSdSQ+fm/KS8GopuVscfyi/VXZaYq
	 LnA/sllvoKRaXHfS8mnIpe1qX6RysbTecSEAl56k7l+EYj21V4GofvAMnIzvzveFt0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S3HdT7nz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C0F606A31E;
	Thu, 26 Nov 2026 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S3HdT7nz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476D91F000CF;
	Thu, 26 Nov 2026 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702446;
	bh=unoPs7xtQ5MF1x7IuGq02jNg5rd2kg+olh3lRYLWtXs=;
	h=Date:From:To:Cc:Subject;
	b=S3HdT7nzKSL93ustD2S2hTO4jkobK2Mxb7JaNi/O1LfRIGdTqC8hzysPklV7Vyv1s
	 ZCvm/p+0GQRCrAMG2rpQQe/3ZgUbAqNRofazQutyl6ABzvzgM3poP3CdXm64zALkYN
	 XrGIY7xs+twXujKrZSPDCAitqILgF7MwD5e1H5gG9lkKvG1CwZAGc5ixrdfmeNMHcr
	 BrpZf8iZEMjPG69G/W1Kztnw1tsR4SBfLJs3lj9KWz6im5QziBsCPtcE3rPP57O+ga
	 8xeUlpTBFI7vigh46vcPShX2GVxSLr7RVg5HrgSlwejdNhLf1FuoU6GkMTeFt9IdXQ
	 5jBF4SmosK41g==
Date: Thu, 26 Nov 2026 14:14:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>
Subject: linux-next: manual merge of the arm-soc tree with the asm-generic
 tree
Message-ID: <awg-qQ3MZwOS7Rws@sirena.org.uk>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6oM05WHMPgAl72P"
Content-Disposition: inline


--t6oM05WHMPgAl72P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got conflicts in:

  arch/arm/include/asm/hardware/dec21285.h
  arch/arm/mach-footbridge/include/mach/hardware.h
  arch/arm/mach-sa1100/include/mach/bitfield.h
  arch/arm/mach-sa1100/include/mach/hardware.h

between commit:

  4a81407e4d4d0 ("arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi =
headers")

=66rom the asm-generic tree and commits:

  aed54038a668c ("ARM: remove sa1100 platform")
  e6f3817ff3caf ("ARM: remove footbridge")

=66rom the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Deleted the files]

--t6oM05WHMPgAl72P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIPqgACgkQJNaLcl1U
h9BXqQf/Q70MJeWwOvg/PGEnCbNdhubB9LnTJxDiHiBqBgmhOom5OcHH89lLyqwn
J3ricMptINfFOMLl0nya8u0bV5dtOIoat7w1BlJXIKygibFGMBNtBD291DP2e8OO
4/sjNHtaI3EMAAu01r6t9TA44R0ZKIMPXKkacDdGfKobEsXCmRrwd+djeuJ/vyuF
40b9c+FnkEuKW/M8vXMkx8hT02aX1telEhEUMeTrJFgP0yaQ1cYnh08RFYFoeGA7
Ou9aBzpKiagQNiwD6TZDZh3crmbJnMQErEynFIlVl2uGZN6p9sgQKC9xIHV3zcbZ
/ntkjbB3rFUwGKZ4XuLEC4ja9oZ9Mw==
=H0f1
-----END PGP SIGNATURE-----

--t6oM05WHMPgAl72P--
