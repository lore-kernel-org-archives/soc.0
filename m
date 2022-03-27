Return-Path: <SRS0=7NJY=UG=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E9C433F5
	for <soc@archiver.kernel.org>; Sun, 27 Mar 2022 19:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 975B2C340F0; Sun, 27 Mar 2022 19:06:33 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5080C340EC;
	Sun, 27 Mar 2022 19:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D5080C340EC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id h23so17372396wrb.8;
        Sun, 27 Mar 2022 12:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ll1EHkrJQGbMWuBiZ52whwPW7D9ncmXOlUyWZdkQFa8=;
        b=nL1VKVuCaHwWxmRmb2Dn4t8lebb86lstPtRKXy97vqWmZprg/sDIyDyz3YIgBiogpx
         dwWSqby9XrdpLQKleWX0LbYuGlDeEqWYa03WpGKjbUuFzom0rOtzkNO7pI3uNRfqgy4e
         OFIfKGYwgSh1kkO9+x0608xBpGOG/MDdTccU6ZWsHHIEWGtv9mmvj0UkcwNK+GMUGUYe
         wXOj9B+BDAaFeLbM5hS7/p6zSBiKkdEURJYgCCvMqL/hAs8eH0XMSaLHgcPSgoPLHZ+l
         qIwWo9MYKP9oT+PgTU+McYoipcWrYkwbEolHotRuhN7hS+2C44672FKSpAt4AGdF+JXl
         8A1Q==
X-Gm-Message-State: AOAM532FZ+5KB/lttnO/y0j1mpiNfZ04PYGHtZjMZNuDNBYUae1nqh63
	VIjyqY+a5jhUQiT12qjpfG0=
X-Google-Smtp-Source: ABdhPJz/my4VzDnEV9yFVeCXb5EyongRdUMvxKA1PHdYDpHE1k/AUDAJKQ34W85UwabacM7E3JqqhQ==
X-Received: by 2002:a5d:6487:0:b0:205:7c2b:b6ba with SMTP id o7-20020a5d6487000000b002057c2bb6bamr17678468wri.283.1648407990933;
        Sun, 27 Mar 2022 12:06:30 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id p8-20020a5d59a8000000b00204178688d3sm11472248wrr.100.2022.03.27.12.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 12:06:30 -0700 (PDT)
Message-ID: <edc4011d-5bfe-8ec5-e76b-61952cb3b9eb@kernel.org>
Date: Sun, 27 Mar 2022 21:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 02/12] dt-bindings: timer: gpt: Add i.MXRT compatible
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
 <20220326144313.673549-3-Mr.Bossman075@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220326144313.673549-3-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2022 15:43, Jesse Taube wrote:
> Both the i.MXRT1170 and 1050 have the same GPT timer as "fsl,imx6dl-gpt"
> Add i.MXRT to the compatible list.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> index a4f51f46b7a1..716c6afcca1f 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> @@ -31,6 +31,8 @@ properties:
>            - enum:
>                - fsl,imx6sl-gpt
>                - fsl,imx6sx-gpt
> +              - fsl,imxrt1050-gpt
> +              - fsl,imxrt1170-gpt
>            - const: fsl,imx6dl-gpt

This looks ok, but your usage looks wrong. Did you test your DTS with
dtbs_check?

For the bindings only change:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
