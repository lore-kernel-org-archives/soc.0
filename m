Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9C4C433EF
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82673C340E5; Tue, 18 Jan 2022 18:24:25 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38714C340E0
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38714C340E0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5F77A3FFDE
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642530255;
	bh=mLcBql6ry0uXjx6vo+gnKoiWq+07y5Vfuzwy6oiJwJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=T1+tO+WzYP/hN3IfHh0xrxU+2xOYeJ8ECvPIHhA3y6uijtmsk7tY2O6AEvKD90q35
	 7tEYTbmP3NvsQDp+T1LsL9xZWySVty9n95pUYagwn9hcBTsx+5ncw4p0QQ6bt24vd1
	 W5/NTcyByVE+dHR5b3zTaREinoUZN9KwaAYkBeEJQOnfiFh+ZTzRFMuypcDv1ZrEia
	 xFF8ipGqPQAGeLiOvfMGYmhWHr/9bFu7wPwLHWqSAsSjXZWUjD5uOEcjfcyKJ02+wD
	 bA+OyfPRnn6KPrU34hCJghOgFl312wneUS8R0osd803fBB7zGO+1VxrN8kUxdrXk7n
	 5TwHoVqBjvWcg==
Received: by mail-ed1-f72.google.com with SMTP id el8-20020a056402360800b00403bbdcef64so1891758edb.14
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mLcBql6ry0uXjx6vo+gnKoiWq+07y5Vfuzwy6oiJwJQ=;
        b=mgp8Qt3oMxhDK5xd4PdmeZkSIaQxZ1tnZr8TbzIvFaD8pXRXRrUKGakoZ/pLWBPU1F
         4TTFGBvf4eu5bde3outbi1Xgss4XWbIfEr8nixknM4EBEJb6cedCoGsE9PYAQKDEgAdD
         HJSPgGM2nSlY5K1kg4klvy8A+kgMrG/qeb3PPn3Kg0D8Nycy9uHGgyk/W7SbBn6LcyUW
         FmpalpZ/iFdXGW5/VdU6/ubXNUvUISew+6R8hapQQPqWsMR1tF7qy4Bs4ulEPXjAJi5Z
         G3S1J/JteWbm79Z+2UHjWSaWl9alxNI2E7tjx4tBgWMR/JOJdh4g0xgJpbCBJ/DtcqBT
         45vQ==
X-Gm-Message-State: AOAM532Bcg51w9mN4cbdvSoHDzXs/qcHHXDNBE2kNq0NEQPBLLOiJ63u
	xn9b/DkJ0NPmok3byTVRGD+9xkMyo242oTeJzEvi7AkCBLGxFoSes5FPKy0VZU4rJ+Q7aYJuX2e
	HYKHcnwZv01dbaD6JoTj2hYE=
X-Received: by 2002:a50:fe90:: with SMTP id d16mr26971832edt.361.1642530252979;
        Tue, 18 Jan 2022 10:24:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztrE0/iDUvJZuDQ5B9d9jHRgMofzZ3cOcTTHrRpyH4UXtBTQXBgCc7/qL6dnTKZQKwt/9lDg==
X-Received: by 2002:a50:fe90:: with SMTP id d16mr26971820edt.361.1642530252835;
        Tue, 18 Jan 2022 10:24:12 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b2sm191457edv.37.2022.01.18.10.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:24:11 -0800 (PST)
Message-ID: <735d1001-abcb-67d1-75a6-17db11cdec40@canonical.com>
Date: Tue, 18 Jan 2022 19:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 03/16] dt-bindings: clock: Document FSD CMU bindings
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150022epcas5p21912423606220552a78c7e22e4133a05@epcas5p2.samsung.com>
 <20220118144851.69537-4-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-4-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add dt-schema documentation for Tesla FSD SoC clock controller.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../bindings/clock/tesla,fsd-clock.yaml       | 198 ++++++++++++++++++
>  1 file changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml b/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> new file mode 100644
> index 000000000000..dc808e2f8327
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> @@ -0,0 +1,198 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/tesla,fsd-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tesla FSD (Full Self-Driving) SoC clock controller
> +
> +maintainers:
> +  - Alim Akhtar <alim.akhtar@samsung.com>
> +  - linux-fsd@tesla.com
> +
> +description: |
> +  FSD clock controller consist of several clock management unit
> +  (CMU), which generates clocks for various inteernal SoC blocks.
> +  The root clock comes from external OSC clock (24 MHz).
> +
> +  All available clocks are defined as preprocessor macros in
> +  'dt-bindings/clock/fsd-clk.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - tesla,fsd-clock-cmu
> +      - tesla,fsd-clock-imem
> +      - tesla,fsd-clock-peric
> +      - tesla,fsd-clock-fsys0
> +      - tesla,fsd-clock-fsys1
> +      - tesla,fsd-clock-mfc
> +      - tesla,fsd-clock-cam_csi
> +

I am not particularly happy about FSD naming (so SoC name, sub-arch
name), but Olof was fine with it, so I won't oppose. Bindings look ok.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
