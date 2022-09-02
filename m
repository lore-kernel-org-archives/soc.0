Return-Path: <SRS0=fnla=ZF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FBBECAAA1
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 08:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A35BC433C1; Fri,  2 Sep 2022 08:06:54 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64697C4347C
	for <soc@kernel.org>; Fri,  2 Sep 2022 08:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64697C4347C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id h5so2296660ejb.3
        for <soc@kernel.org>; Fri, 02 Sep 2022 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/CPr7XRW/l7oJ5TwQnKLmZtSswvlFBKkXS84mHDGoF0=;
        b=ov9NKalAZFyh2hTY2dbXszqArzlqn9GnZwUCyustVqEGsjRHlE2B+lEHUci2QWsq5O
         VvRpapuuUtNowNTe1SZ4hx+1GXq2MsAAyusyFMW9cEccUaf19D+PYWzInE+depRigNqo
         RyD/qbrxA4hF7KA0juayqdEYvFYUG6nTLg320DRnMC6jzYnBpi517gmkeDtm6g5RAhOd
         eGTFZ3np6jsUxmDuGP0G7W15ecBq5ntTGoO7p4zWgAdrckvsw4OtNVud1rPCvJe6GJVt
         WV0u3j98H9paeuHfEXZNjdT5hgUrIaWaGHpWeuOgdW3/V1mvGNCzHyTbhcIOrI2OajEu
         Lkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/CPr7XRW/l7oJ5TwQnKLmZtSswvlFBKkXS84mHDGoF0=;
        b=piJ2sgOmHjV2bdfSzpd7yVkMoXROGzlJQ3yloTGaPZeCETy/6zFsggZ2ms5H58SrpN
         wad8CQjU4rOlHj+3Oh/qepeuAHoRb+2MOZzMFOjy6MsQop23ZxzJjlYZfzEGCyUiZXFG
         sBwxlWSqpkqL2ifwgOZ9kdS53esmFHjmJsglRWPlGKGOSBSlCLoE7q/ReocNZIzxGikj
         vvWlfNz4YxJAX3jtXqkuaIrosTHy/SrWjF/9+fZXGFA32f2Pu6A1vy2j8BzgQsEM676v
         aVoAuroy33Dqbz7HrdmuWUrYXaZVTpigN1lvrwBtMxrvcV7ZO6qYGNCdhpgwLfDnEUJT
         Wb0w==
X-Gm-Message-State: ACgBeo1wPcT4GIdJYLVR2QN2FMBKSZfSOCdvyxkES65/3FcQs8Px/W0V
	3uHvuE16y1gXvS89NC1QGjFKf1vEggVh0gposbzaXA==
X-Google-Smtp-Source: AA6agR4LDNciPZtaUjUX6+2rGeSXUZhhZ0jz4kn1NPhxmpYPCdK4njNDmYFI/PgmcfJA4C22nLg5rswmxoKXLO8pMgM=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr26775363ejc.440.1662106010529; Fri, 02
 Sep 2022 01:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 Sep 2022 10:06:39 +0200
Message-ID: <CACRpkdb25ikL4F499NDCrv1kf2FGvJxqDW2wk9GNQCqrbX9kKQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for i.MXRT1170-evk
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, 
	olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, 
	dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, 
	leoyang.li@nxp.com, sebastian.reichel@collabora.com, 
	cniedermaier@dh-electronics.com, clin@suse.com, 
	giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 8:33 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> This patch contains:
> - Update to imxrt_defconfig
> - Devicetree
> - Clock driver
> - Pinctrl driver

No it does not, I already merged that.

I think you should probably split up your series per-subsystem so the
clock bindings and changes can be merged separately etc.

Then the DTS files can be added to the ARM SoC tree as a final step.

When you send everything in one bundle like this subsystem maintainers
don't know if they can merge e.g. just the clock patches separately
and be done with their part (like what I did with pinctrl).

Yours.
Linus Walleij
