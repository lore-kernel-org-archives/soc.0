Return-Path: <SRS0=qGgT=B5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405D4C7EE2E
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 11:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1FE6C433EF; Fri,  9 Jun 2023 11:29:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED1EDC4339B
	for <soc@kernel.org>; Fri,  9 Jun 2023 11:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED1EDC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso2983818a12.1
        for <soc@kernel.org>; Fri, 09 Jun 2023 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686310173; x=1688902173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxiN7myur7/0GPCT/YlFEtOdpW5toTcI/Nywric3aLQ=;
        b=YlzRxBhuCSK70VDV0dZW+ujKcjhx4HbC1rs8EytAHb8rqlU6SU8hxNRMjHUD+QMhcn
         UCrjeGZXEMM8+CmUHgSFl6Tc+O25dEAVREpYDzcAitOG2vNHg8/NTeuZo7z2WQ3+JfzY
         EpDOvc/Z0L0VRXpe2f7gWbJvqhB84RZMSGPinvLDm+mTj4pHERZCtgyg1PQ6FU9Yi2DA
         V5A5Lu49VgLiRma5ieva3qSSZYRU5/U8YENcGSaYIBRiXcDKxVTntV2O1HuqVZF/XXAH
         hBfaDwo/jtGJ4V1aJeOplkASpUJ0UwbrjD8GZfdp/b5ZOJvBOyw+izn11YznXHe4umJO
         hHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686310173; x=1688902173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxiN7myur7/0GPCT/YlFEtOdpW5toTcI/Nywric3aLQ=;
        b=BlsYCWA/jivGR+13IYbJ+Q+bO19OrJ9e4fcwxck3Fad0/TnhiWLY93IN5flj5MbpTx
         dtmZ8ukJjQ92TYABDl/5FhnWQrpd/lXlbn3frRgJjYXP5q0gHVKOsS0SHUjEkBUGHytI
         ORtSN0/rP26ohj9Oa1yVDliYoPnoyYpgJEJWbrcZtA8ruIf68W5uutkQZQsZFLgGLy8F
         FuNg3s/V/Cc+Aze2cOpIy61LGM8GKq1TbzBjOHMHlfCDIUuN541DjUS36vn270RoQO7p
         SxXRULjhvluCaHenMNP/7GwUfhuPROpTOsFHzpS9LD1gtHy6AtZLFYq0Ul0MANZyzgAr
         Qi1Q==
X-Gm-Message-State: AC+VfDwZ+waEbydPO8/PajHGUXBd40n4oH81xQG2lg9WpkgytEUj8MXe
	KqlzqLsb27RqpmoyILRYEcT+Rg==
X-Google-Smtp-Source: ACHHUZ4N8nCzxGEzlpoKN727/QlEt/dtap2HexlEjZXf6BjLVyzoQAOu7/kxf1+AaNNnWVFwP7S9rw==
X-Received: by 2002:a05:6402:14d6:b0:50b:5dbe:e0f6 with SMTP id f22-20020a05640214d600b0050b5dbee0f6mr1096342edx.25.1686310172919;
        Fri, 09 Jun 2023 04:29:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e22-20020a056402149600b00501d73cfc86sm1661497edv.9.2023.06.09.04.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 04:29:32 -0700 (PDT)
Message-ID: <bff5ff40-fec2-123e-9896-6f5445289792@linaro.org>
Date: Fri, 9 Jun 2023 13:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 =?UTF-8?B?SHVhbmcuQWxhbmcg6buD6Iux6YOOIFRBTw==?= <Huang.Alang@inventec.com>
References: <b039b1b2673644af84db8f803bc7d156@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b039b1b2673644af84db8f803bc7d156@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/06/2023 07:59, Chen.PJ 陳柏任 TAO wrote:
> Initial introduction of Inventec Starscream x86 family
> equipped with AST2600 BMC SoC.
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> 
> ---
>  V4 -> V5:
>   - Remove devices not defined in dt-binding yet.
>  V3 -> V4:
>   - Reply with devicetree binding
>     https://lore.kernel.org/all/28f0ce0a82464083ae24f9ef2f598425@inventec.com/

I received only this patch 2/2 and first patch is missing.

Best regards,
Krzysztof

