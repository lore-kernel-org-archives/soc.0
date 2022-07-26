Return-Path: <SRS0=o3bE=X7=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219E6C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 08:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA7BBC341C8; Tue, 26 Jul 2022 08:05:00 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16E7EC341CD
	for <soc@kernel.org>; Tue, 26 Jul 2022 08:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16E7EC341CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id bp15so24735778ejb.6
        for <soc@kernel.org>; Tue, 26 Jul 2022 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBehNnJT8GsO8upB51VneNbMYqsRg1ZW62nLqXxRwjs=;
        b=ux3qmfJJzCRpmOIlz05amYZpcKjRQdQpSoXtp0phrhdyP/vH1mgjUHF3Cn6q1rAio9
         sTifpvJhZaL/w1o15nmY3samMbq8yjVXooInCubRXzNUnweXBqGb7HBfR8Gj+zpCCOBp
         oQ7iNJBYQZseKBKeQ5mv5+SZV5gcJDb6ePE8xWQSg9oGJIpFn/LFsmiSHs/FfYPc29x5
         0ZrOfpuhyk+7WLYfptEqkETbazvrhXKGkhwVqtYEVIMrQRMiIeEN4MQ0GgqHsD+BL2ue
         tHXVaL4vP+mJovTLoaaKe2LMP1LY8R2jrMJvrRSVa0fyYpGWxCHVYNgCm4cQAKXxNi/u
         75LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBehNnJT8GsO8upB51VneNbMYqsRg1ZW62nLqXxRwjs=;
        b=Mt48TBg27tl0YWCKQW11wbzovRFNoSz4JqzqpBYyGceHNae0RzPr+ZUA0KNPjCEUwN
         fxpF4oNTcTS9C8Nw+cc+OGlKvb7ISEEJRfiaZPXzdL0G2rcvfWKq7wV3l4CyS7L0Oxmg
         JyeEtGOpfsWrwZudDuo/aqJe0UW/25uOVBMohqDRs02szE6uTMWFSmIWQ+KgznMD7TbB
         2oP2XLbLJKR345/nBh/at/oK64pVsTvYNbMt4fomHxaYlokklr84IdUmw+Yt3lCAzspy
         LSX59N4sVsXy1BVg7DM7RcUO50ZbwnYQKjj4ZmM/f085hNpQMs8PVRu1phYETpBmXVlx
         Z0zg==
X-Gm-Message-State: AJIora88rQ3vK+J/nCthiyUFt89vpuIDC5oRyB3pD26o/ZhGg4d1XpD0
	te3QQHz6ufw4yjKRqYMkTFQgd/xvSquEgfp7NzGjDA==
X-Google-Smtp-Source: AGRyM1vHhcGel5juigG9IuL9lnmZZvwbKcwgfiDrUj2uiwtNoJw8NVE9bwIMb2MaITVezVvKoTnq3AyC7k1VJmVf5x0=
X-Received: by 2002:a17:906:5a61:b0:72b:1468:7fac with SMTP id
 my33-20020a1709065a6100b0072b14687facmr13030328ejc.440.1658822698053; Tue, 26
 Jul 2022 01:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com> <20220723160513.271692-4-Mr.Bossman075@gmail.com>
In-Reply-To: <20220723160513.271692-4-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jul 2022 10:04:46 +0200
Message-ID: <CACRpkdZMFdYDssk9B7R-MH7xG8Ukp+ZQpXCRVtPRCS=SFh34mA@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles
To: Jesse Taube <mr.bossman075@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
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
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 23, 2022 at 6:05 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Both the i.MXRT1170 and 1050 have the same gpio controller as
> "fsl,imx35-gpio". Add i.MXRT to the compatible list.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Bartosz needs to apply this to the GPIO tree, I think it can just be applied
directly without regard for the rest of the patches.

Yours,
Linus Waleij
