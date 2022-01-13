Return-Path: <SRS0=+ipK=R5=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E77FC433FE
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BD17C36AF4; Thu, 13 Jan 2022 12:33:26 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A13A5C36AEC
	for <soc@kernel.org>; Thu, 13 Jan 2022 12:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A13A5C36AEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 29F873F1E0
	for <soc@kernel.org>; Thu, 13 Jan 2022 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642077204;
	bh=nozrRCJhGpJqmbYvCljGg8HZE9Dh507qEQxDTQiFa2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=bvyACTi3VRML/vNzNujIiRL/UNvvEId7jXblbignsf0Gy+mzIYbt1XIaO4cgqL0UA
	 Iu53zNhWnGiF84o7iPCunSalA6u3phH24dhOl+3MbS37Uql2Fg4F7NZJ3Ax2bVEi0C
	 Uj6lNbaWOsAXeM+UAEBadOr3opTZ5GGTHaSULmT+1fUcsleO6av2VtJ45xusKf0/up
	 8N03sLZNfNZSstEWItKtRyujzp3hEvGtd/SljxKp0r0JBojC3tejgoK6pZOCa9+36r
	 RH4A74dhojD7bW3HEt0rkwm81jP367bpgz2T1zWK0e0ZQHCoKdE7vWi/vha166SSPz
	 Wo2WiK2MBcupQ==
Received: by mail-wm1-f72.google.com with SMTP id bg32-20020a05600c3ca000b00349f2aca1beso3530561wmb.9
        for <soc@kernel.org>; Thu, 13 Jan 2022 04:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nozrRCJhGpJqmbYvCljGg8HZE9Dh507qEQxDTQiFa2Q=;
        b=Xq1eQ+ayKRbw5ZgP3HonwCYbhSWRd37q3wm0THdeBqAZ1TF50eZqoLmdFsvKn4ORN5
         kqjj6R3g563Zn7UMY/OXbCscq7uAXWlcIhw1o0SXQ8uXJvhjxnPNRFkWnClSSb3X/jEZ
         3mBvhhp9hzSPAjYFDGkvHwJBmOAnY8y+bWNh7sg6PAcYNJ30nzCXsDeyejKAKwEDhnED
         4IhBvejhMAs0gN31wSB8jfetZl/pEUEaO/Q3LSsTbj0BxSGAz293GkfiB6CjdgY3eSd7
         xjQripwg3hISeBx9G/Q/p/h1b+HQpOjsIzy/u/zfruFNbzd0Z1uk+9yxe8TxWoBlUyHi
         oduA==
X-Gm-Message-State: AOAM530uwDT7JMbWrzWcMuZlRy6eifiivlSl5kOepLkJbpWhUNiYum++
	E0jcButRA5RuILidtPEvFAy4JSuNb1bzRGYgyd9eKy2kGN0Kh6kUxR3FPs4t3Pkt982LQ7zG3oO
	AtrpJfW6Kq+Xja+7Y6+HZZaA=
X-Received: by 2002:a1c:9acb:: with SMTP id c194mr8382271wme.89.1642077203728;
        Thu, 13 Jan 2022 04:33:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeidcGH6+/SbUKslGVBMnrfh5gtJs/MXVIuoTJHveED+blfQR9Xg8ks+7ZxN0rNokZjqLksw==
X-Received: by 2002:a1c:9acb:: with SMTP id c194mr8382259wme.89.1642077203579;
        Thu, 13 Jan 2022 04:33:23 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r205sm1395682wma.26.2022.01.13.04.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:33:23 -0800 (PST)
Message-ID: <53c17ddc-a049-72ed-7237-de23db7889da@canonical.com>
Date: Thu, 13 Jan 2022 13:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 13/23] dt-bindings: arm: add Tesla FSD ARM SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122408epcas5p45053d1bf0acf2d8233a98b6c1abab6eb@epcas5p4.samsung.com>
 <20220113121143.22280-14-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-14-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 13:11, Alim Akhtar wrote:
> Add device tree bindings for the Tesla FSD ARM SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/arm/tesla.yaml        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/tesla.yaml b/Documentation/devicetree/bindings/arm/tesla.yaml
> new file mode 100644
> index 000000000000..9f89cde76c85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tesla.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/tesla.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tesla Full Self Driving(FSD) platforms device tree bindings
> +
> +maintainers:
> +  - Alim Akhtar <alim.akhtar@samsung.com>
> +  - linux-fsd@tesla.com
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: FSD SoC board
> +        items:
> +          - const: tesla,fsd

Either this is a SoC or a board compatible... Cannot be both.

> +
> +additionalProperties: true
> +
> +...
> 


Best regards,
Krzysztof
