Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124EE4A341B
	for <soc@lists.linux.dev>; Wed,  6 May 2026 17:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778089164; cv=none; b=kMnwlTTo5InkonoPyvc1/lPaUakfADiFWbvi8JBVzl1wD+M/RHzlGgrI9X7BTxAzrO6M+Libqe65r63MoyMzmxx47QODRc/RXto643AoQnsQ/i5/8tzLtB8KOBK1NJYT5KmyU+569OK/zo5tn4tUsdekw1hws3Ui+nU2LqsA30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778089164; c=relaxed/simple;
	bh=6i1w8FUVeMItLfoBEsQ1m6McI0ZsDh5XdVy3i6eNKsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=imgRm7oqfwBgAzNJvo0vqgeEhGoPALIPhbBeKcEa2Wi6+ma82QU3NvN9URp6FB7B6jIj4oCcCjs3pYxLpVp4Kh4HudDqFzO+jMPH538ofGbSDxzXdH3K8xTrzXkWVUzTnCcxV5e2UYgLREHeQGklJIFy77UPL8V/SbkYkF24QMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUzP33To; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUzP33To"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso51304425e9.3
        for <soc@lists.linux.dev>; Wed, 06 May 2026 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778089160; x=1778693960; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6i1w8FUVeMItLfoBEsQ1m6McI0ZsDh5XdVy3i6eNKsY=;
        b=NUzP33To0AGLfBtrUzahv22HV3BqwcQ5DZpJs1zcpF3PfwHP/pCX42Mwp5yIfyUo5S
         QFB8YqIYSfDlOfFkeDJaGPffBKcAWeGNR7lQTbnx8Vy48Oxn2eV8rfXD4rkduh8Ig1Kb
         X8C12RGeApb7YKb66s3QT/HOuELZN3C54uUq86Mnka5pWlLwvUrVwQvAoGveFIHdDY/q
         8e9CNzyddoObceHjY6WXa2hxtArMATKkQpiYmOhMJt4z9GVKdRRocBeUkQVZkwerhkYT
         mHomQ/8C2a+533YiO45BwHGkO0fVcb5AzrhAD4l3dZJsAXt6ObjkRxsodnW/XJooe0Wq
         qugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778089160; x=1778693960;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6i1w8FUVeMItLfoBEsQ1m6McI0ZsDh5XdVy3i6eNKsY=;
        b=lybaboHugWvSEsvT+nmrql68tZAtse5eTpPgO+4d7e5NOLeZ6M1WLVuqZh2ZUlugEn
         GOI/VqqmQicf2JHFXOgMfYs+vvNSByjnbGIpSLBmhIbazeildhZtzhc5WYLjL8VQOtos
         pIJt38v57z+eSzbVeBqQaSgY6dCcPMnEcKaVmPa2Q3LiedV0s2VUT0A/U2AW5ahv1T3K
         geZBeaa90cTyUubTRUixhKuTLk/P+54j7w7VEHvvJXzbsTQidAEcyg9R8Fer/uklZh/k
         WhNVKkiUi+Tuw0t8I+tk3hT25HmIMQtCpxJm1Xq0FkBOSbVpSpvuGSsGim/VEWgDjn1c
         W7oA==
X-Forwarded-Encrypted: i=1; AFNElJ9SvE2b6BFvB6+cC3rLjg8pbhECZpR7sltAiUgeg0NYIyxgh0ZAStumn2d9zZChi2HOE/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMy3jDvEC7sKqCheeGIzYhF3m+mktcwSiRrJCG/0BR0G2D3pgy
	oY2oCz25lCLZRGC8B6Wn2RKtWNfgcMGIPDR8Fvzw29XB1Kfh3DIdFZRK
X-Gm-Gg: AeBDievd9rTmdKqI2BW3t54jsnMd6BjTRrCB7KNvJI6ogyQG4pq63P87DH8uz6PY8a4
	0Untbl4UnsysZcomFp7vDWG99kBs6+HZRgBBMpr4JZoJ8FIUemKxnaurolSp2jzpwcWwQVfvrtR
	kTaMlpn3e0Jhm0XS3VtMCPzautqUZtuSxMkAGuCGEUxsYhqvi5st4GfyCHTmzMp4rGO1trJudep
	Rx/lShG9ljEsGUgirjBsNtwD4zJIlnmlVbJrjJAUpab4NAtNSmAh4KzHOfk8y9FzwszaWn3Q0GW
	wBJvO8TgCHW92B3DdJnfuaO3nTw4LCSj5TOQE4XtTmL764uBEPOj4o6iPP0b+ChdK2+925ct8S+
	ooO17ELQJc1XC3lDAS2tjPQXQBquQZHMJsxq9cqmowDKNnJ+SgPz4ppHg4LY0kL5MlAuv9ZWo8r
	6TOYAJ0Ar2cGZBrhC1TypD2Yh7xqhYXJ9W4iHq2HyxPFe63js9NTty
X-Received: by 2002:a05:600c:2e0c:b0:48e:526e:1011 with SMTP id 5b1f17b1804b1-48e526e106bmr38312325e9.25.1778089160201;
        Wed, 06 May 2026 10:39:20 -0700 (PDT)
Received: from strix.localnet ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53116a9fsm31957135e9.8.2026.05.06.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:39:19 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
Date: Wed, 06 May 2026 20:39:02 +0300
Message-ID: <5379905.31r3eYUQgx@strix>
In-Reply-To:
 <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com>
References:
 <20260429-send-v7-0-b432e00d2db8@gmail.com>
 <20260429-send-v7-6-b432e00d2db8@gmail.com>
 <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5014054.LvFx2qVVIh";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5014054.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Date: Wed, 06 May 2026 20:39:02 +0300
Message-ID: <5379905.31r3eYUQgx@strix>
MIME-Version: 1.0

Hi,

Am Dienstag, 5. Mai 2026, 12:54:29 Ostafrikanische Zeit schrieb Linus Walle=
ij:
> On Wed, Apr 29, 2026 at 9:14=E2=80=AFPM Stefan D=C3=B6singer
> I'm in favor of this, mainly because multi_v7 is pretty useless
> for this board, it is absolutely too big to boot on the machine,
> the board is odd and need some ARM64 stuff.

I added it more out of cluenessness, thought that every board should have a=
=20
defconfig and Sashiko let me know that multi_v7 is the preferred. But I lik=
e=20
your reasoning. I'll send a v8 with some of Sashiko's (very impressive)=20
findings but keep the defconfig.

> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks for the reviews as always, and thanks to Krzysztof for the yeoman's=
=20
work of guiding noobs over and over again!

--nextPart5014054.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmn7fLYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiGRcP/ihTsoTIIoe31SesPPm7
q97WA2l0QuRdt6uaaVSwsjuCxhCKwuVvPOYPsy5+/F0BG9UxylI20cKySsfndZyc
kMG7hIOD2GgP2oFpXvD9Rm6mABU/01SRMgYxJ8BERldruK2XBi/tTl5z9mLCU9Gv
6hHKRVkiS28GG08oKXywoEXba+Dt5a4HLk6oVy1UgP9OlImj1Bm+KPD3wvWmlRsL
fYr2suEdrJ76ox0Mx0kHIrwqhGpDEOAwm3g5pjmNOEcXS1eVXW1QLSg83wN2KOty
3NWXcwr0KxZjxMc6zkq2jqMZmx/4d7Mdijbs/TInuprU1G9mUcyVvi6BHFYS5Hpz
2ezEEESl6nIbaMpA9zFZWHkhouqr2bOVH12W0Exkml/rhwIQBRv3S53wAeYeR3Mv
H1LNEaKdJgZWKKL5f9WC9q4QFQ7CKJQZc+jnArsKp9GkdC1uRLWzLP3eriuRsgbf
zAOrJSziqrze8Dq2VNH9OpqyNk0W92TO4mmUMNrsqpTMh3dDMM8MiM4VJcLIhb/J
xUUZ4kRf2lHfx/KAJnn9munL1lsJa/k1zBVxarYe1ASh9ivRxqyojTcy0AIPklbQ
eaQp/Vj1+rGq43J9RuCxFzqT22DpbK9xsmEcxNaCzW+ECpBXRqhclbKHHYESo/aF
+r9T9FDiyUEQwbmVCzN6OIBc
=eicH
-----END PGP SIGNATURE-----

--nextPart5014054.LvFx2qVVIh--



