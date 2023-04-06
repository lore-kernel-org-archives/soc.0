Return-Path: <SRS0=RqzZ=75=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E28C76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 17:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59E7FC433D2; Thu,  6 Apr 2023 17:23:45 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 280E8C433A0
	for <soc@kernel.org>; Thu,  6 Apr 2023 17:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 280E8C433A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-4fd23c30581so1543238a12.3
        for <soc@kernel.org>; Thu, 06 Apr 2023 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680801822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YZWm8VVPjeFnm2JphubEFlx8VRO3aDXS4Y0MKirBKZc=;
        b=KaQblYxlv8Wg8dwXdhzP4qzFeNMXk41ba0tlgNgrCN9LirZed/7BpMBMqMCiPA/MKH
         lZTS2GazYf5qg5bYzuIG7uVN20BmC1nvSPU1RX8yN5XqxbHSBPcOyzH+CCIzAI+zVw7a
         qXFW8+AqSJPtIr4fcarlM76G9TR2EzHzPqD00UnHxwo64ctd4WP3bXE9euQyMSCMKMcy
         jI+TIgx/R91BOfaYL9fD2OBpxvGzIcjIePtS27tQtCAAqj3jVcdmaAcKeteQFCJIjzYH
         3p1lYq9OLxx8r4N1OFwfYXcFf8M/kbEY7QMWP792bqMq6GyUEk5cgNcskuKZHPKDEP+5
         ZZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZWm8VVPjeFnm2JphubEFlx8VRO3aDXS4Y0MKirBKZc=;
        b=qSvD+9ddX2txG8s35o7Ytt9zwnkCoL04Ml97OYDvN/QiORkphAK1+zY8z5jbM1x7eG
         YuXQiwO6JuSE1+Hfip1Z+81LtVmiyuFvdqvQe0aVNRMlllpwfZrBD8TGWAfsuGh9C07m
         o3e0yF8yqBwQrlbkGY9rKlr+FEdylOYYA9WODPkh/iAXLVPWj/Ea5K7Y1y6UfZZmgWqN
         FQT8UYt3g1fcu0VuNd1XJrc6cx8igL2Fcc01/uRy1HvLKz2H/tGraZECH0jJetmtJerH
         q3Rztt614uVn6Z8TLFZCEGNur2K12pMC/hpCJKMQ9HSJnpbQqbmrmReSDR+Tpvy7NJeP
         bBMg==
X-Gm-Message-State: AAQBX9c0SrbgujS+qT8siz6tw+C7VAQGMx/nO5VLv01G6Ypumafa24Na
	X+1vkLaXYDPf+H/V66efiE/+BA==
X-Google-Smtp-Source: AKy350ai06lz6ssfMPZUtJwK4e2IEAi6KKdYKCbUWEY+9XXjVsN6ewHSpx6CGQ1uSzp7iWlJhL82sw==
X-Received: by 2002:aa7:c0c7:0:b0:4fa:d83b:f5da with SMTP id j7-20020aa7c0c7000000b004fad83bf5damr239948edp.30.1680801822458;
        Thu, 06 Apr 2023 10:23:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id b16-20020a50b410000000b004c5d1a15bd5sm967580edh.69.2023.04.06.10.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:23:42 -0700 (PDT)
Message-ID: <4af1ebd0-243f-39e4-c290-1eb627bd7b71@linaro.org>
Date: Thu, 6 Apr 2023 19:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] dt-bindings: reset: Add binding constants for
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
 <20230406102149.729726-4-nikolaos.pasaloukos@blaize.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406102149.729726-4-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2023 12:22, Niko Pasaloukos wrote:
> Add SCMI reset IDs which are used on Blaize BLZP1600 SoC.
> 
> Co-developed-by: James Cowgill <james.cowgill@blaize.com>
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> Co-developed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@blaize.com>
> Co-developed-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>  .../dt-bindings/reset/blaize,blzp1600-reset.h | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 include/dt-bindings/reset/blaize,blzp1600-reset.h
> 
> diff --git a/include/dt-bindings/reset/blaize,blzp1600-reset.h b/include/dt-bindings/reset/blaize,blzp1600-reset.h
> new file mode 100644
> index 000000000000..ff1de6b1bd5c
> --- /dev/null
> +++ b/include/dt-bindings/reset/blaize,blzp1600-reset.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */

Why 2.0+? Unusual choice. Do you really need it?


> +/*
> + * Copyright (C) 2022, Blaize, Inc.
> + */
> +
> +#ifndef DT_BINDING_RESET_BLZP1600_H
> +#define DT_BINDING_RESET_BLZP1600_H
> +
> +#define BLZP1600_A53_C0_HARD_RST	0
> +#define BLZP1600_A53_C0_SOFT_RST	1
> +#define BLZP1600_A53_C1_HARD_RST	2
> +#define BLZP1600_A53_C1_SOFT_RST	3
> +#define BLZP1600_A53_L2_CACHE_RST	4
> +#define BLZP1600_A53_DBG_RST		5
> +#define BLZP1600_GIC_RST		6
> +#define BLZP1600_CRYPTO_RST		7
> +#define BLZP1600_GSP_RST		9
> +#define BLZP1600_DRAM_A_SYS_RST		10
> +#define BLZP1600_DRAM_A_DDRC_RST	11
> +#define BLZP1600_DRAM_A_PRST		12
> +#define BLZP1600_DRAM_A_ARST		13
> +#define BLZP1600_DRAM_A_PHY_RST		14
> +#define BLZP1600_DRAM_A_PWRON_RST	15
> +#define BLZP1600_DRAM_A_PHY_PRST	16
> +#define BLZP1600_DRAM_B_SYS_RST		17
> +#define BLZP1600_DRAM_B_DDRC_RST	18
> +#define BLZP1600_DRAM_B_PRST		19
> +#define BLZP1600_DRAM_B_ARST		20
> +#define BLZP1600_DRAM_B_PHY_RST		21
> +#define BLZP1600_DRAM_B_PWRON_RST	22
> +#define BLZP1600_DRAM_B_PHY_PRST	23
> +#define BLZP1600_USB_RST		24
> +#define BLZP1600_USB_PHY_RST		25
> +#define BLZP1600_CAN0_RST		26
> +#define BLZP1600_CAN1_RST		27
> +#define BLZP1600_CAN2_RST		28
> +#define BLZP1600_ETH_MAC_RST		29
> +#define BLZP1600_SDIO0_RST		30
> +#define BLZP1600_SDIO1_RST		31
> +#define BLZP1600_SDIO2_RST		32
> +#define BLZP1600_SD_CARD_RST		34
> +#define BLZP1600_CSI0_CTRL_RST		35
> +#define BLZP1600_CSI0_VDMA_RST		36
> +#define BLZP1600_CSI1_CTRL_RST		37
> +#define BLZP1600_CSI1_VDMA_RST		38
> +#define BLZP1600_CSI2_CTRL_RST		39
> +#define BLZP1600_CSI2_VDMA_RST		40
> +#define BLZP1600_CSI3_CTRL_RST		41
> +#define BLZP1600_CSI3_VDMA_RST		42
> +#define BLZP1600_CSID_CTRL_RST		43
> +#define BLZP1600_CSID_VDMA_RST		44
> +#define BLZP1600_DSI_CTRL_RST		45
> +#define BLZP1600_DSI_VDMA_RST		46
> +#define BLZP1600_DMA_RST		49

You have some gaps here. These are IDs, so they do not have gaps.



Best regards,
Krzysztof

