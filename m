Return-Path: <SRS0=AxJt=MP=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03C1C4320A
	for <soc@archiver.kernel.org>; Fri, 23 Jul 2021 10:38:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB1AD60F4E; Fri, 23 Jul 2021 10:38:49 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DE760F35
	for <soc@kernel.org>; Fri, 23 Jul 2021 10:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9DE760F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id bp1so1347839lfb.3
        for <soc@kernel.org>; Fri, 23 Jul 2021 03:38:49 -0700 (PDT)
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
        b=EE8LLJHn6l0bOEC6p1AGm13lAC89fuigbEWLHyvgYaZsmFcGC7L/sMTTMTp+Ow9bQv
         cOF5BXh7fHDFfbryhhBBcix07UWUdbF50idVeT3rHLtpRucQ71TFS6pC11UlcZ8iZK0d
         0cqtkl8uYxLzg0geAZES6arUWKMc7yoxtJr56ZJokt0QqrkGfD2xEeSyrVwbql11rT93
         GHT+fpf20tPuq+FYzugGa//7gU67GOgWuhiH68VPBKRba1ntyl9Gd2aiifByWfH1e+Ys
         vXyPMI+HYDE+oPXUrSXCYBTtAhM/9QYyaukospR8dDgi/f+0f9Sf5ROoOvbqOiP61f7y
         2Q3Q==
X-Gm-Message-State: AOAM533JMx4RhKFBeiv0Mge8ME2Cd5kAhBAoIJAMLM9p5WqhIyCkwe8c
	N7ONWoRxdxuDIq+MoKYqTZ+5qp19lOULufFd2Ca2pg==
X-Google-Smtp-Source: ABdhPJxxCneK7uZOaNmZ8Jex91S2cTh3oIpLs58Y0lNCNcMJLcBcz7Xikn7o1GTvucpbIkZVQYf5jYjUbdCC4MQJNYI=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr2724599lfs.586.1627036728197;
 Fri, 23 Jul 2021 03:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210618205533.1527384-1-clabbe@baylibre.com> <20210618205533.1527384-6-clabbe@baylibre.com>
 <20210712201125.GA2401230@robh.at.kernel.org>
In-Reply-To: <20210712201125.GA2401230@robh.at.kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 12:38:36 +0200
Message-ID: <CACRpkdb_jpK77w5O-SW1PcDU-SYyrXCFaMgDhMaKa1MiL5HOEA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: gemini: add device tree for ssi1328
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Corentin Labbe <clabbe@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

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
