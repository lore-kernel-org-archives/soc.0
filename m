Return-Path: <SRS0=7NJY=UG=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5751C433F5
	for <soc@archiver.kernel.org>; Sun, 27 Mar 2022 19:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AB7FC340F0; Sun, 27 Mar 2022 19:04:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D912FC340EC;
	Sun, 27 Mar 2022 19:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D912FC340EC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id r7so16266526wrc.0;
        Sun, 27 Mar 2022 12:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8dxte/Nk3Xo80atGww0qKbqjPcx0rSBfv6e4dj7Bp+o=;
        b=AWtXtDs3j3GaYIhPeIXMoVmv1FTtOO+g5eQVShoU96xYBG1yfCABynn5cZCec3pGie
         6OjDez+nsIWbdhZkvZ5Pudv/FdfH1jC9onk+ZEfI0tCcH9U0zKPAtYzuQsHdsc9rYRW/
         4J5HLTBlRQbIMcxSQ54vVD+Xmw1NLw6zzYtYaGUqASVBJHAt0xzS+kYx42TPoBG6uazN
         9LVzqv1dbdXVZcQ4s77s6jZ9MBmT5dIQOAN91l0W/rnCtCvIe2hoLUGflR/IaAYj5YUw
         ITQhp6agbUn2iST8aKvU6f3eRDHgWpp71T/9RQbtANH5Bw+Yo5qS7hSVPSz4p3BPCDN3
         KcEw==
X-Gm-Message-State: AOAM531e8rBCNivw4r4uBGnp3/ODyMhHpcv3lqbGvn6ga8LndvNiH9+I
	ojjTMiKRAlHluMjSnWMlOH8=
X-Google-Smtp-Source: ABdhPJxgtelMWREwOcVfYU6jhvUzEq+0pS7TbK1Vm24wXlEwm6t6U8r8bXOGWGDUJ08t5C79ijV+mA==
X-Received: by 2002:a5d:6841:0:b0:205:9bc5:9470 with SMTP id o1-20020a5d6841000000b002059bc59470mr15195659wrw.15.1648407883095;
        Sun, 27 Mar 2022 12:04:43 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id 185-20020a1c19c2000000b0038a1d06e862sm14781875wmz.14.2022.03.27.12.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 12:04:42 -0700 (PDT)
Message-ID: <6264b6d2-63e1-db65-f201-41a34437c99e@kernel.org>
Date: Sun, 27 Mar 2022 21:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 01/12] dt-bindings: arm: imx: Add i.MXRT compatible
 Documentation
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
 linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com,
 tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com,
 cniedermaier@dh-electronics.com, clin@suse.com,
 giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
 <20220326144313.673549-2-Mr.Bossman075@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220326144313.673549-2-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2022 15:43, Jesse Taube wrote:
> Recently the imxrt1050 was added but the cpu compatible node wasn't
> added. Add both i.MXRT1170 and 1050 compatible to fsl.yaml

s/i.MXRT1170 and 1050 compatible/i.MXRT1170 and 1050 compatibles/

...and a full stop.

> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 0b595b26061f..59575053ff03 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -834,6 +834,18 @@ properties:
>            - const: toradex,colibri-imx8x
>            - const: fsl,imx8qxp
>  
> +      - description: i.MXRT1170 based Boards
> +        items:
> +          - enum:
> +              - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
> +          - const: fsl,imxrt1170
> +
> +      - description: i.MXRT1050 based Boards
> +        items:
> +          - enum:
> +              - fsl,imxrt1050-evk         # i.MXRT1050 EVK Board
> +          - const: fsl,imxrt1050

Order the entries alphabetically, so 1170 goes after 1050.

> +
>        - description:
>            Freescale Vybrid Platform Device Tree Bindings
>  


Best regards,
Krzysztof
