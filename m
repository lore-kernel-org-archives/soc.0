Return-Path: <SRS0=uBN8=OE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16879C433EF
	for <soc@archiver.kernel.org>; Tue, 14 Sep 2021 13:58:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0D576112E; Tue, 14 Sep 2021 13:58:51 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D2F60E90;
	Tue, 14 Sep 2021 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45D2F60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBlpC-1mcCij3Lzg-00CC2E; Tue, 14 Sep 2021 15:58:49 +0200
Received: by mail-wm1-f53.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso2636541wmc.1;
        Tue, 14 Sep 2021 06:58:49 -0700 (PDT)
X-Gm-Message-State: AOAM531iKcfpLXUPyPHyH/E1V5HrINrXcXpYrzzuD3IqEum+gkmCGREg
	hcf3gNVDVNS2vRqrmFM7CXCDEyECLPCTITDl18o=
X-Google-Smtp-Source: ABdhPJywhw7xMpurRhL3hzkADsKfLGH4ftUdoQ1RezoydQtweMfQYnGMOBNiiuTEntg0TtXaQhBlk2GVo4kiwcoscAM=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr2433974wmf.82.1631627929381;
 Tue, 14 Sep 2021 06:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <cec98151-d7a9-3fdb-ba5c-dc1fd182c2c4@monstr.eu> <163010220873.19400.3396594122611634350.git-patchwork-notify@kernel.org>
In-Reply-To: <163010220873.19400.3396594122611634350.git-patchwork-notify@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 15:58:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a38ZeKhg07Ed3fh2puouNKwXjRvosJaf5zWaKqF6x5+7g@mail.gmail.com>
Message-ID: <CAK8P3a38ZeKhg07Ed3fh2puouNKwXjRvosJaf5zWaKqF6x5+7g@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.15
List-Id: <linux-soc.lore.kernel.org>
To: patchwork-bot+linux-soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Michal Simek <monstr@monstr.eu>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dlernLQF5POwcaq9UbYLX7UKD9Ik+Jh/ZA4wADIx9MtWewv62Xd
 IynfGdlx/LTvbRGTmdyyAshj2Nudna/+URx/gDzXzwKEf10ANJxrlPi5nOqj/HLe9PQtSbJ
 6noYn9sOrmQACeIkZQp8g0qzMdWMqTnR09YgNrSViftQLrtNnT5067L2I623E2uwX9csUlE
 34lgGiAud0qDsNt55Kxtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CiLvW2j+6qc=:n7w46EzjKF0A3QWiYQGbNj
 4BCAolssGTWr5GUGUj5H3uVZfwNWD+2zJioikYQ6njmys7OdUH1OviroQMIRaMH5hH5kaes3I
 QQMN3H3lV7YtkfeJGxmvwFVqDIUYAJnS0QuuC/IuBnPuLioENUDDpLJEl4k9XKS4KydwmcTwN
 b0ZKxDoHctBxzCmG8DX7P2uE8mzu604iL748EDsDXZ8iQVC9umv32HtaPaMeofgNI3IO6e/eP
 tTnbtPa5EplHaw0UERMQvFCy6fYEYo3nAYtnKgIe85vpw3n2NkKdNtIVCVHrYdpUfh4q1a4vb
 JY56rbCXkhzuiPmUs1S/futDtnRmK2RTZG1rAShWreSU0st8cwYDhDaZJapnaoTMCgosjv1fY
 Pzb+6xyPT7KSkT+GubZhk+/4OlVyZDO6PIs0AS20QVNs6lyZ8DOhM8hXen4zWpgAFzz/KlK18
 WtthedbYpRy90Wt7EOgY7UuVmAJkV3DSH065nkxSOfjQXSMawYdq4lrgw8g8WSNOnWLfP3CJ4
 p2RRvckzq7IgtCgIiw7SRX1mj/19Ai56i4g69u4+qwjRCrYkaAGirUdxOiE485pCnEQqiRML6
 6VCpQr0K4nqJmb21wcwEy8ecVCrqtwQ2j0yNpYtfenQtK40He12nwa9DtPzGLkf0xwA76wz9A
 RfZ6YEozJrUWzEkqzU6tBUH7KbTzafafsbv1pCB/C89yqDJselS0NFGjk5S6pNuIu6KMAw0xK
 sIS+z0m3zn1ur166ym+T/Ak55ckPyVhBXbVnxIve8fsFFmj1cePvEuc60ATKQ61Qa6NGxoMBl
 dRK3JwPRCrAEW/OEG1jVqZTxYYCD4LCILstjX8XKS/qEkTv6VjyUdC5v7Z+Ba6u7UgWgIrar4
 bJftqVa3A8vaUcCcgPdA==

On Sat, Aug 28, 2021 at 12:10 AM <patchwork-bot+linux-soc@kernel.org> wrote:
>
> Hello:
>
> This pull request was applied to soc/soc.git (refs/heads/for-next):
>
> On Thu, 26 Aug 2021 16:36:21 +0200 you wrote:
> > Hi,
> >
> > please pull these patches to your tree. I have one more patch for adding
> > new Xilinx Kria platform but that discussion about compatible nodes in
> > overlay is not finished yes. That's why I am sending this pull request
> > without it.
> > A lot patches are coming from dtbs_check fixing and synchronization
> > among boards to better see differences. But also couple of drivers were
> > already merged that's why make sense to enable it.
> >
> > [...]
>
> Here is the summary with links:
>   - [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.15
>     https://git.kernel.org/soc/soc/c/6f4f55bdc436
>
> You are awesome, thank you!

Hi Michal,

Just to let you know, these patches ended up not making it into the release.
They came really late before the merge window, so I put them into the
arm/late branch (along with the rockchips/dt64 branch) with the intention of
sending them in the second half of the merge window, but then Linus mentioned
that he had seen enough patches that annoyed him for the merge window
and I dropped the branch.

I don't see anything wrong with the contents though, so please rebase on
top of v5.15 and resend the branch for 5.16. If there are bugfixes that you
want in v5.15, maybe split those out and send them separately for the
fixes branch.

       Arnd
