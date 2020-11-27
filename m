Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DBBC3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 22:56:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 194B22223D; Fri, 27 Nov 2020 22:56:55 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A29672222C
	for <soc@kernel.org>; Fri, 27 Nov 2020 22:56:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YJi2Oh06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A29672222C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lf1-f68.google.com with SMTP id s27so9072165lfp.5
        for <soc@kernel.org>; Fri, 27 Nov 2020 14:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EEgXuLgFFzflMIWu+IVyNpreE9VNoLiTG5aY7t2AQp4=;
        b=YJi2Oh06MyyGpLhe+AmMQCgYMmgqSCD7S2kZLK8zqo9j65RnK/mBoJJW4dzgwUXvAJ
         U2eQMkq0jAxgRs0GvBfqfPFkpNBWDeFVfQseoeKJwCShaw41PMvcBHtF4sbEY3LH2GIj
         A/ru4rUm7qsKXuDC2Jdhkep9uzhy//aLQ6/+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EEgXuLgFFzflMIWu+IVyNpreE9VNoLiTG5aY7t2AQp4=;
        b=kBOdsfQ41t+arxt+0IA48H9Hrf1xMD94bglQWvX+yO1wEp34lzP9uvCEniB1+7zap4
         4a5LkQSFFtPysoIcXR/ZThVrwU0fN5Y0Lwx6FpA/q2Zu8KjSHPvPra8IQLRvF6l8BUvU
         DyT5xAy6OhFVElIsrlrbWqN4QZh5HJymtj1KbqTVkn9Jlg8EL4GLBnhxhxmTl8l6rifM
         a83ddFTy6+wnLilAEy4FrKDPilKApy3+jY8a9W/xvXpOfCsCNx270BSJhdMzto5YD9Dn
         ID/mknHewIMrsfvDjr5ibUb77gUafm7Tg9rsCHSR4y9BusY4iJRQ9jaXYgplX7pqUhOg
         GmxA==
X-Gm-Message-State: AOAM533TRuBzRqwea3elkEDxd/kCqp85Wq/F2bDTFDgEdP8eqc7Pz2OX
	CauZac/HjudpGr9fy4RcPPuPzjBvhGFtQg==
X-Google-Smtp-Source: ABdhPJy+/F3sQ4A+UwGqg74SAknealmbGwmCX+eaklmTa6B7FaXYStfqothb3jKrsTt8vnY/O8q/iA==
X-Received: by 2002:a19:8311:: with SMTP id f17mr4899146lfd.597.1606517812526;
        Fri, 27 Nov 2020 14:56:52 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id b18sm1121213ljp.124.2020.11.27.14.56.51
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 14:56:51 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id r24so9056656lfm.8
        for <soc@kernel.org>; Fri, 27 Nov 2020 14:56:51 -0800 (PST)
X-Received: by 2002:a19:c301:: with SMTP id t1mr4235349lff.105.1606517810846;
 Fri, 27 Nov 2020 14:56:50 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
In-Reply-To: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Nov 2020 14:56:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
Message-ID: <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Arnd Bergmann <arnd@kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 12:51 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
>  - Some DT patches for the Rockchip RK3399 platform,
>    in particular fixing the MMC device ordering that
>    recently became nondeterministic with async probe.

Uhhuh.

I didn't realize this MMC breakage happened.

That's just an MMC bug. Other subsystems have been able to do async
probing without making device ordering be random.

So this really smells wrong, and I just never realized.

Added Douglas Anderson to the cc - the whole PROBE_PREFER_ASYNCHRONOUS
behavior appears broken.

You basically should do the device numbering synchronously (or better
yet - asynchronously, but single-threaded for the subsystem), and then
asynchronously probe the actual device details after you've numbered
them reliably.

This is not something new - we do this for pretty much all the other
block devices, and MMC is just doing things wrong.

See SCSI probing for the traditional horrible cases (where just
spinning up a disk could take tens of seconds).  "Slow probing" is not
an excuse of "random ordering".

Behaving randomly is simply not acceptable.

             Linus
