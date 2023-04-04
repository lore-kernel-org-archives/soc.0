Return-Path: <SRS0=U1k6=73=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CAEC6FD1D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF209C4339C; Tue,  4 Apr 2023 08:16:29 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC7A5C433EF
	for <soc@kernel.org>; Tue,  4 Apr 2023 08:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC7A5C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id w9so127193473edc.3
        for <soc@kernel.org>; Tue, 04 Apr 2023 01:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680596187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=miHUyUNmojfIItEHS1ocDVFcVyQlVzUoZy6LNzCd8iM=;
        b=j+Z6LlwyGlurTnhoA/v00QGDlGgTS8okFCWMxdIAg8t0gKOJ0+fKDy+zcEZf6v6CO6
         3VByImao6RBMcgTCCz/uWmeOpxSlpkqEp7PO9pn6muH3GLxkM1E9+geE3iyMXhrV/T/W
         W+Og4jUJrBQF/zreX0bFL5713QMYfQ5ZNa01iI/3dHEVwAM0VihOw04APgFLTYdP5YeQ
         CaVfBGGnIl3+nz8c03tWwSDwrN06YgA0FJ3DssmlZ1YCtrbdlLjfBCts0ETJ5sXqNnOA
         3kLSUXyWEzRkKBSJ6ETyuoElvv4krzIrzbzGsU/SzUZtTe+UOVldPrOrLESsbmt6Ydrh
         lkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680596187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miHUyUNmojfIItEHS1ocDVFcVyQlVzUoZy6LNzCd8iM=;
        b=aapkKuvbeg3ilsoUasOX1x300aLMIcdO1FZA5BtTPmOAddZW6CsNJtK3nG3b3BQOez
         gn64PSLlnJ0nYofFaVCcvHvz2uQoLN/LDAaYsm3nr2KTrBhXcU0u1jmF9AFtYOC4Bzkh
         /c5tAkG53zqZ7UFs8R+m/5qZvP9cPyj5XglXxw8LVLns1djFdN67YvA4rdNk0Yh2Ec9d
         8dQLqK90KMHPPS+WGhBudFYQlOvaHYIIXjFe4GuQn1Dh5iUEVT6M+LbmJSxtlr9J+R+j
         Equbmm5ezefs2/Te8V6y4+xbKq7Z0hn5diDCIzrTSFZva5OKPDXgmZA9AMEn3dJ2SZst
         l/Gw==
X-Gm-Message-State: AAQBX9e0GnHwkOrcP1s3gcnnMapOnoGi60BXZYk3jOkymEtPbJ10OMhz
	zz4MPXRISos8kCFBVo2HIlkKKA==
X-Google-Smtp-Source: AKy350ZwDvqnyIubzzt0HCD26W8pCbMIetSIJ3v9g3Iard2u2TxiyleGqkFBQt1Tu0D3z5Wt2qEQIg==
X-Received: by 2002:a17:906:20d7:b0:932:d2bb:4fd with SMTP id c23-20020a17090620d700b00932d2bb04fdmr1315066ejc.58.1680596187048;
        Tue, 04 Apr 2023 01:16:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e? ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id gl25-20020a170906e0d900b00929fc8d264dsm5714850ejb.17.2023.04.04.01.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 01:16:26 -0700 (PDT)
Message-ID: <27076f5c-1693-75bf-2ae9-d0e232b80b02@linaro.org>
Date: Tue, 4 Apr 2023 10:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
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
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-3-stefan.wahren@chargebyte.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230404080243.9613-3-stefan.wahren@chargebyte.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2023 10:02, Stefan Wahren wrote:
> This adds a dedicated devicetree binding for the Maxim DS2482/DS2484
> I2C to 1-W bridges, which can be extended later for further features
> (e.g. sleep mode control GPIO). Since one wire is a bus, child nodes
> needs to be allowed here.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

