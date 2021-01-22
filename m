Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E0AC433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:04:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1B53E23B2A; Fri, 22 Jan 2021 23:04:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E07A323B1F;
	Fri, 22 Jan 2021 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356695;
	bh=iv3JQtJXXyDMdrMinxn8ucBa400MIuwVc0IKsY0zPig=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tQMSotNJYlcz3t2XzW81grZhaPSyrZR6WLFduaZY3i8SacqwmhB7tYd3N59r1MZTU
	 LH0OikEfN62Z3chTxW0eVLSBeZfqMa3ghUdjAf1PxZw27dhR8VowJcz/fIddo62wib
	 ZGKDHS5mdBzwtVjMBREY1oGRNG0vglqTn8wK/G6dk2Bxa5fMWm8Q6hCRDdZbDheX98
	 jLsHtkEzOBMFlbz+aqwpDzjUl3QLkZWecRomJH4+9efys2pAvjjfTjkUtwhzIcr3Dz
	 tvPx4Syt/TqHB/7JJWf5z4PiQPtNlMkVa+crOqCq6Pv86xtWghC67uYiS0dRFQhQfp
	 S2d8wE0lNQb0g==
Received: by mail-oi1-f175.google.com with SMTP id 15so7846891oix.8;
        Fri, 22 Jan 2021 15:04:54 -0800 (PST)
X-Gm-Message-State: AOAM532f/jYwAxy41+WvpfgFYR1BoAfDh84HQuP3yKzUjH3eCVtTXPN2
	7FHKHzvKMO29CH9p/lfjH429fELgYG8gKoFCHFg=
X-Google-Smtp-Source: ABdhPJzVwEf9zIaoqHXWeCSJw/eGuoRfATYED0ebRyfTQcq8bKNWds98uWZMBtOTTB0zZ6L+Nil5hdtGoDXads0y//o=
X-Received: by 2002:aca:eb0a:: with SMTP id j10mr4935968oih.4.1611356694116;
 Fri, 22 Jan 2021 15:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20210121203302.3639841-1-f.fainelli@gmail.com>
In-Reply-To: <20210121203302.3639841-1-f.fainelli@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Jan 2021 00:04:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1fk7vLa5z+VWA=TCXhfYvmuiv=ii2UnR-a0=WOsHhBRw@mail.gmail.com>
Message-ID: <CAK8P3a1fk7vLa5z+VWA=TCXhfYvmuiv=ii2UnR-a0=WOsHhBRw@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Broadcom devicetree-arm64 fixes for 5.11
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Bharat Gooty <bharat.gooty@broadcom.com>, 
	Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ray Jui <ray.jui@broadcom.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 21, 2021 at 9:33 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:
>
>   Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree-arm64-fixes
>
> for you to fetch changes up to d68aecc153ea4bd55ff32f083f05e9bc5610ec78:
>
>   arm64: dts: broadcom: Fix USB DMA address translation for Stingray (2021-01-20 10:45:56 -0800)
>
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM64 SoC fixes for 5.11, please
> pull the following:
>
> - Bharat fixes the Stingray USB controllers ability to DMA by providing
>   an appropriate 'dma-ranges' property for the interconnect

I cherry-picked the commits from both of these pull requests onto
the arm/fixes branch, to avoid a backmerge, or having you rebase them.

     Arnd
