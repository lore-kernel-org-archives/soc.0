Return-Path: <SRS0=YV+F=CH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4F3EB64D9
	for <soc@archiver.kernel.org>; Mon, 19 Jun 2023 06:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63E50C433CA; Mon, 19 Jun 2023 06:58:58 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F519C433C0
	for <soc@kernel.org>; Mon, 19 Jun 2023 06:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F519C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5195c85fbb2so3967674a12.2
        for <soc@kernel.org>; Sun, 18 Jun 2023 23:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687157935; x=1689749935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4G6hf18TKdmfNtJ8UCEo6JcM7dVVDUhqliUhTUBuICc=;
        b=NWnPdS7D1gDt3/LuJFeLM1TendCaMiVqQJD+F4P1R56EoN7m1O5j/1TOTzV4tW5QnM
         z3qSJa66nU6AVAXlSKmyMw7NsegMUwKGXm8x+Z7H7uR5VQUe1RKiqUi/3YDf+ipvqVWJ
         hfMZnmJd+vci2rzqV5EBfQaAiBXcZjLfnXZc9zlHgInF+kOyELYsxw8dYpWfkQ1taYhE
         3MqxdfI1BC2AQ5/9xkXVCHr/7zXKiCA1ZPyerIm0vjCqUMKFyA3lc82/CBp5mhvAUe9s
         iKqPqUVZoTtA0nVNpbq/PpBEESHcAtBD3A+maZyrJ1LCYAoDzhcCKF7kY5L9z9XaFWGL
         jKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687157936; x=1689749936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4G6hf18TKdmfNtJ8UCEo6JcM7dVVDUhqliUhTUBuICc=;
        b=e6N/ItZQYcY2xavWbAvzQQMHVzM3Xiq8CRoloueW2e/bJeSJaXXqxbK2fpzayNKJ+V
         FcHg+2jSlp82oggx8Mo+kl+/vn8tHUuUW5jl/2rH9jX7fG/LaFgMjAO4t222N9vEHpse
         H703rV+Mr6wmwfU/MkqHgMnbtIuLYh0qaGQR2f9pBKtmJCy/JcuqRhkQaT1oAWPuUwc0
         FstNz8gilCEnUgLudTNGEtGQh4xz7E7S2/1DVskNsObNj+7RXPLgmDB2Yx3I4yS+mxqB
         R3a6w8NghGdQ3OBdU/kD9QNJIwE5F7GkfOVpXEzJEGYKhaw2Kc9OU3ntkoZEFAzBCfd5
         0W5g==
X-Gm-Message-State: AC+VfDw7l3WkW/8j0G0AHKxRfuWaw7oVsSjxINSnP6ACQca/PVtAnz4u
	aPG920lYCGi2yLHgtWNtnlWXpQ==
X-Google-Smtp-Source: ACHHUZ7dJrESQHn9geXJxEPrr2M7TIYqbkSdh/fM8A4bQoGoLVTjbKoOXm0qEqvY2My4FfHw1MZbAQ==
X-Received: by 2002:a50:ef12:0:b0:51a:f6de:bb81 with SMTP id m18-20020a50ef12000000b0051af6debb81mr150817eds.28.1687157935727;
        Sun, 18 Jun 2023 23:58:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ca15-20020aa7cd6f000000b00514a5f7a145sm12562486edb.37.2023.06.18.23.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:58:55 -0700 (PDT)
Message-ID: <f5e6a29f-6df7-b56c-c7b2-9914008eaa33@linaro.org>
Date: Mon, 19 Jun 2023 08:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: PJ Chen <chen.pj@inventec.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Cc: ye.vic@inventec.com, Huang.Alang@inventec.com
References: <20230619064249.3623-1-chen.pj@inventec.com>
 <20230619064249.3623-2-chen.pj@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619064249.3623-2-chen.pj@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2023 08:42, PJ Chen wrote:
> From: Chen PJ <Chen.pj@inventec.com>
> 
> Initial introduction of Inventec Starscream x86 family
> equipped with AST2600 BMC SoC.
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> 

...

> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: video {
> +			size = <0x04000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +

Drop stray blank lines. Only one blank line, not two. Comment applies to
multiple places.

> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels =
> +		<&adc_u74 0>, // P0_VDD11
> +		<&adc_u74 1>, // P1_VDD11
> +		<&adc_u74 2>, // P0_3V3_S5
> +		<&adc_u74 3>, // P1_3V3_S5
> +		<&adc_u74 4>, // P3V3
> +		<&adc_u74 5>, // VBAT
> +		<&adc_u74 6>, // P3V3_STBY
> +		<&adc_u74 7>, // P5V_STBY
> +		<&adc_u74 8>, // P5V
> +		<&adc_u74 9>, // P12V
> +		<&adc_u74 10>, // P1_VDD18_S5
> +		<&adc_u74 11> // P0_VDD18_S5
> +		;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		uid {

No improvements. Still not fixed and not tested.

Best regards,
Krzysztof

