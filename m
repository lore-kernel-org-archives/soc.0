Return-Path: <SRS0=yEGJ=JU=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9CCC433ED
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 14:02:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3FF3F61464; Fri, 23 Apr 2021 14:02:56 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E206145A
	for <soc@kernel.org>; Fri, 23 Apr 2021 14:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E206145A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qt1-f170.google.com with SMTP id s4so8614362qtw.3
        for <soc@kernel.org>; Fri, 23 Apr 2021 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVfMqSBfK2/PqYx0vrefAbZn8CuJJPRDt4Z7FHHTIMk=;
        b=lNZsy6ZRl8T3jl9miUiy1DG8huWs8AoSpr2G+6tVSViQrqjFn1zJE0a/n1Ij0dEqz9
         shw148LUXm7t2bu+AdCZdr5bWS0c/6C6PuRa2vpBH2/C7PU2h9B0JnGTp9oNGByMmKU3
         NBUhdOExu3xpn1y9aPQogQcIbF2SQO+oVLwhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVfMqSBfK2/PqYx0vrefAbZn8CuJJPRDt4Z7FHHTIMk=;
        b=PssTkc2xKTRPmIWFiWiLDdi0e19984skCn9XYZoeGqWgxKHYMFLEUDfHa24KeGyhPd
         CRtuKZAI6dvXeph5w3zgaI006eTzxMznQ9qYsuCAVXftUb6vfCwBEIHbYpUlIotMs/F8
         Us3YrdShRrilvSRZFrbjv3HW3N79kQ/bKZPe30fdlqxM54hRE0SU+NMEGzO1fCUOjFRu
         I33ET2PaaWAtLQBvKu6AJfdoLX+acMJbm4Qf62RIQM5WIDWnO1gQ2+0HdpFQP+QLcC03
         z+F693a446TxRHbRQR09zoiINQnrQCLoHP6C/kG3zRbDVu+S7gsjUAOfxp11gmpunSVe
         5Tjw==
X-Gm-Message-State: AOAM531KQsOkt7xkuIriTHt8cFJPLIKLQWfeNsgZjQqIA92ZECZSWs0A
	cw0Tx6ENLqbzfGmAZLmP0bc3XkMx+P6omnebqX/+yA==
X-Google-Smtp-Source: ABdhPJypbM40Wzmt6esHRqkXVYyCEh+2x+nqmYNmzs0o++4f4iqaGJdE2IktnPmCKJxIGfzTPllPj8UPUv5oEwkJuPs=
X-Received: by 2002:a05:622a:14b:: with SMTP id v11mr3909827qtw.33.1619186573440;
 Fri, 23 Apr 2021 07:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210422140945.4131092-1-daniel@0x0f.com> <20210422140945.4131092-2-daniel@0x0f.com>
 <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 23 Apr 2021 23:02:42 +0900
Message-ID: <CAFr9PX=QeON1C_25tyNK1rWGm3A_Kc2Ad5qLUCfunmdHQUsv_g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ARM: mstar: Add header with macros for RIU
 register access
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 23 Apr 2021 at 22:48, Arnd Bergmann <arnd@kernel.org> wrote:
>
> The __iomem token comes after the type, so this should be 'void __iomem *'.
>

Bit of copy/paste fail. Fixed.

> > +       return readw_relaxed(reg + 4) << 16 | readw_relaxed(reg);
>
> This should probably be using 'readw' instead of 'readw_relaxed'. If you
> absolutely need to use one of the relaxed accessors somewhere,
> better add both sets and make sure drivers use the non-relaxed version
> by default.

I'll add a relaxed/non-relaxed version of each.
Because of the heavy memory barrier to access one 32 bit register
we'll hit the barrier twice in the non-relaxed version.
And we don't need to hit the barrier at all because it doesn't
actually matter for IO. Is there something better I can do there?

> Maybe both types of accessors can be in a single header.

That makes sense. I'll merge them. Would this header be something that
could go in alone without anything that uses them in mainline right
now?

Thanks,

Daniel
