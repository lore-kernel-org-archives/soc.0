Return-Path: <SRS0=VWY2=FE=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BCBC63777
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 17:27:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DA85620789; Mon, 30 Nov 2020 17:27:42 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E4E2076E;
	Mon, 30 Nov 2020 17:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPx1RZXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E4E2076E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=dmitry.torokhov@gmail.com
Received: by mail-il1-f193.google.com with SMTP id g1so12059452ilk.7;
        Mon, 30 Nov 2020 09:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1Vd/fR6g8wKCZaURanPYDdeMR44y3LFyKTjW1Typqg=;
        b=HPx1RZXZNsy8M//eK/7kOCaSUaWAAX7fONUWyezM24Q2XUD0+BKVnoisJ0C4vGJAHb
         dpSYTjfScL0RG8De+OgMc4aBzQgOeaAScILDnBnSbZ6IYY5M5FdoGUJO9AhN24u8PqJ2
         //nIYs1U1gwGRjsRz8mWlNYQSuv+a0JUT/FUlar/szHwD5pMn525jAyIj0Lh4ISmrrnR
         yV+YjJNmM3Vg+8AiOLhZ3h3eX2eq+JKwdkaeElXR4FgkS57ZidtEVyXXTgRDDGKbX1wk
         +T6CJB8C4eCz6+7TxiF5ht0jijdg+yTIDFYbBsjIrOGSgLf2cGFPDFQHc7JpIp4QUdsQ
         7MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1Vd/fR6g8wKCZaURanPYDdeMR44y3LFyKTjW1Typqg=;
        b=ZmnzEIQF1b2YUq3NhFdn6gn7H+PSvLdCc7ulvJaJ6feV5TLluMm/u6kbUyfyw7qOpJ
         fqcD1cWfywW3tHqcfgmwbq83T92E5hU34TTTMQ/OgYiCDJIoxp810KbPazCB7F1zqze2
         x5KN24kBnIFB40oiqXtjhs4lcV69CELvicSxBxsbEle6PV8Cgj0deHr4bfELSOT44kwH
         +Oqd38AN1kXycflnuJn2xTjyh6VUUqAKLSCNlFvhwPYqbqEy64FR1UU65xxelRpplNo3
         boTMesnny4KM5jXE/UkNzJUyMAxDAPhYnxxftxexTIHR8EUpAxA7uc0+8S5UZ1Wvdq2a
         hhKg==
X-Gm-Message-State: AOAM533GSGa2+qMo696iotmXYsq6w16wCkwJ6OhCOACyWBReLDeQk1uJ
	xryPBFyhtdpWSusxecmY8ayZMoBjpqwvu93tJsFBzDIR
X-Google-Smtp-Source: ABdhPJzc1TmhusDdrQNhIh4x01OuKc5+8edgdoreT8fMqA8YQZsrXmqQSAslZWMfzsvzZ3iuByUoOGEhdE/6dOkpDm4=
X-Received: by 2002:a92:d203:: with SMTP id y3mr19643539ily.206.1606757261315;
 Mon, 30 Nov 2020 09:27:41 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
In-Reply-To: <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 30 Nov 2020 09:27:30 -0800
Message-ID: <CAKdAkRRq=GK7N1PDJ4zLfJVSsrd1BB=u69aXtJHh=sW4vn5LOg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Douglas Anderson <dianders@chromium.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Fri, Nov 27, 2020 at 3:02 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Nov 27, 2020 at 12:51 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> >  - Some DT patches for the Rockchip RK3399 platform,
> >    in particular fixing the MMC device ordering that
> >    recently became nondeterministic with async probe.
>
> Uhhuh.
>
> I didn't realize this MMC breakage happened.
>
> That's just an MMC bug. Other subsystems have been able to do async
> probing without making device ordering be random.
>
> So this really smells wrong, and I just never realized.
>
> Added Douglas Anderson to the cc - the whole PROBE_PREFER_ASYNCHRONOUS
> behavior appears broken.
>
> You basically should do the device numbering synchronously (or better
> yet - asynchronously, but single-threaded for the subsystem), and then
> asynchronously probe the actual device details after you've numbered
> them reliably.

Generally speaking it is either unnecessary for a lot of devices where
we do not care what number they get, harmful (why do I need to probe
i2c touchscreen and touchpad sequentially if I do not care which one
comes first but my boot will take 0.5 seconds longer if I serialize),
or impossible (if device is hit-pluggable). For many years userspace
has been moving away from static device assignments and we should not
be going back.

There are some devices that are special because it is hard to deal
with devices shifting during early boot, and for them maintaining
static ordering might be beneficial for now, but they are exceptions.

>
> This is not something new - we do this for pretty much all the other
> block devices, and MMC is just doing things wrong.
>
> See SCSI probing for the traditional horrible cases (where just
> spinning up a disk could take tens of seconds).  "Slow probing" is not
> an excuse of "random ordering".

And still my external USB disk will get a "random" /dev/sdX depending
on when I plug it in relative to all other USB sticks.

Thanks.

-- 
Dmitry
