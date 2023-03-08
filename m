Return-Path: <SRS0=94f3=7A=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B026CC64EC4
	for <soc@archiver.kernel.org>; Wed,  8 Mar 2023 08:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79F35C433D2; Wed,  8 Mar 2023 08:44:50 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7091DC4339B
	for <soc@kernel.org>; Wed,  8 Mar 2023 08:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7091DC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id cy23so62460335edb.12
        for <soc@kernel.org>; Wed, 08 Mar 2023 00:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678265086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8X8oossssHZ/mYv0HHxeiQFRMY1H8SzjxfV4O0bYpxc=;
        b=eOZ30U3mjKF/Cw9QM6xyMeQcI4S12Jzpe/WsVPpZSKlo9hSirDtP0v25PuRMKwY9SJ
         F6Vxp/LKWQGTJF2re07vLGRbI/qR7axk59dnlw0TPiKhT1P/eMQfSGK5xPjN5t8boyKO
         QNuMJR1NmoDaIkoaz+Fewxz3E6ilRLy3SF2qGOlobFHGNyoaWsOPTAAcOyXn8Fqvxz6+
         ISpFkJxLz5zYNs1+n6uQmPdYkF8NX4ilxEoyILSYMTBCgLa2wlTgdquO3QW/dmwtyMBt
         F6QBhj4MFNoAtQp3X2ZmNaHWJz9P8yN9NY3Cleu/L8jXGxkSAavgNzM8QJfuHg4TsyGg
         GetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678265086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X8oossssHZ/mYv0HHxeiQFRMY1H8SzjxfV4O0bYpxc=;
        b=X7+ESr622kENjffC8AyVUIC0Ubr3OCm7JrilUXF0477+cAK/zNNeADMoexnHKa3+2b
         SvdgXjReqIXNDygqRMiL2yk0KOnYORvgVaJwq715IX9ckoNkhpvJ6NKgi4cDj/iNjiaF
         HbuPMf8N9ho5fBWsfP2Rt61spQz6eHb0zqEI5yoTukmLaQB9uRaTCjEXQTPiYDQfckir
         HCnCghh9xJZx6ma109UemJrsVbpC7CQoRYAMyXSaLTYx3Le5RojK8NgPmOhjuS0npqJD
         evEllLsgWclDKHU/HZKFueJHI28x6SDcNTKlN4yXi+wRSPEGHc7HjdcSjjpDM5G9EoD9
         uOXA==
X-Gm-Message-State: AO0yUKVz7DRaIA5fFMCQ81vdKcikX6QYoXV4nLQCjVO7uGTDBoXQTl9y
	q7c7gQWbVxQLW+TWFqfSCy1+3g==
X-Google-Smtp-Source: AK7set8/wsFI8ZE50pH5OXcMjKAp1LL2QuSi7azOjwKIJIm0TYE9nRCHhZVDF5Boa+jt+w5u3dpdIA==
X-Received: by 2002:a17:906:948f:b0:8f6:c7cc:92ad with SMTP id t15-20020a170906948f00b008f6c7cc92admr19206592ejx.43.1678265086658;
        Wed, 08 Mar 2023 00:44:46 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id h9-20020a1709060f4900b008d2683e24c4sm7237416ejj.69.2023.03.08.00.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:44:46 -0800 (PST)
Message-ID: <d4405379-04dd-1bdb-b1a9-56a4621727d1@linaro.org>
Date: Wed, 8 Mar 2023 09:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/8] ARM: dts: imx6ull: Add chargebyte Tarragon support
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>,
 Denis Ciocca <denis.ciocca@st.com>, soc@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <stefan.wahren@chargebyte.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
 <20230306172249.74003-8-stefan.wahren@i2se.com>
 <d77c2938-bcef-4586-77b5-1cb93b113eb5@linaro.org>
 <a2a39419-86e9-2dff-644a-391248b51a0e@i2se.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a2a39419-86e9-2dff-644a-391248b51a0e@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2023 18:25, Stefan Wahren wrote:
> Hi Krzysztof,
> 

>      From schema: 
> /home/stefanw/mainline/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
> arch/arm/boot/dts/imx6ull-tarragon-master.dtb: 
> /soc/bus@2200000/iomuxc-snvs@2290000: failed to match any schema with 
> compatible: ['fsl,imx6ull-iomuxc-snvs']
> arch/arm/boot/dts/imx6ull-tarragon-master.dtb: /pwm-fan: failed to match 
> any schema with compatible: ['pwm-fan']
> 
> Can you please point me, what is wrong or did you refer just to the 
> deprecated "label" property which doesn't throw a warning in my case?
> 
> Did i missed a parameter?

No, you are right, this will pass the tests. I was pretty sure the regex
for leds will fail here but it turns out it is very flexible and led can
appear anywhere. Anyway the doc states that first form is preferred,
(because it is preferred for all other cases) so: led-1, led-2, led-3



Best regards,
Krzysztof

