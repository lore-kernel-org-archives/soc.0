Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E89BC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 22:07:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 02DE123D22; Wed,  9 Dec 2020 22:07:27 +0000 (UTC)
X-Gm-Message-State: AOAM530k2mjzhry5qeTLU0cQ7vmMpqNdpVZA91/8+yMyZ2tt1DvDzETd
	GPkLmeiWFXXRHrBA4bJnXcu4oM/cAC4UBkYOciM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607551646;
	bh=gPmQMQEImLWPvAjaFsGIPTOSRzUDA+6UU1BaItnv6ys=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=B3vQlEtJqHNs3l6ydoAaRMUMopfiwtCkfkonoQJYlsiBakgVmk6SomjkjDYkug2Ux
	 Jc4lCEej02YhMttWb5EmqJpzGUvRz43vBp6OTENVrIzy0iO82kH9R+cWnXyAB3t2Wo
	 8VowFk4yOuFm2MwUaFon7/VDx8JzbWZ4ZkF0WDU62nHflYNBk0HHt71zkGcu3zW9qm
	 EI6fojwBVbNkdbGSwy3rBTgyf1VOhNKuyRl3t+p6RYgHk89TIFsHckel7PrTEZ3zUy
	 7afDk6sY9wtrU0SrtxMPSixnz17SHE8qfG60PtZ1FShwzTeWACxV8SOn4UB0qTWjI4
	 hEmmhH2MSQKxQ==
X-Google-Smtp-Source: ABdhPJyUJyv3UGMfoQHaB8VACaJj065fMta9S1/6u7U1l8vdriFarOSmG+mvHYs9He/Olwiu7qS7RhpCXwqEb4+ckA8=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr3657222otk.251.1607551646244;
 Wed, 09 Dec 2020 14:07:26 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
In-Reply-To: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 23:07:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
Message-ID: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 10:14 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:
>
>   Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-soc-fixes-v5.10-4
>
> for you to fetch changes up to a0cab089baf3048020de7bee53bccd598747126a:
>
>   ARM: dts: mmp2-olpc-xo-1-75: clear the warnings when make dtbs
> (2020-12-09 20:43:13 +0100)
>
> ----------------------------------------------------------------
> ARM: SoC fixes for v5.10, part 4

Stephen Rothwell just pointed out that one of the fixes I added today
was missing a Signed-off-by. I corrected that and uploaded a new tag

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-v5.10-4b

in its place. The contents are the same, but the new
HEAD commit is 69fe24d1d80feac4289778582cf0a15256d59baf

If you haven't already pulled it, please use that one instead. Sorry
for my mistake.

       Arnd
