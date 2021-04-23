Return-Path: <SRS0=gZNk=JU=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C79FC433ED
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 13:43:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5514F613B6; Fri, 23 Apr 2021 13:43:08 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 566BC61163;
	Fri, 23 Apr 2021 13:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 566BC61163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7RDn-1lYwYm2gQP-017p5V; Fri, 23 Apr 2021 15:43:05 +0200
Received: by mail-wr1-f50.google.com with SMTP id e5so19812610wrg.7;
        Fri, 23 Apr 2021 06:43:05 -0700 (PDT)
X-Gm-Message-State: AOAM531ZKwfhqHuCzNYpztt1X+IB8l04V4UZFKd4rHc5v3pw+ZO3rZCl
	f0FFc9YT8xoD3hoKRW1cfHpOcykGUfNdsXhVziE=
X-Google-Smtp-Source: ABdhPJyYEz3oAXfA6QGQ8pDBYCOWietlua8xR8+nwPHJcQITOjWTJqOWfw/bCo59vyTE1f48HCKqz3MvbCPSUfzzUTc=
X-Received: by 2002:adf:e483:: with SMTP id i3mr5013767wrm.286.1619185385314;
 Fri, 23 Apr 2021 06:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-5-thierry.reding@gmail.com> <YILD4yyPXuiYbHW1@orome.fritz.box>
In-Reply-To: <YILD4yyPXuiYbHW1@orome.fritz.box>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 23 Apr 2021 15:42:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
Message-ID: <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DUUvAzAAMwiIhlxdhIyUHz5ELJy8tQXV/sfKtokfkW41lcYwsRm
 owbBaeB5mJzX08nCCH6iIAaUmo8HKlhteW3Ijm+nsMN186PtuvPimqxgYK2tOS5q3jcoH31
 6yrQSnc7zhQ+WLS/02m2zTBP+bU7fTk4X/Ea1b8cY+WHzAT27Dl1Wus0uTYYfvF9pZsoIOZ
 8FEi6mq+RHRzjjse0+LDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H5vW65E5/Ow=:3gDZYGcajd7bvCxkolj52B
 nKO5e7EqWpEGFk7cvGXFSqRL0/NjdN42Wmq5fi03Pnl9tW96+TZSaML6El9QbsRutmfI+/Lv0
 3RrknO43tm3Bcwm4ihIxHK0XtOA75FnJTD9k68aOzdy5edN02ofyzHkS55FPoZEtc72P0elIS
 G4y+Gt3IzpSgW0JdCLHhdeXTMTwve2Af8uOOgDoNoTnsby/TgWn3Q3OEE0UYH5uLWrLGdYmbI
 fdW4gKX/mTKo+oHjhPU7YT5XgPKfP6j+zhiQSRhgIdnUzuFrgQx7fg3BxagctN6zwcm6czpP3
 q1RceWdz//9TN/IbFWcJjdUOptD06blPx8JLVAv6xUKAOTxEcchkUaulW3pMo0sx/HWHzdM4H
 X1CTl+vHWW82JJqyyFGIg4uzOU0NQRuU0UvkES4jQWN9hdZdndirmjLLonHg3SzTZLx7m8PCZ
 IKWfdSr3kl+afqQciqITz+DwoilILXJO5w0SwK3LsCyZRG1e3Ms5REwpnmVOe+mCzpDSecfs2
 CBnyL+xUm9mbUpUE3w3vTU=
Message-ID: <20210423134242.jzODNMq5VENrSdxW9PSrdtirwY9zUkXpKJ5jcI5_qVs@z>

On Fri, Apr 23, 2021 at 2:56 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Apr 01, 2021 at 07:26:22PM +0200, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >
> > The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> >
> >   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt
> >
> > for you to fetch changes up to 405fa9e9d8664e830982c5fbcb70f9ba8656bafc:
> >
> >   arm64: tegra: Move clocks from RT5658 endpoint to device node (2021-03-25 14:04:49 +0100)
> >
> > Thanks,
> > Thierry
>
> Hi Arnd,
>
> I noticed that v5.12-rc8 is still broken because of the missing
> fw_devlink=on patch from this PR. This PR was meant to go into v5.12,
> but it looks like you pulled it for the next release.

Indeed, I never noticed the difference between the subject line and
the tag name. I usually go by the subject to see what branch to pick
and only then check if there are any discrepancies, but I missed this one.

> In retrospect I realize that the way I sent this out was rather
> confusing. Any chance you can still pull these into v5.12 to unbreak
> the final release?

I've pulled it into the arm/fixes branch now. There is only one other fix in
the arm/fixes, but I should still be able to send it out tomorrow.

      Arnd
