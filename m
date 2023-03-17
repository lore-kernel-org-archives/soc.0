Return-Path: <SRS0=IDeX=7J=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD73EC74A5B
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 09:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D888C433A0; Fri, 17 Mar 2023 09:16:46 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51A59C433D2
	for <soc@kernel.org>; Fri, 17 Mar 2023 09:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51A59C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id h8so17736845ede.8
        for <soc@kernel.org>; Fri, 17 Mar 2023 02:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679044603;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDhJuFa9ztNNzJ386MEsmsZfgZE8+R1VRwAqONdfi3g=;
        b=CrYsG3TxlEscDin+jaLsbWYWoMPi5jUjoAvGRl1IzafmiX7Vy4QG1dr/PNciGg7oHN
         IBfsPPkBtRBkcgX5tin7o8/B+H1Bcqz8W7iXmmD4fU9H2jCtA1ch9/ZNZ8Id+JV8PxbO
         OnFtZ6MSfkM9p8qae+NslwfPuTFRZOu1LFyEtaUHsAtqJa5kL+/+SOuqfv6tXQ1ogjca
         2iEcVLp5V/Oa8/kYYPig+VI7mc1nXD2oQkE4Lje6/93/PHaNvVk6lVScfY4C9Xvs8cvX
         B/CHG/llxLL7xAcf2COwSlF8EEGSJ+Vb4OygsoZC67d49oEV0vLumQdmxC26Xl5TVIVT
         xg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679044603;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDhJuFa9ztNNzJ386MEsmsZfgZE8+R1VRwAqONdfi3g=;
        b=CPuyKuA6hrzosbqfTGIlTSc7GiRjzhp2dQsmBHdYJiNABM6/UrQw8rOv5/dchm7Z5R
         aWTWa1N1ffZWf/IeeWaZR5Gs8h3pDEzQvxrSFHOYbRJcppjfqVgnqjiKTjBozzbXlu5h
         gPOMSi/tvI2oBd32IhLNmBllouTu7YBDQ+mH7SDllK86cVjJdrT8uL3uMzIWRDqwVRjE
         UxPF6O1ZL3X5kZ2mSnPtJxsw5scI/Hi0WF+HkEaWxLjABl4FCd2A61fndvV2K4T4whK3
         NVRutxb2K26K7rD6B1XLX/1LnCkhb0BWlb5ZKraHxu2FR/9wgUSla+qbyWUz3EkU9K3Z
         eC7g==
X-Gm-Message-State: AO0yUKXQWeCCUP96iBcH+n+KPF4HxZBS9ickDi/5dZ1RBGH1Y0v8BwKW
	Rm2avL4PgFeJmZEPztRKjPUI5w==
X-Google-Smtp-Source: AK7set/XnFwylHKPX1EbrO41LWhUKfHkR4YtY3lPOGskXOuSz9g+w1rCSC0Dpa03IrejO58GbpW+AQ==
X-Received: by 2002:a17:906:a0d2:b0:930:6d59:d1f8 with SMTP id bh18-20020a170906a0d200b009306d59d1f8mr2529781ejb.10.1679044603593;
        Fri, 17 Mar 2023 02:16:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id g18-20020a170906395200b008c979c74732sm725369eje.156.2023.03.17.02.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:16:43 -0700 (PDT)
Message-ID: <58cbe88d-4ac3-c283-e16d-a0c84e04c850@linaro.org>
Date: Fri, 17 Mar 2023 10:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/2] ARM: dts: Add Tolino Vision
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, marex@denx.de,
 max.krummenacher@toradex.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230317081618.2387407-1-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317081618.2387407-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2023 09:16, Andreas Kemnade wrote:
> Add a basic device tree for the Tolino Vision Ebook reader.
> It is equipped with an i.MX6SL SoC.
> 

This is v2, so you need changelog describing changes against v1.

Best regards,
Krzysztof

