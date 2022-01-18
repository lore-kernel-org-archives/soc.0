Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48919C433EF
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B3B2C340E5; Tue, 18 Jan 2022 18:31:10 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 488AEC340E0
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 488AEC340E0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 016C5407F9
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642530668;
	bh=YFaw660kiMtbZw2aFgls+WQSIT2y3r6EjVtjCEIvW6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=BNBsDJgxkSUwcaiAIH7u1nBeZ4YsHkuAyFXu72SFpZD4qbjnxg/F84Jo5gJ09xyqC
	 76LYG/qQ1IXCXuqIG/lwuKtFFbGdPROb78i9dBKU64TCD2PGeIzBsDpwGHXIf5gZTh
	 C2ZqOF87GEAtiuLbdJG4Vshl3FrdkxuZ3dUvtugQxouKVTBsY/jSChz4PEQQ4mxp6g
	 dhAvsn2c8AcPHVnazC0Phl0wv2QPEIjJv8Im9EnpercjIkagvjub75kxSR+B6sCD77
	 SGyw/4I8PXTiKlligSPwiFHwLY4UVXc9fdWSqMxDHdR61mIwCoIbz+lvWvyjyeLmyQ
	 +ibgQYepCER/g==
Received: by mail-ed1-f69.google.com with SMTP id a18-20020aa7d752000000b00403d18712beso772377eds.17
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YFaw660kiMtbZw2aFgls+WQSIT2y3r6EjVtjCEIvW6Q=;
        b=niAPp3owpNtd2l71cVCyrJSazH08XpqL3Dj3qEsJCVz2pn0VfH1SI/ZZMbgDGRnDmj
         0tffMVaa0qWBn0giYK2ikLt3cNfqceXlwDuAHqxwYrftOC3rY0rXewanylbwCA9O7PJP
         cE8kXIwZ3DE9EpgP14tl+7O9HfWTZh0a4sPZtAEkj1sfKImDTFeMtgAszSBISQGqa6lN
         RD9ujy8jd2i3SxbB0+0tYCJ5tCW83XbGJZMRWEbJGjVWgyD3zuQ9vJdleU2TsbayP4LS
         AaXB8yK9SXtAHQ7E/LeNuCEaQVifBcuhyiNApvdpqEAxqgvXG0Q/nyd3+9dOKejDNrr1
         zBUA==
X-Gm-Message-State: AOAM532ci4fJIU7O1icp7Fz43B8UhZGO14VumYY2gHxjH1MNgLF2t44L
	bjRwq3+zGPkbkORBJjEFrG+NVuv1v8edeY5qPGuXn+nvkp0hmN/+uXkb9gKvrjW06jTrD1BOOnh
	Uq1DfaatPDnrlAQSBK4cG28Y=
X-Received: by 2002:a17:906:4fcc:: with SMTP id i12mr21825595ejw.529.1642530667613;
        Tue, 18 Jan 2022 10:31:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBs0IMBJhfVZZtUf76zLh8JdoHRYNhTeK8f/e7FszXsAagZM7tbUlsGRQqUmDXyORjeRz+lQ==
X-Received: by 2002:a17:906:4fcc:: with SMTP id i12mr21825569ejw.529.1642530667370;
        Tue, 18 Jan 2022 10:31:07 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p23sm3741934ejr.191.2022.01.18.10.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:31:06 -0800 (PST)
Message-ID: <b35fa0ff-18a0-2a9d-5a1b-378ef2fef66f@canonical.com>
Date: Tue, 18 Jan 2022 19:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 04/16] clk: samsung: fsd: Add initial clock support
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, Jayati Sahu <jayati.sahu@samsung.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150028epcas5p282c05b78f28a9b11d46da94e78330f0c@epcas5p2.samsung.com>
 <20220118144851.69537-5-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-5-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add initial clock support for FSD (Full Self-Driving) SoC
> which is required to bring-up platforms based on this SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/Kconfig   |   7 +
>  drivers/clk/samsung/Makefile  |   1 +
>  drivers/clk/samsung/clk-fsd.c | 308 ++++++++++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-pll.c |   1 +
>  drivers/clk/samsung/clk-pll.h |   1 +
>  5 files changed, 318 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-fsd.c
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 0e18d6ff2916..11587eb87fc4 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -124,3 +124,10 @@ config S3C2443_COMMON_CLK
>  	help
>  	  Support for the clock controller present on the Samsung
>  	  S3C2416/S3C2443 SoCs. Choose Y here only if you build for this SoC.
> +
> +config TESLA_FSD_COMMON_CLK
> +	bool "Tesla FSD clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Tesla FSD SoC.
> +	  Choose Y here only if you build for this SoC.

The clock drivers Kconfig is organized in a way, that platform should
select only COMMON_CLK_SAMSUNG (first comment in a file), so let's keep
it consistent also for FSD. "select TESLA_FSD_COMMON_CLK if ARM64 &&
ARCH_TESLA_FSD" and skip the select in Kconfig.platform in following patch.


Best regards,
Krzysztof
