Return-Path: <SRS0=RqzZ=75=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C14C76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 17:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5F39C4339B; Thu,  6 Apr 2023 17:24:31 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CD64C433D2
	for <soc@kernel.org>; Thu,  6 Apr 2023 17:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9CD64C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id by26so3125844ejb.2
        for <soc@kernel.org>; Thu, 06 Apr 2023 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680801869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JL0tcMswVOFBcZqE4ysEfWlvhjaRhWrngkh1Ruhoyo4=;
        b=MPnQBH6smOnFly3D5rRvEyKmiqswxLyP6gr0q283GTwxvlhz603IrS9F2/iq2f0NPn
         aKYKWU77mZQcOPlybykSjECnvL0fRAidu65ZbPR2GXBg7hl2FeNx2aVSGFzDbenDXfJL
         9S1vKwxSiNBGNJUgkUa1eCNZp4+SHY58amq+JWamL8UjzApvijwt+ikbQANg1+17nYd2
         9RgUl7CAU99JcmphuUYcGBhloboB/Qtwi2ytfZ2EktnW5Gv7RiVYxry8vbP7fcT8nDC9
         GFTNdOObFQR6uvbrzzR1kqhot3m4RblcY5k2iQTjGiUzTG5kExnUP1/c5SvV8sD5c+MW
         o3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL0tcMswVOFBcZqE4ysEfWlvhjaRhWrngkh1Ruhoyo4=;
        b=JXQSbZ0yrDrsj4t1hAKZhX7eRwTDuf0bhf23XhKHq9gexwavPm6Ucwd9CXITg4pUBj
         j+48XBDZLyg3rYsM4SSGeiZ5uwz6oJXf0v+xIqZYlqbqV5tdZ98sRQOYHuEaGkK88/nU
         xspy8wNvyKut++wxjPJ76X07H6XRapoviAMPD/qwkIixseuHx6V1WwZUGl0c/YiiUs/u
         OeiQoThBS1KMTI64hocKg5HRyfg+5oBubzIbNM4cZ5C/hCAg3y9bAPsb1e8B3UZ1zTTa
         AcM52VIN/6Vvxu+trdk2DkMGDfqWGnGdChsEldxtBmvxYdT3P3zMYsszyedorDuQgbF8
         sCHQ==
X-Gm-Message-State: AAQBX9egg8+z0bWYidFkBe84nUNm/9yFUkOnihWCEvk9JRwN9EAL/BfP
	qNpL/flJYreTR33KSbJ3A2ng4g==
X-Google-Smtp-Source: AKy350ZDUjvvTADIBKKgF4owoWF4Z6S7eh506PO079mECLi4kym9F7fYqfKxh7TctbTIQkCLAiJ3Cg==
X-Received: by 2002:a17:907:c201:b0:8b1:75a0:e5c6 with SMTP id ti1-20020a170907c20100b008b175a0e5c6mr6737603ejc.18.1680801868922;
        Thu, 06 Apr 2023 10:24:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id li16-20020a170906f99000b008d68d018153sm1059812ejb.23.2023.04.06.10.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:24:28 -0700 (PDT)
Message-ID: <63f14414-2054-d7d6-8cdd-82f8e034641f@linaro.org>
Date: Thu, 6 Apr 2023 19:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] dt-bindings: clock: Add binding constants for
 BLZP1600
Content-Language: en-US
To: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "soc@kernel.org" <soc@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 James Cowgill <james.cowgill@blaize.com>,
 Matt Redfearn <matthew.redfearn@blaize.com>,
 Neil Jones <neil.jones@blaize.com>
References: <20230406102149.729726-1-nikolaos.pasaloukos@blaize.com>
 <20230406102149.729726-5-nikolaos.pasaloukos@blaize.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406102149.729726-5-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2023 12:22, Niko Pasaloukos wrote:
> Add SCMI clock IDs which are used on Blaize BLZP1600 SoC.
> 
> Co-developed-by: James Cowgill <james.cowgill@blaize.com>
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> Co-developed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@blaize.com>
> Co-developed-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>  .../dt-bindings/clock/blaize,blzp1600-clk.h   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)

Missing device schema.

>  create mode 100644 include/dt-bindings/clock/blaize,blzp1600-clk.h
> 
> diff --git a/include/dt-bindings/clock/blaize,blzp1600-clk.h b/include/dt-bindings/clock/blaize,blzp1600-clk.h
> new file mode 100644
> index 000000000000..bcc8ff513b28
> --- /dev/null
> +++ b/include/dt-bindings/clock/blaize,blzp1600-clk.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */

Same question as for reset.

> +/*
> + * Copyright (C) 2022, Blaize, Inc.
> + */
> +
> +#ifndef DT_BINDING_CLK_BLZP1600_H
> +#define DT_BINDING_CLK_BLZP1600_H
> +
> +/* Simple clock-gates */
> +#define BLZP1600_CPU_CLK	0
> +#define BLZP1600_CRYPTO_CLK	7

Same problems as for reset.


Best regards,
Krzysztof

