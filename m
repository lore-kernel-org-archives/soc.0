Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE37D33858B
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763710945; cv=none; b=dbbguIBKzH4Zm/DfhL5iBr38kkcWuLdgDxOiqyBRKPJ/J7pK6VBLggklZFbNnYjBctYa3THc2Wp6jhQMa0JtLpYC+l/ZH7k9jxKi9BbXah6gN6r4Hx/I67pzqJkTq3Rfi7CllUs6s5SvE21lVq6jdseL4+6A09AOAiqNjZKg8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763710945; c=relaxed/simple;
	bh=amA/kzHVQRhdRU/GgSQX+sOmawJBT1QLpYakOCrqjXU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Vp6NpAbB3f4lfkexhANLeQASvL6wfKf4r8ByEojpmw1hUlyR6w5Gj2Vrjk/4sByseVx5dXteek7fQkpwqpDY0bm8sd2uvFQ1grqkaZ5hBke1nwDG2xzG0sFWctQXUDydqHByWcat+DegzG2TIiZpZWKz8lCV+XVRcRkJY3BuApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwrczSll; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwrczSll"
Received: by smtp.kernel.org (Postfix)
	id B1AFDC16AAE; Fri, 21 Nov 2025 07:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AFAC19421;
	Fri, 21 Nov 2025 07:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763710944;
	bh=amA/kzHVQRhdRU/GgSQX+sOmawJBT1QLpYakOCrqjXU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=ZwrczSllV17Zs8ZXIb2sEf1E9Hu0lur85HQ3Um4KHAtA2gP1cXVo6WZ+6UvcP4UDo
	 pRLpGazt3t5J3vq68k9F9cVpJ4+dV72MV9gKHnkqJYwxggXJTuMnQyoMpSvABWWhqX
	 NCgDvv9zO/fmli/YD7/+KHAS2cSiLK/TkQ3aSm2F1WGU8kI0PhroPVx59oWLRAi8yn
	 XH2COQhK+JwuARhxEQ1ToyY6uWj3jDTvPXWRx0RhdV0sB9pRObVe9TclDAXMXXlv63
	 mQlce4jqo/gh5qP0IKli1VBPj0WMSdcEojG7Fkrl0Ib7pTgoU9pxqjkYZmfu3u0/Ns
	 5/2nE2JGaQt6w==
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7b171c5f6e710ecb6c24e9fd6d7b4641ca3c2c4089c37538aa3112bcc133;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 21 Nov 2025 08:42:20 +0100
Message-Id: <DEE7CKFYFS69.2R2RADO7WNTFS@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: make TPS6594 support build-in
Cc: <soc@kernel.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>
X-Mailer: aerc 0.20.0
References: <20251120075656.2396371-1-mwalle@kernel.org>
 <0d6e055a-d71b-443f-83c8-6365a88ad9b6@kernel.org>
In-Reply-To: <0d6e055a-d71b-443f-83c8-6365a88ad9b6@kernel.org>

--7b171c5f6e710ecb6c24e9fd6d7b4641ca3c2c4089c37538aa3112bcc133
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 20, 2025 at 2:51 PM CET, Krzysztof Kozlowski wrote:
> On 20/11/2025 08:55, Michael Walle wrote:
>> The Kontron SMARC-sAM67 module needs the TPS6594 regulator driver to
>> boot from SD card, i.e. for its root filesystem.
>>=20
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>> Arnd, the PR from TI [1] (which contains the device trees for this
>> board) is already out, so I'm sending this to the soc ML directly.=20
>> Let me know if this can still be applied, if not, I'll have to wait
>> for the next window.
>>=20
>
> Why it cannot go via TI tree? It should...

As explained above it can of course, but I've missed the time window
as the PR from the TI tree to the soc tree was already sent out.

For why I'm sending this to the soc ML, Arnd once told me to send
defconfig changes to the soc ML (commit 066f5f4c7967 for example).

-michael

--7b171c5f6e710ecb6c24e9fd6d7b4641ca3c2c4089c37538aa3112bcc133
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaSAX3BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h+PwGAmreD4xIrlvlApUqC8qOTa7+vu7DnZDH9
gBhpPZqTZb+5pf5ZBVblcla9ar/kNZ8cAYCy4R9wx/t2nhZj7E0ULW4gBLJzVvtR
M9DRbEiUEfXBWFKn94rTGoScE2HmkhwumQg=
=HEAf
-----END PGP SIGNATURE-----

--7b171c5f6e710ecb6c24e9fd6d7b4641ca3c2c4089c37538aa3112bcc133--
