Return-Path: <SRS0=14BC=WJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAD7C43334
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 06:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5CE5C34114; Thu,  2 Jun 2022 06:40:59 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 128DAC385A5
	for <soc@kernel.org>; Thu,  2 Jun 2022 06:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 128DAC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id w27so4988415edl.7
        for <soc@kernel.org>; Wed, 01 Jun 2022 23:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=llatoePH1yzIqeTSTwUWisKSH5M18dFT6pYJQDMFi7Q=;
        b=LfTg8lbBkthaaOoIVdNwmek5KzPK5Xl7iKlqLhl5N2b9xt1NnauUNH5b0zRqCwrAl6
         +nVZiYsROjD229eGdVCqmEtj7rFgaMYJeP7loEoQG/RKBAx7BdU2ZjrhRhAW1UNjoLpX
         7rYlEHSRmpNk9M+oELAz07OsDaXB8ATqqGQJ15aaVaqLgkfA3Dtis0JHBpVcGbJL7reA
         gwM7LvB3NQM2vp8BwSNtZRE4g2/FKlQ3LPIYpRl28EnxbWPpENVC3Ei7EN8ECV4meQou
         OugZVn0MmICRl7CgKB29V/5flRkBtJXVKoXvCEmPAjE7ZwQo1wbnAlRqnm2zsVwm4YEl
         9LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=llatoePH1yzIqeTSTwUWisKSH5M18dFT6pYJQDMFi7Q=;
        b=EP+qLCfOs1O3n7PjXJAtLYEZHtjytfIpIcXre/YqLKwVnkTV0ZyGB6O+ZKKdFWh7Wm
         p3yPyfwDNbHstC1BgFgdlL1o9JrcGQslj0/cbXkAxBqc2GiyvI0BTYVmsDlz3bRLpCmp
         /x+tSCNGla8rMYgSTvVNeKswR3E7K+y0hHPZE1f450zMiLZIbF6/MtjuclTXVyvYDvTB
         fl8L35opkZ1cKu5ax2WSTvUJCd9D3bUc82wUr8la2nIJSJloVMyGxOJYullEJC30sTkA
         ziWa8LYl0hqHyMpXjR+2rS+8ATejcn5YCCej8FwJh1M+aUdarlpyEoDxq+XqIwOuOrXf
         7/2Q==
X-Gm-Message-State: AOAM533AWsOx/vOV4cyZJMTYd3jOHwTt4VBC80DAITKL09d4qSDIw9n8
	K0eaapi1NqeAVpa+NSZFa6PqQQ==
X-Google-Smtp-Source: ABdhPJz22IaG4hd9iRn2/XAusvA547svArzxVopo0Ev9WjUpfJULUqNV90gjmQfgVnA1C1ngksbOBw==
X-Received: by 2002:aa7:c0d1:0:b0:42d:ddda:7470 with SMTP id j17-20020aa7c0d1000000b0042dddda7470mr3619891edp.196.1654152057453;
        Wed, 01 Jun 2022 23:40:57 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906805200b0070b7875aa6asm148083ejw.166.2022.06.01.23.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:40:57 -0700 (PDT)
Message-ID: <209c4f72-7de2-929c-dac3-3fb10af2566d@linaro.org>
Date: Thu, 2 Jun 2022 08:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/5] ARM: dts: socfpga: Add atsha204a node to Mercury+
 AA1 dts
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org, amstan@chromium.org,
 upstream@semihalf.com
References: <20220601154647.80071-1-pan@semihalf.com>
 <20220601154647.80071-4-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601154647.80071-4-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/06/2022 17:46, Paweł Anikiel wrote:
> Add atsha204a node to Mercury+ AA1 dts
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
> index b0d20101cd00..dd1bfa7e1a78 100644
> --- a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
> -
> +/*
> + * Copyright 2022 Google LLC
> + */

Usually we keep here a blank line.

>  #include "socfpga_arria10.dtsi"
>  

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
