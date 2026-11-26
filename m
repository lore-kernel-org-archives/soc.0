Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702703;
	b=TPkKrloYqpzh4oLnvyLly7oFILMINGkIAMpLppyk90KZ1RwZeXuG6xBdQqwbJelvtnJJ
	 6Zp8YoYIaxhuYGKUXA/LHoglrtFiljEfZ1TxX9b93hMzcLUMktVlNiGdJDugxN2Xne929
	 vIMKXK1matzFGcufT2j5Ur1tSAMU35Jcb1RwpcYGk4ILc7+KUX/F+BEAplO9rer4zcsI+
	 kYjQnpaIfDOPK1HsGTwCV7JNPfmodrmfTn0nXHe5v0bB0Jw50cJke+/y3xh6vMi9yXVjr
	 WELzZgumLIllne89l0JSuH4mkB4ZTnOi1YVMBPMvjI/H33JM+ktvA3m2Qoesh+BvBow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702703;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=li0g+4yzm+5HZaKlm3e3BgTHWheTF9xm6VFNXjGr600=;
	b=huIhl8UjTMOeD1ufPZDjLhN+sgDgrv2nMpm2dLnWk31uT2nBpssmmtm9rYwA1Qy+pmPG
	 6bFTV7i1RFI+qdOtdu9+MIWCJ6yR/7g3JkX8ddk6x8sM9U8PWgbsAyvM4ByKUbDUT91R3
	 En4ob1ltJZZqBcowQusxL74TrxXt5pvTtpKMjA5gAibkZAGbwI8TC1gMJwUQyXfod+mWv
	 WAzUaQKy2sbxLlaQD7RgHhqap9td0PlPjUylDOq2CL+ecrG0rGPC58Cv95tf6YXhRBrDX
	 tByQekZ8y8pSS5KiK/1iMHNF7yqGql3xy+K6vh6l0pwMWhK6RGMwttWmgy8hl25XEpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUyU+pZy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C23606A31C;
	Thu, 26 Nov 2026 14:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUyU+pZy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9401F000D3;
	Thu, 26 Nov 2026 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702702;
	bh=li0g+4yzm+5HZaKlm3e3BgTHWheTF9xm6VFNXjGr600=;
	h=Date:From:To:Cc:Subject;
	b=PUyU+pZyzf+II3wHV215mtxw2Js5N4bA5GVKzAxYAoohgDy11yEK/W03/RY9EMcb0
	 SqScMPXOl/ZV9vDVmcS1TXLttC/4CkYRNfTtbXL+rBLbBTmtO48fAXZB8LufaqTk51
	 TCboeuJN1ea2AEBhMbIr9z+53nFBRzMqlgRXWDBTpCQ4n3u3mAfHnRbR8vOIF0Nzdx
	 jg2iZ+IwyfxL6jZohKCXlRkE6s3XyaLYrdjhPo3GOVxqJmpsLNZeX7T9aOQjfqLI7r
	 O2ALeZb+oOfJbfq6nNfS0cpdStTtVUqwkUzPpyZxOcK3qBWbBSLr4DiyI0LYZ2NKKV
	 FwRuykFRVJrXw==
Date: Thu, 26 Nov 2026 14:18:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Herring <robh@kernel.org>, soc@lists.linux.dev,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: linux-next: manual merge of the scmi tree with the arm-soc tree
Message-ID: <awg_qpipeO0u8RKS@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="+hXprAXjSqnefud3"
Content-Disposition: inline


--+hXprAXjSqnefud3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scmi tree got conflicts in:

  arch/arm/boot/dts/arm/mps2.dtsi
  arch/arm/boot/dts/arm/mps2-an399.dts
  arch/arm/boot/dts/arm/mps2-an385.dts

between commit:

  9e08db554e848 ("ARM: versatile: remove mps2 support")

=66rom the arm-soc tree and commit:

  e7c38fdf57c42 ("ARM: dts: arm: Use standard node names")

=66rom the scmi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Deleted the files]

--+hXprAXjSqnefud3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIP6kACgkQJNaLcl1U
h9Bhgwf/f6eKw3/MnjFJmzzrZ3c721Hv7V8Cvi20pMXf3zKJYcMncmRAvToJfAsY
OrjhPTCEVJ1hqSN91qXVctBBTd1CMMcuC+m+HoTMkZFTaEi4IncjtCXndaD/bs6O
dzb/ttHi5r8WJWeyPL2YQKhkFk2xJ9Vz9N6zQEEOZ+S0Fw5mmRC7QwF4LyxDkLoJ
Zpq9aHm6IaXe1Bx5r7XixNUzz6jWikobsiEHVaWnmvi0x0IsplKxma61oh0k/2H9
9bFqukAWc68NbpZagE/SlEAiInkb8zHWiYKr6K/vJxFambm2VNq2H+60U3NUP0hq
cC2CACZ5cGIWg2EJoHzubBv6Bxs7lg==
=zooJ
-----END PGP SIGNATURE-----

--+hXprAXjSqnefud3--
