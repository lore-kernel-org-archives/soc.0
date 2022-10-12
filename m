Return-Path: <SRS0=UryD=2N=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22468C433FE
	for <soc@archiver.kernel.org>; Wed, 12 Oct 2022 21:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3AD3C433C1; Wed, 12 Oct 2022 21:21:55 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E75B4C433D6;
	Wed, 12 Oct 2022 21:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E75B4C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id s30so94471eds.1;
        Wed, 12 Oct 2022 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQfpRIt3DFuqO+zX1CeFTtSVeijb+PJxpHgqxCSADR0=;
        b=al3lXHrUDVuQJuNML3yc9OTVp8mBm1fceF0wyeRVT7rVZewHTS45N+wEDJE03RPt86
         whlP9ZfSGJADr+jLrP9hcsriMOhuem5pNu2pOAlJGKbIkvgU4vsvgsKImKxmYnPqvZ04
         Gy0dYOkAtFViIUJWCib2vOru/oXpiU2R5sCA5tIc9DrsT7nZUBEfhbCav1Ts2VeHxZg1
         3UPQI7BMu+saxhG/f9BQK7IpFypRaaRBR+D1hcpKxTgFSXFoUMQDXQQyxHYxn8zeyDbc
         JihcfTeXH5CI+eDdEWIsUu1fJgdoFDJYMUGCYlO33DjjtXQR6WbTQO4WMHCbg/3j38Sx
         57KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQfpRIt3DFuqO+zX1CeFTtSVeijb+PJxpHgqxCSADR0=;
        b=x57pNzsdJE5sINAjjBq60kDZZ++Dr+2uro+XmDwheUb2tPz+PKTnW8dOyVnpP9TzFr
         MxVNbTdcSmTFR1rNzPr4qBEtcNTktStgXBvvY6miS+/3py+4+ZdynqznqSeZXD+aU+cj
         gSGOc75joBnZRnh/1g5rW2BqSlGOSQ4MTK4hVW8gFxXALN9HYjv3PhSelU8a7INw/R73
         uK1C2dVpYqsQtOIMHVGWEPyeK/U9ZzsuP4X4lu+G/TGCGzl8OTRpacdw+u6nresmWJl2
         YIjearClKL+2Pmboby+S+mOVVYysgLp+tKup2a0JPcwPUVHxH2k6fK+k5CRk6C8d728L
         tmGA==
X-Gm-Message-State: ACrzQf3VyJHdUAFyws0UIIr1oJvLnf4GB0Dcv43z58v76kpFKNKzWu74
	PgS2RhEiUqw3E7J6nl9JWRwZ4vBsp7fBVA==
X-Google-Smtp-Source: AMsMyM7ztgB9rREL8AMYuGYCWQ376iRMzD7aUi2+lPvEwK2yjjBdeM84G3oYxHblooq1M66KBII06A==
X-Received: by 2002:a50:fd16:0:b0:458:bf43:8dc7 with SMTP id i22-20020a50fd16000000b00458bf438dc7mr28513321eds.400.1665609712898;
        Wed, 12 Oct 2022 14:21:52 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id a20-20020aa7cf14000000b00458dc7e8ecasm12009298edy.72.2022.10.12.14.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:21:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <uwu@icenowy.me>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 04/10] phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
Date: Wed, 12 Oct 2022 23:21:50 +0200
Message-ID: <4218006.ejJDZkT8p0@kista>
In-Reply-To: <20221012055602.1544944-5-uwu@icenowy.me>
References: <20221012055602.1544944-1-uwu@icenowy.me> <20221012055602.1544944-5-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Icenowy,

Dne sreda, 12. oktober 2022 ob 07:55:56 CEST je Icenowy Zheng napisal(a):
> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> 
> Add support for its USB PHY.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes since v1.
> 
>  drivers/phy/allwinner/phy-sun4i-usb.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c
> b/drivers/phy/allwinner/phy-sun4i-usb.c index 3a3831f6059a..2f94cb77637b
> 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -109,6 +109,7 @@ enum sun4i_usb_phy_type {
>  	sun8i_v3s_phy,
>  	sun50i_a64_phy,
>  	sun50i_h6_phy,
> +	suniv_f1c100s_phy,
>  };
> 
>  struct sun4i_usb_phy_cfg {
> @@ -859,6 +860,14 @@ static int sun4i_usb_phy_probe(struct platform_device
> *pdev) return 0;
>  }
> 
> +static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
> +	.num_phys = 1,
> +	.type = suniv_f1c100s_phy,

I think you should just use sun4i_a10_phy. It has no special handling. I don't 
see a point adding new phy types if there is no special cases for it.

Best regards,
Jernej

> +	.disc_thresh = 3,
> +	.phyctl_offset = REG_PHYCTL_A10,
> +	.dedicated_clocks = true,
> +};
> +
>  static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
>  	.num_phys = 3,
>  	.type = sun4i_a10_phy,
> @@ -988,6 +997,8 @@ static const struct of_device_id
> sun4i_usb_phy_of_match[] = { { .compatible =
> "allwinner,sun50i-a64-usb-phy",
>  	  .data = &sun50i_a64_cfg},
>  	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = 
&sun50i_h6_cfg },
> +	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
> +	  .data = &suniv_f1c100s_cfg },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
> --
> 2.37.1


