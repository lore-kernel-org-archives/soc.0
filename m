Return-Path: <SRS0=pA+E=VM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD16C43219
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 21:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DDCBC385AF; Wed,  4 May 2022 21:38:50 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8BE0C385A8
	for <soc@kernel.org>; Wed,  4 May 2022 21:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8BE0C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f7d19cac0bso29964467b3.13
        for <soc@kernel.org>; Wed, 04 May 2022 14:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VX0Y5lK0oKhUNvSgMz9EtXzVemCwMapBfZK+KjIwWaY=;
        b=QFpWrEBIrRnFFsbRzuQnDhJe4BaSIkFjtC3A5cZVG9hy/hcMauWrIqr2be5/KwrfGo
         NCGCurP8cU79+UY+pB9TmqKhq7oXZZ7qPI7uQbAillCKF63H5X/zuGVkc+JsGOKGae5G
         f+iwI+Dj4ePQuDCx/1Fct2nRPtAuc4Hty7oz//xsfve/iIL9k6svN3NMMvhiwINJ4xTM
         9sMncJOw7LjeeB//tUJa4IoTpI6DRjLlfyj3NRTd/sq9i3txOLixbGmLfCTI0VPt6z/K
         HRTwjUNbVnucCOGaOR4QEyXpnInRsolXUV5HOuBia87QkC+0dAuzdKHwcHKfLed2iZ+D
         Bhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VX0Y5lK0oKhUNvSgMz9EtXzVemCwMapBfZK+KjIwWaY=;
        b=dYyNpD9yae68mIggvV2CTNFaKeWeulSb1/VDtj5ApEV8G5NrUe8nksuaArMvsYfkj9
         m9s2hkFuuTZKofRaI31WwUGn/2YsuuzqfO6oxUZOuRGci9unsWxYR2ZX78Kfip+8GXWM
         cGyAjx7yBFCTA0WU403E3n5TMAm19W1DvhZNX/ywbwuHBn27ofDd40oeV/5zIU5lV6AO
         ENqFBvjbO1gjfWsnQN99b9tWlZCdBmDtbKUxA1AkpvQa1OULeDtFB1B7RsKi3l8JNg58
         +4VW8M3xH++ZyXaQ1hfd+Jvd4iV8QBAymcDV8mClxyqrqHq+iNTIf72CavHWo6EIE5zd
         da9g==
X-Gm-Message-State: AOAM533bINhe8cjCcdmJTxCvGuHOAqcY3EYYLzgmPWB7IfG76zwrkzqs
	2duiU84v4MSl+JGcYqbenkaPxIxOfSCGWkPcbQ2QKw==
X-Google-Smtp-Source: ABdhPJyWaynNr+CEKkTESmGLzWOB0NJ+k01UPdgmFyQnRX5drt8jZsToCyQBLbeZMlkNdUUCDjlKhWmRzv0FXiKAhqI=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr22520729ywe.140.1651700327788; Wed, 04
 May 2022 14:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com> <20220428214838.1040278-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20220428214838.1040278-13-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 May 2022 23:38:36 +0200
Message-ID: <CACRpkdY2MNkAKhVOQ_Eyq0AwOtEW-seSrxgsJ2D8E78u636A8A@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
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

On Thu, Apr 28, 2022 at 11:49 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add the pinctrl driver support for i.MXRT1170.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Nothing done

If I get a review from a Freescale maintainer on this driver and the bindings
I can merge it separately, correct?

Yours,
Linus Walleij
