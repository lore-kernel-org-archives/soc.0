Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5C6C433ED
	for <linux-devicetree@archiver.kernel.org>; Thu,  8 Apr 2021 22:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 190346113A
	for <linux-devicetree@archiver.kernel.org>; Thu,  8 Apr 2021 22:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbhDHWMI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 8 Apr 2021 18:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbhDHWMH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 8 Apr 2021 18:12:07 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A72C061760
        for <devicetree@vger.kernel.org>; Thu,  8 Apr 2021 15:11:55 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id v140so6518886lfa.4
        for <devicetree@vger.kernel.org>; Thu, 08 Apr 2021 15:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ioJ10CTBsTjkn9xL6Be686Hj+jHT1alauBLQtGYqWa0=;
        b=K/Zcl/K0msGqq95CBiI/1f5tvFQ7Nv4lRy21tpAg8kaxbf7cgeMiS0cv4T3lnWleA2
         r207Yc+Mc+IrxKmIaJAejXh/b1axYFI35RA+oI8EPJ2TVbzqvn3Qoktcl2GYlsPoP+km
         tuN/LsNg4R9HHcPJzt48h60dQkhoN7yXQBWEAKt8hdnvqgTdMxgpS+38Qr2LakAr0bjg
         63f385BWGGOd0XEVBGlPq09IDHeUdXq5duuf/5caUB2YFzHvesvNZXPEgdxhgoMB0kks
         QaCzHzrTuNc3goh9yjVwNeWzmTs73Sr2N4L/0uAwuKdAsYh6x3EFOq0J8wTK8cPglTP6
         Fd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ioJ10CTBsTjkn9xL6Be686Hj+jHT1alauBLQtGYqWa0=;
        b=Ta75laqwJeFfPha3hs/KVXHq0OcY9hzAwfG6MNoWIHoQ/TxxB31cBS+VXvBO3CO6eS
         EpuYMgxacnDQWfPWl1wCFoCpteAeXLatMcnhE33t/gi0sCnMHTsV9IH1AbsJk0y2vfOG
         ALcMCTA/3swAAotjEqPsEX0w21DQz42YCPypiNM/AXVhYZsK5pvhBSikf5Zt32xhnyA/
         7w+r5LGx8DBMXrXxJo21WGsHEsHprLyXrzEvE+gFFonRLWQrb0DuYC3mFvPbNlvlpzyr
         XOod7abToZoyO6Pfa4qDBm4Z6SZ02I9cxMQoBgAAo9NpabfAQwvx2k15SnHIVoQ1Sqq7
         d4Wg==
X-Gm-Message-State: AOAM531rrdzqR1J4tHouRFiUjyqVFMsHYxSRHU+/M126x1B5XfKAq/ro
        WRUME0p/X19M+0CSl81SY1aJa0/aWbsaZ4Qsk9ktrg==
X-Google-Smtp-Source: ABdhPJz27ymMDR1dUEGPuUztSRP4eit7GdrXQuLeZavzg3ufC0FEXhTcV+mU85qzPX7FbSTioVON1nl/5qRtMHAr7DQ=
X-Received: by 2002:a05:6512:c0b:: with SMTP id z11mr8544156lfu.586.1617919914405;
 Thu, 08 Apr 2021 15:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
In-Reply-To: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Apr 2021 00:11:43 +0200
Message-ID: <CACRpkdZ8iDwH5EPiZxGzEU5p-69A5X+MUEskooe21u_j12n5Ww@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To:     Arnd Bergmann <arnd@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        SoC Team <soc@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210408221143.1a7uGZBnKkiMhx9_jeoR_Y2xBjKlcq8FgJTWAZAPWy4@z>

On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:

> arch/arm/boot/dts/ste-href520-tvk.dt.yaml: accelerometer@19:
> interrupts: [[18, 1], [19, 1]] is too long
> arch/arm/boot/dts/ste-hrefprev60-tvk.dt.yaml: gyroscope@68:
> interrupts-extended: [[22, 0, 1], [21, 31, 1]] is too long
> arch/arm/boot/dts/ste-hrefv60plus-tvk.dt.yaml: gyroscope@68:
> interrupts-extended: [[25, 0, 1], [24, 31, 1]] is too long
> arch/arm/boot/dts/ste-hrefv60plus-tvk.dt.yaml: accelerometer@1c:
> interrupts: [[18, 1], [19, 1]] is too long

These warnings are all because the bindings in
Documentation/devicetree/bindings/iio/st,st-sensors.yaml
are slightly incorrect. Several sensors have more than 1 IRQ.

I was working on a refined version of the bindings but got
sidetracked.
https://lore.kernel.org/linux-iio/20210104093343.2134410-1-linus.walleij@linaro.org/

I'll try to get to it.

Yours,
Linus Walleij
