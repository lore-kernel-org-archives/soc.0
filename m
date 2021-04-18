Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274E5C433ED
	for <soc@archiver.kernel.org>; Sun, 18 Apr 2021 19:24:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E88BD61165; Sun, 18 Apr 2021 19:24:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2DEB610FC
	for <soc@kernel.org>; Sun, 18 Apr 2021 19:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618773884;
	bh=4Se/bEEETibAB00qp1t/rKwtQoxtk+0b3mGt76pulPk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OMp8LkIjCM5uUvdf5CMGk3k5v3I25L60xFZeEN0hGuUEHpwLKrXKnVn3UoN5zEZhL
	 SScfaXvUgHjrw0+FgklZpW0uJwkiCFJaEC3Bm53RqS6100eGXn7soWbL78nFVZRfnc
	 2oVASMIHzCgubDnW39b4AdPY+a99r2cqO4WEJ1m973sVlsFjiYnf/9C1/bGNzXwECm
	 Yjan5VuRygYZ5hO3hXqOkI42Lr6MbJKjx9ecZCVjnJXMvCzDogiRmsrGt4OoLu83MB
	 Dcwc/R4FPNuxTHjsV5h0S0Ry4AdHEfglW5e4eTX1ZZgmghDjnFCbcAmbEVaqn4YCNJ
	 vh/18WDJprOYQ==
Received: by mail-wm1-f41.google.com with SMTP id y124-20020a1c32820000b029010c93864955so19332533wmy.5
        for <soc@kernel.org>; Sun, 18 Apr 2021 12:24:44 -0700 (PDT)
X-Gm-Message-State: AOAM5314Z2in1EMbIarIDhG+zhDj199BMaUAlqB2wQMBWOQe1CLbnpEC
	Udlttlb1CaXjdM011ZA/bfh/2IhD0Qly7h+CSUQ=
X-Google-Smtp-Source: ABdhPJw60C3cNf2STVU/AoQJg0Y5c/7RngznPFd6F3lwHWK44L/t6UsO78u2X9+QWvvz2igoPVq7rnMavwBP+0JdEKc=
X-Received: by 2002:a05:600c:4149:: with SMTP id h9mr7114451wmm.43.1618773883527;
 Sun, 18 Apr 2021 12:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
In-Reply-To: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 18 Apr 2021 21:24:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3oQm7P=Mj2xU=8v=g82mN-OXk7yrPmFMcK0XpMpwRctg@mail.gmail.com>
Message-ID: <CAK8P3a3oQm7P=Mj2xU=8v=g82mN-OXk7yrPmFMcK0XpMpwRctg@mail.gmail.com>
Subject: [GIT PULL] Re: ARM SoC fixes for v5.12, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"

I forgot to add the '[GIT PULL]' in the subject line, replying to myself
here to ensure it hits the right email folder.

On Sun, Apr 18, 2021 at 9:23 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:
>
>   Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-fixes-5.12-3
>
> for you to fetch changes up to b9a9786a13ea158ee3b23614217f2e3158178421:
>
>   Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
> arm/fixes (2021-04-08 17:56:09 +0200)
>
> ----------------------------------------------------------------
> ARM SoC fixes for v5.12, part 2
>
> Another smaller set of fixes for three of the Arm platforms:
>
> TI OMAP:
>
>     Fix swapped mmc device order also for omap3 that got changed with the
>     recent PROBE_PREFER_ASYNCHRONOUS changes. While eventually the aliases
>     should be board specific, all the mmc device instances are all there in
>     the SoC, and we do probe them by default so that PM runtime can idle the
>     devices if left enabled from the bootloader.
>
> Qualcomm Snapdragon:
>
>     This bypasses the, recently introduced, interconnect handling in the
>     GENI (serial engine) driver when running off ACPI, as this causes the
>     GENI probe to fail and the Lenovo Yoga C630 to boot without keyboard
>     and touchpad.
>
> Allwinner:
>
>     One 32kHz clock fix for the beelink gs1, a CD polarity fix for the SoPine,
>     some MAINTAINERS maintainance, and a clk / reset switch to our headers.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
