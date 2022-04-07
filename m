Return-Path: <SRS0=bijT=UR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE5C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 629B1C385A7; Thu,  7 Apr 2022 12:13:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 487B3C385A0
	for <soc@kernel.org>; Thu,  7 Apr 2022 12:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 487B3C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id dr20so10365721ejc.6
        for <soc@kernel.org>; Thu, 07 Apr 2022 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4RwpkSUqDB0l6cKt7wHht/Va+r9VAPBwORUmjbKGxuI=;
        b=IOjkHAnh1pWx6/i2VRl8VGFDhbScmVYeMIT7FQPJoRzzulxXx7xtZflL8hK5uQ+WGG
         hwmFpuXCO3RlaeFY4Sp2HsozUwO2zXvPz7ojFWxUkDTyt2qAh3bh0bplhRsb751HrrhS
         qXUM9D8p6nSO/JESUbR8jY5csiffSvzwvnSSCo9HFJMKGq9NK9p1m0cuA2mTggZQUn/k
         ki/Q6Y+PBOYR6Y7gmzwn0A0MbhNE7pHbG/08lRfNlD2Mqbq5TXsXiE6rqdslZtOvTM++
         sNB0PxwFcjgKkF7U58yM9jxghqBDMcXUDwMAmC0/U/5pQSyZps/oGxn7W1kRsKAp2joz
         YX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4RwpkSUqDB0l6cKt7wHht/Va+r9VAPBwORUmjbKGxuI=;
        b=jGBypfl2BBUpy6iTYLWYV1KUekePWtEI78iEbnu/mPU3+XsJtB6Ni2q3INMcOep3oz
         TxUm3Js1BFEptxYBNP58kZGVn6J6JP7O/xBqD/ebwA01r4dpv7n/Nj+oQEBtik6gMuXb
         lW60YEZXg6ek22L289iTI8DzoDIaGE4H7IZr5LmalqkVbIRC53t7mGCAC+NouQ7m9rIh
         iQvcZ3oobZY8cLggBBcrAXvL/eVAdFA99R3l+JjDYW2xdkGA805N+Lp3NJvx7MxN9mEp
         l9q8dPG5G/dn0baTHinZCo1qtqgeVy3mDOHtt5CnRzprKwfYpU34qRsem1xaVMSnx++e
         sCRw==
X-Gm-Message-State: AOAM532lUsDwtJkT0SMwcX02AZvEXdRN9YhNgk1lb0I6M5FZtgPOaRj5
	Kscl2dAKQm5APy6EmkF0bItleQ==
X-Google-Smtp-Source: ABdhPJxEFc3pwxCcjRWWqquRyplf/LckBfH88Uh/n2MY+jXL0K8uHf+M5WVvVNwnNRb8aMHBq4N6Tw==
X-Received: by 2002:a17:906:a08b:b0:6b9:2e20:f139 with SMTP id q11-20020a170906a08b00b006b92e20f139mr13597295ejy.463.1649333594458;
        Thu, 07 Apr 2022 05:13:14 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id d12-20020a50cf4c000000b0041cc12dc1f3sm6484690edk.71.2022.04.07.05.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 05:13:13 -0700 (PDT)
Message-ID: <1369ae65-5455-f217-c770-570e2472ba47@linaro.org>
Date: Thu, 7 Apr 2022 14:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] ARM: dts: lan966x-pcb8291: Add QSPI0 and SPI NOR
 memory nodes
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, arnd@arndb.de,
 robh+dt@kernel.org, krzk+dt@kernel.org, alexandre.belloni@bootlin.com,
 olof@lixom.net, soc@kernel.org, nicolas.ferre@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 tudor.ambarus@microchip.com, Manohar.Puri@microchip.com
References: <20220407105835.10962-1-kavyasree.kotagiri@microchip.com>
 <20220407105835.10962-3-kavyasree.kotagiri@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407105835.10962-3-kavyasree.kotagiri@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/04/2022 12:58, Kavyasree Kotagiri wrote:
> Enable QSPI0 controller and sst26vf016b SPI-NOR flash present on it.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
> ---
>  arch/arm/boot/dts/lan966x-pcb8291.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/lan966x-pcb8291.dts b/arch/arm/boot/dts/lan966x-pcb8291.dts
> index 3281af90ac6d..99d96d46661d 100644
> --- a/arch/arm/boot/dts/lan966x-pcb8291.dts
> +++ b/arch/arm/boot/dts/lan966x-pcb8291.dts
> @@ -62,3 +62,18 @@
>  &watchdog {
>  	status = "okay";
>  };
> +
> +&qspi0 {
> +	status = "okay";
> +
> +	spi-flash@0 {

Just "flash" please (to be generic).

> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;

Why do you need address/size cells here? You don't have any children.

> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +		m25p,fast-read;
> +	};
> +};


Best regards,
Krzysztof
