Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879873CF976;
	Fri, 29 May 2026 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055390; cv=none; b=rhCrA4IjGD0BInMBTy3zMgpPiYxXhfQvvJoAHc/FlWwqURGd9xGjiFce0NeyaGOiqAuDjR2UooTOe/F5huRt8cTaue208UL95TaJ+ksTYG1eRGWNpPO4riTpGw2Bj19em6UK4Rr1ShFS/tVlpczmIOZCaw8AaTqpQ9+lvJmLjow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055390; c=relaxed/simple;
	bh=AaDW3gUQxDtj6N/TBqUucb9aJ3ZMPEiBO7h1qYkd/Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X2FqyqbayE0MDH87ElewoUvGZ0vzDFoXu/8Rs26lJMU91GU+C20BmYSWPBkAQerMMKgF/sFTsBiraMXNSysoDk2WrTwCOJdueK/9GrFtbaUTjKr//daaZEJQse7oy5XkXZCIbLoJYVmzjU9S+f0iOOP4FH0iNv29EFrM3OcsrNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy65K6Qe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy65K6Qe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED571F00893;
	Fri, 29 May 2026 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780055389;
	bh=FmVc5rfuNKL20/TBZ1WvyWH/vJX1ksbo/UkwXmpMGLo=;
	h=Date:From:To:Cc:Subject;
	b=hy65K6QeIetJhPz8hNMF9ES0DmLptgKqb2wLfni3bmoNL+j8UHZhibg5+bBcWZQTG
	 uBzhuBJwZKdh4Vji8zMgjdnxlqa/9Ml6sa4Qij9BOC2D1C8klPcCij0aH2qVx4Dn8P
	 Op/yq7Y8jMuSsqKIAnicjTYP3YC8NVMU67kwIfyCrCEolhcTSZ1DE6fuqOsS0HuhF7
	 k4Mla/pEx1n9iae5UXwejsvUf7M3NDWtR3FuSFo/0tvtB7f9WzHIVuR3FWzeIlu+qS
	 PFlTVX4A5hi/yt386kbmIZyuFXOUXLZlffYt1JVL7cXg8Bh+oTbgeNs3igUu5Qjt8Y
	 J1kcKPohbFCyw==
Date: Fri, 29 May 2026 12:49:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the arm-soc tree
Message-ID: <ahl9WYLcYwaMyVJ3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIAZ1wya8cd5MvRH"
Content-Disposition: inline


--XIAZ1wya8cd5MvRH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  90825ab392ac1 ("arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node")

Fixes tag

  Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the

has these problem(s):

  - Subject has leading but no trailing quotes

--XIAZ1wya8cd5MvRH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoZfVgACgkQJNaLcl1U
h9DcoAf/eNkzWHr/KmP/SubGREoBDK9xBgWTpFq+sMKfuw2OGHtdAnOFRw1J7XYl
5l7FYjoCEe/B4l12TW1h5rJa0NJP/Dnl7GyiaxCem1QvHeBwLPCiQR6ZN7IsNBdy
HC8v6t/+sfyqm9bW4dcfqq/s9vb1ebPkaiYBLfghY0S8IVSZ2zWDat5d1Uwy7m62
H8UgvTpUjURkxc9thILafB8hkX7sHPc+cDPPgEfR1GPCSeSq4CTMhZUeXsx39B0K
QNBITi0YpskuYEoLmUo4/UR1ZiwwC8vTXxYPwGeSpsvFOHMuSjfaLYH1Zx2WCiLu
YuTcBwDWt1Y7CR3+f8XiRuTMFynKGA==
=7MZL
-----END PGP SIGNATURE-----

--XIAZ1wya8cd5MvRH--
