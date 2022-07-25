Return-Path: <SRS0=wDrw=X6=linaro.org=daniel.lezcano@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A39C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 12:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33091C341C8; Mon, 25 Jul 2022 12:36:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5976AC341C6
	for <soc@kernel.org>; Mon, 25 Jul 2022 12:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5976AC341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id w8-20020a05600c014800b003a32e89bc4eso6263960wmm.5
        for <soc@kernel.org>; Mon, 25 Jul 2022 05:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eR0GeLumhM91/TCzD0goe53MjMncNfAoNQMHeoEkQV8=;
        b=x9mwngfikol7my2J8AreAMA61Jfh0SZy+MqkNIZ0E580llka84AcNAUgYfxeHRzMeu
         MxeVRAtwmB6xZygLXJxkhw3QzbmskycEHylnjx0ZvM4fI/Fz+uQ6F/zQp3Dd9ehMIdIs
         isz6x9bLsh0kuVCC5G/qkM0bSyxA7vwbSDUqVpvvqWlt6ZqcsJ2ZoJc+LWUDHTGqYxl4
         N7fa8MQ3ylJ/GObIejynK33wt+Ck9d1rrPdvGKa7Uh68B1r3reP05BSy1CH4noZCFIXR
         SW6tmTeb6TRnTRQL0QwYY9zzPpB14hI+Q9rP7KtTlSS8g5et7g/KbUNai+VTM4g+vYKC
         U1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eR0GeLumhM91/TCzD0goe53MjMncNfAoNQMHeoEkQV8=;
        b=ofgImd+Wwe4+U+dxO3RCsKOiFa8ZMn6GdyrgejvsDNvQBANtZprO6LPU0OPO3DxIFO
         sjrKZTbfL5CpNRWaUE8f0yMrUYHhRhmrsXjFqCNgnAjmkpqzKxwrIbjfR1hLkGOVN8Jb
         jwR6otLwhYX3sB3G4Z0frF0qwU4yFLhUz7Dqew9GImZ3dKU4GMIFQ3Drkg1gGzJubTw2
         j0Vax9mwQAQIK0//fab2pBhLjwBoj1jCiy3Xq9MWkiVoJurwegWPNGQUR3Xwa0vh1rXM
         8Nvi1XF0zQ37Uu8IYPszBW/3Eo59DrJf1kSUqRvZYa4GUKU7x9kWrUA2KFu9VHhihAwh
         5dJw==
X-Gm-Message-State: AJIora9bKIeSh+5RJZ52aNZvUe/bR1ViYhrg5tBp4uQ1TYFUFwIGGzUx
	jevDBDOHfKDDp8GQ3+wlVoAMiQ==
X-Google-Smtp-Source: AGRyM1s6geEfXSHGYaVDq14Sx9ppzfsFySaD/JaN0xkvki2bCUkGIZlt1FARgPm3BXG4IuShwYQXYg==
X-Received: by 2002:a05:600c:2652:b0:3a3:2a3e:a2de with SMTP id 18-20020a05600c265200b003a32a3ea2demr19979264wmy.174.1658752578639;
        Mon, 25 Jul 2022 05:36:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1780:8e54:dd38:6668? ([2a05:6e02:1041:c10:1780:8e54:dd38:6668])
        by smtp.googlemail.com with ESMTPSA id g18-20020a05600c4ed200b003a3199c243bsm24698309wmq.0.2022.07.25.05.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 05:36:18 -0700 (PDT)
Message-ID: <f34c9583-7d00-0adc-1cb8-f4fe8a8dcae6@linaro.org>
Date: Mon, 25 Jul 2022 14:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 02/12] dt-bindings: timer: gpt: Add i.MXRT compatible
 Documentation
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
 linus.walleij@linaro.org, tglx@linutronix.de, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
 marcel.ziswiler@toradex.com, tharvey@gateworks.com, leoyang.li@nxp.com,
 sebastian.reichel@collabora.com, cniedermaier@dh-electronics.com,
 clin@suse.com, giulio.benetti@benettiengineering.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
 <20220723160513.271692-3-Mr.Bossman075@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220723160513.271692-3-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/07/2022 18:05, Jesse Taube wrote:
> Both the i.MXRT1170 and 1050 have the same GPT timer as "fsl,imx6dl-gpt"
> Add i.MXRT to the compatible list.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


> ---
> V1 -> V2:
>   - Nothing done
> V2 -> V3:
>   - Nothing done
> V3 -> V4:
>   - Nothing done
> V4 -> V5:
>   - Nothing done
> ---
>   Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> index a4f51f46b7a1..716c6afcca1f 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> @@ -31,6 +31,8 @@ properties:
>             - enum:
>                 - fsl,imx6sl-gpt
>                 - fsl,imx6sx-gpt
> +              - fsl,imxrt1050-gpt
> +              - fsl,imxrt1170-gpt
>             - const: fsl,imx6dl-gpt
>   
>     reg:


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
