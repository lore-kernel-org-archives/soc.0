Return-Path: <SRS0=yfNB=QV=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9FFC433EF
	for <soc@archiver.kernel.org>; Sat,  4 Dec 2021 23:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 924D6C341C0; Sat,  4 Dec 2021 23:38:05 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95D46C341C5
	for <soc@kernel.org>; Sat,  4 Dec 2021 23:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95D46C341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f51.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso3224614ooa.6
        for <soc@kernel.org>; Sat, 04 Dec 2021 15:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=trSplw+nhot93KoeiH0yY3mLr5CNf5Ad5Ms9Knh6UUA=;
        b=YXQtOnAsYXUdf/SzQIruzpKzFHzEydiR7SArS5CbCur6LJTwlPvdYpHhiwiKumz8XE
         RTNtr5Ox3jyzQ/aU3hPS57YShiWv4hIl+HXGTtBqk+mNgRuWSxvVmBAAt1e6yQJM62I+
         5WitJ00hhsB6JzAAQewHOJNeAyWHHGOY3Rk4Hc/PpmlBpGSwuyszLECAiv1ShtuxUQcV
         3Qe5AW/y3Hb+8KpwCcghHzqPAQHGjM/xycrS++wbZ9gwnpAe1yWSGAaM6j1ZJSXYaMP5
         9Fwo4FLPlPCI3oqvoZSbsap1v0ZKB28Qc2vOPVEXRTkj/l1Mh9iSV9od+VsSUo4fhix9
         8pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=trSplw+nhot93KoeiH0yY3mLr5CNf5Ad5Ms9Knh6UUA=;
        b=iRUwDkVo7aFP7SL3gu3sEL457d92Rnu7/6Ho9Jk+Ymfm3ew4EOQtIrGF0Nol4D7QLr
         GBlArvTl+s+TjNjCTu3n0mQn/rO1aV84rQXrGfCukQrA0WyBY0V/mL2StQtQdWbULYWT
         5aLJL6IjgDfUtrLd+/L1bN8aXsKH0/OrJsYmgG8BFe1Kb1/E4ghPBgz+A166sHwHvUio
         LT3vd9WIvuThKkXGoVYSExrCOnGuDNJZtY0jIIlyxLfBoK4yg7C+W9w4u1G4G8zSRXfH
         yTQAIMC9T0sSKWAqkypeBbx2/I04fZtxkRN39wbj10wB8tZNc1HI/pguxSWE1EGO3rE8
         AruA==
X-Gm-Message-State: AOAM532wHOtvQlmmUIP7ThaDtxsvPNa/av90iuFW7jf1HJBf4+iBAmFv
	gbXWvMOcrYdkD0GJqYXFUu6AYLggfQUWeMfS/OxHgw==
X-Google-Smtp-Source: ABdhPJxAqv/xn3C5dPzAl5HRpbDK5uEX+KGGVV8X5QGIJ0tMt85CbgX1CE1+8Vz21+/VSbs77CahfO1GxRFwfb6pyFc=
X-Received: by 2002:a4a:e155:: with SMTP id p21mr17644649oot.84.1638661083480;
 Sat, 04 Dec 2021 15:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20211202095255.165797-1-herve.codina@bootlin.com> <20211202095255.165797-6-herve.codina@bootlin.com>
In-Reply-To: <20211202095255.165797-6-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Dec 2021 00:37:52 +0100
Message-ID: <CACRpkdbVfpmFKcdmNtcbpozuMt+EeJSmCuF4nJ--8oHrnyvLEA@mail.gmail.com>
Subject: Re: [PATCH 5/6] irq: spear-shirq: Add support for IRQ 0..6
To: Herve Codina <herve.codina@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 2, 2021 at 10:53 AM Herve Codina <herve.codina@bootlin.com> wrote:

> IRQ 0..7 are not supported by the driver for SPEAr320 SOC family.
>
> IRQ 0 is not reserved in SPEAr320 SOC (assigned to GPIOINT).
> Furthermore, in SPEAr320s SOC variant, IRQ 0..6 are assigned
> as follow:
>   IRQ 6 - NGPIO_INTR: Combined status of edge programmable
>                       interrupts from GPIO ports
>   IRQ 5 - TX_OR_INTR: I2S interrupt on Transmit FIFO overrun
>   IRQ 4 - TX_EMP_INTR: I2S interrupt on Transmit FIFO empty
>   IRQ 3 - RX_OR_INTR: I2S interrupt on Receive FIFO overrun
>   IRQ 2 - RX_DA_INTR: I2S interrupt on data available in Receive FIFO
>   IRQ 1 - Reserved
>   IRQ 0 - GPIO_INTR: Legacy interrupt from GPIO ports
>
> Add support for these IRQs in SPEAr320 SOC family.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
