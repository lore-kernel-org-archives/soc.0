Return-Path: <SRS0=Ozy7=QQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BEBC433F5
	for <soc@archiver.kernel.org>; Mon, 29 Nov 2021 01:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82486C53FCF; Mon, 29 Nov 2021 01:06:18 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB43CC004E1;
	Mon, 29 Nov 2021 01:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB43CC004E1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id be32so31421990oib.11;
        Sun, 28 Nov 2021 17:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gpRRvK9r9O97XvCAiJTGMmQVu03foEfqtRsiLywdxH4=;
        b=aAo/h1XolkxW0sIyW7H2bsp+MBU6YdndYMSkug23BltYjgXzT1XVza+XwYGtCL1Sbo
         F+YdRmYYzlQx5HMjAHYY1VTmrOZf9YQJa1eQ2nbD1P0e8CQovH3zYMYHEBV8vwVppogS
         pMpDbxPpDXYvSfjHcdB6vmXF9ODteZXXlw+DLz1FexwCbrbtFLyQSOiGZDx+jszRzU1K
         aZUxa9MDOmlo0tWUVOVn2KEoZVOxCPJ6/AE4Im+1pLchUwvos5I8udP9rgFqQQmMDMjn
         qKf39MuPw1LLlmGqZj5f+EaKGU74ozVdiv+zUdbU/pcRclYPu/PXQr2scBwhUHnOPkc/
         sL/Q==
X-Gm-Message-State: AOAM532lgiCWoIgecUpX0CveCaqMyVozCCCUTP3SasGJoQdaLKoB7k03
	q4dTIj0QugrwwFCz3LmzIQ==
X-Google-Smtp-Source: ABdhPJy5D3GTNsvBMul80UgG3Lo1JoUnIUKs/SP1wv8plmtcYo5HCaIWhD6EfHm4biI5heyxosXndA==
X-Received: by 2002:aca:2205:: with SMTP id b5mr37485428oic.177.1638147977123;
        Sun, 28 Nov 2021 17:06:17 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id n23sm2640740oig.4.2021.11.28.17.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 17:06:16 -0800 (PST)
Received: (nullmailer pid 2942765 invoked by uid 1000);
	Mon, 29 Nov 2021 01:06:04 -0000
Date: Sun, 28 Nov 2021 19:06:04 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Mr.Bossman075@gmail.com, s.hauer@pengutronix.de, linux-serial@vger.kernel.org, mturquette@baylibre.com, jirislaby@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, olof@lixom.net, robh+dt@kernel.org, linux-imx@nxp.com, stefan@agner.ch, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, linus.walleij@linaro.org, abel.vesa@nxp.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, linux@armlinux.org.uk, giulio.benetti@benettiengineering.com, shawnguo@kernel.org, sboyd@kernel.org, soc@kernel.org, linux-clk@vger.kernel.org, gregkh@linuxfoundation.org, adrian.hunter@intel.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v3 03/13] ARM: dts: imxrt1050-pinfunc: Add pinctrl
 binding header
Message-ID: <YaQnfBGC2NhXeWEA@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-4-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-4-Mr.Bossman075@gmail.com>

On Thu, 25 Nov 2021 16:14:33 -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add binding header for i.MXRT1050 pinctrl device tree.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: move pinfunc from dt-bindings to dts folder]
> ---
> V1->V2:
> * Move pinfunc from dt-binding to dts
> * Change subject and description
> * Change licence to "GPL-2.0+ OR MIT"
> V2->V3:
> * Change License comment style
> ---
>  arch/arm/boot/dts/imxrt1050-pinfunc.h | 993 ++++++++++++++++++++++++++
>  1 file changed, 993 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
