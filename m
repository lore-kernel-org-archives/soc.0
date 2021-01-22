Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AD9C433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 15:26:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92CE723AC0; Fri, 22 Jan 2021 15:26:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B99223A9A;
	Fri, 22 Jan 2021 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611329164;
	bh=j7POJbXKTzDuB3/eYG14J7veIFugGno/3G4vA/5heEY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XkaCH1PkYNMAV1ZuIaicePstgpavdjiYnAKaiZ7ZWRgkKEcl55k61d+1TyObR4PTz
	 9q3mWc9suY579Rq8uT9oF2rtWf8x/DjgwWiYtCiHwA/xhT62a4cp+FmKgl0gymPiUM
	 geKq3QHTu1ogxeoEz1kXgONs0zotT6H5dmUy/iGFnBIMRzLyQ1c7528iyTjQOSq5A0
	 aDX3LnhtuXPhyAjIm3tkWIjDYgibTKu5EboCE9vZNT1T4n9miV98M+aJJD0QHW0oFC
	 LwAvyTsUbduCdoIuMAUL9cK1tsAPYY7Zz7F8vvAWV342kS0trsfM7mqWulxYVOe6kZ
	 EyZQZkxJnrIzQ==
Received: by mail-ot1-f42.google.com with SMTP id i20so5388828otl.7;
        Fri, 22 Jan 2021 07:26:04 -0800 (PST)
X-Gm-Message-State: AOAM531U/zwc/8R4r7+l3Red9kjYO/Ns5QIWqort2eARqrVNqvaqu3GL
	PmzCzM5yFYcRXBAF1HkESBFM9ULsa/alzkmSTzk=
X-Google-Smtp-Source: ABdhPJxBc2BUd+tDE56eSr6EAXddRpNZSF16hXtFyUYar1ooFQ3C99Hc/fJ3T0D4QcNjqsPaaGQC5xFsuAQkpJAiAkM=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr3692162otk.210.1611329163798;
 Fri, 22 Jan 2021 07:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210122143536.168833-1-nicolas.ferre@microchip.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jan 2021 16:25:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
Message-ID: <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 22, 2021 at 3:35 PM <nicolas.ferre@microchip.com> wrote:
>
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>
> Arnd, Olof,
>
> I'm taking back the lead on sending the pull-requests for AT91 and hope that I
> didn't loose the knowledge in the meantime. Tell me if there's something I'm
> missing. Thanks a lot to Alexandre who kept our flow steady and very
> predictable during all those years!
>
> Here are the first SoC changes for 5.12 which contain a single patch for multi
> platform kernels.
>
> I plan to send another pull-request for the SoC changes related to new sama7g5
> that Claudiu sent to the mainling-list recently. I'll let it mature in
> linux-next by the beginning of next week and will send another pull-request by
> mid-next-week.
> Tell me if you see a problem with this approach.

This all looks good to me, but I think I'd rather take the 'soc' pull request
into the v5.11 bugfixes, as this may already affect users on other machines.

I would also suggest adding a 'Cc: stable@vger.kernel.org' tag. If you like,
I can just cherry-pick that patch into the fixes branch and add it there.

       Arnd
