Return-Path: <SRS0=H+9z=QZ=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC7AC4332F
	for <soc@archiver.kernel.org>; Wed,  8 Dec 2021 10:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FC24C341C3; Wed,  8 Dec 2021 10:48:20 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C964FC341CD
	for <soc@kernel.org>; Wed,  8 Dec 2021 10:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C964FC341CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id u22so3205023lju.7
        for <soc@kernel.org>; Wed, 08 Dec 2021 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E62B7WGzX8nf4wabBN3Nuyo8QyNx1GyQDY+Jwu7/Il0=;
        b=KIQR0nZenE6WiBwGcCP6vJ0l75O11bgeJJNpP3vZMnAUqwhO8tlOLDS1lu4f04muiu
         LB8koX9b1hTnsC/rPf08wfBN6J8H4T2YBlb834pNCZFRULw+q08j4hk1RInoX36kQO5S
         rb9fmIROHpiJWsLVFwCfCZfJszXYxHNHw+0Oq0Fo5+nWgAztO7VcXfcD35XLOd8jinSx
         FOgAeyW9y+5LWhdatDM/JhSGvqzAyjIWPUs6CzeJYHrCoC0Tjcy/GJ0fngcs9EVwtT/B
         6Q8g8UhNDxe0N7WcQvfVUzdEyXOTS94E7gMkyO8gZ8S9rRXBrT1UgkqyfenpDmNIiUey
         avMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E62B7WGzX8nf4wabBN3Nuyo8QyNx1GyQDY+Jwu7/Il0=;
        b=WQ0huJNwOS9YCuNvtj3MPlB8o1/moTwlzpsnWdNl+jnzGLquF6+I1Dl1me+1joBbCE
         ChJNQr9yjYBMQm4xZdsrXsokk2oAPyXE8oKpw9zRnaLDckv8KLr+thvCKqVhoiBQs9UU
         JvCoxSGlo5jiVm6q0j73CLSFDZhOE7m0Hc13RbV2/mymvzmhz+5m+tZiOlZyignVsyJG
         YrinnsAsERCz6xXn8UDBBucYYXVHpdQNOJzAzA2H0wIyyRuPRfTuPv7tPjIIJCXFxbOg
         Bv9o9FqsjGOL7qpSuhhRYPBdoKRgWpQE11DqiafaZhm2bK8ldipN4ETMyGJ9MVFyRV1F
         +8dQ==
X-Gm-Message-State: AOAM533XYaq8rr24dmIABbZKZyzhFbbaH8iDkLnaAaefCCqZIsaCk6fW
	QNqFREX4RBXd1rEwRcvrMG2bGsTVfyjnMGC249LGUA==
X-Google-Smtp-Source: ABdhPJzXfR8qOAF/m2qhhgl5Acc3CRElQWGZIWAeKDmrdGuMwdUITXnr9Tae73rE3jghR+UE+v0pecgM4kb5GiRKDcI=
X-Received: by 2002:a2e:80c3:: with SMTP id r3mr49750019ljg.4.1638960496893;
 Wed, 08 Dec 2021 02:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com> <20211204061042.1248028-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20211204061042.1248028-11-Mr.Bossman075@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 8 Dec 2021 11:47:40 +0100
Message-ID: <CAPDyKFrgfqCbWh6BjSn-dM=pVf+eCGwWfQ9r0Y32hXahd=GnWw@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT
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
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Dec 2021 at 07:11, Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add i.MXRT documentation for compatible string.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

No need to resend this, it's already been applied.

Kind regards
Uffe



> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> V3->V4:
> * Nothing done
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index 19621a2f8beb..0912055b4089 100644
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
