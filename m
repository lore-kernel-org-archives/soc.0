Return-Path: <SRS0=RxOW=PB=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0430C3DA7F
	for <soc@archiver.kernel.org>; Fri,  2 Aug 2024 19:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AD2CC4AF10; Fri,  2 Aug 2024 19:20:52 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F993C4AF0C
	for <soc@kernel.org>; Fri,  2 Aug 2024 19:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F993C4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-654cf0a069eso68196197b3.1
        for <soc@kernel.org>; Fri, 02 Aug 2024 12:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722626449; x=1723231249; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gZNwK4s34iYGvIbS46dI7pOTIc2gw03JA9isN6WtOpc=;
        b=MQ/Lkjj+kCAlyXXe/vJMym8a+2ENasx3ctZEPxgcE9w2XaLtJZRgM1GhTi4+gPjMnl
         YeifgHJDlJXYiOHy8etYAfs6ekJJX0tfGLwKJ92xV0IUHy1/U6ucCB4UQ/Sa5/wJRBFP
         pYZxpqHbxt4QZTMnFVp/dWdwSt/wN9CnOUZAJPwJzaQ2DSA+muE5El5GjHgMkxsTIpOz
         fuy2OWojqnX/okouFjdXGavX70hd5+yLsqsR6uz9Hx04hGtVSTRTUNmGBkODxPLs1Nwe
         nwjBP1uhmjjZso+ApaqX0hYyjqPJKqqFl8i02ap1QFOto79c0bzZh/ZNJT3XNpZy5yhs
         5D0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626449; x=1723231249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZNwK4s34iYGvIbS46dI7pOTIc2gw03JA9isN6WtOpc=;
        b=aDNHuK4zZv3MDXimb1FsChibPC1F4KYUK1DqkYDavr5cKS46tLREKfqLIPtxAyuKQ5
         86cDKZyvHYTi7rCiKrrU9KCJYhO3hJjizqrSn+7rTTQvq37OfzTfgwwNLiEn+OI0l+2+
         75JUJnuA3CLwzkhpdcuxPI6YPdFKsb7+yGTavSZV19js0UeZqcLu3OxE0C6chd0+pACD
         3GgHrGQRz3z6/Zdbfbi0KYALXVx9H+LHs+AIx/87v/NZ6PADqd0J1PhAkfzr25YxUGuy
         vl5LvQzsbpxIE8OLE9f7bzNz4qG6va+//eE9Oauz6Ko1czn6HeODkGnx/ii7UqGJeqSN
         Y1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCW4EcsFCOM1w/NX621JVWJ6riNanJlnUO0UwfPlvrnA5Jz8sz4yxNAzyoCdSW3Cpi3NYIvKtVS709UZr4wYSw==
X-Gm-Message-State: AOJu0YxjdX6nTUlXux/FcDxsDOyAu5qkLL7Cuk8xOnbhzokkMaQWQ+ou
	aZ6zKF5FrU3E1/aljOJEjJlHwrrBCxpV+exyRJZawIMEIfD5Dqh7sAf0eRqaP1NKd6WOIl8DxLn
	xnB4NNDB2PHs6kwS5aVk42dnSJRkHTypX5MrBRg==
X-Google-Smtp-Source: AGHT+IEqzG5OJVYb0N/hhSy3/aCVZpwuaC57g1J8oBIELAMwqUOkxVNDUu61cFnvy19WDb7qlbHaefm1NS450MOTFBE=
X-Received: by 2002:a81:c20e:0:b0:63c:aa2:829d with SMTP id
 00721157ae682-689637fccd4mr52822217b3.44.1722626449505; Fri, 02 Aug 2024
 12:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com> <20240802090544.2741206-9-kevin_chen@aspeedtech.com>
In-Reply-To: <20240802090544.2741206-9-kevin_chen@aspeedtech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 2 Aug 2024 22:20:38 +0300
Message-ID: <CAA8EJprcmQvE3PjySxBKq7Qv3JHJHhic2aQ5MDnwZaf-D=K2Rw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: defconfig: Add ASPEED AST2700 family support
To: Kevin Chen <kevin_chen@aspeedtech.com>
List-Id: <soc.lore.kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, lee@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, shawnguo@kernel.org, 
	neil.armstrong@linaro.org, m.szyprowski@samsung.com, nfraprado@collabora.com, 
	u-kumar1@ti.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Aug 2024 at 12:05, Kevin Chen <kevin_chen@aspeedtech.com> wrote:
>
> Enable CONFIG_ARCH_ASPEED in arm64 defconfig.

Why? Usually the defconfig changes have "Enable CONFIG_FOO as it is
used on the Bar Baz platform" commit message.

>
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7d32fca64996..b393735a695f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_ALPINE=y
>  CONFIG_ARCH_APPLE=y
> +CONFIG_ARCH_ASPEED=y
>  CONFIG_ARCH_BCM=y
>  CONFIG_ARCH_BCM2835=y
>  CONFIG_ARCH_BCM_IPROC=y
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
