Return-Path: <SRS0=5Zx1=SA=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC490C433EF
	for <soc@archiver.kernel.org>; Sun, 16 Jan 2022 12:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95AC8C36AE3; Sun, 16 Jan 2022 12:06:12 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F299DC36AE7
	for <soc@kernel.org>; Sun, 16 Jan 2022 12:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F299DC36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id v8-20020a9d6048000000b005960952c694so5705618otj.12
        for <soc@kernel.org>; Sun, 16 Jan 2022 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2JKr0VhVhkCrnxhwrKxEZLONnSfW5FQCdXEB+dx8FvY=;
        b=ndUhiroZpnTdKQO7j2D83aBoJKHUMDbe5XUno1L/grKwtiT0At6LN8nqxwzRtR4gXM
         YofEm1SkkjAENJbnKq+ZQKnA2Hmc4uJu8vXBc11m9CJpYhkqDuDSQYzrWHEPnGc2NcRu
         5awSzFrm5WgY3U3DdrRLr+sbrWPwUdPJ51bPZZTvmYfOqKZ1WdFq+/F6t8+uS+xpH2iu
         VzbW2TLFTo1Jw0ldbpQrkuDrIpxsgeqYPsGdymvWqRR8ODASjyUhHaOLos8M/Tr9VIsi
         2Rmw9H8HGOiG8z/GzjkJWaUVLW2WgniE08yzhKpHEP01hnQNgS13olQ/73KWsVVKaLCb
         ju/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2JKr0VhVhkCrnxhwrKxEZLONnSfW5FQCdXEB+dx8FvY=;
        b=d6C4gL50H0ograRt4Ray4hYDf0pGkNTOS6XnDcawgXLBJ3qDFkbqJq7rWb3kKpqsvU
         65UgXPzokOIeidh+yWk6l2MV3+10swO9FN2+Q4Psc/lL6IVt7dJ+TxTWVaBXudkPrt4I
         0UOR5a3aWSR/hmTZX9oJyM/g16R/AglA4wCuuYkFJGnc2Zl+VgwhVk7zFbgLAWK5fKXS
         cBnMvqyg+0XHHHmGqEEDi54e6YtdulnMV6S8K8E15s7yy02JTLJgoOL+0Em+jSF7qF39
         pxL+vHfNSLqATMR8qrqvGW2eLnmcUWlEaYXbtPzzqC1qttgVFAB/bgVAAWFgVLDWG9P0
         VoKQ==
X-Gm-Message-State: AOAM530vqZEhr0geW3uFzpFdBQAeVuxDunrnzE/LVgb8IIKeaOSA6b4g
	lZbL6EllqffoesQPXB5u6mlHt0o8COjkEH79+B0QjQ==
X-Google-Smtp-Source: ABdhPJyZW2DY7OLm4V7AlnhiprfBMzKMRJwLFYA5jTMMRX+gM8CvfOrsMi4mM4UdWZfAdLOYxGGTFjyOrhpoeYpQKkg=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr13235569otg.179.1642334770136;
 Sun, 16 Jan 2022 04:06:10 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113122400epcas5p34363ba8f477b4c273d601d0b64324afa@epcas5p3.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com> <20220113121143.22280-12-alim.akhtar@samsung.com>
In-Reply-To: <20220113121143.22280-12-alim.akhtar@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jan 2022 13:05:57 +0100
Message-ID: <CACRpkdaRshgkwrAgF-zhpsDxjPPC9GTOYXvnXL927GyjDhbu=g@mail.gmail.com>
Subject: Re: [PATCH 11/23] pinctrl: samsung: add FSD SoC specific data
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	olof@lixom.net, catalin.marinas@arm.com, robh+dt@kernel.org, 
	krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com, 
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, 
	linux-fsd@tesla.com, Ajay Kumar <ajaykumar.rs@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 1:24 PM Alim Akhtar <alim.akhtar@samsung.com> wrote:

> This patch adds Tesla FSD SoC specific data to enable pinctrl.
> FSD SoC has similar pinctrl controller as found in the most
> samsung/exynos SoCs.
>
> Cc: linux-fsd@tesla.com
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Looks good to me once Krysztof is happy with this I expect to get the
pin control portions from him by a pull request.
FWIW
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
