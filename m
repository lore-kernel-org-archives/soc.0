Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F011C4332F
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 629D3C340E5; Tue, 18 Jan 2022 18:36:51 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88724C340E0
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88724C340E0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F230C3FFDD
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642531008;
	bh=Xr6SgdUN1TZh8LNJdRyo3Mtp+OngI4NaFYJZFvhIHmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=dWT5O2iBUWszkoW0JblnJbJ1GYzXrx11BRJErc0oShw22KJihqeWZ9B4zGO5RQGfO
	 sNiKb3x7pFjtyfYCDrJU9XuFAqgpPKKi1bMDXrMgDeb543yebf1MmTnj53vthIHNt+
	 sw+aIN2x92DlznjJmPbTJv31qgvmRdiG1KinM6Qt0Ew1gloYChIq1te+0OWDzaWlu2
	 pT9NT8dX4sWx7v3QT64s3h2AEfZ9jxZtXucQp0uPCRL7t+GmMmRAo51802Rx8YkuNN
	 xXL1gVrAXSluFtdT9JmF+F4fQGBff+puE32eJRqTD+iSsNGn0p/5+iXurkfU0d3pw5
	 DuRtaAr34UI4g==
Received: by mail-ed1-f71.google.com with SMTP id t5-20020aa7db05000000b00402670daeb9so6896688eds.5
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xr6SgdUN1TZh8LNJdRyo3Mtp+OngI4NaFYJZFvhIHmw=;
        b=oCBEALlnlOqudtxieu7Xv2yO5+Hf1dRXkUSjG5b9urGIjpZ8sTsIRTaoXM2vo4fh14
         /WBZGKa2LJzI3dSWVZIIONd17jLV6mswJdGNqHNllCAUbkKZEIcalX1PABUEKATVGrN2
         MiHWtb4yKSphZl3QIs0kZrZOkKJOzzbawDz3Tpe9zxZe5mwIS44FT+78zOl4nCvIqTts
         CfG8qL1JlUJn7Lnwy5AKTk2Bg9YSrEDA3qwkfT+NdctdiaBlvit6uvmV3ab+2nv53wVy
         nogS4QE92OKkUHTBWwjitVEmOlHCm5kuihzVV2QSK0H3hcLa6kiH+o1twIY6Sm+kZ9x0
         xyiw==
X-Gm-Message-State: AOAM533XF8C/bXWI5b7vxyGSUdrnMhkMy9c5EMKs0snHU7+44oKfcz2X
	nIo5dDZEZY7LDFdmCUg76RyrwlBMdQOK/kqOQftVezEtgpsXGqTCw4uBZaUFXYZtJFkfVef2tFW
	5/qR6RkFxHMsScM/CwvyFopk=
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr21430538ejc.202.1642531007362;
        Tue, 18 Jan 2022 10:36:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhfrqj3ReK7A0ko54v0kjJtEtaJOwjxvJZxY2r3mMd3765xiW/XF5zsxzkUqpiG2o3Eafuww==
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr21430530ejc.202.1642531007224;
        Tue, 18 Jan 2022 10:36:47 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id kw22sm5615885ejc.132.2022.01.18.10.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:36:46 -0800 (PST)
Message-ID: <ad954b04-9df9-6675-18b8-8cda01467ce8@canonical.com>
Date: Tue, 18 Jan 2022 19:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 10/16] clk: samsung: fsd: Add cam_csi block clock
 information
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, Sathyakam M <sathya@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150052epcas5p12efa399d1a59fc2fb0595eef128ffdf9@epcas5p1.samsung.com>
 <20220118144851.69537-11-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-11-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> Adds clocks for BLK_CAM_CSI block, this is needed for CSI to work.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Sathyakam M <sathya@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 207 ++++++++++++++++++++++++++++++++++
>  1 file changed, 207 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
> index 72a2b38524a1..afac8760ebe1 100644
> --- a/drivers/clk/samsung/clk-fsd.c
> +++ b/drivers/clk/samsung/clk-fsd.c
> @@ -1543,6 +1543,210 @@ static const struct samsung_cmu_info mfc_cmu_info __initconst = {
>  	.nr_clk_regs		= ARRAY_SIZE(mfc_clk_regs),
>  };
>  


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
