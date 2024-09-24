Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCC43F9D5
	for <soc@lists.linux.dev>; Tue, 24 Sep 2024 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727178380; cv=none; b=ny0AzfOSXWaeRjxBofMVaSKLeMbz8rwGFCdHZVfrFRV9PC9T6VkxNc3r0rtgXv7dQLfIIkoDHa20uZ/csQuHy0vErCWT1DFfEFJfN7U++CUUqy4F59Z0vqLhTlbMuwJCIa8+HhUelyuBd5WPCmD5M9nvetkl0YF2hLE3NYIiooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727178380; c=relaxed/simple;
	bh=6DhmIaSyUm5rO9r22RHuvlNx7CM1fcGSKzSl5E4kAfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oF2GIotmcTAIFsTrXf/FHg/Vz3rs57KrExxKngN2+AvWeSnbQS0Z7m7w52ddb5fTwRZHcs7lYJNeTV+lvcLEeKbdmiaAbJiKIJpvGl/K4OGbhP2gblQOXzBls5Oyy2R2jZKOashTAbqm1iUS0xcZfOUNgJPY+OGhyWRadlLy5JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4wTUJDQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4wTUJDQ"
Received: by smtp.kernel.org (Postfix)
	id 87BC2C4CEC7; Tue, 24 Sep 2024 11:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1957CC4CEC4;
	Tue, 24 Sep 2024 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727178379;
	bh=6DhmIaSyUm5rO9r22RHuvlNx7CM1fcGSKzSl5E4kAfQ=;
	h=Date:From:To:Cc:Subject:From;
	b=t4wTUJDQJ8FTqvST5jlVQ6ue1eZTljHHBkU6saTnNs7XnSNBBgyBElhb7IuaoYhVH
	 rYguBKbDK0529Xh190pb3XAYO9senRraXRNx/GXpTEnPhwYUk9E0+p+brEgD//hsPb
	 0rk0wlvDgy6KUYbdOatKFdnV9y4s1zS9cqwtnTz+OsZWqHcUGwyw5DHx7j6URhFFo4
	 ZwZ3ktWp1oqqhEtsuR6W6ptlRaXRihrvujOOouHLvVLLnVAJq+hUSiyeFJSQy732aV
	 yjn3vKasxKcYkRYCCa9mvVJPgzQ1S/oPePBtPuwpczcyynov2SFLgysDFLvpax3842
	 /ud7XKn4vDQ8w==
Date: Tue, 24 Sep 2024 12:46:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, conor@kernel.org,
	soc@kernel.org
Subject: microchip soc maintainance change proposal
Message-ID: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="47Pl5gbWTvb5cJSo"
Content-Disposition: inline


--47Pl5gbWTvb5cJSo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hey folks,

I mentioned this to Arnd and Alexandre at LPC, and to Nicolas before
that, but I would like to propose some changes to how the Microchip soc
support is maintained - mostly affecting the riscv side of things that
I've been maintaining in my personal tree, alongside other platforms.
I'd like to propose moving those from my tree, into the at91 tree.
While the dts bits for the arm and riscv platforms have no overlap
and nothing is particularly gained from me moving which tree
location they're in, I'm far more interested in disambiguating the tree
that soc and/or firmware bindings and drivers end up in.

I was going to add the bindings/soc/microchip directory to the
maintainers entry I have for drivers/soc/microchip, but while doing
that, I noticed that there have been recent patches for sam and sparx5
bits that have added files to that bindings directory that went via at91
and I figure it's almost certain that there'll be drivers added before
too long. Having a single location, like we do at the moment for clocks,
would make the route upstream for things a bit clearer - and I figured
that while moving one thing, might as well move the firmware and dts
stuff too.

My assumption is that the riscv dts bits would retain their own branch,
and that I'd still send the PRs for them and for the firmware stuff given
that there's no !riscv soc content in that directory yet - and I don't
want to saddle Claudiu with more work for devices he probably doesn't
care about...

Seem reasonable?

Cheers,
Conor.

--47Pl5gbWTvb5cJSo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvKmhwAKCRB4tDGHoIJi
0iJ3AP9ZMrTDm6nX9lTKvZlE/xlhbrMLOylSFAshsIrToe2ssAEA4KHnkZpSUzq4
MHhZuNPZ7qxnM4Ml7dfLuTw+BFX7Qgs=
=0sZL
-----END PGP SIGNATURE-----

--47Pl5gbWTvb5cJSo--
