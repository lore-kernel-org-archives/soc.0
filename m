Return-Path: <SRS0=zMhd=RP=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760BEC433F5
	for <soc@archiver.kernel.org>; Thu, 30 Dec 2021 01:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 425CCC36AEC; Thu, 30 Dec 2021 01:40:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2641C36AE7;
	Thu, 30 Dec 2021 01:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2641C36AE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MX00X-1mvz271iqv-00XKP2; Thu, 30 Dec 2021 02:40:06 +0100
Received: by mail-wm1-f47.google.com with SMTP id a203-20020a1c7fd4000000b003457874263aso15285892wmd.2;
        Wed, 29 Dec 2021 17:40:06 -0800 (PST)
X-Gm-Message-State: AOAM533ACvA4PLeOEsWDFCEreLytg/LZanG7x82Rxw6ysiZSlKPEtuGY
	f6WI1/EjhSv2gsjRPgGrhj8fNIyRd0G8MEsNAdY=
X-Google-Smtp-Source: ABdhPJxdTKZsUGv4yK6MpMvye0fW7A+jPT6EmKT3s0X6J1Ax1eu2h7DJ+yLaT2MAqb8v3KguyWLmiC/ygBi8s75y0VA=
X-Received: by 2002:a7b:c448:: with SMTP id l8mr23776105wmi.173.1640828406019;
 Wed, 29 Dec 2021 17:40:06 -0800 (PST)
MIME-Version: 1.0
References: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
 <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com> <9b16c1c9-7fcb-b717-7dcb-b911dd39a5a2@gmail.com>
In-Reply-To: <9b16c1c9-7fcb-b717-7dcb-b911dd39a5a2@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Dec 2021 20:40:03 -0500
X-Gmail-Original-Message-ID: <CAK8P3a2mY7y1XWS6L-Ze-DtnhONJRzx0rFdAagBfKGBErsdD6Q@mail.gmail.com>
Message-ID: <CAK8P3a2mY7y1XWS6L-Ze-DtnhONJRzx0rFdAagBfKGBErsdD6Q@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: updates for v5.17
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <mbrugger@suse.com>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ben Tseng <ben.tseng@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Prashant Malani <pmalani@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:P3mvvtG9d2nR1aPWcCcOXLo+06m4EVYeHZPBvUnOPgDtxz4aCuK
 5RAW8S0tZ6z1exf+0Dtzj2mH6sYI/SdhxJVDdfPv7Bz7C+A0MenSJtyXTupbe2L6r0gvMCg
 PJH9PDHhw8P06wv/XTpfNtGrcerTmJ5NjzNnhlPqHQaekqEKMgTC0XIaibLDoO80JXdKi6q
 XbOSHSBAUdet3mj01M0+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dpqROz1hazo=:Vw/9lztMeGnFTxHF9mFJXw
 gI/2c869bxMiI8rQBhsJaRUc0UAAetQEcK1NHbcnjgbLu21U2VfgOI/JhFEpWpFkcVSmoE8id
 F2BwMbuNDHmM1RxRSp4eYIeN8i4pf+ykW44zwffJUsFdnLi0n8u772aYCEgyGOOzieBR1vXW5
 lOS2lwVK/a9oiP8BnX2rCe1f6blxgQ3KiJCEuiSVorMU+DsbwwvtmYdoNcJFTYfdbhv+xId3C
 P+10EccNFrUnttS4+ugTXlkWhUkQcPqCBkSl3ICYbmjLSHy/MMsqvDfo8sBKE2vh6tsFDo7ud
 74abH7oy79yENTqC625SKrETmDhCpy33i/ZwQ2Oi2sqTWDBGIFNb9a3Nhty+cr8yzXxtEdFAR
 DbrE7i37NEkQy4knW95leVNIWIkWrCugoPkaU7e5P31UpAHnyNah8Vl53jZJxBWu9PZ8GRj4L
 pSs5EX3/qNFq15CO6ejV3AwzWsgPcpfZMpGCU5eRki1OMye7uWUM2Y/s1nc4BrAlxAJtmtoWa
 2jbk6VDtwL+GYY+8j35yinFihh1YV9LGG7fW3kzDbJVF8tDuQlGHHlzble3pj+4W7UgQ+x3rx
 jxosFR4zyQj19HU7DVqStw1Cb8/lQ2ItbQu4HWFrP1RG/FxB7h5CK5jeB1ARBGb+KqUdXgIQz
 KGQQZKCEBtX4WUhf12A2y+OLEkPsNj0xqQcEqqHpGFPXDXk23GFTO5GPQ8ofI1L8BMV1HNHaQ
 6N3yNWm3vWG4W4oVv1bqyuxg1VZXx0mXGkhsHu6XObKrvrQ/zbXWQnChjs1HaZnr+vWjcBLmt
 WRNrqDir0o27/rT3ifoTnFYyaWCpzy5nElmVfRhiihAeJgKZp0=

On Wed, Dec 29, 2021 at 10:29 AM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> On 20/12/2021 17:18, Arnd Bergmann wrote:
> > On Sat, Dec 18, 2021 at 9:42 AM Matthias Brugger <mbrugger@suse.com> wrote:
> >>
> >> Please take a look on the below patches for aarch64 based MediaTek boards.
> >> In this round we add support for the mt8183 based Acer Crhomebook 314, as well
> >> as we add support to several SKUs for mt8183 based Chromebooks.
> >> Apart from that we add basic support to the mt7986 in both variants (mt7986a,
> >> mt7986b). The difference between the both SoCs are the pin-controller capabilities.
> >>
> >> Hope you are fine with this pull request.
> >
> > I've pulled both tags, but I have two minor comments:
> >
> > - please put "mediatek" into the subject, that helps when looking at
> > the pull requests
> >    with pwclient, which does not show the author by default
> >
>
> I did this pull request with a lot of time pressure and forgot about it. My
> apologies, I'll try to not forget next time.
>
> > - I was expecting you to send a branch for the new EN7523 SoC as well. Did that
> >    end up not making it in time?
> >
>
> As I have seen, in the meantime you reviewed some parts yourself. I took the
> first two patches in my tree, but we should coordinate for the rest. If  you
> want to take it through the SOC tree or if I should take it through the mediatek
> tree. As Airoha is a subsidiary of MediaTek, I suppose in the long run, you want
> it do be part of the Mediatek tree, correct?

I talked to Felix about it last week, I think it would be best if you handle the
arch/{arm,arm64}/ bits for Airoha as part of the mach-mediatek and merge
changes the same way as the mt76xx, mt69xx and mt81xx series. For the
initial submission, of en7623, having a single branch that contains both
the arch/* and drivers/* with the appropriate Acks would make the most
sense, to avoid spreading it out over multiple merge windows, though it's
not too late for 5.17.

         Arnd
