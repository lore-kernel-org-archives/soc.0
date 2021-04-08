Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53025C433B4
	for <linux-devicetree@archiver.kernel.org>; Thu,  8 Apr 2021 07:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23EB961057
	for <linux-devicetree@archiver.kernel.org>; Thu,  8 Apr 2021 07:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhDHH1A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 8 Apr 2021 03:27:00 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:49757 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbhDHH07 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 8 Apr 2021 03:26:59 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqsL3-1lzHxG2c8v-00mrKD for <devicetree@vger.kernel.org>; Thu, 08 Apr 2021
 09:26:47 +0200
Received: by mail-oo1-f51.google.com with SMTP id p2-20020a4aa8420000b02901bc7a7148c4so277980oom.11
        for <devicetree@vger.kernel.org>; Thu, 08 Apr 2021 00:26:47 -0700 (PDT)
X-Gm-Message-State: AOAM530/pJOoK0WdWE9OnO6D1HOQQ8cenUs5VKALd1eNsoPk/yleEuKr
        2LFE+ItBKYD5uZnFWTetEb5dUtuwn3062S4+/No=
X-Google-Smtp-Source: ABdhPJzKJmULiKJZbqIfF2zDxr9Dn4RUKtO26qlLbMKJT/5DsJBNPIXmgMgdVr4n60mmoqzCYdBdCT5pE1al5gbKDF0=
X-Received: by 2002:a4a:244d:: with SMTP id v13mr6446430oov.66.1617866806386;
 Thu, 08 Apr 2021 00:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
 <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
 <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com> <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
 <CAOwMV_yQLWwMEQ_f_wHOAipgD1qZgNz2SA2RJDZpNozCKv4vWQ@mail.gmail.com>
In-Reply-To: <CAOwMV_yQLWwMEQ_f_wHOAipgD1qZgNz2SA2RJDZpNozCKv4vWQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 8 Apr 2021 09:26:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Qg-uz0kMXFMrvRjUv3NRvZXjTwS1P5MDvFk3feYaBzg@mail.gmail.com>
Message-ID: <CAK8P3a2Qg-uz0kMXFMrvRjUv3NRvZXjTwS1P5MDvFk3feYaBzg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
To:     Fabien Parent <fparent@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:j1AY6EJODYVytiIWB+Wooc0C26ZDQp1gjNo+f7t5FKwICN5kbn1
 k5mUBpepRh13Le4Xl/BVBIPCoYMk0aqtzO8ZsKJVXifZ5TP4y65PufxRHlWwOHnG6Vl5V7A
 gGydAy8Hgme1iOhBLlRcxxfVXoaKCqYbvU/m6SxODzsYtN+G1oMTO8lJuF8gwJ20SWd6K2h
 VK1GtOUR/liUdNqGfzfSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hPjVjcVz+go=:PFID7DMQHfXRZqqH4JwxX1
 xgEkc8vfh1sFi+o0tzLf3KGqR+MiBxukPKdqMH0lw/3YrgR21BLEocqBK8YRxZDAezCKwzM/C
 ImGH8P2D3zMGWqHVGUaqmMNbvV5vav0njBCCLU7BxQgkLywHD9vok/duFMpA2PsGx6t3tQeoB
 Z54Q4lerXqawEdjDf/PDr39Y2/bqanCnCCgPehGvlhWDNzb78Uti2yBXXVBTg8BxG7FSBX8mZ
 eEZeBeuypfvNzwMxG16QnjWTIMAjLTLF4wnXDZ6vrp7lhMYUsKXs37twbvyWvHfG39MXqKTWA
 z2T+JnKOamxHu928mutOEzCfr4Lwu29mOUPvFFSRbNEoTq0jjUTDZcplgzVgPW+zR7FGQMDX5
 phyWepSMTPWdNmoO1k0q4OgaqZfJBmMNNc6hmZ3QqZnSkEnDGxBXFLIs6+jwLXpahmgMMoJqj
 Ncckw0N4dcGKLhknmU54iCtRtD75XTA=
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

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
