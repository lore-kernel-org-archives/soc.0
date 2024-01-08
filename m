Return-Path: <SRS0=q8a3=IS=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDDBC3DA6E
	for <soc@archiver.kernel.org>; Mon,  8 Jan 2024 11:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65411C433CC; Mon,  8 Jan 2024 11:14:02 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA46DC433C8
	for <soc@kernel.org>; Mon,  8 Jan 2024 11:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA46DC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-46781bd40f8so337765137.1
        for <soc@kernel.org>; Mon, 08 Jan 2024 03:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704712438; x=1705317238; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMmNHA5ZM5uagnRv+Z2EBfHRX06UJnwNICsOfprVTxU=;
        b=BlJHjst4G0/WwfUfjrwFQWyznlfKAMeNRJ6OM/q2I25LXpcswl1pTVIKjaz7H5BBug
         ypteZMFoyNCaf9ca9bKDNkHnCxdKzSvCweRt3ZMYwDjrDEd03Y6cBYlykQ2K8b0rH6EZ
         bg5pNCj7NWe0iAT8JbcOALgsuizVJ2xuBHnqh81DcTg8wro9hY4WQ/Ik2bDjuR7KMoOV
         xvF60bEK5JVsVf9BpeTy+DMZmrfckXnKnAv4CCJBvecnUJDK1dwzZ+qXfMThJ32rKX7O
         JOiAMjaFr5/bYo3b3acSEO9MT3JiatXgJ/MwVtwqC4/JtdetbjQojWgWcOft9GCsVApP
         HI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704712438; x=1705317238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMmNHA5ZM5uagnRv+Z2EBfHRX06UJnwNICsOfprVTxU=;
        b=HJYhYPniOCVnlXmCv1Rp+hv/WkL2GkCyf/+VfuBDxbaG0caHXImuq3XoRGZPm2VIag
         5/Ezz7MjwjKOcdu7/5ICb2df3s9aajaokEXb6LzpnKGeExNiLi1MWdF8sQIzexXXk3sX
         PZggGAXkX3Nk1D/HquCm79noiLPpRWIWE7s+obsa+X5Ue3IKVDhCVP2Q/oSj1YKl15Xk
         DlzJN/kgDUgE2H6TA/p10CB4lGZxAu6ckeu/N3i2TMw3pNCgBZ3DXNem8RucgsdmGZOG
         Hmu7ePUIDz/RO0Urgrl7leG0ZwiAs9WNyjUxRdn3lT9400qv3uN7n8HPnPruGXRklkr1
         q/4Q==
X-Gm-Message-State: AOJu0YzUyyrD/jcJJk21MkQlREiZG6dmIGAmxEZuvBPqY3P5geoqx3Xl
	PSiErjVpR3WtxWFqnOyOJ2SaLJUztcNxzhauBV6PsvK5BFrEAw==
X-Google-Smtp-Source: AGHT+IFUCaD2C2j/tqCkMONWfs1OnD+E7URpzHw4UpbkW5y8hSqJvmsQCrqyEoFMZlctyYNJ2KWUjnAks/4t+55vjJA=
X-Received: by 2002:a05:6102:3d84:b0:467:c94e:3790 with SMTP id
 h4-20020a0561023d8400b00467c94e3790mr1154552vsv.20.1704712438691; Mon, 08 Jan
 2024 03:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20240108110055.1531153-1-arnd@kernel.org>
In-Reply-To: <20240108110055.1531153-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 8 Jan 2024 12:13:47 +0100
Message-ID: <CAMRc=McFNz5fJqScS_q1JzX-U=VC+FXQ1p6=j7ANHxL0RV88dQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: davinci: always select CONFIG_CPU_ARM926T
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 12:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The select was lost by accident during the multiplatform conversion.
> Any davinci-only
>
> arm-linux-gnueabi-ld: arch/arm/mach-davinci/sleep.o: in function `CACHE_F=
LUSH':
> (.text+0x168): undefined reference to `arm926_flush_kern_cache_all'
>
> Fixes: f962396ce292 ("ARM: davinci: support multiplatform build for ARM v=
5")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I ran into this today for the first time after five years of randconfig t=
esting
> with the bug in place, so it is clearly very hard to hit.
>
> It's an obvious fix, so I'm applying it to the soc/arm branch directly
> for this week's pull requests.
>
>
>  arch/arm/mach-davinci/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfi=
g
> index 1c8bf56982e5..2a8a9fe46586 100644
> --- a/arch/arm/mach-davinci/Kconfig
> +++ b/arch/arm/mach-davinci/Kconfig
> @@ -4,6 +4,7 @@ menuconfig ARCH_DAVINCI
>         bool "TI DaVinci"
>         depends on ARCH_MULTI_V5
>         depends on CPU_LITTLE_ENDIAN
> +       select CPU_ARM926T
>         select DAVINCI_TIMER
>         select ZONE_DMA
>         select PM_GENERIC_DOMAINS if PM
> --
> 2.39.2
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
