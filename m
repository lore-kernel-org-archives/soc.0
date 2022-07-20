Return-Path: <SRS0=b8ul=XZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F812C43334
	for <soc@archiver.kernel.org>; Wed, 20 Jul 2022 10:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4752BC3411E; Wed, 20 Jul 2022 10:36:41 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A45EC341C7
	for <soc@kernel.org>; Wed, 20 Jul 2022 10:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A45EC341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 19so20652722ljz.4
        for <soc@kernel.org>; Wed, 20 Jul 2022 03:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eOQs/h3TvmwMGsHYWl9U3/WtYoMV9gdMa1dgDXwlbSQ=;
        b=fkB0BJqfPCtZaMfiYdGb3bdOxfiLSBeYykX2v5HfeUI0qT9RCYWjYKZwN2H2/Lcklg
         5AtcySUHDocU/gfgqQ6VWa5vXLUeoBByLaXwcyqmEMHN/lC6o1LBfrPHatb2VG1Eheoj
         uLEPyQzCB8wzzWwIqTO9fAzIK81bYmX8sZuKQn2O6Eqk08vYjGUGX0zg1BDxszd2cGwH
         BJHeSB3ql3PnNoCjParSAlqbboMcvdkkApwZgirbZGwvTV8dh4aky4QdjnMkgpQ2pCFD
         mUH0PJziq/T1HRPDay71Oiw5Rxu6yMU2spGr7/T+3+rh0cKImMnmNv8XOtmuAJk5lfk4
         QQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eOQs/h3TvmwMGsHYWl9U3/WtYoMV9gdMa1dgDXwlbSQ=;
        b=x/OORQqDZ+qDmIFOja8Nj4S88Urv2xGDGBEBOe48xaOMmALW1FYAoFsOWlI/SCWjo1
         UcvRec64BprtmMZomVWalCiTdnhEOEBvtIrtlYSXY1RYZgtQ1Z/38qOwyL7h0SE9imWP
         ye9BlINpWkvQXjuDpu93f7aU7qcPohHpy2Hv4CrWn4QvoSY/hF9FigEfNtQXX/Wla10d
         L1tORZDZtRbd1Q9tUkHRZr+DEXTNeDAZkgwm/kKxSeBU1XBwi7Q90l8UxfQ9yei/tvxZ
         JWlQgtioym7j02Zxm6G62Z/6eUbnoqKiJU58oRXDmCaAzppP5wvY5Nk5/Rom6K5bVmnY
         GSlw==
X-Gm-Message-State: AJIora/q8oBbJg5yw9PKgBrX7Lca2ZDlDk93VhyQCKurw8kiS9jaKTsI
	OyRZNnv2bpmpw8Ip+q89lq5UhQ==
X-Google-Smtp-Source: AGRyM1shKllIGiUnXHGiJLH6+O6rAfySNJxSL+EK7w+lV4RU9sESPdtwOwhOZz2Yrya3DaMVYGje0w==
X-Received: by 2002:a2e:a788:0:b0:25d:94fd:1a84 with SMTP id c8-20020a2ea788000000b0025d94fd1a84mr14986884ljf.177.1658313398531;
        Wed, 20 Jul 2022 03:36:38 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id d29-20020a0565123d1d00b0047255d21124sm3752136lfv.83.2022.07.20.03.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 03:36:38 -0700 (PDT)
Message-ID: <ab78f85c-dd0a-9176-103f-8e4abe01b8f9@linaro.org>
Date: Wed, 20 Jul 2022 12:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
Cc: Phong Vo <phong@os.amperecomputing.com>, thang@os.amperecomputing.com
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-3-quan@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720085230.3801945-3-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2022 10:52, Quan Nguyen wrote:
> The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
> hardware reference platform with AmpereOne(TM) processor.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> ---
> v2 :
>   + Remove bootargs                                       [Krzysztof]
>   + Fix gpio-keys nodes name to conform with device tree binding
>   documents                                               [Krzysztof]
>   + Fix some nodes to use generic name                    [Krzysztof]
>   + Remove unnecessary blank line                         [Krzysztof]
>   + Fix typo "LTC" to "LLC" in license info and corrected license
>   info to GPL-2.0-only
> 
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 577 ++++++++++++++++++
>  2 files changed, 578 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> 

(...)

> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	adc_i2c: adc-i2c@16 {

Node name: just "adc"

> +		compatible = "lltc,ltc2497";
> +		reg = <0x16>;
> +		vref-supply = <&voltage_mon_reg>;
> +		#io-channel-cells = <1>;
> +		status = "okay";

Isn't this new node? Why do you need status here?

> +	 };
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +

(...)

> +
> +&gpio1 {
> +	gpio-line-names =
> +	/*18A0-18A7*/	"","","","","","","","",
> +	/*18B0-18B7*/	"","","","","emmc-rst-n","","s0-soc-pgood","",
> +	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
> +			"uart3-mode0","uart3-mode1","uart4-mode0","uart4-mode1",
> +	/*18D0-18D7*/	"","","","","","","","",
> +	/*18E0-18E3*/	"","","","";
> +};
> +

You have a trailing line error.


Best regards,
Krzysztof
