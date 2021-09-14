Return-Path: <SRS0=uBN8=OE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DB9C433EF
	for <soc@archiver.kernel.org>; Tue, 14 Sep 2021 13:54:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 553DD61130; Tue, 14 Sep 2021 13:54:23 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A015B61108;
	Tue, 14 Sep 2021 13:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A015B61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MjSDU-1nAi7b0MDi-00kz9s; Tue, 14 Sep 2021 15:54:21 +0200
Received: by mail-wm1-f52.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso2162182wme.4;
        Tue, 14 Sep 2021 06:54:21 -0700 (PDT)
X-Gm-Message-State: AOAM532KIvOxHTdOcwdnUARyKGGLzMn0LGy/7g6aZM3vz4W2sTdqwVLU
	ZYVdmGf4KnMZLyZhKHZAJ/9HiVhDKUqfVFQrEbI=
X-Google-Smtp-Source: ABdhPJzfYT9N1FW1riy+N/kpM3JaauBvGO+lf0r+4PKV8dK91NMoj2dnMEb7hSJi/AoxQAwHMqJzn9JWuELlwpKaDNo=
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr2356251wmp.173.1631627660743;
 Tue, 14 Sep 2021 06:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-5-romain.perier@gmail.com> <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
In-Reply-To: <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 15:54:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
Message-ID: <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Romain Perier <romain.perier@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TpwCTSOgnKIHTRoyYxOkQQJCjHVA4ZpNAQ1/vHiEHSeC0UWicfK
 HW7FLMEI5Hwadb3zzgyJiVM2tydHA/Mk4VWSElR3tuVuYLhuk42WMAz0wsAC84/f1v/uHHu
 GbCn16HTT8SbNmG+ZW1yBr5K33Bs+21hA5y+mrjyoAtqQnbzN5hua7FIrVfjKfSQdWqLUL9
 bR9XswS8BliYZ0iidTffw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qlty1d8LVGI=:0mO32uG3coIByg7Pgk6Rbe
 FVofRXlxowRvnJdZ1Kn2rzdpinuEWubnP5DYG93/HN5zAijEy46xUBo3grXNzy59FmNfwsceJ
 Re5FKGeZOTQzgR6tZGhFgewqbVTaSE6gaczjVeKdUTjWDEy/Hy/273Bjj6cyhdXeB3ud4X7Tl
 ZsGCGRWdysj0BhEr0U4zWS4gSArMfzdfm/AnzDkzZ8eRNp4BHQxD9vaCcxDjoHOqdyHaOqRLU
 8rO4csl3oInekys0vhg3Z5DyP+3i9VC980vTs2JNlQDJzeDqx7WAJX7z1Q5HBEo/J4SkiU7dR
 RuU4hTXhomuS54+SUjQ+SSTyIDvOy9/muX8B5T2KBNW5d0sgOBWVNeI6I1u1T2WLDT7hnhi3N
 xXauIcmjXhrLDa4P+G71xeV2NTMQK29BHTkbCGAQQVzFxjxh0sUdQ2iLSdnN54ZvqI7t/eK4x
 n9LBpyP1caji9TmOtMtv2qNRuZEC9ItitL2cUSttExzZYc+Ee7n7N3nS68NWzawQ71cexKNSq
 lOyr74+WTzQ/A3ZS+LeYFtiPw5rUHAfMTXRl1h9rpGG4RsfMf4aFwCZix0vy122OZGywyVIcr
 MvIgrjZhEbU7ohQJV32luMwZStvkM6LSBXkPb4QJ22y89XT2IWi09P4UcRkfLcVYmM3DAOV7O
 KFQ3pZtAvX0OSQ/H1hmEyoc3bf4ZdjJPffEMpcfNz+gGOVMdZ5SaZkuD2cMQe0jVYOmEMXuh/
 sVGoX1YrAKcYBimapi6zvVqjULV5DXHYTn+BuoSqBQZ0hDjYqLCcsWzHSFcQoguYE2SL3kQFb
 vOhfZsJo8JlNYR7rfGVD0CRkA80dwEXqziFycB5pt2vmd+9LV9hettuo26a0jegj5qhYx9FXI
 4X4tyrRudNJ6rnWQSqiQ==

On Sat, Sep 11, 2021 at 4:57 AM Daniel Palmer <daniel@0x0f.com> wrote:
> On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
> >
> > As proposed by Daniel, I am going to help him to maintain the platform,
> > so add myself as co-maintainer.
> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a9a7cbf9456..ad1a0e5a5425 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2231,6 +2231,7 @@ F:        arch/arm/mach-pxa/mioa701.c
> >
> >  ARM/MStar/Sigmastar Armv7 SoC support
> >  M:     Daniel Palmer <daniel@thingy.jp>
> > +M:     Romain Perier <romain.perier@gmail.com>
> >  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:     Maintained
> >  W:     http://linux-chenxing.org/
> > --
> > 2.33.0
> >
>
> Acked-by: Daniel Palmer <daniel@thingy.jp>
>
> For everyone else: For MStar/SigmaStar I have a ~350 commit backlog
> that makes almost everything work on these machines.
> It's impossible for me to finish up working out the hardware and clean
> up and push patches without the whole process taking years.
> Romain stepped up to help out and has been pulling out patches,
> cleaning them up and pushing them. He deserves to be listed as a
> maintainer.

Sounds good to me.

One process issue though: These emails were sent 'cc:soc@kernel.org', so
they end up in patchwork, but I'm guessing they were not actually meant
for us to apply from there. I'm happy to take merge these patches (or
a future version of the series) directly from patchwork if that's what you
both had in mind, but for clarity please either

a) drop soc@kernel.org from Cc for patches that are meant for review
and will be part of a pull request.

or

b) put soc@kernel.org in the 'to:' field after they have been reviewed
and you want them to get merged.

Or even better, add an explicit sentence below the '---' line asking
for the patches to be merged directly into the soc tree when this
is what you want.

FWIW, I'd suggest merging the MAINTAINERS file change as a
bugfix for 5.15, it's generally better to do these as early as possible
to make sure any patches reach all the right people.

      Arnd
