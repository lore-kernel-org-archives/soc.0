Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03855C43462
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 May 2021 09:55:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D85A9610A1
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 May 2021 09:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243215AbhERJ4W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 May 2021 05:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348111AbhERJ4U (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 May 2021 05:56:20 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697D9C061573
        for <devicetree@vger.kernel.org>; Tue, 18 May 2021 02:55:02 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id b7so4471749wmh.5
        for <devicetree@vger.kernel.org>; Tue, 18 May 2021 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fginyF3h0uO7FrUs8ObqH5iIkZOGxEkZEk2Vd5hl+Xk=;
        b=Ia0JbupATcQIAZpnsgPyw/IxSOH5RZnB8RmQwq7l+YBDwL8AK1RjU7QgciKS4WEX1Q
         2P9apoj7sgKliK0A87i0x8huLkQzYQ0vFpt9K12LY0ksK7kcj0j9UbEIGHeJZD+XoQ7D
         oOBEk/6BBz9luYtN1SZt0MuXWtGkUPVMkMsCN3I938eK1TgUKy7XRN5vR3zqv7Bpc7ma
         +Qvzu/2WX1/R1VFNB1F+HyodIQS4C2X3n8rxapwRiiyENVNdR6JTVE0cKG/AsV/lW6Y0
         p561NTj8uWYm8ZV7Z5gRA42s8lQAJdBMhMUmckwY/ysUv0URwYM6L13n3swBZ/V0N6uL
         20mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fginyF3h0uO7FrUs8ObqH5iIkZOGxEkZEk2Vd5hl+Xk=;
        b=QckYSWfUC7x5RL3U3WK+zR7WII8lmXBlbP1D6zWPYyh8aU+33Ow9AhCTv8FebB71cX
         ALOBQE09hEwRA5ip70UdIy6JIylHVudpP1DfCwjhKe8Md9cFEaxIKV12qM8oTMaI6Dde
         Ggm5SWHNzRZsE8NRbpZPsTg1azLhDJ8suuL3vfZ+096ECz5S1S3lIjMyMADMvtEg7NB0
         157Jix7N5LK40oHwkR/XMbC3OambzLha5lgjmM6lIgwJeq1CdUuLrLp480Z5F3D67Vmr
         f34ccqYm0EzlWtMUvEef79cHUup19c2QmXZYbRR14Invdi0B/BHkansLABuiOrnHuA3f
         S4Dg==
X-Gm-Message-State: AOAM532VjSgSyMKK4EFlAWhrz7s1WcQQRmZkfqHPSOE4u36Zw2jllhXR
        QqtG0wcq5xR2EIN9zbQimGeHzA==
X-Google-Smtp-Source: ABdhPJwctiP6iNlOp+0KFqNHTYlHVOzwDJqpjoyzt4CfSSa1ZARgEvW7Zuwr3HxKdXV9J88hqOzC9A==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr4440939wmc.135.1621331701145;
        Tue, 18 May 2021 02:55:01 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id q3sm18355872wrr.43.2021.05.18.02.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 02:55:00 -0700 (PDT)
Date:   Tue, 18 May 2021 11:54:57 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] ARM: gemini: add device tree for edimax NS2502
Message-ID: <YKOO8UxdmZBjYbt4@Red>
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-5-clabbe@baylibre.com>
 <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210518095457.VpoZvhoC3gW6G6JkcqkIKie7-JHBRLn9SCPDFtYWa3w@z>

Le Tue, May 18, 2021 at 01:46:20AM +0200, Linus Walleij a écrit :
> Hi Corentin,
> 
> this is looking nice! Just one thing:
> 
> On Mon, May 17, 2021 at 9:32 PM Corentin Labbe <clabbe@baylibre.com> wrote:
> 
> > The edimax NS2502 is a NAS box running a SL3516 SoC.
> >
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> 
> > +&flash {
> > +       status = "okay";
> > +       /* 8MB of flash */
> > +       reg = <0x30000000 0x00800000>;
> 
> No pin control setting? I guess it may work but this doesn't hurt
> (I think):
> 
>     pinctrl-names = "enabled", "disabled";
>     pinctrl-0 = <&pflash_default_pins>;
>     pinctrl-1 = <&pflash_disabled_pins>;
> 

I have added, without any change in behavour.

> > +       partitions {
> > +               compatible = "fixed-partitions";
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +
> > +               partition@0 {
> > +                       label = "RedBoot";
> > +                       reg = <0x00000000 0x00020000>;
> > +                       read-only;
> > +               };
> > +               partition@20000 {
> > +                       label = "kernel";
> > +                       reg = <0x00020000 0x00700000>;
> > +               };
> > +               partition@720000 {
> > +                       label = "VCTL";
> > +                       reg = <0x00720000 0x00020000>;
> > +                       read-only;
> > +               };
> > +               partition@740000 {
> > +                       label = "CurConf";
> > +                       reg = <0x00740000 0x000a0000>;
> > +                       read-only;
> > +               };
> > +               partition@7e0000 {
> > +                       label = "FIS";
> > +                       reg = <0x007e0000 0x00010000>;
> > +                       read-only;
> > +               };
> > +       };
> > +};
> 
> Is the FIS broken since you hardcode the partitions?
> 
> Doesn't this work:
> 
> partitions {
>     compatible = "redboot-fis";
>     /* Eraseblock at 0x7e0000 */
>     fis-index-block = <0xfc>;
> };
> 
> (Needs CONFIG_MTD_REDBOOT_PARTS)

No it does not.

physmap-flash 30000000.flash: no enabled pin control state
physmap-flash 30000000.flash: no disabled pin control state
physmap-flash 30000000.flash: initialized Gemini-specific physmap control
physmap-flash 30000000.flash: physmap platform flash device: [mem 0x30000000-0x331fffff]
30000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x002201
number of CFI chips: 1
Searching for RedBoot partition table in 30000000.flash at offset 0x1fe0000
No RedBoot partition table detected in 30000000.flash
Searching for RedBoot partition table in 30000000.flash at offset 0x1fe0000
No RedBoot partition table detected in 30000000.flash

