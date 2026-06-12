Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F57D31F98D
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258567; cv=none; b=bp88MWh07Kyxy+TXpLNB/xzzoNMrl2r54u4Gpho3F64cg4kJGPyFYBr1yDg4EjChKZL2xd27QwFppjlFdCXmI7RR9thnYVOWOo7cr5qiFUNSqsnwN7zv2cSTMfrVwwBXNV3m2cUm1BAZ2VuMxJOWrUsypVgBaUTA575sxwl1H/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258567; c=relaxed/simple;
	bh=wSZngkeG6OG3hgQgiI1PMAc9onKC7al9v7n+pkogS+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nm1nUx2C3urRNRrpEHK3ghsShXoww0rSwqrCGzxSZ0WIvkyBHJjyxRmFbG6QQ8gmX+sRVKNr9RGrs1kCYBgQBCzQHRP3bSEPGYY7iLSp3rQZBEVaJBeetzUHhDDW9R3LMZOLQ0UU9vgBf2EurYRqF0o6MDpW3tiduRz/3UAkF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=id6Oi05F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="id6Oi05F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7191F000E9;
	Fri, 12 Jun 2026 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781258565;
	bh=wSZngkeG6OG3hgQgiI1PMAc9onKC7al9v7n+pkogS+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=id6Oi05F9/1RZG3og/x/x8bjQgknLAd8WcYCy4bveNCkBqJ6iDV4v/hLVmtCQVjUl
	 9BLmcS0ebe6BXA2oOrZl/4Eg8Jmzu7Dy9gh29MHKXMmni3VXZ+IVoSHkPAAlNPe24p
	 fnhB2mDQTaELLk8Rv3XSW2kFUErBmyT933HWelFxKaoHypVsP6PhpZsE7v+7Jh6qEH
	 gqYWi7HUxndVy73ER9Bil2mjFE5ejOsboqPDJcYBPtptmLuUBROk2bKyRFyZzXTL6M
	 +RcclFviQfTnyHmuVFxr0ZNQs08l67c4PM5CS7yJHTvk873lzIr5q2cntwe4t6kLQK
	 pdB6aQ3ppRfeQ==
Date: Fri, 12 Jun 2026 12:02:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Message-ID: <20260612-tacky-authentic-cicada-bfb5fa@houat>
References: <20260527084135.842736-1-mripard@kernel.org>
 <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>
 <20260612-indigo-sparrow-of-action-d2bcbe@houat>
 <6a93097b-fc06-414d-a5f4-cf2dc98474d5@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ppz4kjgq3qecylwe"
Content-Disposition: inline
In-Reply-To: <6a93097b-fc06-414d-a5f4-cf2dc98474d5@app.fastmail.com>


--ppz4kjgq3qecylwe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
MIME-Version: 1.0

On Fri, Jun 12, 2026 at 11:41:18AM +0200, Arnd Bergmann wrote:
> On Fri, Jun 12, 2026, at 10:33, Maxime Ripard wrote:
> > On Wed, May 27, 2026 at 10:50:02AM +0200, Arnd Bergmann wrote:
> >> On Wed, May 27, 2026, at 10:41, Maxime Ripard wrote:
> >>
> >> I'd like to wait until we have resolved the build regression
> >> from the earlier patch[1][2]. I don't have a strong opinion on how
> >> to resolve it, but at least for now Christoph is asking to have
> >> your change reverted.
> >
> > I believe it's now fixed, even though not through a revert, and is on
> > its way to Linus:
> > https://lore.kernel.org/dri-devel/c7a9dbb0-a5c8-4e67-904e-1a52b3de9bb4@=
linux.intel.com/
> >
> > arch/arm doesn't select ARCH_HAS_MEM_ENCRYPT afaik, so this patch can be
> > applied as is I think?
>=20
> Yes, I've added it to the soc/defconfig branch already, though
> the automatic notification apparently did not trigger.

Oh, perfect then, thanks :)

Maxime

--ppz4kjgq3qecylwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaivZPAAKCRAnX84Zoj2+
dqLUAYCQ1qWHtCUNOruXhLmXQIItqvrZsM4X1LrB9TE35LLbCQETF/Ia1YkE1uDR
XYpXJekBgKxsT2qu6dFYeqmUkfqv32ZEWjR7zDddxoPfYkbMkT1z9wadyYy0QBnL
maYl8lYniw==
=f1eq
-----END PGP SIGNATURE-----

--ppz4kjgq3qecylwe--
