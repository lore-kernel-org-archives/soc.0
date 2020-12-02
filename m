Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91539C64E8A
	for <linux-devicetree@archiver.kernel.org>; Wed,  2 Dec 2020 09:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AAB820709
	for <linux-devicetree@archiver.kernel.org>; Wed,  2 Dec 2020 09:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388051AbgLBJLl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 2 Dec 2020 04:11:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387961AbgLBJLl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 2 Dec 2020 04:11:41 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B802C0613D4
        for <devicetree@vger.kernel.org>; Wed,  2 Dec 2020 01:10:55 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id es6so364820qvb.7
        for <devicetree@vger.kernel.org>; Wed, 02 Dec 2020 01:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHXxAEFihpGexQosJgOwtA1rTxwRBPimbOCJs6PdyiQ=;
        b=Y5QtHYdkrX6aP/Zfes2Iz6RXNnojW27vyX/5CgTqb+ITygoCCJ2dfDbg2zQfOXAiic
         PF4gIiC7/Pfg7hZ/9b5KyW8cmfjNRwejA5zB5Pca6v0+vP80S/2MNkkd29UrKFoqUPwY
         EGUNWFX4S8E1fm9eVVgvgwraAIP7bfzNE460M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHXxAEFihpGexQosJgOwtA1rTxwRBPimbOCJs6PdyiQ=;
        b=EU/o1dt9DwDmnvS/qZOUWzE/XkXoBrYcTrVeLib+qXFFlmwh/l/EAQlKDYn7ulBZFV
         nI1zDdh8XSx8gMKyDUf8S7H4/FOdJXGUzPGK/cy7pGzF/va5KjreAINt2RD4BdB3Ur4w
         dGwLTQM3uHmAcfsA8969jN5Z2Kc41Ga2Ei0JTxhwJFTDgrD/3Rsfqqrwyi26wKb9Gnv/
         t89h/Fl8EP03DNztBqAv3kNvekoSakfffn9jflPZtuyEBZjVrUTiXiA4ZBj5D/6uJO1Q
         ceiLK648JZ5y5rXH84br1lK/RaRkVDgdwed2hx4z4thCZryabMHj5ZIcaOxTWivbHmtG
         RL/w==
X-Gm-Message-State: AOAM530+WtP3WarWbXpadjkA7506I6M8ZXyX0xKB533AhioYP+bqQOcd
        0DxLyXzGAGZyDMdGn90eSy96H1MztQWpwNEelzQXfA==
X-Google-Smtp-Source: ABdhPJytwEIZuRyGn05kO7fcdgPdlwgix3LuGPG61AnTa6cEDH4lUg49k1PEGAjiN9bs36DCjIusI58CiLW25Da9z0Y=
X-Received: by 2002:a0c:8e47:: with SMTP id w7mr1540726qvb.55.1606900254283;
 Wed, 02 Dec 2020 01:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com> <20201201134330.3037007-11-daniel@0x0f.com>
 <20201201150425.GC1551@shell.armlinux.org.uk>
In-Reply-To: <20201201150425.GC1551@shell.armlinux.org.uk>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 2 Dec 2020 18:10:43 +0900
Message-ID: <CAFr9PXnME5UCyOdkRGFO2+=gv27grcq35Adrtio3ex4hq0CWEQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ARM: mstar: SMP support
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>, SoC Team <soc@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        olof@lixom.net, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20201202091043.m8t_h0n7hco7moJ4Hk_z3SXt_iE5HnpHY0SyEAwzhn4@z>

Hi Russell,

On Wed, 2 Dec 2020 at 00:04, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Tue, Dec 01, 2020 at 10:43:30PM +0900, Daniel Palmer wrote:
> > +     np = of_find_compatible_node(NULL, NULL, "mstar,smpctrl");
> > +     smpctrl = of_iomap(np, 0);
> > +
> > +     if (!smpctrl)
> > +             return -ENODEV;
>
> Wouldn't -ENOMEM be more appropriate here?

There seems to be examples of both -ENOMEM and -ENODEV in other ARM platforms.
arch/arm/mach-aspeed/platsmp.c uses -ENODEV for example.

I went with -ENODEV there as the source of the error is most likely
the node not being in the device tree.
I didn't check the result of of_find_compatible_node() because for the
memory barrier code in the same file I was told it wasn't necessary.

Thanks,

Daniel
