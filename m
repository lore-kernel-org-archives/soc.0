Return-Path: <SRS0=ywYp=QP=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DA0C433EF
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 16:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7D3AC53FC7; Sun, 28 Nov 2021 16:33:05 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42207C004E1;
	Sun, 28 Nov 2021 16:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42207C004E1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id t23so29724237oiw.3;
        Sun, 28 Nov 2021 08:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DTKKUggdynPAqGJsI3E9zzyw5Kukgsz0VXc1dJCbKyg=;
        b=Dl8JcCK1LISWITDTZvsUoFrW0hUO1FPH9n/HA/6vEdG8krcNoJmKjTpnYBYWLeyHtF
         XvNssg22xkcpsTdo93STonBAe876h82Qj8NzN33O80mQLcKgg7Hw6wnbu5q/1BjOBfce
         irU9IUAskRtnJwSuF/ofvDannTcLpQf6DjT0KCqTVE3URjQR03lrVywJEj6BNVh5Q8rM
         rGcmzoTLk1MmVIxUOJXItZrj+bNV0ZSkGQ0etZy9ez3Cd4x/43zVEV9EuzkT4HRWhI27
         F1MgAdGKGUxasjx6+GzNIdXU9GzV3XenfTk7r0QK7z6+TzFN4p76B8ET4cbYxCqzCBtV
         vL7A==
X-Gm-Message-State: AOAM532e03IBEFZWLP+2oBz5I3KwqXXmmVv8hPdrvaLKZkYf4jeR5UeB
	q/5cKXf/QkaMNBP6vhDMKA==
X-Google-Smtp-Source: ABdhPJxBpTcV7eWTx2svyTY2PH5cK/LgWeTgOyLP0qd8SaQ0EyLZ4KwjQ8u5w8helE0S+iaxinbO/w==
X-Received: by 2002:a05:6808:14c4:: with SMTP id f4mr35933867oiw.76.1638117184444;
        Sun, 28 Nov 2021 08:33:04 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
        by smtp.gmail.com with ESMTPSA id w24sm2173942ots.10.2021.11.28.08.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:33:03 -0800 (PST)
Received: (nullmailer pid 2680013 invoked by uid 1000);
	Sun, 28 Nov 2021 16:32:58 -0000
Date: Sun, 28 Nov 2021 10:32:58 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT
 compatible string
Message-ID: <YaOvOsVzPXQrCmTb@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-11-Mr.Bossman075@gmail.com>

On Thu, Nov 25, 2021 at 04:14:40PM -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
