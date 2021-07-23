Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFFDC4338F
	for <linux-devicetree@archiver.kernel.org>; Fri, 23 Jul 2021 10:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A462660F3A
	for <linux-devicetree@archiver.kernel.org>; Fri, 23 Jul 2021 10:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbhGWJ6R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 23 Jul 2021 05:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbhGWJ6Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 23 Jul 2021 05:58:16 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A5DC061575
        for <devicetree@vger.kernel.org>; Fri, 23 Jul 2021 03:38:49 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u3so1290295lff.9
        for <devicetree@vger.kernel.org>; Fri, 23 Jul 2021 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HS+KrbKWpPg6959vVc+gifN5TSsSydBGp7pXF+iv/30=;
        b=r7GcSBDAig/jsK+TLYxnlKfMPCesIsg38LoZQ/cBD/7LvqMsrhj+tZe3Qw6svxGLOw
         Wt3NwG3HAiFV0qp/87JXs52adhE4XdaYITwmey+cnGK4kcL0eiMES5ltYd+dRcVN5SQE
         FTKr6IVugqJhwmMiwnYeJIkkJftbjQUB5iqmcxkFZkSuKq3UN6oVZyOBx5xFpP/p4SPh
         5HQQMgtnaWTLWI2AK62Wzd1Q47J5FtjnItdrPqw4Hqyh55pz3nQ4ey2soMMEdxq0jkWt
         3GteKPHdXTdgRcg2OS/y/X1B4N1/ydkgPjG3IVWfuHJSKlGgZugZ/CPDE2fpcZ0swCK2
         8tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HS+KrbKWpPg6959vVc+gifN5TSsSydBGp7pXF+iv/30=;
        b=glPiWRbqhbQlX4Z6EJbwRXcJQ5+VMdt4w+eAX+KMBD7jOnqgET1o0xhngHu50edTX3
         KpQzl2bui0YAdCRSsYPrJsub8xnt4WbJ9LXfdRABcUSgMQNz+h1WqHPfr7Hy+zx5YVwB
         HiK/+OxcVScv/5pp8TdRqUaP+n6HMxNfhUl3u9NbbKwNs+8On59NiVnXG8ym+UnfzzMY
         HAGbD1Up8jqwXCy7L2Q9llBQgJyvVZK1YwHuY+oIANEXaq0gUmSLzqZpy3MAzouZRBF1
         XnaXCewwhvPYc+s4HpxL8h0aw/Eo19guS3DNyiV6ZZY5pjjVlmSX2GsCrA0pj2reT9fP
         +sMQ==
X-Gm-Message-State: AOAM530Xl3ezffwmK+85bXebuaWSV9BIryCBeeIEI9GCYa7Yqw1Q8941
        CPcDHmlO9f3a8CxRB0EOM14QWtAS9nIRt2raNAzrYQ==
X-Google-Smtp-Source: ABdhPJxxCneK7uZOaNmZ8Jex91S2cTh3oIpLs58Y0lNCNcMJLcBcz7Xikn7o1GTvucpbIkZVQYf5jYjUbdCC4MQJNYI=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr2724599lfs.586.1627036728197;
 Fri, 23 Jul 2021 03:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210618205533.1527384-1-clabbe@baylibre.com> <20210618205533.1527384-6-clabbe@baylibre.com>
 <20210712201125.GA2401230@robh.at.kernel.org>
In-Reply-To: <20210712201125.GA2401230@robh.at.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 12:38:36 +0200
Message-ID: <CACRpkdb_jpK77w5O-SW1PcDU-SYyrXCFaMgDhMaKa1MiL5HOEA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: gemini: add device tree for ssi1328
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Corentin Labbe <clabbe@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210723103836.ayM1EAXvHqixS9QZyrYqF2f_skpjfd22_r0j1wlvP-c@z>

Thanks Rob,

I fixed some issues while applying.

On Mon, Jul 12, 2021 at 10:11 PM Rob Herring <robh@kernel.org> wrote:

> > +     model = "SSI 1328";
> > +     compatible = "ssi,1328", "cortina,gemini";
>
> Where's ssi,1328 documented?

I'll take a sweep and add all of the new machines.

> > +     chosen {
> > +             bootargs = "console=ttyS0,19200n8 initrd=0x900000,9M";
> > +             stdout-path = &uart0;
>
> Don't need both 'console' and stdout-path. (console should be removed)

How does one specify a default baudrate using that method?

Yours,
Linus Walleij
