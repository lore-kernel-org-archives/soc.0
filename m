Return-Path: <SRS0=+ipK=R5=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F6CC433F5
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 13:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C847C36AEC; Thu, 13 Jan 2022 13:28:59 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39FD5C36AED
	for <soc@kernel.org>; Thu, 13 Jan 2022 13:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39FD5C36AED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 24689402AA
	for <soc@kernel.org>; Thu, 13 Jan 2022 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642080531;
	bh=hznGQk19CD8NoR3VWNyd9c/wYFGozPUj+0yuhJLbQPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=fx1DLRj4nJZLQutZ8+NLS/PfY+jBgO8qLoCNBE+5Fq8DteqX3r+Gc26gBNkujCR8B
	 TTZfoiqrvZtPYHq9E96lx7GL3Oyev+unzIL94f7GlqVnsh8TlMXxlUXwD3htBRrVdB
	 2o1kTOKI6OeoL3bNzC32wL+aOEgyi6+XG3g+Wx0fL8QKlkifJNlq/ghuSeWavHNN09
	 2ftxVCnlIubUJb3mBmtdqf7xGWEvf8UdkAiQVIoSHazYQBBNFWkFnQfZ8PlvYk5JZJ
	 j47QlRTyTZ5L1Py9pDHzP/cLNIabsIQQvB5X8NqwTSojMQH1x63ne84yLBQqdvXDJD
	 HumqvsD2fgWRQ==
Received: by mail-ed1-f72.google.com with SMTP id z10-20020a05640235ca00b003f8efab3342so5358705edc.2
        for <soc@kernel.org>; Thu, 13 Jan 2022 05:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hznGQk19CD8NoR3VWNyd9c/wYFGozPUj+0yuhJLbQPM=;
        b=ep+FgYQD8xr9bZlajMT6KsHV6xEKlzIMGfGG0s36scbh4o19/aI6M5oFAiqhWguLp3
         xAmF3dQFH8c84IGli96WF8NLpIQveKGmNScTjehcm6rwsjq13g04cY9b08Xet1bCYDY9
         yYJ0yINqpAElGcknCqmH9wlJnsyliH3Z8GNIq4H7IJYeyf2zNOvSBczdBAQcHR9TW6NU
         mJHAfJfsCKsbrnOB4cisbvTGfrfXMaWGKMc0wgnnpo2Jts4uqeykU5aLAxeIYmCWhmDl
         hjd7w9VatbPHpmdQpOOs/HmPv2SgsMmlNqeiMuHgoLM5qxn0hmJ6QJDI1GLKyja3QWS7
         pNRg==
X-Gm-Message-State: AOAM531/cdpyd775WEOCt/Su06mYVt+Uzu2DjlN5mrnGary8TaHCXfo7
	HRQXapF/jDEU7Nz5hmdUruu4DIats0kXjOIUZNcBx1goowEDI8nrK+WAmNCY8bej/ilQuw8Pxde
	ni2aNdDaKA0R+xBGTPnAzFT4=
X-Received: by 2002:a17:906:a15a:: with SMTP id bu26mr3467354ejb.335.1642080529633;
        Thu, 13 Jan 2022 05:28:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvQFVh8OpoiHGF8vNUoAdSJ/5cDZxtFhJSX77E0+B6EEgX3ZPEv8tzxTe5uuJkZotkBoW/eQ==
X-Received: by 2002:a17:906:a15a:: with SMTP id bu26mr3467336ejb.335.1642080529487;
        Thu, 13 Jan 2022 05:28:49 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c19sm1178698ede.47.2022.01.13.05.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:28:48 -0800 (PST)
Message-ID: <dc400642-418b-6bc3-f4f8-0770c0ed4671@canonical.com>
Date: Thu, 13 Jan 2022 14:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 18/23] spi: s3c64xx: Add spi port configuration for Tesla
 FSD SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 Aswani Reddy <aswani.reddy@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122435epcas5p18e6a2699f193b9e1287588278a570235@epcas5p1.samsung.com>
 <20220113121143.22280-19-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-19-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch adds compatible and port configuration for
> spi controller for Tesla Full Self-Driving SoC.
> 
> Cc: linux-fsd@tesla.com
> Cc: broonie@kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 8755cd85e83c..8d0c1f03ab7a 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1442,6 +1442,16 @@ static const struct s3c64xx_spi_port_config exynos5433_spi_port_config = {
>  	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
>  };
>  
> +static struct s3c64xx_spi_port_config fsd_spi_port_config = {
> +	.fifo_lvl_mask	= { 0x7f, 0x7f, 0x7f, 0x7f, 0x7f},
> +	.rx_lvl_offset	= 15,
> +	.tx_st_done	= 25,
> +	.high_speed	= true,
> +	.clk_from_cmu	= true,
> +	.clk_ioclk	= false,
> +	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
> +};
> +
>  static const struct platform_device_id s3c64xx_spi_driver_ids[] = {
>  	{
>  		.name		= "s3c2443-spi",
> @@ -1472,6 +1482,9 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
>  	{ .compatible = "samsung,exynos5433-spi",
>  			.data = (void *)&exynos5433_spi_port_config,
>  	},
> +	{ .compatible = "tesla,fsd-spi",
> +			.data = (void *)&fsd_spi_port_config,
> +	},

Looks good, except the discussion about too generic compatible.


Best regards,
Krzysztof
