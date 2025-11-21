Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580FE33BBAA
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715744; cv=none; b=rEoq385b0nvOWfridR7K/db7j61KzcBeYqtqLpOREoQ6KkRjqLKil6USQt4G2OxyvSNuTP6ee6wRgLdoCLAYzj0ykXlDT1NU7Ibwd1M0YhaHEJu5eHJXa3MFYHzhVqUI7IXBCzfh4LlLe7LCrfRj1bm3iuqBIFbqoXnPGMtMmgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715744; c=relaxed/simple;
	bh=VmlepT8gIZCzlgAkrSuubfJzaekK6ugVPr5Z6RUGnL0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=bMN7UMbpW3vyxIakWBt97tNwWMzP23tliqHJKfYj19WtkWrozDspJE5N3J49tUUcRW7LHrb//+IDTczV7NRIvH3CT8iag0UjiYcK1z6K9d7Es+8VCG7Gw5v7l/w/Zlp+ex12PzyAkSnc0rQa2aE612SHcJyESbJFMH0nd5jCjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZ4bOgBI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZ4bOgBI"
Received: by smtp.kernel.org (Postfix)
	id 13189C113D0; Fri, 21 Nov 2025 09:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C2BC4CEF1;
	Fri, 21 Nov 2025 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763715744;
	bh=VmlepT8gIZCzlgAkrSuubfJzaekK6ugVPr5Z6RUGnL0=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=jZ4bOgBImnFhGvdlurVDtrpUnwZdstUo4uOAQE63wOTROnH7u/IjFbep8YHWn9lUP
	 UP9YUjUKmvaV7NiXCF6aixO78Wa1lRiH2m1T2cuOXOhkXRqx++jWruknUZNysHSF+r
	 07UtSs/Da1sfNbP5RpcvwnlkGa28WTxeZzK+gzBYXb3NJMjIf/zH4af7EMxVcAgUg5
	 oXuY+S3nx4BUopGz22jwbs64jLkdp9AsNH+hKmZf+D+u8cif95D9czNS6Tv5yQUpNf
	 9a+5bPUavwJRf7Wy2thC83050zpdrf+t3PfZv8xktRUc3FthTe9HTsTiE9Ey2oR1a1
	 eWtf++WKxgw+Q==
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=391db8165047b94910b5ccebb5ad2599ee27cea92c5ec45c34608959c9dd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 21 Nov 2025 10:02:15 +0100
Message-Id: <DEE91R7LQ6X5.2TJ5HTFJVC7O@kernel.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] arm64: defconfig: make TPS6594 support build-in
Cc: <soc@kernel.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251120075656.2396371-1-mwalle@kernel.org>
 <0d6e055a-d71b-443f-83c8-6365a88ad9b6@kernel.org>
 <DEE7CKFYFS69.2R2RADO7WNTFS@kernel.org>
 <c55c87ea-01a1-4200-8fed-e629d7d068ec@kernel.org>
In-Reply-To: <c55c87ea-01a1-4200-8fed-e629d7d068ec@kernel.org>

--391db8165047b94910b5ccebb5ad2599ee27cea92c5ec45c34608959c9dd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 21, 2025 at 9:10 AM CET, Krzysztof Kozlowski wrote:
> On 21/11/2025 08:42, Michael Walle wrote:
>> On Thu Nov 20, 2025 at 2:51 PM CET, Krzysztof Kozlowski wrote:
>>> On 20/11/2025 08:55, Michael Walle wrote:
>>>> The Kontron SMARC-sAM67 module needs the TPS6594 regulator driver to
>>>> boot from SD card, i.e. for its root filesystem.
>>>>
>>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>>> ---
>>>> Arnd, the PR from TI [1] (which contains the device trees for this
>>>> board) is already out, so I'm sending this to the soc ML directly.=20
>>>> Let me know if this can still be applied, if not, I'll have to wait
>>>> for the next window.
>>>>
>>>
>>> Why it cannot go via TI tree? It should...
>>=20
>> As explained above it can of course, but I've missed the time window
>> as the PR from the TI tree to the soc tree was already sent out.
>
> This alone would justify for anyone to send directly to soc@ when they
> miss their upstream maintainer timeframes, so sorry, but that's the way.

Fair point. Sorry for the noise.

-michael

> Time window in TI can still take it. If they cannot, then for sure soc@
> cannot, because soc@ takes from TI.
>
> Best regards,
> Krzysztof


--391db8165047b94910b5ccebb5ad2599ee27cea92c5ec45c34608959c9dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaSAqlxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hFdgGA54e+abaNcVXcxXx4rvJGQxgtcE/qvqg5
3zNSi1wMyZ427vLiED2prUkqjUr+N7ohAYDXCK3z25Q7dPnjcxRWk9SieLRBpy5a
351hpfKi9utNFX5tFAG3616sLjbGuR/HOaE=
=hkOc
-----END PGP SIGNATURE-----

--391db8165047b94910b5ccebb5ad2599ee27cea92c5ec45c34608959c9dd--
