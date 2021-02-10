Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43793C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:25:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD57864E25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD57864E25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N2xhsDIjVncN9nl6X/unEnYj9McyJoqH4tL/gjVaAhM=; b=n5W5b3WYuw9lFki8R81lfnteA
	1dn+1jqOokiyCfBDoyMVJDw3BXD0XT3KV8nzuvWR9m+nrIf5Ry2ueEjuMLWH3TkHNUJnV12nnmG4A
	0mLuw0Br/qLf54U6CIXThUOJzAZGZ9bQ8vfdKqJATy+HP+/eqgkJqjAbWFTR1wiovtY4HfO2cUk/N
	7bFrEHxX3aYkXRt6gDGuVWkWKc3BSthwTVmWzutAzNh6k601NXdgEzDe2WF9cVH1zZVxQ+Zp899Ln
	DgoI6O6kRBLhZtyBlFbWRhf6LN2ZaDrwMx3qEC79+lXxR9qcXER28ojupq4jxtgIk1vjEigoJqwRl
	hmRr+nl9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9oXb-0006dR-UC; Wed, 10 Feb 2021 12:24:20 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9oXZ-0006bR-CR
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 12:24:18 +0000
Received: by mail-qt1-x830.google.com with SMTP id d3so1288617qtr.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Feb 2021 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LISi+Oc9GTZ5oHTm+YUr6VLWACgROuri9cGJPLpozgI=;
 b=EW9Gs12uxdYBPULSVoXhyzBNha9rowbDBkjznSNaTFNaiTV56gKyrVP5MVjdlsaoBp
 SynP8rRSvYLNNcbAltAfGysTSBI9lsE9Nl+/l90licN9Ut8RU5i2wAdZMLR/dr6Z+vjQ
 ghbeYAQ2zgUg+JxD3Pys4HZTNJDGYOu1VEbns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LISi+Oc9GTZ5oHTm+YUr6VLWACgROuri9cGJPLpozgI=;
 b=etwRfrZ1FCuN8eq4xGBY+e2rmdpkoXc2jn9bdiyKi5PAVEaYHcM7m875hJ/RiN7q6Q
 Pow6V8+QVngbnH+lk4jaCECIzpNtu5zbQRhuknVPsrWcznJZBxoUu8Rv8vQlWQXD/vF5
 E4DbC5arog6wD/72oDGxUbbuCTeMcOFqbBW6nfEzAWuRBxuoozb6mWy03qctyfeVcVgL
 At8mvPZbOCS7wYPU3GC8Bo5r52Wgn6Bg/jCXXuDxEwX9GUK0ntu2Q3Ysnm7F0hfKBa+U
 rATSSRB/xoJKv1JYisZAfdFcw6tZR9PjPEFSKb+uWOQ9y6GyVnB83/5axVkBsbsSU5XX
 kZpQ==
X-Gm-Message-State: AOAM530qrqg/BTiaCCdqS3nWFl1nOsMyRotlBfMNH7zhO9wenjmFTMxb
 QKD+P82apo905kGK8uKH0eGR0edlfbTqSogPf9URJA==
X-Google-Smtp-Source: ABdhPJxEfZ/WBSPKx1Tl0qBwSbg2IbGZqKcplsfGLH1uLBGHXIALkT/jB/LIe+Ss4Wptzn5AfhQO5Hz846E+WIqzIZk=
X-Received: by 2002:a05:622a:4ce:: with SMTP id
 q14mr2498595qtx.132.1612959853524; 
 Wed, 10 Feb 2021 04:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
 <4dd911d8-ce84-bf4d-3aae-95ef321b4a97@marcan.st>
In-Reply-To: <4dd911d8-ce84-bf4d-3aae-95ef321b4a97@marcan.st>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 10 Feb 2021 21:24:02 +0900
Message-ID: <CAFr9PXkLRKHguszidJX2Qit0QUJ0QxFi3H=Wp2HDqpfJQYZEVw@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_072417_636329_5D985807 
X-CRM114-Status: GOOD (  18.72  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210122402.IMPVXuL27FWgWAEW9gIHBUxZvzf-cb3TNWOg470dNBM@z>

Hi Hector,

On Wed, 10 Feb 2021 at 20:49, Hector Martin <marcan@marcan.st> wrote:

> > Yeah, just don't use an imaginary dummy index for the reg. Use a real
> > register offset from a clock controller instance base, and a register
> > bit offset too if needed.
>
> I mean for fixed input clocks without any particular numbering, or for
> temporary fake clocks while we figure out the clock controller. Once a
> real clock controller is involved, if there are hardware indexes
> involved that are consistent then of course I'll use those in some way
> that makes sense.

This exact problem exists for MStar/SigmaStar too.
As it stands there is no documentation to show what the actual clock
tree looks like so everything is guess and I need to come up with numbers.
I'm interested to see what the solution to this is as it will come up again
when mainlining chips without documentation.


> The purpose of the clock in this particular case is just to make the
> uart driver work, since it wants to know its reference clock; there is
> work to be done here to figure out the real clock tree

FWIW arm/boot/dts/mstar-v7.dtsi has the same issue: Needs uart,
has no uart clock. In that instance the uart clock setup by u-boot
is passed to the uart driver as a property instead of creating a fake
clock.

Cheers,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
