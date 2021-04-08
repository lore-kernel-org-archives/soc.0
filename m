Return-Path: <SRS0=hr/K=JF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D277DC433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 07:26:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A977961178; Thu,  8 Apr 2021 07:26:50 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C454161164;
	Thu,  8 Apr 2021 07:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C454161164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-oo1-f48.google.com ([209.85.161.48]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7sM0-1lYEoM0GO2-004yop; Thu, 08 Apr 2021 09:26:48 +0200
Received: by mail-oo1-f48.google.com with SMTP id w1-20020a4adec10000b02901bc77feac3eso287247oou.3;
        Thu, 08 Apr 2021 00:26:47 -0700 (PDT)
X-Gm-Message-State: AOAM531wPKkLiZlSkTJEqYvUZAMWB8LRInWYihe739P7UdWP3BHRl8AV
	btf1qkepXQfGgegHl+jWoDlxQcKJuBqzTfrXUVQ=
X-Google-Smtp-Source: ABdhPJzKJmULiKJZbqIfF2zDxr9Dn4RUKtO26qlLbMKJT/5DsJBNPIXmgMgdVr4n60mmoqzCYdBdCT5pE1al5gbKDF0=
X-Received: by 2002:a4a:244d:: with SMTP id v13mr6446430oov.66.1617866806386;
 Thu, 08 Apr 2021 00:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
 <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
 <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com> <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
 <CAOwMV_yQLWwMEQ_f_wHOAipgD1qZgNz2SA2RJDZpNozCKv4vWQ@mail.gmail.com>
In-Reply-To: <CAOwMV_yQLWwMEQ_f_wHOAipgD1qZgNz2SA2RJDZpNozCKv4vWQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 09:26:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Qg-uz0kMXFMrvRjUv3NRvZXjTwS1P5MDvFk3feYaBzg@mail.gmail.com>
Message-ID: <CAK8P3a2Qg-uz0kMXFMrvRjUv3NRvZXjTwS1P5MDvFk3feYaBzg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
To: Fabien Parent <fparent@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Irui Wang <irui.wang@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SEPheqocUgEBKaWEQzXhXMbcg64RXaKgsnxO4C71HvaRNaW1YLr
 vnojImipnju27pRpwtSzDVce8MmETlejigyKEtu/RyDQzDFWjd3YjqzhtS3SZ43UszkSHnB
 Z01Rxg6OCmVVv8X1pxhSlxrbJj/0+ZBnqvwZvgTsBXW/1176HPs6Sl/1Q8K9N8eeFK2IbXt
 xW4e9tXB9k63Dy6XlW92Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GJyYWLv1wFQ=:SvbNhPj6b94Q5FRHqiBHMx
 TOKQP9MGXLYBwF3UQwB8dlQEYBafblRfLbC+eo+GTJ+vpjjjSpRfKRccRVrqI8l1+0Ntor/cP
 kNXo6y+1OpJZnWamrVfS1DjjYG6fxsKS2QvIykYTW6pjI1TvAmDndSMMZdrGgMOWQ1SpQqijg
 cc+FFaXsT1oPLcO+ft7vszBpDkX6cZ+0ssoK6CfNclabAQpUV5WTae0ZXe8ERw9+1Mrx8j9Fr
 4+8AdLxU+TQAck4Ji0PqUNmeGWR5hD8PMbE0x1/lJHxdyga6BKQZDk2wUkTc1aLFxgiV7n6gC
 NuyUJ7ekTEnaV81KUQxGq8pplN9f018RfxgaoCDFR8WBuWwECND+Xf/MMjVXz0U0o5BtOX1ij
 0T2UznrML4bcqW1MuwOy8x/jcCGwtT3RluqusUmvp/vy8gBiPTh1s4MjDFX+/82k3+OPd4Ew0
 RUCbv5LeicOhNZcK4tfcDik9QMwpP2Iln1cGJgWZDP6/GggIKayk7CAqzabe6X4KeA4V6ht36
 s5incrJgCKzNj/vWsTrayeGdwBVBQ+xs3IcJF+qnKT9Bsijkg6xZ08n148rUrtESXr5CZt4pY
 mN+43OK8CmG/jdoU4x5P56F/rpzLP/VG9T
Message-ID: <20210408072630.9Bm4bQTeMN3hyypfBcR6N1NCaoKJ7-2GbPJ5hXXqN24@z>

On Thu, Apr 8, 2021 at 12:14 AM Fabien Parent <fparent@baylibre.com> wrote:
> On Wed, Apr 7, 2021 at 7:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wed, Apr 7, 2021 at 6:34 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > > On 07/04/2021 18:06, Arnd Bergmann wrote:
> >
> > So five of the strings are documented, the others are missing. I did not check
> > the other patches in your branch.
>
> The binding documentation for these drivers are here [0]. The display
> bindings are documented as:
> - compatible: "mediatek,<chip>-disp-<function>", one of
>
> The <chip> placeholder is never expanded for all the supported chips.
> The 5 existings matches from your grep command comes from the example.
> I guess these will be fixed whenever someone converts [0] to yaml.

Ok. I suppose the wildcards just didn't get caught in the initial review of the
binding. The way the binding is defined is not all that helpful since the entire
point of having chip specific strings is to allow having different bindings for
future chips that have different requirements.

There is still an open question on what to do to replace the aliases. At least
since they are not part of the documented binding, it is fairly easy to argue
that the drivers should not rely on them, and we can still change them.
I also see that as late as last november, there were still incompatible
code changes to the ad-hoc binding in
drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c, so I'm not too worried
about breaking existing dts files that relied on it.

I don't claim to understand how the various blocks all fit together here,
but I would expect that this can all be replaced with just having
references to phandles for the other nodes in one place.

Are the aliases in this case actually board specific, or do they just
document how the SoC is wired up?

       Arnd
