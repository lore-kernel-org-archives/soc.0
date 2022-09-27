Return-Path: <ardb@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA248C54EE9
	for <soc@archiver.kernel.org>; Tue, 27 Sep 2022 13:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C15CC43143; Tue, 27 Sep 2022 13:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76056C43142
	for <soc@kernel.org>; Tue, 27 Sep 2022 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664285697;
	bh=PM/TgtGhohp6waLCLdQwnXZCsRO7cMWGWoGwmWvdIKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=laQAg2C6SwlyQk4eN/CfR6lP1SmcULaOh+EA9oUFYoSAO+qoZnkqxMqJ71KnlXRMJ
	 STl+u45bYrFPQU5xmMjk92Tj80Sp789LWBd96TgnQxYNDxSSPR771DMJf6Fl4ye+PK
	 jxUKz0FAz2AB9wUoXGmb+sJZu9m/IuSSbyncAezd2X45gXUpVHuBPsS1NvbHQGxM0Z
	 0iDl6YCkD/sFW2vY4vB/7j4v+6gKhVbwpjDqP4McMc3qcJCFlJBIIUw3t7KxuVdONt
	 iHk8kJrD9kwWnY5JAz3ltXfPdttefRdyeuxR1IQyOg0r83klju39SSAPWr24UQoJYl
	 9Mv0yAlrsi5nQ==
Received: by mail-lj1-f178.google.com with SMTP id l12so10921323ljg.9
        for <soc@kernel.org>; Tue, 27 Sep 2022 06:34:57 -0700 (PDT)
X-Gm-Message-State: ACrzQf1SiLJHs8pg27qEE7w3CmoBglyZYNJYeN9IyMQlFRldGqjw6n4s
	iK3MWgM11oN6hOQVhWXQ+NbRvJuzT3ZJnuh2egE=
X-Google-Smtp-Source: AMsMyM6l4uSt2eJtPW1Jlt7XD8YfMxMZ7kVCNV+yC2DUU3UEiuATgYcUsvgt2Y2z5PcKTmMVtCWBVRioVYXYrfOvlfA=
X-Received: by 2002:a2e:8349:0:b0:26c:4311:9b84 with SMTP id
 l9-20020a2e8349000000b0026c43119b84mr10257992ljh.152.1664285695442; Tue, 27
 Sep 2022 06:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <09f0619e8038654d01588d9ad3a023485b2bd77f.1664285209.git.geert+renesas@glider.be>
In-Reply-To: <09f0619e8038654d01588d9ad3a023485b2bd77f.1664285209.git.geert+renesas@glider.be>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Sep 2022 15:34:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHrtrgP9wmKghhcxOhBeqgZ1V+Oyf=E_OZDBhWyQWjRcw@mail.gmail.com>
Message-ID: <CAMj1kXHrtrgP9wmKghhcxOhBeqgZ1V+Oyf=E_OZDBhWyQWjRcw@mail.gmail.com>
Subject: Re: [PATCH] ARM: Drop CMDLINE_* dependency on ATAGS
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Russell King <rmk+kernel@armlinux.org.uk>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Sept 2022 at 15:28, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> On arm32, the configuration options to specify the kernel command line
> type depend on ATAGS.  However, the actual CMDLINE cofiguration option
> does not depend on ATAGS, and the code that handles this is not specific
> to ATAGS (see drivers/of/fdt.c:early_init_dt_scan_chosen()).
>
> Hence users who desire to override the kernel command line on arm32 must
> enable support for ATAGS, even on a pure-DT system.  Other architectures
> (arm64, loongarch, microblaze, nios2, powerpc, and riscv) do not impose
> such a restriction.
>
> Hence drop the dependency on ATAGS.
>
> Fixes: bd51e2f595580fb6 ("ARM: 7506/1: allow for ATAGS to be configured out when DT support is selected")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index ea8adbf25651438a..68923a69b1d41188 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1599,7 +1599,6 @@ config CMDLINE
>  choice
>         prompt "Kernel command line type" if CMDLINE != ""
>         default CMDLINE_FROM_BOOTLOADER
> -       depends on ATAGS
>
>  config CMDLINE_FROM_BOOTLOADER
>         bool "Use bootloader kernel arguments if available"
> --
> 2.25.1
>
