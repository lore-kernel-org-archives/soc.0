Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B037FC64E8A
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 18:23:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8372E206F9; Mon, 30 Nov 2020 18:23:19 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DEB320705
	for <soc@kernel.org>; Mon, 30 Nov 2020 18:23:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T3JHFa6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DEB320705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lj1-f193.google.com with SMTP id y7so19409307lji.8
        for <soc@kernel.org>; Mon, 30 Nov 2020 10:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3wsPs7gnC3/t/rTahaWNN74dCjJuviyFHSHKHhvgoAY=;
        b=T3JHFa6MTkq+VOk0GAbb3Hdo++K9Cf6gCbjyoUak9gPGSfjnbUXNChVlLfPmr6VD80
         sx+p1+g3CNmEyeSgqaqqDxjcC3VE6QGe9DAfNtjRjGt8UgxptHZBv2aWCdpfx1MX9Bof
         wglxUVF2HbnRMwq1on9b36hH9zdcb3fjSSpE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3wsPs7gnC3/t/rTahaWNN74dCjJuviyFHSHKHhvgoAY=;
        b=lH6ydeVWYhQS2J65wEQXPOCxAv6DliRf35JARKQrc+aOP5ZVVgOSMCzELdQpiNsRKD
         npjtHAvzHv0wwuUI2cBB/0VbP7zsmSrP5N0H6ojyxG0pcM9mJGEYmuflo33TX5JEHK7n
         D5VAy0WBR2EXsZ4n2c39TeVsXUugvQHB03SwKvIY4BdmFMKPc39lgeDc4MsXa3qVztKZ
         G/KB9RDlTNdv8qIkXIyIaSwvvsqZqv7rGtrsJfd3SVBuB6lS8dQTQMvNGuglq10W5oXr
         bo6z+N9Y4k0giKAl2rZuThJrqIfeQq54YN3aW1nAjcOjOBG0Acgc1uT+Islr78DWUvnE
         J6QQ==
X-Gm-Message-State: AOAM533ySOYaAmo1HKGLcn0FYzaOv2HR4cZu+2ZnWis/1W9wDa9laRMA
	i9/GhPUGd/HnfCAy/udR55K2R8uwKAlA3A==
X-Google-Smtp-Source: ABdhPJzuuFkX6qHaZjJg5EE7sdBRCfsBYNEcWh1pZV7wVDtfeS4fH6b7YD5mNj4KxQnpL9HJAc8TEw==
X-Received: by 2002:a2e:8e87:: with SMTP id z7mr9916261ljk.254.1606760596735;
        Mon, 30 Nov 2020 10:23:16 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 141sm2555675lfi.102.2020.11.30.10.23.15
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 10:23:15 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id a9so23489155lfh.2
        for <soc@kernel.org>; Mon, 30 Nov 2020 10:23:15 -0800 (PST)
X-Received: by 2002:a19:c301:: with SMTP id t1mr9587473lff.105.1606760594943;
 Mon, 30 Nov 2020 10:23:14 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com> <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
In-Reply-To: <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Nov 2020 10:22:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
Message-ID: <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Doug Anderson <dianders@chromium.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 10:11 AM Doug Anderson <dianders@chromium.org> wrote:
>
> So I guess the answer here is: strive very hard but you don't have to
> guarantee that every corner case is covered?

Yes. Covering every possible theoretical case is basically impossible.
I mean, it can be something like "the firmware glitched for whatever
reason, and didn't set up a device, and it didn't show up at boot at
all until you did something explicit".

(Example: airplane mode wireless switches, but also possibly things
like just slightly unreliable USB hubs etc - I bet we've all seen
those).

So the rule should be that you strive very hard to make boots have
reproducible behavior as far as practically necessary, and avoid
obvious timing-induced ordering issues.

> In a traditional PC I think there are fewer dependencies?

I'd say that they were "different", not necessarily "fewer".

> I guess the question is: why is static assignment of numbers not an
> acceptable solution to the problem?  It gives us the desired fixed
> numbers and automatically avoids all weird probe ordering / dependency
> problems.

I think that if this had been done originally, it would probably be fine.

But I still have this - possibly unreasonable - expectation that the
promise of DT was that it wouldn't be 1:1 tied to the kernel all the
time. That was always the promise, after all.

So the whole "add DT markers because the subsystem now screws up
ordering" smells really bad to me.

             Linus
