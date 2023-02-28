Return-Path: <SRS0=Jrkf=6Y=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90920C64EC7
	for <soc@archiver.kernel.org>; Tue, 28 Feb 2023 19:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73177C4339C; Tue, 28 Feb 2023 19:56:23 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42E73C433EF
	for <soc@kernel.org>; Tue, 28 Feb 2023 19:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42E73C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id s17so6402977pgv.4
        for <soc@kernel.org>; Tue, 28 Feb 2023 11:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+9o3S6kQ18VQ5w6rkuB4Wcic7oEsWXTa9ZJlpIVCtyM=;
        b=jNVXTJQ9/neAz+/Gp9RBOUUkesvo85PS686TmIbNkJvk4iNe3ZoDePEbbmZ4pSEldB
         m0kbuK6TvBNpmE+Hq1yY9j/5/WS+FTJ+c84zd/1ToRq3icNeNiKvnEFsalIOu9gr8JQr
         IxzXE5mkz5S/ZbWi3uEuN/DhuwTOflRyrrMxqv8AtN6B8/0YOGhRfDF4Lz1kShQMzN4t
         wA19vPKfjcdJ9jZYNfMuh4CR0CBb0ka/pnMvDamp7t/xT4/KiURpgMKPg6NcJH7wSkMC
         5MrZcfn5RaeVt6rootxILvHt4O63znQrbo/bmzN58hnPdu+MG75mP42AftzNaESQj7SE
         YP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9o3S6kQ18VQ5w6rkuB4Wcic7oEsWXTa9ZJlpIVCtyM=;
        b=upTVFoD57Z6vcEVEceDaErWcLzMOFm1JqNDqN52qNcTtv5CrHx2zzu1kV70K8vj88y
         Ds/BkM7keUcFtL92qstz6j/N0vknEEbiQ0pty0zetNwESzAMVP4+MlYa9vpkYSclwq+V
         0Tz1S43+BFi4wEWd0IqEi1zkha562CfnLHyaT1tMCRDVuo063aMIAuDzk9/e2uPneOXX
         H4jNd6QZMILu6D4Rvhibc3Qor94JcC6boON50eAePDPldgcjziTEOFoV4mw9U6Suhb9L
         FzWkhwWnchjBl8zbJPYBBzUkM8XuFclFkThNA6BWqMmA65wJ7QqGJXejyIzophGW3sDH
         P4QA==
X-Gm-Message-State: AO0yUKUuZiUx85EaziAQS2NMSVcJV2MfV3nqV9S0oaT3qdpU8i5jcVKS
	qA2Pmli8O7vxrqdJb4wl27huUQ1UHtiaGRYyJvUsnA==
X-Google-Smtp-Source: AK7set98slERKiVcYggw/Nm5y198Tg6ohtVHHM8PMqKMOcoP7/RJq00aNPCY1AsgjJTbYwPHLc6Q05bCteOOgDwdG5I=
X-Received: by 2002:a63:ac58:0:b0:503:2d3f:a187 with SMTP id
 z24-20020a63ac58000000b005032d3fa187mr1271237pgn.5.1677614181655; Tue, 28 Feb
 2023 11:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20230224135230.2295826-1-linus.walleij@linaro.org>
In-Reply-To: <20230224135230.2295826-1-linus.walleij@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 Feb 2023 20:55:45 +0100
Message-ID: <CAPDyKFpxJQJAiGNFFmuz5u92AXgPTCxmS3_EE6GcEFgmPcQHPw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Add IOSCHED_BFQ to the default configs
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Valente <paolo.valente@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Feb 2023 at 14:52, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> ARM64 systems are often memory constrained and more often than not
> use slow single-channel storage such as flash memory or MMC/SD-cards.
> For any interactive systems (such as mobile phones, tablets,
> chromebooks...) the BFQ I/O scheduler will be desireable.
>
> Make sure the BFQ I/O scheduler is available on these systems.
>
> ARM (32), Loongarch, MIPS, m68k, UM and S390 has also enabled BFQ in
> their defconfigs, cf commit b495dfed706c4c5873c0dab8930ad6eb1d276a6c
> "um: Cleanup CONFIG_IOSCHED_CFQ" where the motivation is that
> it replaces the former CFQ scheduler.
>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Paolo Valente <paolo.valente@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Seems reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> SoC maintainers: please apply this directly to the ARM64
> defconfig branch if we have consensus.
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 851e8f9be06d..503cc08cf112 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -126,6 +126,7 @@ CONFIG_CRYPTO_AES_ARM64_BS=m
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> +CONFIG_IOSCHED_BFQ=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_MEMORY_HOTPLUG=y
> --
> 2.34.1
>
