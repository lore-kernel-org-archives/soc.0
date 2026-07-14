Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855DF49250F
	for <soc@lists.linux.dev>; Tue, 14 Jul 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041147; cv=none; b=j8iEtpvhahu+ULmBuezVMxQ1wfSl3jPfUCEdBq0tMy3MOGBoGkrzjOQP2iOAqCcmYFZMbmPTrCPNuWHoVrEUPHHxRKYG3xz7GaMxVWnqs5WWO7G07mefwaALXweq8ylp4h29Gi5rF3rsJBYJE6yZdOc7TdCJPvRv+zuFkeGmiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041147; c=relaxed/simple;
	bh=swy8JbrGorNMj08tbXQTp9onZ1IbII6RltFBELifPkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzlLGDRkJK5Aw22GH2Y9A3hRlfqS2heyTWiInKKWZ1Z3Hw6SRfyvjEewHacdChVVkc97kc8/Cdr8vCw6YbdzCPO9Jsl9OCLf/CzdECFNbe8jaBmO9a/Zs3uazxfV+dLblB61R7raFEyaOUVF/1EVJgE545RqU7VLi6KvAU4BT6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92c7a0a701aso295628285a.3
        for <soc@lists.linux.dev>; Tue, 14 Jul 2026 07:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784041145; x=1784645945;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W/km1l4qos/3vnh74LC9dqwRWW+IxrErU5GLSExeZpk=;
        b=CLY9ITSEu83PKDg2Bb3+eAdUDViqgWtnSF0/AmvEO6Yytnbv7UvTksTqSmSZzX8fAQ
         ZQC7/+GMv+2COvp8th+FbneEJLiOTaa5JWkqps2TLZfcZH+QB9VRxQy7GER3i66o8DeX
         tSYjUDcOLjwT3awsbvXFQdktSidA7h8v8RDR+lVnAYfmFHzqx5OTTSbTEW3BWtEsHeuH
         uo5ALjVOSSkS4mByTqqhHGQOI0SbzDhiigX7xsut2zhE8NFDe90BHO2F+Bg+xKsE0Uz9
         y2pPlwz6zDBhousqJu4XTls/ckyG9xiaCZtxRNGArE4Egxv3av2MEHkAlx7q4qZ7gjZJ
         3MEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0lLv290RFseJi8DnoxEIPszcdEUbP6QnxMjupG++YhvFFwkXbzbnmtNkJpDokLdRq3is=@lists.linux.dev
X-Gm-Message-State: AOJu0YwShFTsLEypYDf1PfLuoynIhVQhUQSB33xUOyu+xZyprjEnyT9l
	FyQeJssSoGvimeRZqWBVvvkJ4s1VBufv2Z+yevsPBp3MmFlqx29b+I8bJT8IXwJbub0=
X-Gm-Gg: AfdE7cmq0IC0Jl+m7XkjgYpJFzsaSoBXN8bp3yHMwn/SMmhJkim0x15RxoDuKgkjpcv
	WRtSqD2lQ2lUkBx5lAs8pjgVF+xhII50KAeG/4kKOq5eEmn+9mPq0UTWHGZxqydmspzdzaGXsoq
	1/KoamCzLQS5GFwZ3SJGGsSPsrZN5/KXct0NIhgQbA1oS1ad36A3G0PTQmeOl/TFm4VaPJI8Zma
	b+1/GlKPqINtgNLsEiFnGGtNfXArSbXbCXvth9H0KF0+qakY3FRtiDPlwau8cTd+VGdGgEXa4A8
	V+xEWSeZ0NpYLADhDgmh02XOO5w8TvVPoIz+pVgV0KgxDsFvx5/NSAWPtBh/3tBR2Xvl7B8Pz1f
	KEdkLjeL8xK3+LtaUg3cnRwFm38af3RgbjOcoetNIBVo04U4AZVXUAAKtBCarv5GdhfNYHWTAbj
	34w1yiCl+8u001svYz8kvOMp92IqZvIzPVOnaVJth9XDWWU8RW1w==
X-Received: by 2002:a05:620a:2248:10b0:92f:279:5952 with SMTP id af79cd13be357-93083c27844mr274855485a.4.1784041144961;
        Tue, 14 Jul 2026 07:59:04 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4a0a6sm1508649385a.8.2026.07.14.07.59.04
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 07:59:04 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9034b6b7674so30596006d6.0
        for <soc@lists.linux.dev>; Tue, 14 Jul 2026 07:59:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq/8loR/PjD6+p0b2qBlYZwYa92UkO/8pyAipoZITWY2cxeK2CqXHclj5zwtHDmqfNqmvI=@lists.linux.dev
X-Received: by 2002:a05:6102:50a3:b0:722:a46b:2f2c with SMTP id
 ada2fe7eead31-7457e8e365emr2275003137.15.1784040773753; Tue, 14 Jul 2026
 07:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-6-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-6-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 16:52:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKcyA6YVR8MRAF=uQFiF73Mbnhh0f8jei82_Ev41BVog@mail.gmail.com>
X-Gm-Features: AUfX_mzWdd5ndgb4V5c32_Too4L9v4meC5g5UkXGWDIweQBOL5XU43xcgrFTB8s
Message-ID: <CAMuHMdVKcyA6YVR8MRAF=uQFiF73Mbnhh0f8jei82_Ev41BVog@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] ARM: turn CONFIG_ATAGS off by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
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

Hi Arnd,

On Wed, 1 Jul 2026 at 23:29, Arnd Bergmann <arnd@kernel.org> wrote:
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
> add a dependency on CONFIG_EXPERT.
>
> The board specific defconfig files that rely on ATAGS
> are changed to turn on both EXPERT and ATAGS if they
> were not doing thath already, and the ones that explicitly
> turned it off before no longer need to.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit 4d9226b820c165b7 ("ARM:
turn CONFIG_ATAGS off by default") in soc/for-next.

> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1390,12 +1390,15 @@ config ARCH_WANT_FLAT_DTB_INSTALL
>
>  config ATAGS
>         bool "Support for the traditional ATAGS boot data passing"
> -       default y
> +       depends on EXPERT
>         help
> -         This is the traditional way of passing data to the kernel at boot
> -         time. If you are solely relying on the flattened device tree (or
> -         the ARM_ATAG_DTB_COMPAT option) then you may unselect this option
> -         to remove ATAGS support from your kernel binary.
> +         This is the traditional way of passing data to the kernel at
> +         boot but is now only used by a few of the oldest ARMv4 and
> +         ARMv5 machines.  Users that still rely on ATAGS should plan
> +         on migrating to devicetree based booting.
> +
> +         Support for ATAGS will be removed when the last machine using
> +         it is either converted to DT or removed.
>
>  config DEPRECATED_PARAM_STRUCT
>         bool "Provide old way to pass kernel parameters"

I don't know how much of this is used by systems with old boot loaders
that use a combination of (appended) DT and ATAGS.

E.g. the old U-Boots on Marzen (R-Car H1) and KZM-A9-GT (SH-Mobile AG5)
rely on CONFIG_ARM_ATAG_DTB_COMPAT=y to pass the kernel command line,
and that still seems to work fine without ATAGS.

Note that to boot a proper multi-platform kernel on KZM-A9-GT, I still
need "[PATCH v2 1/2] ARM: decompressor: support memory start validation
for appended DTB"[1], which RMK doesn't like. That patch is so old
that I forgot how to make upstream boot on KZM-A9-GT without it...

Anyway, it looks like all my boards boot without CONFIG_ATAGS.
Thanks!

[1] https://lore.kernel.org/20240121203009.9257-2-ansuelsmth@gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
