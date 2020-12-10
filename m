Return-Path: <SRS0=Y1pW=FO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB8AC4361B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 15:48:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 63FA423D20; Thu, 10 Dec 2020 15:48:26 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B21A022B45
	for <soc@kernel.org>; Thu, 10 Dec 2020 15:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B21A022B45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qk1-f193.google.com with SMTP id 143so5151982qke.10
        for <soc@kernel.org>; Thu, 10 Dec 2020 07:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jg21SZZlFp2nXg015Qdy7Ey+4o9sWgsPDLbyCKehNlo=;
        b=dy5DU5wCTwtfk7ljGOi1L73ppuP+Z+I6LgYKef020Y7kmWfzLih5jpQXgRkzcM0eqY
         AcUP1c3cS2dG0/ibj39VhwpX3gtu8+jhhJMSKjm3C8NqCP+cW0QlR7Oi/KKcRFSqZz1I
         Lb5iRPAYHYA243SA+1PdA/xrMKPBCb3rr28pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jg21SZZlFp2nXg015Qdy7Ey+4o9sWgsPDLbyCKehNlo=;
        b=T6yAPDEutC9y+/kn4jVWSTUl7E0p6215IkDwFjkDCTIfSuQVH0AglwgADP1yEl6nlH
         1F5F2IonC/uW2d7RBjtNZGWgUAJSo8KUBRVovQ6D6qQj5lMeA3W8uAcaUHBN9nJ8VAzI
         /T3GZdgM1pZqhC3gNgtH62vFhf9dPw5WgbyntqXtEGxDtaXoWdOLpChWrkWHNzCVvVTe
         C1/QWCS3Ge192KqsZ0V8zettPbcCKomQLqHDxUKMReIpJYaH/giGHrhRlGQBBCxBdUf2
         lmmxREqjx5xxaAudF0wcyImyjEI9CJBOoyZyybI2YkNP4w5uvBKD2q7S9H0bXyHLc+Jo
         G0MA==
X-Gm-Message-State: AOAM530kPQ4TXI1N8RK/ghxs6sBiM2bxbkLghXKpeIrnJl52tDczj+rK
	LfEPFN/f5v469UV+8T/7yMrs5aO/UahlXiH1tZ6VLA==
X-Google-Smtp-Source: ABdhPJyGA4IsN0DyvYeav6TuGz8fI63Z8eB2r82GLqP6jFmdsiKRYyqDFTZHzh4jhRC0raXKyTa1O58NpDKhOQ1MMqM=
X-Received: by 2002:a37:2742:: with SMTP id n63mr5466883qkn.390.1607615304710;
 Thu, 10 Dec 2020 07:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <20201129110803.2461700-4-daniel@0x0f.com>
 <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
 <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com> <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
In-Reply-To: <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 11 Dec 2020 00:49:04 +0900
Message-ID: <CAFr9PXnGF1PV8vnCpdCuSB-z9ns5BPDjhJvPg7b+rUC0GrjhqQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 10 Dec 2020 at 23:28, Arnd Bergmann <arnd@kernel.org> wrote:
> > I did think about this and I did this with the clk mux driver I
> > haven't pushed yet. In that case there is a random lump of registers
> > with some muxes mixed into it so I decided to make the lump a syscon
> > and then have a node for each clk mux in the lump and some properties
> > for the muxes within. The driver is certainly less complex but the
> > device tree is pretty unmanageable as there are probably 30 or more
> > muxes.
>
> Right, for clk drivers, the trade-off is often different, it's not
> unusual that they are a bit of a mess and require a separate driver for
> each cheap.

I will try to clean up the additions for the ssd202 (the smp enabled
chip) this weekend and send a series for that.
If it still seems wrong after adding that I will can that series and
refactor this before lumping more on top of it.

> > > It would be helpful here to replace all the readb_relaxed/writeb_relaxed()
> > > with normal readb()/writeb(). Don't use _relaxed() unless there is a strong
> > > reason why you have to do it, and if you do, explain it in a comment what
> > > the reason is.
> >
> > The reason is that readb()/writeb() will invoke the heavy memory
> > barrier even though it's not needed for peripheral registers.
> > I guess it doesn't actually make all that much difference in reality.
>
> Ah, I forgot you had that heavy barrier. It depends a bit on what you
> use the GPIOs for then. For most uses I think the overhead does not
> matter, but if there is any bit-banged I/O it might make a difference.

Bit-banged buses are likely to happen I think as there is a lot of
gpio compared to hardware peripherals.
Anyhow, I'll add a comment for the readb_relaxed()/writeb_relaxed() usage.

Cheers,

Daniel
