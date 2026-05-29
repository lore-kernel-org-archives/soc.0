Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D18368D73;
	Fri, 29 May 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055381; cv=none; b=cxh+lFht9x8dQe2OC94JY9CWH3W2dFTEJJwG5qPATkgkcA9PjEovmUKJe+u1+fsy4uqyTyfgGm3PFMIGJ72JhmirpUiqAT9VwYzHDD23FD+tv4P9r3gJoblrEILdijaisixdYlCy2Qm24RV01PfPor8gNJkB6nltMw9/NcXJOlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055381; c=relaxed/simple;
	bh=Gv6hySGqB+TbKvyVOaRq5oyPeVQavoEiqDBMXcy+e+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLH3x/33uig1sYwpYB8kKBHjVyx7dzfG8mRlG9eiAEjQnd3LmABBKVewCJd05Byc+9mhNgIzXuRyzNhCAWO01trq77znsPfPdGBJgBhZBSY6njQ5Gd2bnUBoJ4XHVfZF+LaFR9tO2eYhPCu7QI4uaubE7yB9hgce5n7VBP5n6aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+pZIcpN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+pZIcpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAF71F00893;
	Fri, 29 May 2026 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780055380;
	bh=UhHVVbTDLpyL8CkfEhKgwaQRa8ihnoiN8aYpeAsu7W4=;
	h=Date:From:To:Cc:Subject;
	b=C+pZIcpNd2eOKJd84cQlHKVCC2w5/9HHiN5wIe/c4ptIvN2+I7S+ODEFFJbhMtMkc
	 kdj99PkoB3HVyNTpaS2iUBBKKrpGBzq6+moQ77RxREbRJ76cF7Kpb33ekHjCDfGEU8
	 GA63xa0oGNybk+SSJATnWAfmRX1+1nwr4IFQR3CyoRGdczlukD9dNvRRvxdnBzwSMD
	 Le9EZ8lwssmnqMDt8atZhMQ0dZ0C3+GClUVhEoNogBgLcusZafGBvtqaY4LVZawXKS
	 4fR/SWG2Vo49YQUCL9l/tfPY1Vwu8V3on4MNQKW4R+F0p9vF12Y9BBdHo04xQttn7B
	 jyJ5i1JkZQB8Q==
Date: Fri, 29 May 2026 12:49:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the arm-soc-fixes tree
Message-ID: <ahl9UR0tWlho_YlM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ggY58tqGXEL9n68+"
Content-Disposition: inline


--ggY58tqGXEL9n68+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  90825ab392ac1 ("arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node")

Fixes tag

  Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the

has these problem(s):

  - Subject has leading but no trailing quotes

--ggY58tqGXEL9n68+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoZfVAACgkQJNaLcl1U
h9DSdgf+NU4Pg2YVURrzEkg+r/PWwXOH0RbtNF9FZ1Grpj8qNWUQSGdbiEqZaR+r
zenFYaQ3SHKUEPd702U20GvF28tNcXdsG9KKodoZsKbl8EpCBg3ZLh4qnjHkN/9f
mZ19V1OL/HsErrumAkh+gctIjUbDy8ZA2YNVR2vgWqaHt3SwuA29JNFL/BpEa8Dy
Jhe5Ir/+sEfCCK9/ZNun1H243hvycLAUm9DHN7a0O0HQGF2rWFwe/kIrqL1swShZ
AARoYkFY2N7juKc2ktDWjP1IupOAYxWeJJALPfkMNZtIMWWW2gX96KDzHBTSq1i/
OvY4u4F3DYgojxX4AW9sNe4AeB40RA==
=0U1i
-----END PGP SIGNATURE-----

--ggY58tqGXEL9n68+--
