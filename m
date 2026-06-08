Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D043385B2
	for <soc@lists.linux.dev>; Mon,  8 Jun 2026 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916210; cv=none; b=ak+S0YOEUfUJeSNgPucxW3VOivUxMi7ggyPh+eHGLScZlSTVJq8QUaVc7lAauIdIjASCK20RVgeD2/qLqEvmmpfyrSwJQ7DPjZ82XN5iPzjPLc/xcLtFFChn6RMoz4BL7SeBWRZXwspF2kQm3DnuoytxpG6DFfI1Q8wgOuzYp5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916210; c=relaxed/simple;
	bh=AnsKeoDkPcFNjb/Pr4hNBK2FqbW/xCMgCWu1+s3PfVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loHAOT3eWsU7YQ5UVlO34UdfrcL6CmaT6MyX7xFiJAO/K0rHpEY7gtvK1bRkZCRQTam7adA72wNQepENThwFZrCBWslH9b3BjFYsH6UdxtrDqpMLtS3ehnRSXs1THxH8wpk7T+KeshpVOz28ac7E1CcRFIE21XiiVq9vEJ5VZ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1dILxmI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1dILxmI"
Received: by smtp.kernel.org (Postfix)
	id 09D211F00898; Mon,  8 Jun 2026 10:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006191F00893;
	Mon,  8 Jun 2026 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780916208;
	bh=fyBk0eZtnLfb+bujJcB9CnVICzL/3aVTwKLHeGlIQlQ=;
	h=Date:From:To:Cc:Subject;
	b=F1dILxmIICyZXo9qIqCFY7hlL45UN3CzT4gtQ67qRGVW4qd4LOYbSViismY7sg5fN
	 S71WsthRoxqXGKn6fzWUmIRZQwTtMgV2GMVhmFYx8Dn45WuAAPiKieuIvisZ6Jvuw5
	 GoQ5I3DbQuj+kOPqzbPwQY3FgiPyLtkjMIG/534sV65iFTd3ssJWswd9E2u7bMrB+o
	 uXsdPPcBSWWc86MabZK+63hdjvcojUDfiPHXrBcpCq7/4CL0Fmu7Kqc4KGO9J8XPHg
	 WcU7KPzQozo3YoZJs87Bn4y3YcSIGNpBQHPTs9AipmAW43qBfTE3y0AWa51nTLxGZb
	 CpUt0HSF3MhQw==
Date: Mon, 8 Jun 2026 11:56:45 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, jonathan.cameron@huawei.com,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] standalone cache drivers for v7.2
Message-ID: <20260608-retool-automatic-2e55911639f9@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SfyJYZuN7jyFlQRq"
Content-Disposition: inline


--SfyJYZuN7jyFlQRq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Just a single two-liner patch here on the cache front.
A new driver popped up in the last few weeks but isn't ready for this
cycle.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ cache-for-v7.2

for you to fetch changes up to 8e2501e1494c8d27f62eb8d36bba5af465f48962:

  cache: sifive_ccache: Add StarFive JH7110 SoC support (2026-05-21 11:12:00 +0100)

----------------------------------------------------------------
standalone cache drivers for v7.2

SiFive ccache:
Add the Starfive JH7110 to the list of devices that need the
non-standard cache ops, because the GPU appears to be DMA non-coherent
unlike other peripherals.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Dominique Belhachemi (1):
      cache: sifive_ccache: Add StarFive JH7110 SoC support

 drivers/cache/sifive_ccache.c | 2 ++
 1 file changed, 2 insertions(+)

--SfyJYZuN7jyFlQRq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiaf7QAKCRB4tDGHoIJi
0jChAPwKrfXAngc+nIHH6lI/EghzbEhEsp3WC9hY7MD0mLmYtAD/b9XfGoZLb7P+
X4qS+dbvZuctM3ds7fYKqtJNvFrJWAI=
=FUKS
-----END PGP SIGNATURE-----

--SfyJYZuN7jyFlQRq--
