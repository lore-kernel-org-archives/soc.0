Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171D322557
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791086; cv=none; b=nDFY1JCZUkMT/rSDxSAltEB0HNrkB+wUdeSdSu7JzjRtvGavntlILMqwxFMqrqgDPeYKcO6ZqnsUytoKFZkqrYa7B8TDDZkk4ZgvXDdqduuiPjC/CQry2YsUZTZZ2h8B7ZvAvCeM9GZXF7xuW1cNST6W/Qv059zFgTELKpFSsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791086; c=relaxed/simple;
	bh=cwl5vXD5y7GSuS/061m1oGSn7/bNiamIj8C0fSeGFE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQoUmT0g4X606eTDs3iYtReE+A9wRbL2++aFp9lBfaBFU1BmmvQWSq6vxnmwO9LxZ+KGDWmUSdJrZzDlF18WhgVeUUJyhOFdTCjJqsdsmHI8wlPNA0YFXykn1pYjzQKxEMLZpT/7mk5V2x0M0BCKXOG3UotuETaBydwOe612y+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giR/PuYB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giR/PuYB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc305882so1541135f8f.0
        for <soc@lists.linux.dev>; Fri, 30 Jan 2026 08:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769791084; x=1770395884; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjyJlTp7j4YH4/LWsfYYLt/Sw6nbmBbVnvtCwZ8aFYI=;
        b=giR/PuYBgF/0KKyjlbx55NjaueFPox1XcNXGmXLdClPJu5or3UXk9efQ/kAHjaQvHo
         RARQ1tX9FmA8afnFA5voLsqoJoHrlshqxosLB5hA1JAuBmj3CGbVACikBeCyljmFY58R
         D0TUZ53xX5yiwAx0PSONJOXTS2AW2VMYAi9GSJfAAkbqsu/FpSuR2nGgp3HLvjfeyERZ
         69Oq6tmtcNFa9WAbyppPDI+2NpmDmYQT53DOmHiW2n+vtRDZIqgrtZf89daiVL4E424D
         dbilR0Bjds59MD+WRvP1IQ/qRZZLqSY26PwuyEUQtG3yEHxtfnOhqQ7dtB7dTlumXLnA
         ZSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791084; x=1770395884;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjyJlTp7j4YH4/LWsfYYLt/Sw6nbmBbVnvtCwZ8aFYI=;
        b=o8GZIoEpAjoTFWPY4hYAL7LAx0Ftu4jiyKTaAiV1K0e43XvOLJsUwtR1OpFD7IX+nN
         mMl8pKTaRjnzQJ0jq1p2zoCbF3UniK+0gNW9RI/nNtqfgsNn2Jia0k9ZXtiuIHfSvzdd
         W6MoqtQ28R5gIcIHt5ENwn+ZYzzaH3WLb7KpQKIj7GIiucupi/NO2AbBgq70r625Z6QA
         gErWVY2EJbNMojN5xGPXDn2cyRCFfttehGhyrZ44ZHs7NsF1pfOFX3Aayz5DaXVxxqQy
         P+PHvO7FwFY8Iue7+iWkkj+rfmDlvF6id4lti+XZ+UFsw0qJXTzjSoD21GeMs8BhB9wN
         AsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX98ZWqp5tBxtiloAu1p1YjmxbFPqpvlfS8RAGtBP+tLFNHpDe+vmTZz7249zcJ3KQFkbk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc1MVYjgcm2xbXrPXZFgceyrZy+7o3l1J5bPaJpWix3+oj9WrR
	kzgrCTUSF3UQbbz06ai4BR0D+Hm+i3Tr3ovuLJv6MaITEmdQ1lW0a2T0
X-Gm-Gg: AZuq6aLxey89lJlny7AfHcH4Ve/1cv2iV7/v0yvvqldZ45UChAt7mOCl2JKV9+wZuyY
	uwzbZtHf0Z/m9tjleta49sc7CCispCdNPVB/zYyH9zle9fHNDGlfBn1mTkN5TK2VU83b0358TpT
	ZbpBQFQwbvH4D3awLjVP4Vw6p2ptNveFiLKx2nXuBgOmBBey7Jl4dBid3WsXltCSg6qlTzCRHWQ
	9KrmtwcanXcuPQbbu3wqvhJL7Vb/gbCH8WahIAv9QV6OgFJGKnLI41vnJ5vnTkAPpni3z1MeVbZ
	CFZBsOgeBxwGebNhvkc87J8IQnfOrMP+p+IlVkw/uKv7zT6PBsZqkKN/nxbGp9HvBjB+P5XhEWu
	JL/fxo0b6wUUMTQ4Zsp5GCbmuJYoZIDsYH5An7TOfGuAWjNcL9QNoNsjuYkPUNPTrtVaP2mReBL
	DlR2+ADMYL0MPrPVp+swFT+Ati
X-Received: by 2002:a05:6000:4308:b0:435:a370:2d71 with SMTP id ffacd0b85a97d-435f3aaa9b8mr5238517f8f.33.1769791083315;
        Fri, 30 Jan 2026 08:38:03 -0800 (PST)
Received: from strix.localnet ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm23794050f8f.10.2026.01.30.08.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:38:02 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Drew Fustini <fustini@kernel.org>
Subject: Re: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
Date: Fri, 30 Jan 2026 19:37:53 +0300
Message-ID: <1848649.VLH7GnMWUR@strix>
In-Reply-To:
 <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
References:
 <20260128203455.38569-1-stefandoesinger@gmail.com>
 <20260128203455.38569-2-stefandoesinger@gmail.com>
 <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8678641.NyiUUSuA9g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart8678641.NyiUUSuA9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Jun Nie <jun.nie@linaro.org>
Date: Fri, 30 Jan 2026 19:37:53 +0300
Message-ID: <1848649.VLH7GnMWUR@strix>
MIME-Version: 1.0

Hi Linus,

Thanks for the replies!

Am Freitag, 30. Januar 2026, 12:07:41 Ostafrikanische Zeit schrieb Linus 
Walleij:

> The practice to run 32bit kernels on 64bit capable hardware has been
> pushed back in the past. When you say "they run aarch32 mode only" this
> sounds like a choice, not a mandatory demand from the hardware, i.e.
> it *could* run in 64bit mode.

I think ZTE could certainly have built this board + software in a way that 
runs in 64 bit mode yes. I am pessimistic that we can do this ourselves with 
purely software means.

> We can see why the vendor does this because the board has only 64MB
> of memory, and 64bit code is known to take up more memory.
> 
> What we recommend is usually to run a 64bit kernel with a 32bit userspace,
> so the userspace still isn't too demanding in memory.
> 
> Have you been able to try this?
> 
> If it seems hard we might need to bring people in who can help with
> enabling 64bit mode for the kernel.

Andre Przywara suggested switching to 64 bit via the Reset Management 
Register. The RMR seems to do nothing on this hardware (https://
lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099787.html is my 
reply in the archives).

We don't have board schematics or datasheets, but I guess AA64nAA32 is 
hardwired to 32 bit. Maybe a GPIO pin can control it, but it doesn't look like 
it. We also know of no way to reset the CPU without resetting the rest of the 
board. (since RMR doesn't seem to work)

In my previous research I came across the suggestion to do an eret from EL3 to 
EL3 and set SCR_EL3.RW to 1. We'd obviously need to set ELR_EL3 to point to 64 
bit code. However, I haven't actually seen a working example of that and my 
own attempts just ended up locking up the CPU. I don't know where I came 
across the suggestion the first time. All I can find right now is this 
article, which is clearly AI slop: https://www.systemonchips.com/switching-from-aarch32-to-aarch64-on-cortex-a55-challenges-and-solutions/ .

Do you have any other ideas we could try?
--nextPart8678641.NyiUUSuA9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAml83mEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJED0TvMhUTxoiQBgP/inD0NVE8ZPvrLCZZNaC
9eG1g7nkKI+qoYBWw1PN+34G1G32LTc33gaw17rYkTEnqQUNuQRs3JInJFY4eQez
cCl9WsTEJDVarV/7bIzE+38yHlkTBqSIJLawQeK2JiME1hqL4gIZga0iZtsmBzqJ
Jv4RKpJGkyrKQLEb+CtauiGR1OVw08QzvhkgA8KbiRMSCjE+EXHZU7mCPnfi1sdT
cPvOxeqp+OKE5M6JRrP5pXOebaukeuqgv0TJn7gwWQdKNgdhfsqLzuESfjfETp2/
XbGAk9qEV9e4Y20TiljThnOmRqdgMjzqQ1QzmAbifKSJ0fXg31MeSONe2gaHMG0Q
CsCbLDqP/1yKSUc1adPzkGSdyT/NVwoKNvJoSyyQU2KNJE+o/S23ahc1qsiLqZIz
Vpo3K4OfJaF8fvb4bDze8k2UapgbDbOUgPk+rcB3ywEqWl9rsB83Wu0JnhbQOjxA
vxQqdgZ5UrpdLEhxupakM6n/JzOXU7Yt9sOadkq42bqCjjMXKduofPlD/+/yfxGU
aDg1L6kZzybebN4dz66sAncH66RdKlxaI3v8KyutypvHLEW7vnDDLU3gA6gGCloM
ws1EvO91MrJ//JCJMjyWIZ/cXnWd7029fNdMMdP0s3cm9NxyS2qHF9ADvOLooDXy
js4qcdOpszjzpzQ8kMApBrSU
=2FI0
-----END PGP SIGNATURE-----

--nextPart8678641.NyiUUSuA9g--



