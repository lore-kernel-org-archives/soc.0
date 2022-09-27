Return-Path: <ardb@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E32C54EE9
	for <soc@archiver.kernel.org>; Tue, 27 Sep 2022 13:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C95FC43143; Tue, 27 Sep 2022 13:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1778FC433D7
	for <soc@kernel.org>; Tue, 27 Sep 2022 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664285765;
	bh=KF4ygSdoBEgFR9c95ykoGxx1nq7hRUsiYDGtXOQ60/g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Cupc1LEG0QvgtutTKOAF/DAtypyBFh14RvLBlaD9mL3VOGfIF8J2Ch4dUs+mw1vcl
	 GZlTqJV8LEo36piRyTLhxYNnx6sz1+0Ua5svEUXEimOBdWxiK0ATygn6/u07IgmDE4
	 wOy/+CUN2L5xuTJp9kF40ZDcTWxFNq2PhNGXQwSrwOAlPs6Fqlycvyo+P4nlY/Y1J3
	 ROSYyjjTGdCKUKh3Vo55Pn/FCpFgACTtwPPlFDbkkF9UwF5ChypPyOh3iqCUEYa5ie
	 6XLaR9792tHq3+PxmIJ2MGlKEK+oMzLOX/czw9L1VQVgyRSJ8fUwvQ4gGBlXuGD03S
	 BM+iNyuQ/0UCQ==
Received: by mail-lf1-f48.google.com with SMTP id a2so15735292lfb.6
        for <soc@kernel.org>; Tue, 27 Sep 2022 06:36:04 -0700 (PDT)
X-Gm-Message-State: ACrzQf3qzY5aV1rjzIYB54dnXohKdsDkw24vS7bHZkrwa1yhWXPhhvde
	Ah3NIc4ZnvyfxVnPHQRWYqA+24544aSvOa7GtgA=
X-Google-Smtp-Source: AMsMyM4Y3Wje5KdfbbiBTLtF+Lwy068okUSJfsDGYICgGYo+0fhgfZ9ubhir7T5qaij+lYPWdvn4Ga22vo3gi+Iu1qg=
X-Received: by 2002:a05:6512:3d09:b0:497:ab35:fd12 with SMTP id
 d9-20020a0565123d0900b00497ab35fd12mr11478651lfv.539.1664285763056; Tue, 27
 Sep 2022 06:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <c557b149780faa2299700585afc9d270ede7f78b.1664285062.git.geert+renesas@glider.be>
In-Reply-To: <c557b149780faa2299700585afc9d270ede7f78b.1664285062.git.geert+renesas@glider.be>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Sep 2022 15:35:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEK340azdrrf8T225gGTSBVgCW2NH6jkteVcqWzcnc8Xw@mail.gmail.com>
Message-ID: <CAMj1kXEK340azdrrf8T225gGTSBVgCW2NH6jkteVcqWzcnc8Xw@mail.gmail.com>
Subject: Re: [PATCH] ARM: Drop CMDLINE_FORCE dependency on !ARCH_MULTIPLATFORM
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Russell King <rmk+kernel@armlinux.org.uk>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Sept 2022 at 15:26, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> On older platforms that boot an image with an appended DTB, or where
> the boot loader has no support for updating chosen/bootargs, it is
> common to rely on CMDLINE_FORCE.
>
> While a fixed command line can make the kernel unbootable on other
> platforms, it is not guaranteed to cause that.  E.g. all Renesas boards
> use the same chosen/bootargs in upstream DTS, which works fine if your
> DHCP server hands out proper nfsroot parameters.
>
> Fixes: 84fc863606239d8b ("ARM: make ARCH_MULTIPLATFORM user-visible")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 22f62ad919bfd831..ea8adbf25651438a 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1616,7 +1616,6 @@ config CMDLINE_EXTEND
>
>  config CMDLINE_FORCE
>         bool "Always use the default kernel command string"
> -       depends on !ARCH_MULTIPLATFORM
>         help
>           Always use the default kernel command string, even if the boot
>           loader passes other arguments to the kernel.
> --
> 2.25.1
>
