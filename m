Return-Path: <SRS0=Kx1M=7Z=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFFBC7619A
	for <soc@archiver.kernel.org>; Sun,  2 Apr 2023 10:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0454EC4339C; Sun,  2 Apr 2023 10:28:29 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6AEEC433EF
	for <soc@kernel.org>; Sun,  2 Apr 2023 10:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6AEEC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id eg48so106368675edb.13
        for <soc@kernel.org>; Sun, 02 Apr 2023 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680431306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=of9U+7t6Yuf9+Y98WIM4IUCakS5RAWajzrK84hySHdg=;
        b=tEKG3h1wLi/hGqwYpD36pjDL0MohbkNlngRrseU17jt46mofxhxwA7W2BD9+f1lo0K
         pLc/TfydwCf8aPrfHQMwlr75sG9gj1SkI/v8oIku3Qid2v385Jp97r6J73KYlkf2AzSd
         bc0B0LbFwFmu9Ywm7lP7ni9Mo8HT/RazybqcYRnyU6BtWtSzEv3YxhFnzT39bukkgKDf
         b4m4pwExvMJK7hYMDVpi6cC9PZ7k6XNSKbLmS/WJHWsUg/ByrTFq/tUKEA/voh2tzOKI
         VJsy6QsvwcHP5YK4guZ7cpG3m1QKL8r39xhPwsGo3etmmTK37dlz9X63+ap12WhD16MA
         TtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680431306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=of9U+7t6Yuf9+Y98WIM4IUCakS5RAWajzrK84hySHdg=;
        b=GoMAOGwMP9GYGaXhwO+VFATlrY3weJEwdzX+qHG+GI/0heo6McYMcutgifWJN2hkY0
         25RfYzvd82i46Cwkr6k71mwdN5OSE2LjEWoYrkrM9ZwIHPFv+HBmYygRnyFulUKrtazn
         JhNDfjXBF0MbCguFaYxkGKSokK1MmSCfOrdAhBiRn35UguG0LuPScL7uKpZYbrWeQCn5
         UaUtJB7/AI0jmFdou+GGkA3gXF9bFtjb5KBvU+xbQli6otcRgMiOA9w/axrLi7ZyXF/R
         kynZkbn1lXHvagP2t4Zq4MrtzvPEwDS9pZWAIiadS11x6YG6OpEd5hAJ9/47BJwfBk4t
         JteA==
X-Gm-Message-State: AAQBX9cXGUFXq4aEgzJ8O/BrguYf5dXEVg/WHpx3jkEl77m78QYs/mH4
	V3jOQB9QOjpqFGO9aAN7RuxG5Q==
X-Google-Smtp-Source: AKy350brOmbUTD8JAdjX9mxWM8kcm7XdQ4+erHXIXvxhKN1w3oRn5a18uQmYzzbnS3VVDnozhduOxw==
X-Received: by 2002:a17:906:cecf:b0:932:2412:8abf with SMTP id si15-20020a170906cecf00b0093224128abfmr34927375ejb.62.1680431306117;
        Sun, 02 Apr 2023 03:28:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b009486efb9192sm370873ejc.11.2023.04.02.03.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:28:25 -0700 (PDT)
Message-ID: <708503d5-a272-77ee-b9dd-694e03119af4@linaro.org>
Date: Sun, 2 Apr 2023 12:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V4 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@chargebyte.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stefan.wahren@i2se.com
References: <20230331210840.4061-1-stefan.wahren@chargebyte.com>
 <20230331210840.4061-3-stefan.wahren@chargebyte.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331210840.4061-3-stefan.wahren@chargebyte.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 23:08, Stefan Wahren wrote:
> Even this binding look trivial, the actual hardware supports more
> features (e.g. sleep mode control GPIO). So add this as a dedicated
> devicetree binding for the Maxim DS2482/DS2484 I2C to 1-W bridges,
> which can be extended later.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> ---
>  .../devicetree/bindings/w1/maxim,ds2482.yaml  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
> 
> diff --git a/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml b/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
> new file mode 100644
> index 000000000000..fd692a3a7400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---

This is still incomplete as it does not allow children, but you
mentioned it in commit msg and other two bindings are limited as well,
so sounds ok:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

