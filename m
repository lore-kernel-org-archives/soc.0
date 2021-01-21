Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05112C433E0
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 10:02:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C87C9239E4; Thu, 21 Jan 2021 10:02:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 968AE239D0
	for <soc@kernel.org>; Thu, 21 Jan 2021 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611223358;
	bh=0g1Qyr+c0075Y5vEhiNGpW/8oK0y2CtwQYj0OvCHfs8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qPzQd3mvNkB50G7USYawjUgisB+MSiLOkhUerV0JV+HiOID8wmgybGcOAEwmLFtb3
	 nWsfhfXXH8e/RhbGr5ZXYw/A1yJUqr7WCmnkBLUZmfHk6ZLbWuZCwQ9mpRJAvkcNP7
	 LpeBSS6MJsGHpWZLB1sy5nV+RbQDACxv1neukRuwBNN4zw9lsLwu4FjJCN/AlTDDcq
	 nFhGw2Zg3Z7kZJtb8m7WAt8s8cFMwuRwCLwjfL7l3JGVC8Rz5UiN7IlRGO5mAUTrz9
	 fbofZxcKtkCtcXWEQVk16HJM8l3eIXa+FI05yU1UUQ8KXSXRzmOyOayhNjVjdD+TRG
	 nrItLch7obm8A==
Received: by mail-ot1-f49.google.com with SMTP id 36so1084954otp.2
        for <soc@kernel.org>; Thu, 21 Jan 2021 02:02:38 -0800 (PST)
X-Gm-Message-State: AOAM530s+Nb899eodNoA1EUTINHPtSOuR9If/3eNDB5+wn5b6lskrmfH
	WIlq94pqF7VoWW8vtdu9geO38E4FOJTGk+QCsug=
X-Google-Smtp-Source: ABdhPJxu5gTSXAh66TG6pp98dbKpmSWbbtFerQ1SryF100skSDX3YtoYt1B2xrPW7rBFkA3uXs3CMFkviwD563OZ8rw=
X-Received: by 2002:a9d:3bb7:: with SMTP id k52mr10174614otc.251.1611223357853;
 Thu, 21 Jan 2021 02:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20210120124812.2800027-1-arnd@kernel.org> <20210120124812.2800027-6-arnd@kernel.org>
 <CACRpkdaMZdUebQy7KOeAQz9wqGUWW3_PJUcD8N500NQZ0wXX2Q@mail.gmail.com>
In-Reply-To: <CACRpkdaMZdUebQy7KOeAQz9wqGUWW3_PJUcD8N500NQZ0wXX2Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Jan 2021 11:02:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0CTquq6vzVV37xHUwNH+TtRJPQbqAk4NMz+yai66a+fg@mail.gmail.com>
Message-ID: <CAK8P3a0CTquq6vzVV37xHUwNH+TtRJPQbqAk4NMz+yai66a+fg@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: remove u300 platform
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 21, 2021 at 9:34 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jan 20, 2021 at 1:48 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The Ericsson U300 platform was one of two ARM929 based SoC platforms for
> > mobile phones in ST-Ericsson after the merger of Ericsson with ST-NXP
> > into ST-Ericsson, the other one being the ST Nomadik.
> >
> > The platform was not widely adopted in Linux based systems and was
> > replaced with the far superior ST-Ericsson U8500 in 2011, but Linus
> > Walleij kept maintaining the code for the whole time.
> >
> > Linus continues to use the Nomadik machine, but decided to drop
> > u300 from the kernel as part of this year's spring cleaning.
> > Thanks for having maintained it all these years.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Link: https://lore.kernel.org/lkml/CACRpkdbJkiHR9FSfJTH_5d_qRU1__dRXHM1TL40iqNRKbGQfrQ@mail.gmail.com/
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I was planning to do this but you got there first :)
>
> The reason I cannot work on it anymore is that the device
> requires a special signing server to flash new kernels and
> I don't have access to that, and we never created a U-boot or
> similar for this device so anything needed to go in through
> that flashing tool.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Will you queue the patch for ARM SoC?

Yes, I'll pick up the five patches in this series directly, while the
drivers should go through the other subsystem trees, so please
apply the pinctrl/gpio patches to your respective tree.

        Arnd
