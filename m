Return-Path: <SRS0=L8HZ=WE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63445C433EF
	for <soc@archiver.kernel.org>; Sat, 28 May 2022 21:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A9E2C3411A; Sat, 28 May 2022 21:09:16 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93379C34119;
	Sat, 28 May 2022 21:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93379C34119
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLRgp-1oCRoJ1359-00ITg2; Sat, 28 May 2022 23:09:12 +0200
Received: by mail-yb1-f182.google.com with SMTP id v106so6316131ybi.0;
        Sat, 28 May 2022 14:09:11 -0700 (PDT)
X-Gm-Message-State: AOAM533UMR5OLrm+TZV+uTSDXrt2cm1loxbIbVoc8yk564TRN+18Qhl8
	qF7AFpn6fW3T1OKLQgAz4zwgLps0o3giOeIbzX0=
X-Google-Smtp-Source: ABdhPJzYWcxVMSVO35SjnuTA/wM3uXbL0KS/JIGSkpi4QT9U3HrCaqV40mr9DwdV/Jk6nh6hQeh9t/VVFkm1NyZMo88=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr2641390ybf.106.1653772150854; Sat, 28
 May 2022 14:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian> <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian> <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com> <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
In-Reply-To: <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 28 May 2022 23:08:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2DRBrDmfhz2GbMOqNBufNKS7K7XyeE1Px3AhqAuSZD4A@mail.gmail.com>
Message-ID: <CAK8P3a2DRBrDmfhz2GbMOqNBufNKS7K7XyeE1Px3AhqAuSZD4A@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lF55lB7OhCWA95gc0qCB57niK/EmhUusHb5n7RgWf5PnOLQeyoi
 MwL0u+vOlpG0Ya9VhXXatskwEzukEY0/kLbh6ApFATd7WlRKdFaM+gGzyakYU1M++9+loA7
 I91yFM6T1BQI1VbGAbiePq0HC57E3967kTlNu+t/AsksvyNefVR/5wRdMQgJhT4lhTegvTF
 RsrqBKOFV+unEju/oTFjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vJ2VbIaCmDg=:Dag0GioD2gT7G7UFTe23T/
 n5Bt/Pzytf6ysQnDTHAKO4JDaC74JSEXHOeQ/UpbaUa17X5VDhrkEeMnHuqwwgp9/RZTdR/WF
 /RueXNJ7DrxzOS6WPTKLAW+XS1h34iP5o+GjnUJZhbTQypFTl/ytba9xp2dtKpmHFhXJMQp68
 DZlqza7VqGNDgIXrbkPjPjTw07Unpd+3aaG8Ums4MRA/SIcINOISAnvs3hXm22GyHl4x1w5Rg
 Tx2cFYrYZiGnbcsVnJqT5oSCH2SnkzBLnaAccjwYnEU0QhZt2F33P9nJ6LVxyQl1T7jSSicAw
 LudlExDDKulzGDNmAzkYGTSKVYNOdGg84GcPoUKiYFhBLe41jmMeIKBHQWAsynLRHm8KnFLMs
 9uqq4P6lhBCTtSH3Mg2PKYvqql6/WOWnqpGCRwRgoB4K0ZfjI9d16zrTRCios5vBI/OmLqEUy
 +e2BqBanF9g2nlEA1MoEpycdsegpg8NoQ5IQ4crtEk1W7BZPTLj0d+QUbMgDNUN/hjSvLulmN
 Y3Pqoa9vTe/Yurcxn3COCyTI/47jiYQqd5+3mfhYWH7EqaU3aJ0XMll6heD6iiO0d5MgDd/2Z
 38yMqXo/EO7ZVpob8cUaFCwVUkbmP7peagLll2a6Ka1JF+KnbUwmhOdOCqgKfqkSuwG4ACLeh
 18/L4tK2oKtz6Jje8U40xShFrxC2kmdEwabG9/NnBKJuOXmPxeludsSYO1ocXVENfRkmmsSP0
 8ziPRxQPTF46smhs2WpuVIQ/dQr73+ZQiXAS4pea4QAKI/ONTZCvoIyKxZoGGVUubxuFD+MHa
 09kcj1ODhu1fdJ9gj0v5YMxShUjRWd99bhJiaLQfcjL5wP7vSzNlkTvYoISnO2gwE6q3IL9rr
 wlYCSDFrmAcRFVJ5kX5A==

On Sat, May 28, 2022 at 10:31 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sat, May 28, 2022 at 11:59 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
> > option, you the kernel is built for the old 'OABI' that forces all non-packed
> > struct members to be at least 16-bit aligned.
>
> Looks like forced word (32 bit) alignment to me.

Ah, of course, I keep mixing it up with the odd structure alignment of m68k,
which does the opposite and aligns struct members to no more than 16 bits.

        Arnd
