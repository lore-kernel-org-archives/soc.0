Return-Path: <SRS0=oh9M=3Y=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CB7C43219
	for <soc@archiver.kernel.org>; Thu, 24 Nov 2022 11:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BB1AC433B5; Thu, 24 Nov 2022 11:53:37 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 342D6C433C1
	for <soc@kernel.org>; Thu, 24 Nov 2022 11:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 342D6C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id g7so2204691lfv.5
        for <soc@kernel.org>; Thu, 24 Nov 2022 03:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPVcl2Eug+5uraZ8m6qhcz30LIzsGZsRRGgxjK4JKkQ=;
        b=UZ3xC41EWV1GfOOrF46u4ZqOAdpreJnnihRyvCq8lvAqy3OFuTuVlphajy3OQrkiKM
         yiWfG2OuD6zm9ZjFA07vazCpZaK5NpnZMDEYzyytqdYG5SEypvLiFctsgb1jewHKxlp4
         YBGw8p3QrzUwOiWsTJPdkx47dyRQ+La9dGB4Gij9g8jMcqbKRhL+3QIJ2wIcF90IVycf
         XyD7EMcpP59Ka5k5ZW0TnO55nPFiLNrVh3hgiQQRXVZVo014j/QLabcpfSXD+gv20FWl
         IieUtv7CjjftVyWTQJdejuAWiJkPoX7nLzKVfs28Ku6yEsYhC3EafaqNPoyYGc5WSXNo
         ZNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPVcl2Eug+5uraZ8m6qhcz30LIzsGZsRRGgxjK4JKkQ=;
        b=X/zrjeWA7OCN64WAwA1Oz3rkDtvrv7O7Zi2HlHvJYeKbzf+UJPvpOfLxWrbweCDPK5
         5MbDKGR5j345sUbF4SZeHXw5ohIHY0etXoB++pGlvsuqzjQ2C3k/0s/8xJKmej7E1Re8
         TzVeOZmrmJQyUF/7fyK9s/aMKVHUOzGU38kjI2+3Qx/2QLk0hUvI5QgZZcUAxDEgIgvV
         n5A2F08HSnqUYv0qJpw2bi+qmeqlY0fDHQbcPDlW1Qm6jsgdHNvScOytumMUNRWwtzu/
         MENccs3AUPoEF7/A3al1T92VDYEsnU6K+9BzbYyTYokXrQmuibFeLO2YvOnpaehjXSNf
         c8lg==
X-Gm-Message-State: ANoB5pl+0rVrfJtNvCLecc8tzUWiNyEXST3ubH94FnSL8cgku9oqtk/k
	ri2lb3vvbYgrWVu+t9u4DlYAOg==
X-Google-Smtp-Source: AA0mqf7BswiRU15d2KnipL8ZZJdBMrUwqe10ADV8X/LEEDqryOG+RLgGnMJu4AYr+KJcmL9hOBAkTQ==
X-Received: by 2002:a19:6b0b:0:b0:4a2:44dc:b70c with SMTP id d11-20020a196b0b000000b004a244dcb70cmr9943677lfa.360.1669290814310;
        Thu, 24 Nov 2022 03:53:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id be34-20020a056512252200b004978e51b691sm97186lfb.266.2022.11.24.03.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:53:33 -0800 (PST)
Message-ID: <0a3b491c-7b91-4732-e280-3e49d9da01c6@linaro.org>
Date: Thu, 24 Nov 2022 12:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: omap: add phytec pcm-049 som and
 pcm-959 dev board
Content-Language: en-US
To: Colin Foster <colin.foster@in-advantage.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, soc@kernel.org, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20221123233209.1854806-1-colin.foster@in-advantage.com>
 <20221123233209.1854806-2-colin.foster@in-advantage.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123233209.1854806-2-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2022 00:32, Colin Foster wrote:
> Add documentation for additional OMAP SOMs and development platforms,
> provided by Phytec as the PCM-049 SOM and the PCM-959 development kit.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
> 
> v1->v2


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Would be nice to convert the file to DT Schema.

Best regards,
Krzysztof

