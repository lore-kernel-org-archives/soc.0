Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AFBC43460
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 May 2021 23:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CC606124C
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 May 2021 23:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbhERXTa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 May 2021 19:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235802AbhERXTa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 May 2021 19:19:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B99C06175F
        for <devicetree@vger.kernel.org>; Tue, 18 May 2021 16:18:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b26so274127lfq.4
        for <devicetree@vger.kernel.org>; Tue, 18 May 2021 16:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t1lUkNBuVC2UZABZ7mjXl1iS2OFEu1Ax24kG7Pa9v9o=;
        b=oIb6bCshL727qAb4uQIy4tdqNvs4pKTGrZeO2A2o7UfVH/eztAfkfvbBEipSokq+59
         FoJYB78uhQ4mijp8vZr0SP4cPRxTCgv+9YN3uSxCr2FnO74K7P78F1v6PtUE7f6iC8Pv
         FPES6jgvgT3i/uSIj/QqFa76gtm49FrRaxPB30vHeUYSMgKZxTDA9R4MdmfdBPJPUrAk
         PXjdR2Bdhpl2t8wkJ57L3l+BRB1V7Q+57X8geh0vCm1fe1G8J0cZ40q6tT3ssBW4SGXn
         7chziYboyIHfa834KfPzy+3k9wESGMTH0oTvTN+o2L+36uT6tElzd3NtoyPiJe6LOZLv
         Maww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t1lUkNBuVC2UZABZ7mjXl1iS2OFEu1Ax24kG7Pa9v9o=;
        b=OyoNF6bvLNedBAu/gLupt54umXFf1L/9/lSt61hc1+NGmvB0qg92j7DBLsFcgRz8Tp
         /V5lVbB6Vk01WURie0DNkHDdMhyKRMfERLgOMPKZIC6GMb3DGWaszMCx1y8MLZuoV2FT
         +QvvTAzDzMbkkvfCERewJPjmvjecJUnUzEZLP/5kNNu0fNpt91TRpDU/k2jqjoMLQB90
         uOaDqT2PAURrJ/TfqeTs5yYsgq5s8y1eC7s08yfBWMgU3k0ERCVHxjJpf1851ZulI/z7
         21JPHxAE9Q8qHuxXD5QwwNAe1BBrWonkiPm7JoO3nQuFUjH0Oo8WNMF++9Ci+zdRSNlm
         VTzA==
X-Gm-Message-State: AOAM533uT6lpbsZJdo1xLW/qIhInOZd4ehZUDMfLzbCs+0jk+bMdRQcW
        Hj+OK9/teeFHJFioqQH/HllIZ7ISCXm55wMX1J1Qsg==
X-Google-Smtp-Source: ABdhPJwbX+FemxVEp4TpL+OaKW57UtYIhtlS+hTGYuSbNLuqKI0W4v/DXLByxnfuX+1snj0AfuXOkxd2UaRJJjUo3pw=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr3321479lfd.529.1621379890103;
 Tue, 18 May 2021 16:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210517193205.691147-1-clabbe@baylibre.com> <20210517193205.691147-5-clabbe@baylibre.com>
 <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com> <YKOO8UxdmZBjYbt4@Red>
In-Reply-To: <YKOO8UxdmZBjYbt4@Red>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 May 2021 01:17:59 +0200
Message-ID: <CACRpkdYqaoggyBO9=fdi2iUh9O0Y_jT5jnc7+qbE9HzEWK57Sg@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: gemini: add device tree for edimax NS2502
To:     LABBE Corentin <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210518231759.ZIxoXt5oCYFb0F56_jhKVxr8XL5dHUHGzj3bfyFri0M@z>

On Tue, May 18, 2021 at 11:55 AM LABBE Corentin <clabbe@baylibre.com> wrote=
:
> Le Tue, May 18, 2021 at 01:46:20AM +0200, Linus Walleij a =C3=A9crit :

> > Is the FIS broken since you hardcode the partitions?
> >
> > Doesn't this work:
> >
> > partitions {
> >     compatible =3D "redboot-fis";
> >     /* Eraseblock at 0x7e0000 */
> >     fis-index-block =3D <0xfc>;
> > };
> >
> > (Needs CONFIG_MTD_REDBOOT_PARTS)
>
> No it does not.
>
> physmap-flash 30000000.flash: no enabled pin control state
> physmap-flash 30000000.flash: no disabled pin control state
> physmap-flash 30000000.flash: initialized Gemini-specific physmap control
> physmap-flash 30000000.flash: physmap platform flash device: [mem 0x30000=
000-0x331fffff]
> 30000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer I=
D 0x000001 Chip ID 0x002201
> number of CFI chips: 1
> Searching for RedBoot partition table in 30000000.flash at offset 0x1fe00=
00
> No RedBoot partition table detected in 30000000.flash
> Searching for RedBoot partition table in 30000000.flash at offset 0x1fe00=
00
> No RedBoot partition table detected in 30000000.flash

Hm since it searches at 0x1fe0000 that's where it thinks the last
eraseblock is so the erase blocks are 0x20000 (128KB).

FIS at 0x7e0000 should be erase block
0x7e0000/0x20000 =3D 0x3f

Can you test fis-index-block =3D <0x3f> and see what happens?

Yours,
Linus Walleij
