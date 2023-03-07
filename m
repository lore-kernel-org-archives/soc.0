Return-Path: <SRS0=Mj3k=67=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C16DC678D5
	for <soc@archiver.kernel.org>; Tue,  7 Mar 2023 08:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2DD8C433EF; Tue,  7 Mar 2023 08:23:10 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69BBDC4339B
	for <soc@kernel.org>; Tue,  7 Mar 2023 08:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69BBDC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id s11so49019516edy.8
        for <soc@kernel.org>; Tue, 07 Mar 2023 00:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678177386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsvQEVxWDlGqG69PjKx9UwP7aecD3y/kUgXUmvfhHcQ=;
        b=lsQEz275pvH+8FEj/h7Ww0GEFcurhFSWm4+mdoMwomxK5qXxkz2O/re+ouGJQQUs2M
         yqgZlws2ppqtaEwPjP8/OIA0TaDB6hFJ4YPfu/twHafTCHBhb7e3ToeH8eVKGt6iEvSp
         q1vHYlnf7bGpikgLk1zIrov7DJ0xl+b11ROJ7DETq60rJR6PRcSlB3rWCNlrd5Ldt9Ry
         5kpNhu5TwJieQ+RhUUcqWk7CuGZXLdEOu7F/f916zkGuv82pE0E1kjmTUkYc8ujylZAQ
         J4TUYTAPwHBfWHNk4AXWXs3UOX4+VgyWEPf+ywmjvnY0nUt+VgkyCrNagRpmNEwj5pSh
         8gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678177386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsvQEVxWDlGqG69PjKx9UwP7aecD3y/kUgXUmvfhHcQ=;
        b=WgK3LHVLjOh8V0O6rxmgxYDOBOrzV5aMBVBzjOKQRwrCHc9vF1M3OTsbwWvhVEsnko
         ZsoQp7+EbSivC6CsOcyLGzEaya6NEDN4qxHK5jWq74drXHB9mZQi2w+65Zv4QcYlzfm+
         hF3xdmnXZTErev1CE35U+YTYFF/0K31wXlU6Ecs3chKiACC0H21fecbihlcWSaPC5gYM
         iHqcYuElTN7aGlZHb+6SixT4/j9HUq4rIxughGcJ6+FuwtyIceHuSaZEHvOywI1GZ0J0
         XaEAG9IJ/sCJsCMxyE3riv++BZ5mn6XCA+C9QH96ezZB8AmjgOd5W+/xVua1FYui15Ta
         TZUg==
X-Gm-Message-State: AO0yUKURncstPIk2203IADoNRuf9iE1gKwqF3ty1DiflUv4ZwFvU6B/9
	RI0yURAM48Ii1OGQVqcw4i6tkg==
X-Google-Smtp-Source: AK7set/pI4T5zAiugz10LG3mVZbxPx0VWV8mlvPrlq47VZ6OHWxQlyt6zxG0+wRCbDHpRtbVbNP0Yw==
X-Received: by 2002:a17:906:8a72:b0:881:a3ec:2b40 with SMTP id hy18-20020a1709068a7200b00881a3ec2b40mr12386452ejc.59.1678177386739;
        Tue, 07 Mar 2023 00:23:06 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id y7-20020a170906470700b008ef13127b5fsm5714065ejq.29.2023.03.07.00.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:23:06 -0800 (PST)
Message-ID: <633b1e27-d148-62d2-ef83-2d0da432c0a7@linaro.org>
Date: Tue, 7 Mar 2023 09:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/8] dt-bindings: iio: st-sensors: Add IIS328DQ
 accelerometer
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
 <20230306172249.74003-5-stefan.wahren@i2se.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306172249.74003-5-stefan.wahren@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2023 18:22, Stefan Wahren wrote:
> From: Stefan Wahren <stefan.wahren@chargebyte.com>
> 
> The ST IIS328DQ is an accelerometer sensor compatible with
> the existing ST sensor binding.

If it is compatible with existing binding, then make it compatible.
Although your driver change suggests it is not compatible...

Best regards,
Krzysztof

