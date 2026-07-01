Received: from mail-qk2-f3.google.com (unknown [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F37939E9AD
	for <soc@lists.linux.dev>; Wed,  1 Jul 2026 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782944550; cv=pass; b=X0Xj76eCLQCdlZjFI+AibDgW12KvDDFFQiSB7JexfIeYga2BTGQ6JqNGIj2Gt/HpFrfvHJQaW9rr8K8M+Zqi/fLYR1RDioZO9v+hs4B+x+zLweOSAViQ6WnB3dkXCpTP6uF4HkyhQPQglDPshVFRLrtRfKoOMGxYaTRcINSFQYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782944550; c=relaxed/simple;
	bh=Jda+gAYXbk7PHfgm1C0E/dvQ9lFBrVT/hvWOqrR70io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8rv3Dr6HHVOW/5yGxr7LX4ohfqfzWwBPO37zV2YMsJjYQmOGVlpu/UH+JB3586/YPmXpe2vGqu5YY6clHZKSo9n4yNiWEbEtDEhMMrmxGSWkeNT5bNEXI+jqTEL+qh5jnvgf4et/M/RE7fPFZW0pgHpGLJLxlwf/B9ulWzwj6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpHdWB4e; arc=pass smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpHdWB4e"
Received: by mail-qk2-f3.google.com with SMTP id d75a77b69052e-51c0f88ca6aso2045221cf.0
        for <soc@lists.linux.dev>; Wed, 01 Jul 2026 15:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782944548; cv=none;
        d=google.com; s=arc-20260327;
        b=FbUl0hrqBuytSjNca7irjI8D6QtnIzf/pWeK/E4YZiBsTIMrAWFp+ndXReadVL0//z
         8tlUViLMMo+c/taQaJ29hTNSd2chX32C9Jh85bxgSEKXutJ5gG2A5C7w3NQX0EzLho/f
         zC3AuC5CRWkyQ6Wk7mEXM4M7bZi3II/sDXkSLzLq6oxMjusUdap6qwUxWa6p13Ara0Cn
         Fe+0S4e7o6qHOtppZTNbyHkjI+RfHKnjXIIwqnUIIOAuBvf5YcPGJi7jog0PrN/doGf9
         gYZHafd4t0IaK0MpMWq6VRNsqVcYCd5G2T9r9Hi7JgYFYFOcBogZWmybpxvUtY1sHuLO
         pQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MVhzVy40B70l/jqexwyJaSJ3X5bFGEqAL47A5U/79HE=;
        fh=qkm4T+QLFfJiDC5VSAEYom1OeVzeoSjYbCB/qeNAhEg=;
        b=WC0cT7fPKRhT5PAK4fD6YZkqcEaiBB0lw2qLGYUSepjHSsXzUu1qzqUqxlorrSyteu
         XRmQsQpfkof9+FTV3LTk8MtWVq2q/cLxadl+hxsjpJJQ2bPnA5hLMqhH4nWApfbON9XT
         3Yea38NqlScnZzWZQH8vIBACK5C0Ig22atrDWwXdY7sdvH+salelt0iOHAusf4lnrPWP
         cXDwSxFk0tmlQ+lHcT+2yFYucLjDvF5hjaFSzf6pZG/0s8EYr8kC4htZjmZ8MVUnjhph
         1c/nxpuvgMOSJRZDzrq0iuA2Mxf6NvBcnustr2O9bOhIxsQwoFPcGD6KUZLk2wv10Tme
         Z4Vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782944548; x=1783549348; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVhzVy40B70l/jqexwyJaSJ3X5bFGEqAL47A5U/79HE=;
        b=PpHdWB4eMQer/tu9HGPPiEfbLn2sMEjlXHkq3Zemiq3uXZvn6j549BSDhmO05HKerK
         bOCaqlOVpzlQzmAMhf+c9fGCzK8JoTXlpwanP7Pe4+IWrbswR/2H85XMUtjFFmtikui6
         AYdmInKguS63HzLVV9s1VRCYXpl0p74OKrhdFihGDK4WRV/S024FUN+C/LO8RLa65raA
         HkpC8XlR1Rj+WcynwFviEO8BENtx+Z2oPvJlcqIQU8G1u1Dp6CJ/rwD2beBqaguo0kMj
         SOEU/3cR2Hb54WxzB8eoYrobqfr1wm5C/aMsJxyV1Fda7J0a1Lm6juU4yjxJQIVUsggZ
         z5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782944548; x=1783549348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVhzVy40B70l/jqexwyJaSJ3X5bFGEqAL47A5U/79HE=;
        b=Svkp2FsQ0V91bcLKzprY1K0zkltLq0Ti2prrjP/q43c4fwUux6dQY0QjMg46aVxn1Y
         3GQ6CV+CncS+F8WsMpFYFlD9YwoLSyLZTH8lI5li0FUuNGFsDTnkpdL3ENCO14qmsrZN
         Tn+/gEXQUreNg51tRYhch/sUkFMmSevouUNxdCC59NdvMvdYMtsYQ3lTzco1S+gWnCJm
         wp709IETz8Dz3EsUizZO6XWHRfDy6ijfI+b842GYvnijM9RpSbDPPLCCxAbx635usv8g
         pTxFs6zx30+KDTRsP00uB/Ok6HOeipxAIQqOo7wgUwC8B5v/2X6icUvK+sZM7yCBr84R
         t7WA==
X-Forwarded-Encrypted: i=1; AFNElJ8+lYN1OAIFvpRIFTL+ooyRiBUkvaL1upVcotqHCsYB8E0EKqQWZWEa2q0QmBsmU6hu0Gs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9zzrQjeEGzvA7WTfZsaBkp8PKvIzq0ERTgM93u8j6/lbu3X/K
	yv2Af1y+7s8NUAxAEGz0XYA2wBN7Qk2RqqQJFbuHQfoRx/E/OqT+pPHquDZ+afN2uoBOh1bSbL/
	szFmM/iHbWxlT950jeLvOh3YXYA2Q5OYNB6o9
X-Gm-Gg: AfdE7cmApgqQnc5tZj8SEjPTyXtQROh9HkC/iHWKsQUunaHy1WKij6jF3+nKnzLWheo
	sVDjN0ShQRepzMOmokR9r7LmhJoZzxNkuBTfabM9YbkvHWxo1gX7u69F3L17gKvQtSeQD4hJYwC
	gCJVHdb/XUv5d30ySbFkCttsIItH+iK8+ktGdllEpCEqs2KZsfItwJWV2vrzukQDG1GPiQWyAUJ
	ysuj16rjWZ38GVvJeNxXjiwxvJe0WHkAiZ5OsPFU1lUqiPNOQrcm6GEnIz6EbY1ckAC7NruXzvt
	iCs9cKh2AE/jV/WxB7VdVhoN6IffYDQTJqEiEAvTzh/3A/wGXIC/ZaisK3HnW4bF/6Zj
X-Received: by 2002:ac8:5981:0:b0:51b:fca2:af71 with SMTP id
 d75a77b69052e-51c26b14753mr45380561cf.42.1782944548094; Wed, 01 Jul 2026
 15:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-6-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-6-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 15:22:17 -0700
X-Gm-Features: AVVi8CdgN18Vc-unGLPG99aYWmbh8Lx3HkejzODRi3mFEu8urukn9hQEI-DKk2E
Message-ID: <CADkSEUhif4s5sSHe-bMapxEiM4bksaNkS+R5EtWOV2kgsk-29w@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] ARM: turn CONFIG_ATAGS off by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Arnd,

Looks good to me, though I noticed a few small issues.

On Wed, Jul 1, 2026 at 2:24=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Only a very small number of machines remain that rely on
> traditional board files with the ATAGS boot data instead
> of devicetree, and we have not accepted new ones for
> a decade.
>
> Most of the remaining ones are on their way out of the
> kernel, but the Kconfig option that controls ATAGS
> is still enabled by default.
>
> To reflect the actual status of ATAGS support and alert
> the remaining users of upstream and out-of-tree platforms
> with this, chanyge it to being default-disabled and
nit: change*

> add a dependency on CONFIG_EXPERT.
>
> The board specific defconfig files that rely on ATAGS
> are changed to turn on both EXPERT and ATAGS if they
> were not doing thath already, and the ones that explicitly
nit: that*

> turned it off before no longer need to.

> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -20,7 +20,8 @@ CONFIG_ARCH_STM32=3Dy
>  CONFIG_CPU_V7M_NUM_IRQ=3D240
>  CONFIG_SET_MEM_PARAM=3Dy
>  CONFIG_DRAM_BASE=3D0x90000000
> -# CONFIG_ATAGS is not set
> +CONFIG_FLASH_MEM_BASE=3D0x08000000
> +CONFIG_FLASH_SIZE=3D0x00200000

^ These shouldn't be here - they depend on CPU_ARM740T || CPU_ARM946E
|| CPU_ARM940T, and they were manually removed previously. If they got
added when you did make savedefconfig, I'm not sure why, given that
dependency.

Reviewed-by: Ethan Nelson-Moore <enelsonmoore@gmail.com> (assuming
these issues are fixed)

Ethan
