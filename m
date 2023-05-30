Return-Path: <SRS0=jKnc=BT=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25073C77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 13:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9690C433A0; Tue, 30 May 2023 13:24:21 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F07C1C433AA
	for <soc@kernel.org>; Tue, 30 May 2023 13:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F07C1C433AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-974265a1a40so107867866b.0
        for <soc@kernel.org>; Tue, 30 May 2023 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685453058; x=1688045058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f13+//j5TUSK7f17I23pgVcVd7PAgs1drwm4AW53RHM=;
        b=zC14MYkKGvdGUnL0dteMGGW+ZVB+LtSJnuFAGxZ/yRtnxaHKhM2+owjsNOlMVqR2zz
         QCOcAeSXtqxWdqUcu7BgM3t1mkvqUHoCIETz/izhIQ2clL/1yrr6/eyi5eujcIjQSDg5
         4tFrkX5xraNaG4SScrEQ1WIAO7Kh8kjw+ZqfOouXU7sSFWciqn2J2Bby10nGMuy5/bp+
         pA9XuUc7Ohz7HKYlwJcwl27Y4yA5dz3pstZ1iQB760AJnYos3PDZi+X57zapbUEl5vcX
         baySGpbCaL4zCDgIGimm8Zl1I0XQPTCng8O/2rpHAfejd3kOnP6x1vI95UeaYIm0F50x
         eeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685453058; x=1688045058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f13+//j5TUSK7f17I23pgVcVd7PAgs1drwm4AW53RHM=;
        b=jnzKuzjwNUA/cMVMmrmjsRc5nFyXdHyBZfGz9okA1ftsn+xupu2wsjBFBUzLI7Q3nA
         QrqD2c4Iahpt+peXZ/NULeVFBitNIIZ/wx1FsdqKouLw/t8H3Z7ZLynej1C+uYdoqfvf
         SQvum3/ZpxWyCl+wGKF2T95caNlUZCXiJGMIwL5WGFiBjksScIpP+/WiViYOwtcKgWSH
         pgEfLqzHD4qUiJ+Vgzv/pQwpyhueHolsqvSQSVanvIgspD5p08Dxbwv9+HS4BlIlBQGG
         J/4ireDlzjhJDHWN+sYTSkM70Q8/x+CI3THM5mak2omSQUaKozEhCxbXhs+zSoJIG8o9
         4LoA==
X-Gm-Message-State: AC+VfDxH7JlR19jlCqujpqCz3TSHYYyR4f+M4R5b9verkM/Qkz5uUGW3
	1JKzW8QpKCnVn0Yru61+x8LXJw==
X-Google-Smtp-Source: ACHHUZ45MHzQv6JgtBdSZV3zezwsX8mKYWid5QGh2Tm9MTh1hRIo/ZlaX97ft0SeEvZoCw6qfiVN2A==
X-Received: by 2002:a17:906:9753:b0:965:d7c7:24db with SMTP id o19-20020a170906975300b00965d7c724dbmr2131710ejy.32.1685453058029;
        Tue, 30 May 2023 06:24:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id me21-20020a170906aed500b0096a16e49b0fsm7305207ejb.51.2023.05.30.06.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:24:17 -0700 (PDT)
Message-ID: <3f2eefcc-fb0b-d374-995d-3c0b7e4b4507@linaro.org>
Date: Tue, 30 May 2023 15:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/4] ARM: dts: qcom: Add Samsung Galaxy Express support
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-5-guptarud@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230528001010.47868-5-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thank you for your patch. There is something to discuss/improve.



On 28/05/2023 02:10, Rudraksha Gupta wrote:
> This adds a very basic device tree file for the Samsung Galaxy Express

Please do not use "This commit/patch", but imperative mood. See longer
explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


> SGH-I437. Currently, the following things work: UART, eMMC, SD Card, and
> USB.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/qcom-msm8960-samsung-expressatt.dts   | 334 ++++++++++++++++++
>  2 files changed, 335 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 59829fc90315..12c90f263142 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1081,6 +1081,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-msm8916-samsung-grandmax.dtb \
>  	qcom-msm8916-samsung-serranove.dtb \
>  	qcom-msm8960-cdp.dtb \
> +	qcom-msm8960-samsung-expressatt.dtb \
>  	qcom-msm8974-lge-nexus5-hammerhead.dtb \
>  	qcom-msm8974-sony-xperia-rhine-amami.dtb \
>  	qcom-msm8974-sony-xperia-rhine-honami.dtb \
> diff --git a/arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts
> new file mode 100644
> index 000000000000..a1ee9c272558
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts
> @@ -0,0 +1,334 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/input/input.h>
> +
> +#include "qcom-msm8960.dtsi"
> +#include <dt-bindings/reset/qcom,gcc-msm8960.h>
> +
> +/ {
> +	model = "Samsung Galaxy Express SGH-I437";
> +	compatible = "samsung,expressatt", "qcom,msm8960";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &gsbi5_serial;
> +		mmc0 = &sdcc1; /* SDCC1 eMMC slot */
> +		mmc1 = &sdcc3; /* SDCC3 SD card slot */
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&gsbi5 {
> +	qcom,mode = <GSBI_PROT_I2C_UART>;
> +	status = "okay";
> +};
> +
> +&gsbi5_serial {
> +	status = "okay";
> +};
> +
> +&sdcc1 {
> +	vmmc-supply = <&pm8921_l5>;
> +	status = "okay";
> +};
> +
> +&sdcc3 {
> +	vmmc-supply = <&pm8921_l6>;
> +	vqmmc-supply = <&pm8921_l7>;
> +	status = "okay";
> +};
> +
> +&gsbi1 {
> +	qcom,mode = <GSBI_PROT_SPI>;
> +	pinctrl-0 = <&spi1_default>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&gsbi1_spi {
> +	status = "okay";
> +};
> +
> +&msmgpio {
> +	spi1_default: spi1_default {

No underscores in node names, missing proper suffix.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +		mux {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +			pins = "gpio6", "gpio7", "gpio9";
> +			function = "gsbi1";
> +		};
> +
> +		mosi {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +			pins = "gpio6";
> +			drive-strength = <12>;
> +			bias-disable;
> +		};
> +
> +		miso {
> +			pins = "gpio7";
> +			drive-strength = <12>;
> +			bias-disable;
> +		};
> +
> +		cs {
> +			pins = "gpio8";
> +			drive-strength = <12>;
> +			bias-disable;
> +			output-low;
> +		};
> +
> +		clk {
> +			pins = "gpio9";
> +			drive-strength = <12>;
> +			bias-disable;
> +		};
> +	};
> +};
> +
> +

One blank line, not two.

...

> +&usb1 {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +

No improvements here.

Best regards,
Krzysztof

