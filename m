Return-Path: <SRS0=2bQ/=FZ=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813E0CDB47E
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 21:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68E7AC433C9; Wed, 11 Oct 2023 21:56:20 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6879BC433C8
	for <soc@kernel.org>; Wed, 11 Oct 2023 21:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6879BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c9b70b9671so27805ad.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 14:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061379; x=1697666179; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GY2RJk7ue/Ex7NXo2WJS/YXw1Q/fILloVJYJ2jREcs0=;
        b=PUwNJgpbRzhCySJwR8zoSlxb+ES9JcGxFTiRNKIOkSFMLF8/O2DMHgye3KqF+nq2+b
         khkjTT8qktqdQfTKWN+RU1cWfF81XaxJeQ6OV5y83fuAgmHMSY77pjaxWMUVeRDXQvU1
         lKl/HTaBLXIq1aIVwKSEUOQ8tkEuHI1Ouyk6B6rlIUOAiZmouKOn79IRvVKPBGVMad+g
         EqY/4ZpfBjD9YSECiXCPly+vRkjeKCbChL5VIc884QzvOQPR6puXnGYXgU1BtR/5iP7E
         C7ndZv4tUZ/MLfDi4o6qsHhuKBlaGveycY8/DIDJ/who9SleWu7dnT3IrcnmSTMW5Hem
         wl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061379; x=1697666179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY2RJk7ue/Ex7NXo2WJS/YXw1Q/fILloVJYJ2jREcs0=;
        b=SaZz2klAVcn3TaiWW41XjCBhJhpFZF0oRR4zp1bj2Gfx4wV6kPwJj7v8zHc+qotmEp
         UqZeYyCLY0v1l1Bd3lwO8j0BaR5nJrJ+mwO4GlxcWS2bAW+e771sZEYzQiE6llQw++pa
         H+eud+nOo4+kMYQZqZwrQU9YTrXFqtTabntpXDIpSlsjkJgrjZu3dV7vODhvjCmkM+wN
         az0663BqeyBVTId+C1G2lqcrXcIlYh7YqXX1RAWgK/t73ppok4Vh6JotUUQ9y8wqE5GO
         QOcfTUM6GFPW6lOe3Sap62mIJAl2eQAPHrUrUXbm//8XNXzcm+pEFLpnIHK1e3y2o+KQ
         i1Wg==
X-Gm-Message-State: AOJu0Yz/C6fAcI9ui1FlCI2L5MjwWoZUBoJuB/pKb0+PEI6ZO1u24mSX
	2waGfBAbSh9avmd/bVjarvxp2A==
X-Google-Smtp-Source: AGHT+IH0cLMnt++OxXQaz5pgZY6kHmQMxAtk4c0SyB052nIznwOmmp2huLT7DDHY0oMZldy8+AbXOQ==
X-Received: by 2002:a17:903:18b:b0:1c6:ec8:4c82 with SMTP id z11-20020a170903018b00b001c60ec84c82mr303280plg.23.1697061378736;
        Wed, 11 Oct 2023 14:56:18 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id bt12-20020a17090af00c00b0026b12768e46sm383180pjb.42.2023.10.11.14.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:56:18 -0700 (PDT)
Date: Wed, 11 Oct 2023 14:56:14 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
	cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 19/20] arm64: defconfig: Enable Google Tensor SoC
Message-ID: <ZScZ_sllcdyS7tCi@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-20-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-20-peter.griffin@linaro.org>

On 10/11/2023, Peter Griffin wrote:
> Add the Google Tensor SoC to the arm64 defconfig
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5315789f4868..8a34603b1822 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
>  CONFIG_ARCH_BRCMSTB=y
>  CONFIG_ARCH_BERLIN=y
>  CONFIG_ARCH_EXYNOS=y
> +CONFIG_ARCH_GOOGLE_TENSOR=y
>  CONFIG_ARCH_SPARX5=y
>  CONFIG_ARCH_K3=y
>  CONFIG_ARCH_LG1K=y
> -- 
> 2.42.0.655.g421f12c284-goog
> 
