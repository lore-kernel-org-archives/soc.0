Return-Path: <SRS0=S0VK=QR=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080A1C43217
	for <soc@archiver.kernel.org>; Tue, 30 Nov 2021 15:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAAEAC53FCD; Tue, 30 Nov 2021 15:42:29 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C127C53FC1
	for <soc@kernel.org>; Tue, 30 Nov 2021 15:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C127C53FC1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id l22so54846806lfg.7
        for <soc@kernel.org>; Tue, 30 Nov 2021 07:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbWKM9Xn2xFZwaHfEK9OEQJFZXBlU8alMZMLf++BEkY=;
        b=hNo72FJguIUw3J4//SCG1WE05GM6kn91yQQeLaGkFBRyHnRInP5JIaBXX7Jg7auqq0
         E0Fp4993Kl+eV8htXH+Vn830560XGTxmPMdXeWicmRSImFt7QHIhplsO4zdKCN4b8106
         gIAMgoE5S3IeJrlX1rqiJD4NZDbDtX6CWj7OzJHIIHtoed75dOjR5AS42OjJI1c1cGA5
         GdFIp6gVb8+ErETwzVIx67blxGjJEIcqgag+8aYwmxPIa6xs3tOHM/0CMOwvrXTpHiaO
         gSJRCsR6eaXF52pWr4AgfTVpzASpuYt890glq2JEYebV96xb+F7mJGhBEzw+Nm+jMFvg
         0vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbWKM9Xn2xFZwaHfEK9OEQJFZXBlU8alMZMLf++BEkY=;
        b=gMIp/NDFs+qJADutaNQynAW7iCeyq3WKvNval7goSEgvg6AVBmkw/DVdQtfmgt7HSK
         Lcxr/vSYB0Hs6yGP7PNVfwKtKbllSeoUE/4iiS7UGJ0/5+WWk4lApeGN7bD3QcsDxBEf
         FP6OcfMmDlfhpQupPFOwvSEZsh+W2HKVKgrJHCUl/f5Q4gWkmsuVvjVmGh9T/tHNNbVz
         G46e+3L/k6DREtZ0cG35qXvW0du0+MfJ/cFEftvxsmmr+1iEGhWC3sBsW+cHEBa0A9Pl
         iY9aMCVWq+XwEFuxkpdSywwZ3rbbIduIlRcJFfNTIjBaztrLsuxTddaqQ+SgNr7GSrt+
         tXDg==
X-Gm-Message-State: AOAM531GGg5TI9zXFIUhEKqoy194w4ru63GiMbvRLEkRPuc8JhIJlfpc
	r3IgdVXXjU60xTzwyrye4E2bYAHeY8FT6HAEE5F3dg==
X-Google-Smtp-Source: ABdhPJxkVm8zHo+0JrioJtZwtgAfyQdYXd1nGp/UrLj5Wi3K+MS7vNAPj00qeL3DDQrtGJ7m/zhMDNmerhnM7oZ2vtg=
X-Received: by 2002:ac2:5a46:: with SMTP id r6mr4420lfn.358.1638286946279;
 Tue, 30 Nov 2021 07:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Nov 2021 16:41:49 +0100
Message-ID: <CAPDyKFqxso-_ed4KsFO9c1M_ss65KKAPf9wYiKKOU_oLCUvzcQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT
 compatible string
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	Kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, 
	arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, 
	abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, 
	giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Nov 2021 at 22:15, Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add i.MXRT documentation for compatible string.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index d5be9863009c..3fd6deff07f2 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -34,6 +34,7 @@ properties:
>            - fsl,imx6ull-usdhc
>            - fsl,imx7d-usdhc
>            - fsl,imx7ulp-usdhc
> +          - fsl,imxrt1050-usdhc
>            - nxp,s32g2-usdhc
>        - items:
>            - enum:
> --
> 2.34.0
>
