Return-Path: <SRS0=/rbu=SD=chromium.org=swboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECDAC433EF
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 20:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA768C340E3; Wed, 19 Jan 2022 20:11:36 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E961C004E1
	for <soc@kernel.org>; Wed, 19 Jan 2022 20:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E961C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f177.google.com with SMTP id q186so6006382oih.8
        for <soc@kernel.org>; Wed, 19 Jan 2022 12:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Ux0XE7RoJ9M9u9eFrS5FvbzwFObKaVh7eojK5revoSE=;
        b=OppY9DT86SovagpCZvYO8aRmIb/yj57hBcyw+SsmOCeJ20AxLkGpxulk6NNYQ6W4Ll
         YFleAZQ5HmGZoRqFDQosyuscrvxZvwTvD7RSIMRQwCnvoUV/XV/vX8pT8bxiMffSvWAd
         pzizFhbXVg2xXF20pLLi1Q3zt7o9IVRJ+GkQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Ux0XE7RoJ9M9u9eFrS5FvbzwFObKaVh7eojK5revoSE=;
        b=wjNjck0wEELlob/dkv/wyBuxXwDjex1QJn9hDM9hDFwxIeOve+bB+VaPQf8I/Wy0Dq
         2zDVsdmrZLNYM47P5/gKlF2fTcDjO/JW/DF2y07qmRE/a6KTndnjVbDhIv7iqHoRlfsj
         5RElVWHPnRRzdWBrXSe59ldBfjglD8csrcMf7UH6b+UqnqrdQpLbBrvnBfJtfyayh0EB
         gR51SjqhcE7V6VyPCEXRmDc/X+yur2fvZpreoab1OZFnIIMC/l/DIoUgfVuNSRv7fc4C
         AfNrnFZhslONqDzxy2Vv5YK7AGh9+xxNcg9XqhlmURTO3idEfW1hu8UL8d9fDyCAaprx
         LYjA==
X-Gm-Message-State: AOAM530JIu9fVCLVAfky7OiDJvAwzhXTcs+4Yz65jL4p3Fjd3of16Vuu
	XNFuSKSiI3UIHfaSXhWO+b7bB2TYuXsS6DN/uwXAbQ==
X-Google-Smtp-Source: ABdhPJzEno0W0DnWhBvwsJjSg5D+E9lMOeYOjDKQVHxpxyCqvXx7BVqTDPR+FBASM48cOMdflS4bgsfc9irgl3siz98=
X-Received: by 2002:aca:a953:: with SMTP id s80mr4673449oie.164.1642623095415;
 Wed, 19 Jan 2022 12:11:35 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Jan 2022 12:11:35 -0800
MIME-Version: 1.0
In-Reply-To: <20220118144851.69537-3-alim.akhtar@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150018epcas5p32642af7af63869d08a861d00d97e3b68@epcas5p3.samsung.com>
 <20220118144851.69537-3-alim.akhtar@samsung.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 19 Jan 2022 12:11:34 -0800
Message-ID: <CAE-0n51KLEbCsvR7ByzNXxKg7gK4y6UNvg5vfAJ4C87QUweC9Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] dt-bindings: clock: Add bindings definitions for
 FSD CMU blocks
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org, 
	catalin.marinas@arm.com, robh+dt@kernel.org, 
	krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com, 
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, 
	linux-fsd@tesla.com
Content-Type: text/plain; charset="UTF-8"

Quoting Alim Akhtar (2022-01-18 06:48:37)
> Clock controller driver of FSD platform is designed to have separate
> instances for each particular CMU. So clock IDs in this bindings header
> also start from 1 for each CMU block.
>
> Cc: linux-fsd@tesla.com
> Reported-by: kernel test robot <lkp@intel.com>
> [robot: reported missing #endif]
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
