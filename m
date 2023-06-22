Return-Path: <SRS0=UKN7=CK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B969EB64DA
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 15:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3534CC433CD; Thu, 22 Jun 2023 15:21:01 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1144BC433C0
	for <soc@kernel.org>; Thu, 22 Jun 2023 15:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1144BC433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f87592ecaeso6433720e87.0
        for <soc@kernel.org>; Thu, 22 Jun 2023 08:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687447258; x=1690039258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9Nib1mjQ7HUVslIx9EtURK9z/yS/7mpl1B4Ox7/c/s=;
        b=g15tA4+CNcniYf/OcLJKZt2ymRKzXESCDfPItGGf4pXM5u5X0DdAweQxDe+YuHymKN
         HCYHcv4nhoMVPTvohDVk/2XxmWYeXhzfneaiKr082wMmGHZ2GKygtvUPPAEA524UAtxy
         bmcqY6FuJBxlZe8TchhILJkH1GYMoqDZZEBGqK2JPaVajS3v2KvZYyenL/6VbHYFgEeg
         VFfCihnzU9iwpvPRInH6mOxO8kkOUvkprS1mAxdvP3NFkz4XNjgeI9L8lqcM7R8ApVzi
         DdPjtgvLR6ALfJQsKO6aF4PCymSNHzbj+dW7iimcPMQfrmOhBVn6daWWPgAUTd+M+PGG
         6g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447258; x=1690039258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9Nib1mjQ7HUVslIx9EtURK9z/yS/7mpl1B4Ox7/c/s=;
        b=EZNG4UF0792BLjrfwwlR5MVScRRHSTqOYqBRNa0s94gZfaxt3EIqgTRwZ0bxSiLoOP
         HjYwxWzd6myo989RUQCYS2lcLbiChSaOZxeCllS3Ad51BQ3O94Nf9FfmNbAJy4Nhf1JP
         IyfIhqx0b+dT/KYs3k+vqp9HjvSTEusGr/IrJzYCugHCwCpzL5YXutVW16f3RhcvvWh+
         vk8Zn8y0VF+ai1FgQzoUftOsnL9IOAU3Zc5udc7xBkMGL/4pXI3jwxjM6H76DcjjbBCr
         VmoU/n1zDJmAl4TZLNrgztMwUK8e7ZUEJ20I/QN2CcYgArRbVLdThRqLSTaxL4XtmUM+
         Fxgw==
X-Gm-Message-State: AC+VfDzNgrmx3F8mjJwe5CYcNMJ58TRkHYreFA2j+Bo/AaEEpQqbv0id
	6de28dCfd56DIK3rumyn1uzQ9w==
X-Google-Smtp-Source: ACHHUZ65em47HxJ5uP2ScMq4wC1WUQ8IS3y4pSQ5ePJuf0EI86kFZ1IXZW0p0liht+sUtKhW1HKrpA==
X-Received: by 2002:a19:6446:0:b0:4e9:bafc:88d0 with SMTP id b6-20020a196446000000b004e9bafc88d0mr11095123lfj.23.1687447257858;
        Thu, 22 Jun 2023 08:20:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d7-20020a056402516700b00514bcbfd9e0sm4134273ede.46.2023.06.22.08.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 08:20:57 -0700 (PDT)
Message-ID: <218a76d9-d00b-3856-80b1-7d2f11b4ff1f@linaro.org>
Date: Thu, 22 Jun 2023 17:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8916-samsung-fortuna: Add NFC
Content-Language: en-US
To: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
 linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, soc@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 Joe Mason <buddyjojo06@outlook.com>
References: <20230622000007.48219-1-linmengbo0689@protonmail.com>
 <20230622000437.48367-1-linmengbo0689@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230622000437.48367-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/06/2023 02:05, Lin, Meng-Bo wrote:
> From: Joe Mason <buddyjojo06@outlook.com>
> 
> The Samsung Galaxy Ace 4, Core Prime and some Grand Prime have a
> Samsung S3FWRN5 NFC chip that works quite well with the s3fwrn5 driver
> in the Linux NFC subsystem.
> 
> The clock setup for the NFC chip is a bit special (although this
> seems to be a common approach used for Qualcomm devices with NFC):
> 
> The NFC chip has an output GPIO that is asserted whenever the clock
> is needed to function properly. On the A3/A5 this is wired up to
> PM8916 GPIO2, which is then configured with a special function
> (NFC_CLK_REQ or BB_CLK2_REQ).
> 
> Enabling the rpmcc RPM_SMD_BB_CLK2_PIN clock will then instruct
> PM8916 to automatically enable the clock whenever the NFC chip
> requests it. The advantage is that the clock is only enabled when
> needed and we don't need to manage it ourselves from the NFC driver.
> 
> Grand Prime SM-G530Y (fortunaltezt) has a NXP PN547, which is supported
> by the nxp-nci-i2c driver in mainline.
> 
> It seems to detect NFC tags using "nfctool" just fine, although more
> testing is difficult given there seem to be very few useful applications
> making use of the Linux NFC subsystem.
> 
> Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
> [Put i2c-nfc and NFC pinctrl into fortuna.dtsi to share it with other variants]
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

This and other SoB chains look like missing Co-developed-by.

> [Add pn547_nfc]
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> ---


> +		/* Available NFC chip varies depending on model variant */
> +		pn547_nfc: nfc@2b {
> +			compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
> +			reg = <0x2b>;
> +
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <21 IRQ_TYPE_EDGE_RISING>;
> +
> +			enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
> +			firmware-gpios = <&tlmm 49 GPIO_ACTIVE_HIGH>;
> +
> +			pinctrl-0 = <&nfc_default>;
> +			pinctrl-names = "default";
> +
> +			status = "disabled";
> +		};
> +
> +		s3fwrn5_nfc: nfc@27 {
> +			compatible = "samsung,s3fwrn5-i2c";
> +			reg = <0x27>;
> +
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <21 IRQ_TYPE_EDGE_RISING>;
> +
> +			en-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
> +			wake-gpios = <&tlmm 49 GPIO_ACTIVE_HIGH>;
> +
> +			clocks = <&rpmcc RPM_SMD_BB_CLK2_PIN>;
> +
> +			pinctrl-0 = <&nfc_default>, <&nfc_clk_req>;
> +			pinctrl-names = "default";
> +
> +			status = "disabled";

Common part does not have two NFCs. It seems common part has zero
NFCs... or should be put into different file.

Best regards,
Krzysztof

