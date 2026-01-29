Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E21F09A8
	for <soc@lists.linux.dev>; Thu, 29 Jan 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715596; cv=none; b=nDziheEfAxkdu6Wh3wuEE44Y1vgplqjoPcWjcZ4tOHujdhU6V6mKhsUVe2mp8DmyPBafaTgG4BL3hNNoXVU6+QNCwSCiHs1uaGl5fUXM7kUapnk546Qm4Z8NIPqMMpDgbzYXTtHqsaGnlORsxcFSt5YowBva6nfcG0cORlNY0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715596; c=relaxed/simple;
	bh=tSxycrveoYZhVO0fIyQsLogJ4Fuf3SqBUQ8Oi8YwSgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ItXTzbXJ7zR44FPvyGr/bL1q5ExsZf4y1Ht1WId2xoJDa3jXt+2pfMbrqgUU2cGs0rQe75N07NZ8Jw6XRPsucXI/N+Q0mz2x85bTZo2LStHDN8HUhnV289Ds5KddQTK3teDZ/poa1BRsD9O6kMmDAQh1iMVfmvbvLn6vKrcb4ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfMDA+wX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfMDA+wX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso13448795e9.0
        for <soc@lists.linux.dev>; Thu, 29 Jan 2026 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769715594; x=1770320394; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t86CR7+9yfrVNBsgovnJ8FKAIyElMk+cczKwlZov8Ck=;
        b=EfMDA+wXvq5GOy5qcWOfUxzPThl772z2bA5q4muRiXqyESwGd2K795FVcdFGQkW52c
         Gs5O2MY4OUwvn5b8Wa7eodrExbsxDtV67Yc4paCLW4rZnQVGrunrlLfPfcUNcprw24Tb
         nQM4A8p8SMHByd2YLBfvq/9q3POydKJ/BTBG8XPmTfSYKtJ3b0X5NlhzHpuEOZr0JmgL
         GMCIFCgyBHiyEjy+YvkGKZXRxh4hxflNOD0KV5VuMiWwBpKe/Q4yCVjz8aEltfB1F5TK
         O4WP7BsYwW4X+A7xqVjThrQwrT6eKMzo4iZ+bp+pHlsS2UCzGrZeEzswLkxohIClsU5Y
         zyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769715594; x=1770320394;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t86CR7+9yfrVNBsgovnJ8FKAIyElMk+cczKwlZov8Ck=;
        b=jqqs2Vs5j2CISLCzA4pQOK5tUqUEb6q/4bBRRrTwrGmUd4AdGHGtgr+T3456Wgjc6G
         /UyN+EJqSKqckZ6hWhBqigBGUOBECzpZqNKWnOyZVwZlUOd1nh8oBd0M6Kmo4tJx/nhj
         zy34FL3MvZ3C7lcOsCXc5S0Jx9cvEPM+945rjnBhnGX52+N5coEgTHiZaZdcgpmUIyG0
         8uEVtt3d1IMzuAakzbDIiYsm7kda5SvpAQayds8ggexT3sheWbSP50xokEG+qYBDJ3qx
         83fwqF2p31dXV7ja7CIlvnjvUIUROHEc8lf7AxfeeKpr3WRB9i5IA6+H7E44lqL97jX1
         TB4g==
X-Gm-Message-State: AOJu0Yw1gHaOKpJ7hTEk7NQ4UyeCHpos1jmIcdwxMjaTcQRRNImkJ8uv
	/ZTYG+Tkerr1ESjkcLJf8soZyT2pfoN6LjLwSRpmuNDe1ygwdJS+fa8cyjOmpNt3
X-Gm-Gg: AZuq6aIA+f03ux40VFBSJpMN8K0tYWj+dxY6Cc5IR+QIQYZ4f0PReDOW67q3jllG7vH
	eTV3v2M5HXP6uzJs+u3TEOFOyBEhY31MXRm1sctjpYbGLeWMRSaVUJHyb1mZNXfds124lork/48
	h/OuY30jWR2BoQUAf1RlLmAOh+LO/rzxVYXEdypukjl3cHPbtpRPAb2iZaSjYPjvYSiTEBvQIIY
	Wx23nh9dsGNgyP/zr+XE1BY25Lo88Qx7fFuAUHyIDbIV/fdteI7DEoKfd1jPX59Eq+AFTlhi29e
	Z7ZSSH60tPhmdFMbWd38eGGJW2Af2ioiSl0os4sVCWNR2g7iVExAL6uW3+dijiJ/aAw01jPRtE/
	6w5CapeWrmH8WbQ4Wa8d6sgfwsQcF+yyT9Efbbxt9QCuS6+bv9e+q5Fe/bGVl9EYt+ayyfDsisY
	/Xi/ZRvoZzq30Ipo58pyLtYYbitOp3TIeM+w==
X-Received: by 2002:a05:600c:1549:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-482db493944mr3617565e9.17.1769715593527;
        Thu, 29 Jan 2026 11:39:53 -0800 (PST)
Received: from grey.localnet ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cefdsm16504443f8f.23.2026.01.29.11.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 11:39:52 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, Jun Nie <jun.nie@linaro.org>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Thu, 29 Jan 2026 22:38:51 +0300
Message-ID: <2936803.ElGaqSPkdT@grey>
In-Reply-To: <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
References:
 <20260128203455.38569-1-stefandoesinger@gmail.com>
 <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5583984.GXAFRqVoOG";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5583984.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: soc@lists.linux.dev, Jun Nie <jun.nie@linaro.org>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Date: Thu, 29 Jan 2026 22:38:51 +0300
Message-ID: <2936803.ElGaqSPkdT@grey>
In-Reply-To: <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
MIME-Version: 1.0

Am Donnerstag, 29. Januar 2026, 01:00:08 Ostafrikanische Zeit schrieb Arnd=
=20
Bergmann:
> On Wed, Jan 28, 2026, at 21:34, Stefan D=C3=B6singer wrote:

> I assume that you were in EL3 when you tried to write to NSACR?
> From EL2/EL1 it would still appear the same as not-implemented
> even if it is there but disabled in EL3.
Yes, and I just double checked, it does read 0 in all cases. Here's what I =
did=20
=2D abusing the head.S error handling code a bit for printing:

cps	#MON_MODE
mrc	p15, 0, r9, c1, c1, 2
b	__error_p			@ abuse for print
Error: unrecognized/unsupported processor variant (0x00000000).

cps	#MON_MODE
ldr	r1, =3D0x63fff
mcr	p15, 0, r1, c1, c1, 2
mrc	p15, 0, r9, c1, c1, 2
b	__error_p
Error: unrecognized/unsupported processor variant (0x00000000).

And just to make sure I didn't get __error_p wrong:

cps	#MON_MODE
ldr	r9, =3D0xdeadbeef
b	__error_p
Error: unrecognized/unsupported processor variant (0xdeadbeef).

I am certain switching to EL3 is working here because I am using it in the=
=20
same way to set up ICC_SRE_EL*. (And yes, I know this code doesn't belong i=
n=20
this place. It's just more comfortable for my development tree for now)

> I've never seen a Cortex-A53 without FPU and NEON, but since this
> is optional, it was a matter of time before we got one ;-)

The ZTE 3.4 kernel code suggests that there is/was a zx297520v2 that was=20
Cortex A9 based, and then ZTE replaced the Cortex-A9 with a Cortex-A53 and=
=20
left the rest of the system unchanged.

A later version of this SoC, zx298501 switched to 64 bit, including kernel =
+=20
userland. But I don't have any hardware based on either of them.

> Support for 64-bit cores is actually quite rudimentary in 32-bit
> more, as we are missing a lot of the errata workarounds and ARMv8
> specific features in the kernel. If you can figure out how to
> use 64-bit kernel mode, that would be ideal.

One of my co-hackers is giving it another try. Pairing a 64 bit kernel with=
 32=20
bit userspace seems reasonable. Of course the other question is what quirks=
=20
are hiding in the hardware when we run them in a mode the vendor never test=
ed.

> > 6) The old removed zx29 code used "zte," as the vendor for the
> > compatibles. Sanechips is a subsidiary of ZTE that designed these chips.
> > Are there any preferences for either "zte," or "sanechips,"?
>=20
> I would stay with the previously used one

Check

Cheers,
Stefan

--nextPart5583984.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAml7t0sbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJED0TvMhUTxoism8P+QFSQGrDOtw9AhxTyEAu
BdkXfStJ8njk4kPHGeXN+YB92aJ+SOLAF8kK6Xdtm9Xo3oRAKtv76+FPtzU3A0Zh
RzJmS418aehsbXktaz+0pHzzOwGynjtTDNPYvioiC/6wnNN1dW/cz+SIJOxOhT4Q
VuYjt09ugt06rKCkphE3XRn+ATAb89967Nn6X+4jJigpFC197fi564dctuzPEWQa
e+nRxHCZdxr+ots7393wJRTQTFTzI0lcZr6XDhPk3xwfsofLdh+P379fS6DKwpD/
lzV+IufgyfvL7g5m+e7/5eYUTotbi3cPqNtP57YcQ1R+2LhLS057zx32aTQKYqbe
nlLrTz/NPswSVe/YjsRBDxFflQUpho12cxvLLP0DKBKFbA8b9fJEnWYDUYSIjn5R
SwPyLWRgEXnRLIRCpQ87nWVrI3Yal9ZybebxMtF9ENFftZPZgwsKdCaMGThkzKM4
OjmdVLzoVha59A52RAUu0+vmayU6tMAF1U2UmDiWoOJW37WmsKmeMzEee4hKd/RS
+kBNuICVn609UFUN7iiV0FzNfPEsu98rsyCGVqwHISh6hQ1OG32ZYQMGB5kdcOCj
KTOiowTdPKXHyMmf1FKHFUX8S10E7BXNuBlouBqOglnu8bDeAa71oFxtj/nFUmfE
qjKTODDI9F5Ka9skDQfHOWv2
=LjqD
-----END PGP SIGNATURE-----

--nextPart5583984.GXAFRqVoOG--



