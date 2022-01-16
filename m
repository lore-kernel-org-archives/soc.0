Return-Path: <SRS0=5Zx1=SA=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFFDC433EF
	for <soc@archiver.kernel.org>; Sun, 16 Jan 2022 12:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62FFDC36AF2; Sun, 16 Jan 2022 12:12:35 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B354C36AEC
	for <soc@kernel.org>; Sun, 16 Jan 2022 12:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B354C36AEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so16170165otu.10
        for <soc@kernel.org>; Sun, 16 Jan 2022 04:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dN4hyAkZ1Miqzb3/QhoFsGXlrqJg5gaQIvzhl2DDXYI=;
        b=CPNaiXWo2pnIicCgCE4TOFjmWNuRA9dzQpr3F9MQWVZndQVObEbrqc0LkwEobvrbAm
         b6jkPIJMdB2Xorzqzp3V0BiqMe5ONj9bKIWeOOKnukHWMiMqb9y3m4SwNrdoQkHfxhXq
         CDquO4Y5+rWhQ+usux8FaGzPpZ95FJFNAJGvYvwxZ9I3+VcEl9PH/Pvh6d4vmzz5tDtF
         V/8iIeMg4OwY/XNOgqmwFtCvGlXid6h50FVXjS+tHS/Kzh585Uwe2iOovV48wXEuLeyt
         nSve4ONIxR8/CbPDzw/rOM9rrux2qd5frYCAqc10IqjcAEKiOuYUepeHxW4aqbyBlcZl
         bWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dN4hyAkZ1Miqzb3/QhoFsGXlrqJg5gaQIvzhl2DDXYI=;
        b=VpLZ4VFHCnYKTFEp76FUNTiCIwgWzB+kbkGJFg6Hp+7ASGhQeLg5BkrpLug8BI/Q7F
         85PXPfT9isKIQ3DQZ8OLzwJrrDAEMKY74x3/Qy34M74rO+bfb9WAuzZq2puphZjG8acY
         NIXD6pkG4OCwVsoxHxjApekT0EobKWkmDYcV79ighyaxizQYR7Czj+kZcYD4RCtfM9TT
         A/BRzM+R2BHCaklT7uvDKXIzLiJGxN1vzs9I/w2LDxFw8Xx9tyvVq3pRxz4kJO6nV8Rh
         t9tZMTM1H//iRLulXKyZsoaE7lymuT2PbyAOBVRpWWHytT/L6Z9D7KWiz4OpWR7eqmOj
         WdRw==
X-Gm-Message-State: AOAM532G1QN0YpPF234WO8xMpRn3Pep8/wfavycUB0ZzC1KKYzdFRGHb
	6j3S5MoVV1ikLA9At154x7L4SRWrO/+FNIHG1SfU1Q==
X-Google-Smtp-Source: ABdhPJy8usbAaNUR44V9Qk15vyIj3ak49FQUUJBJouk/HUiIm/veRgYnOMPkzs5+HmpbNVpOzFFdybTHvuzzOVkJiXc=
X-Received: by 2002:a9d:465:: with SMTP id 92mr12902887otc.35.1642335153484;
 Sun, 16 Jan 2022 04:12:33 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113122435epcas5p18e6a2699f193b9e1287588278a570235@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com> <20220113121143.22280-19-alim.akhtar@samsung.com>
In-Reply-To: <20220113121143.22280-19-alim.akhtar@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jan 2022 13:12:21 +0100
Message-ID: <CACRpkdYSR5hiVKoZTffxudNOUQCNFqX-yuys-xgeocn2vG_ecg@mail.gmail.com>
Subject: Re: [PATCH 18/23] spi: s3c64xx: Add spi port configuration for Tesla
 FSD SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	olof@lixom.net, catalin.marinas@arm.com, robh+dt@kernel.org, 
	krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com, 
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, 
	linux-fsd@tesla.com, broonie@kernel.org, linux-spi@vger.kernel.org, 
	Aswani Reddy <aswani.reddy@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 1:24 PM Alim Akhtar <alim.akhtar@samsung.com> wrote:

> This patch adds compatible and port configuration for
> spi controller for Tesla Full Self-Driving SoC.
>
> Cc: linux-fsd@tesla.com
> Cc: broonie@kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Note to self: now that I see that the Samsung "S3C" SPI controller,
which I was thinking of as "some kind of early 2000s legacy" is used
by the very latest silicon I bumped up fixing it to use GPIO descriptors
a bit on my TODO list.

Yours,
Linus Walleij
