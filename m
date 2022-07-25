Return-Path: <ardb@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD5EC433EF
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 05:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D16C1C341D2; Mon, 25 Jul 2022 05:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4775C341D3;
	Mon, 25 Jul 2022 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658727881;
	bh=lJc6yzUAsp9ss2eaRTI/gSfonIc15bY+Uazs+neYJdA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Soj8y3i7+Zk9OYEAt2mfShLKLO+OwAPJHpGG5ttLO2OHt3Mrzf2yono55AnY424cL
	 LcVBt6iMh8UQZEG2DJ417SslDJ+drT5f/NzVsRGeMyj+8SxpDCS8hej/9v+/HP6BxB
	 E2qKpf0WiTS8rvxLOyN27NF7Feay8x0xol/aIGiAWEfyTIRM297dCrBJJwtuWXAKSH
	 s4ICXTGKzeJf638Km24ack73Lc1AB9/dpSTZpF+mXbkQieJ+LRbDTVqweE6FHOMpn+
	 dQlfPsaALiyAG5Y0jAXD9ci6XFNwQh/3vrUWzTZGt+GCgEd6WL8hzyq2b0RkR+/2PR
	 LBxgPHVfxuG4A==
Received: by mail-oi1-f178.google.com with SMTP id u9so12332264oiv.12;
        Sun, 24 Jul 2022 22:44:41 -0700 (PDT)
X-Gm-Message-State: AJIora/j1aitZOH+wbMMIJIsOq0xtG/53LfHFbpHg728qXV6GLuhSzT4
	tXWchwL3NGZTOrXm2Jty/0xbQbt2LWYQbus2fYA=
X-Google-Smtp-Source: AGRyM1uAA5R2+NahTeAKgrGhsAQg14AiMW4BQf7Or4SO4t1sFh1hyOUBLsm4vBQwcqcQrJmezXUxzXwhdqCG6r7z/nc=
X-Received: by 2002:a05:6808:1489:b0:33a:861c:838e with SMTP id
 e9-20020a056808148900b0033a861c838emr11519091oiw.228.1658727880857; Sun, 24
 Jul 2022 22:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com> <1658681004-132191-3-git-send-email-john.garry@huawei.com>
In-Reply-To: <1658681004-132191-3-git-send-email-john.garry@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 Jul 2022 07:44:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHFTEKQS9tZemfPxKus-pAv7rTKVs2kjJy=Kcpd6CMvAg@mail.gmail.com>
Message-ID: <CAMj1kXHFTEKQS9tZemfPxKus-pAv7rTKVs2kjJy=Kcpd6CMvAg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 Jul 2022 at 18:51, John Garry <john.garry@huawei.com> wrote:
>
> Since commit f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable
> from a choice") faddr2line has stopped working by default as it relies
> on CONFIG_DEBUG_INFO.
>
> Enable CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT to get it working again,
> which seems the sensible config option to use.
>
> Signed-off-by: John Garry <john.garry@huawei.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index de662de0bb4d..43e3550afa45 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1311,6 +1311,7 @@ CONFIG_CRYPTO_DEV_HISI_TRNG=m
>  CONFIG_CMA_SIZE_MBYTES=32
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  # CONFIG_SCHED_DEBUG is not set
> --
> 2.35.3
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
