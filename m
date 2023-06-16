Return-Path: <SRS0=N2oh=CE=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD5AEB64D7
	for <soc@archiver.kernel.org>; Fri, 16 Jun 2023 06:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F8E9C433C8; Fri, 16 Jun 2023 06:01:02 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F7FDC433C9
	for <soc@kernel.org>; Fri, 16 Jun 2023 06:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F7FDC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6668c030ec9so383294b3a.1
        for <soc@kernel.org>; Thu, 15 Jun 2023 23:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686895261; x=1689487261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z2Tdae4NzuKasm7w2+zUMrYnjwOZmFXGaFRcSVLtGS4=;
        b=IiY7MEtF51azzi+Au/MlRmq+0IYmYohAb3gth8d0B9zh2HsQriiVYCehdq9xmRoMjf
         DFaDtnFbUHtYrDeD13F1ZXWVCg8zanaz51fHubhIQiztpvYqiBK3WxfgdpGzjlx51r6h
         jAOcw8m56xqxLVyuP8dLEZPFBOgGepgtX19/Cv+aYZPoHzwTVbHwJIoSDCnJnn0dxHqQ
         OGkl3jTV6rkgBrWRwzwWl2Z/eLW+GCswsPynY65c7iBROleoF21UAwod/21sjHA7fzVk
         NC9DnRDYWvwgHCTd4j0xXrRJrBGWZFGqhaZeT6gemvb8bmZYaHHyZPblSPjckOhuNdkY
         Q74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686895261; x=1689487261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2Tdae4NzuKasm7w2+zUMrYnjwOZmFXGaFRcSVLtGS4=;
        b=J8Qf18UkGXMfoxVKU8ppUpAp9yJaZuGkJKvC1g/J/7b8oSI27sReOkjySRXDtn6YrV
         OZPjkhJGj8rQjFGerxF5r/bEE6BX1OhLxCI3RVHcTLNGWUZRsb3MgFVOIzeeVJiWGBwt
         YzNKEYTY7HsVweTfEs6cxJjniLVpnr6rVMcsPHPcXSb0cbA+16v83syJ31cmVGUbHEEH
         V5GNEs5WJW22hX9bYcogSmSCC2u9RgZF0VZMkJVx4HLBN+Fm/JV00m45tc2XroJBmgRX
         f/Mee3bK9dpsGqD5878wyC+pmQ39kH+gKbXvbbEA+DkiA1LXI0wH4hUoigSkief7hyAf
         lcZA==
X-Gm-Message-State: AC+VfDxPiLdKlEslAcpRgzZ9mK2hcRkmRW/G5vc7L8xkc3lUHzinNK8E
	JYEzH1aQdPeXp3YV2hSfHZR2Sg==
X-Google-Smtp-Source: ACHHUZ60sq1ipG1z94+WQu+zmM7i765xoHf5/NNQO8ODM5H/I7pDV1nW7CsA+JwiRlp1ezi51TAn5g==
X-Received: by 2002:a05:6a00:2382:b0:64d:277c:4ab2 with SMTP id f2-20020a056a00238200b0064d277c4ab2mr1350915pfc.24.1686895260664;
        Thu, 15 Jun 2023 23:01:00 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id g3-20020a62e303000000b00654ecbafeadsm1879921pfh.218.2023.06.15.23.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 23:01:00 -0700 (PDT)
Date: Fri, 16 Jun 2023 11:30:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: spear: Remove unused of_gpio.h inclusion
Message-ID: <20230616060052.kid7gtdunrlhhqu2@vireshk-i7>
References: <20230615164158.25406-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615164158.25406-1-andriy.shevchenko@linux.intel.com>

On 15-06-23, 19:41, Andy Shevchenko wrote:
> The of_gpio.h is not and shouldn't be used in the drivers. Remove it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/spear/pinctrl-spear.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
> index 18de2e70ea50..b8caaa5a2d4e 100644
> --- a/drivers/pinctrl/spear/pinctrl-spear.c
> +++ b/drivers/pinctrl/spear/pinctrl-spear.c
> @@ -18,7 +18,6 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
