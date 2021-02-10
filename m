Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1952AC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Feb 2021 12:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C77E764E3B
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Feb 2021 12:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhBJM0y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 10 Feb 2021 07:26:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhBJMYy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Feb 2021 07:24:54 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49646C061756
        for <devicetree@vger.kernel.org>; Wed, 10 Feb 2021 04:24:14 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id c5so1332461qth.2
        for <devicetree@vger.kernel.org>; Wed, 10 Feb 2021 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LISi+Oc9GTZ5oHTm+YUr6VLWACgROuri9cGJPLpozgI=;
        b=EW9Gs12uxdYBPULSVoXhyzBNha9rowbDBkjznSNaTFNaiTV56gKyrVP5MVjdlsaoBp
         SynP8rRSvYLNNcbAltAfGysTSBI9lsE9Nl+/l90licN9Ut8RU5i2wAdZMLR/dr6Z+vjQ
         ghbeYAQ2zgUg+JxD3Pys4HZTNJDGYOu1VEbns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LISi+Oc9GTZ5oHTm+YUr6VLWACgROuri9cGJPLpozgI=;
        b=VCp2reuG6OjlWL4xZmF+G6U/03gc3VEhNPKmbXsJRRyqhyE2nTYl+6scT2AXo+QIWN
         rJp6BkYc1LJ/JIV2AWiR0gl1Hl5nOe0Uj2NHq6ZetPXa4thv3BwN+JJQx+nduAeYDS2b
         9xynFVSurki/2DdpsGTjDqJonayTHFYMHa1XwzlVnnhYwQvV5PUV8EKpjVjLf+6Swh++
         fgdGmnSJkXDv6Z2bV1i+3PBHirbI9w2LrguNKAPoiJpdKv07TL6Q6LVhDhg00ezVx7ap
         XcWHt4N9/lTGXO3Su+5FUNQAOJXXFaExO2FnQ3LixuoR9gpFFy2nxuJvnMo93Hlx+nJ4
         SW2A==
X-Gm-Message-State: AOAM531At0c6TayggAArYSfdi/xO3zhrAnfU+pJOY0q5ae12ApuxqtUR
        V9vTpOeyqhIKPOAxgBCTpQfwE7bS2vBN7MUYZch6fg==
X-Google-Smtp-Source: ABdhPJxEfZ/WBSPKx1Tl0qBwSbg2IbGZqKcplsfGLH1uLBGHXIALkT/jB/LIe+Ss4Wptzn5AfhQO5Hz846E+WIqzIZk=
X-Received: by 2002:a05:622a:4ce:: with SMTP id q14mr2498595qtx.132.1612959853524;
 Wed, 10 Feb 2021 04:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap> <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com> <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com> <4dd911d8-ce84-bf4d-3aae-95ef321b4a97@marcan.st>
In-Reply-To: <4dd911d8-ce84-bf4d-3aae-95ef321b4a97@marcan.st>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 10 Feb 2021 21:24:02 +0900
Message-ID: <CAFr9PXkLRKHguszidJX2Qit0QUJ0QxFi3H=Wp2HDqpfJQYZEVw@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1) devicetree
To:     Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@kernel.org>,
        DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210210122402.8ib-x0DobomjSjE9qrFQffRZcYTKaogz9jMNvpal6PI@z>

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
