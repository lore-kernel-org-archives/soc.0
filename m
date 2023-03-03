Return-Path: <SRS0=ecuo=63=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F49C64EC4
	for <soc@archiver.kernel.org>; Fri,  3 Mar 2023 07:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A05FFC4339C; Fri,  3 Mar 2023 07:02:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A120C433EF
	for <soc@kernel.org>; Fri,  3 Mar 2023 07:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A120C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id d30so6569398eda.4
        for <soc@kernel.org>; Thu, 02 Mar 2023 23:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677826976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SS0pZtOXOCGsRpwT2/LH/98sjAzBtNRBQ/GVmHS+K8M=;
        b=i3ks/kDAv8EabEjfJk5skrkV5kgK09F1+JDqq5gGixIHL65aAoT/XDlXrErPqsX7pK
         VAR3Z+nNky2f7A7QQZcfLLYS2USwnw/CJqjWpDtiY9wTySt1Rgo1KTk/AvB9qwBCIn2Q
         Cibve5sdaWR15dLdmtOcpEB4tPvp+s873vwz1D0Md4gHynRxNsxwHA8aqCiwvQSAqcr2
         98syev9fmu0m8q/X2q3ijfG3HZOQSm0VsZt0N92kLGtOHUsGDonFYQggLjqhHMlWm7pr
         sklSAT7dwtujXR99xO0A+j6+u0imCQu8pCM+YN3dWfEgvyNJwvEhBNaycMT15samIfTE
         Wwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677826976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS0pZtOXOCGsRpwT2/LH/98sjAzBtNRBQ/GVmHS+K8M=;
        b=KFo1qyOflnW3M0/X2yh99WQ3JWHZYNyqtVDlh5GsdXIOeP7gUlIZf1zWjgXzObqVNJ
         hHnxWtTzYyAvtWYWPCPWN0CuhYkS5OlENj/OrbCNEX2bd/zwwiRGQK/9sFB4qunru0nj
         c7CmBaSwpVN9LaBq8vSZrHBOfcl7L3CGsPLJKnADvXWzXckYirX84lDViPlwXEVGezsI
         x/VPpvBw/BY2mB+wQ9/lb9EOIGIRLT5Escu/y3JXpzKxsyvkUFDMuLhN25RiVweWxIUl
         41SdEIVOBAT3BmzscAfVG+Ox54NmAaWrTVP3dxa1QHMJWjyop2Aci3RzSuOOtT4OQXHe
         Lkfg==
X-Gm-Message-State: AO0yUKUZGtbVrMWWSkYqDsYdi7Xvpp+W1pm+oDV5nBVxhQA622PXzJZB
	fbAUiY1vqEtaNcoIS17Dvh5kiw==
X-Google-Smtp-Source: AK7set/tMa38FXOV2npPtA2knaAbce5U81AM4X6wzByfio4vR+xTOVhyLCP2XdEogoz4q2JS276toQ==
X-Received: by 2002:a17:906:6a1e:b0:8b1:fc58:a4ad with SMTP id qw30-20020a1709066a1e00b008b1fc58a4admr886969ejc.11.1677826976663;
        Thu, 02 Mar 2023 23:02:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id hy3-20020a1709068a6300b008e57b5e0ce9sm609319ejc.108.2023.03.02.23.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:02:56 -0800 (PST)
Message-ID: <0ea5f080-6c99-0243-1ac2-0182d9a83aad@linaro.org>
Date: Fri, 3 Mar 2023 08:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/7] ARM: dts: nuvoton: Add Quanta GSZ BMC Device Tree
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: David Wang <tomato1220@gmail.com>, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 fran.hsu@quantatw.com, David Wang <davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
 <20230303063435.803097-2-davidwang@quantatw.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230303063435.803097-2-davidwang@quantatw.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2023 07:34, David Wang wrote:
> Add the device tree for the Quanta GSZ BMC and it's
> based on NPCM730 SoC
> 
> Signed-off-by: David Wang <davidwang@quantatw.com>


> +};
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsz.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsz.dts
> new file mode 100644
> index 000000000000..c9f11880ef6d
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsz.dts
> @@ -0,0 +1,1523 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2021 Quanta Computer Inc. Fran.Hsu@quantatw.com
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +#include "nuvoton-npcm730-gsz-gpio.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Quanta GSZ Board (Device Tree v01.10)";
> +	compatible = "nuvoton,npcm750";

Same problems.

> +
> +	aliases {
> +		serial0 = &serial0;
> +		serial1 = &serial1;
> +		serial2 = &serial2;
> +		serial3 = &serial3;
> +		udc5 = &udc5;
> +		udc6 = &udc6;
> +		udc7 = &udc7;
> +		udc8 = &udc8;
> +		emmc0 = &sdhci0;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
> +		i2c10 = &i2c10;
> +		i2c11 = &i2c11;
> +		i2c12 = &i2c12;
> +		i2c13 = &i2c13;
> +		i2c14 = &i2c14;
> +		fiu0 = &fiu0;
> +		fiu1 = &fiu3;
> +		i2c16 = &i2c_9SQ440NQQI8;
> +		i2c17 = &i2c_db2001;
> +		i2c18 = &i2c_db1200;
> +		i2c19 = &i2c_io_exp_1;
> +		i2c20 = &i2c_cpu0_pirom;
> +		i2c21 = &i2c_cpu1_pirom;
> +		i2c22 = &i2c_ncsi_clk;
> +		i2c23 = &i2c_m2;
> +		i2c24 = &i2c_fivra_cpu0;
> +		i2c25 = &i2c_fivra_cpu1;
> +		i2c26 = &i2c_vccfa_cpu0;
> +		i2c27 = &i2c_vccfa_cpu1;
> +		i2c28 = &i2c_vccd_cpu0;
> +		i2c29 = &i2c_vccd_cpu1;
> +		i2c30 = &i2c_hotswap;
> +		i2c31 = &i2c_tps_1;
> +		i2c32 = &i2c_p12v_1;
> +		i2c33 = &i2c_p12v_2;
> +		i2c34 = &i2c_fan_controller_1;
> +		i2c35 = &i2c_i2cool_1;
> +		i2c36 = &i2c_i2cool_2;
> +		i2c37 = &i2c_i2cool_3;
> +		i2c38 = &i2c_seq_mobo;
> +		i2c39 = &i2c_fru_2;
> +		i2c40 = &i2c_io_exp_2;
> +		i2c41 = &i2c_io_exp_3;
> +		i2c43 = &i2c_fru_3;
> +		i2c44 = &i2c_seq;
> +		i2c45 = &i2c_fru_1;
> +		i2c46 = &i2c_tang;
> +		i2c51 = &i2c_pe0_0;
> +		i2c52 = &i2c_pe0_1;
> +		i2c53 = &i2c_pe0_2;
> +		i2c54 = &i2c_pe1_0;
> +		i2c55 = &i2c_pe1_1;
> +		i2c56 = &i2c_pe1_2;
> +		i2c57 = &i2c_pe2_0;
> +		i2c58 = &i2c_pe2_1;
> +		i2c59 = &i2c_pe2_2;
> +		i2c60 = &i2c_pe3_0;
> +		i2c61 = &i2c_pe3_1;
> +		i2c62 = &i2c_pe3_2;
> +		i2c63 = &i2c_pe4_0;
> +		i2c64 = &i2c_pe4_1;
> +		i2c65 = &i2c_pe4_2;
> +		i2c66 = &i2c_pe5_0;
> +		i2c67 = &i2c_pe5_1;
> +		i2c68 = &i2c_pe5_2;
> +		i2c69 = &i2c_pe6_0;
> +		i2c70 = &i2c_pe6_1;
> +		i2c71 = &i2c_pe6_2;
> +		i2c72 = &i2c_pe7_0;
> +		i2c73 = &i2c_pe7_1;
> +		i2c74 = &i2c_pe7_2;
> +	};
> +
> +	chosen {
> +		stdout-path = &serial3;
> +	};
> +
> +	memory {
> +		reg = <0 0x40000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		efuse-pg {

and all my other comments also apply...



Best regards,
Krzysztof

