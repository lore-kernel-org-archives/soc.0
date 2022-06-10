Return-Path: <SRS0=qNS+=WR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AE7C43334
	for <soc@archiver.kernel.org>; Fri, 10 Jun 2022 10:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CF66C3411C; Fri, 10 Jun 2022 10:05:56 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89D1AC341C4
	for <soc@kernel.org>; Fri, 10 Jun 2022 10:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89D1AC341C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id x62so34584855ede.10
        for <soc@kernel.org>; Fri, 10 Jun 2022 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Q5vsmxWtwaYG8oW1AvQlgwQ8iE5Q0pMcGpxfbWiaZG0=;
        b=mAwnc2FFbtLQIpZr3EhYJcGHEjUDTrbX5Jx0lJTRxxZ0qBjgwzPJoDo1t/rjo0CWE3
         yerDl7ktV0DQWz4+QGdECsB949KbT+RbfG3jjSbSDHNcLk/Qq32eONfK5Y+syiadgwxc
         ksxL5klIEiyxCxjJvC8ufzFhxN2Xdp4ryDJ2tg7eEFag1jBlUpf70OVlutNMCQvvFixk
         895brrs4P/H1ae1l2GIH/45CaIzX/PQ3r60ns2tsqGQzOzuj0bVlcbrTvxO6/D2WULPH
         VqEwY5ydtSucv3FLVw+nIzGu2j0Jn0IuF9KeJQMxm25MK3JNOoeX21Lku7r4L+7+wnEq
         em5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q5vsmxWtwaYG8oW1AvQlgwQ8iE5Q0pMcGpxfbWiaZG0=;
        b=XPg1ejNk7ypPF/k0wm/hkn7WXgnWtWrxsGxVj6nRcEqbuJjxI/rFDPeMHf20R72RgV
         fWiD+i87KyU+acPy+vNRpdOrQ3B8vigSK7MomodYnmHAqWDy4spbGYxzSNghrSGZxv8p
         mF6wIds2c7leteF9wmoyHqah7xD9QNGZ4NDDhuijzETZ2wltz+eeSIVgwLgRKDUdr0oM
         wQaQShqXAGpj33oOsPJLRDVA72RRx/zI1lpLRJgoCUt23STSB78pEhx4lNX+OgldKiTK
         ox2sDyRvFqCYxF0aXwW02RalSOm9ZClB62Cu4RI0LktQ4qpXnZFvhgywDfLeMgZCoJu7
         Uhbg==
X-Gm-Message-State: AOAM532zGnDvVyfWym/HSMfteLESccAmhCR4oyn2lzyxYzsP4rroRTn0
	kyfOPKj/1XAsfyh/xel8zuNvdA==
X-Google-Smtp-Source: ABdhPJw+10Yv7YpKYQWS1YFaBYbE6qXvaEMzJNgXTJK+zRmZH81nGhz+1LAX3otPNb4lPpztjPphrw==
X-Received: by 2002:a05:6402:50:b0:431:69fc:eff4 with SMTP id f16-20020a056402005000b0043169fceff4mr26419944edu.243.1654855553741;
        Fri, 10 Jun 2022 03:05:53 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906444700b0070e238ff66fsm9834067ejp.96.2022.06.10.03.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 03:05:53 -0700 (PDT)
Message-ID: <537986d4-376e-d787-1581-cf0b0d525daa@linaro.org>
Date: Fri, 10 Jun 2022 12:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 44/48] ARM: dts: at91: align gpio-key node names with
 dtschema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Claudiu.Beznea@microchip.com, arnd@arndb.de, olof@lixom.net,
 arm@kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, peda@axentia.se, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609114047.380793-5-krzysztof.kozlowski@linaro.org>
 <42e8f573-cfc2-dfa4-1740-b0a29521628e@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <42e8f573-cfc2-dfa4-1740-b0a29521628e@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2022 09:12, Claudiu.Beznea@microchip.com wrote:

>>                 compatible = "gpio-keys";
>>                 pinctrl-names = "default";
>>                 pinctrl-0 = <&pinctrl_key_gpio_default>;
>>                 status = "okay";
>>
>> -               sw1 {
>> +               switch-1 {
> 
> This is acutally a button labeled on board as SW1. It has been wrongly
> carried over from older DTSes. Maybe it would worth to have it now here as
> button instead of switch.

Sure, I'll name it "button-1". Could be also "button-sw1" if ou prefer.

> 
>>                         label = "SW1";
>>                         gpios = <&pioD 18 GPIO_ACTIVE_LOW>;
>>                         linux,code=<KEY_PROG1>;
>> diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
>> index 08f0d4b995ff..96c9290007a8 100644
>> --- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
>> +++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
>> @@ -478,13 +478,13 @@ can1: can@fc050000 {
>>                 };
>>         };
>>
>> -       gpio_keys {
>> +       gpio-keys {
>>                 compatible = "gpio-keys";
>>
>>                 pinctrl-names = "default";
>>                 pinctrl-0 = <&pinctrl_key_gpio_default>;
>>
>> -               pb4 {
>> +               button {
>>                         label = "USER";
>>                         gpios = <&pioA PIN_PA29 GPIO_ACTIVE_LOW>;
>>                         linux,code = <KEY_PROG1>;
>> diff --git a/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
>> index 5e8755f22784..d5652c974748 100644
>> --- a/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
>> +++ b/arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts
>> @@ -26,14 +26,14 @@ chosen {
>>                 stdout-path = "serial0:115200n8";
>>         };
>>
>> -       gpio_keys {
>> +       gpio-keys {
>>                 compatible = "gpio-keys";
>>
>>                 pinctrl-names = "default";
>>                 pinctrl-0 = <&pinctrl_key_gpio_default>;
>>                 status = "okay";
>>
>> -               sw4 {
>> +               switch-4 {
> 
> Same here, this is a button not a switch.

Sure, then button-1 or button-sw4

> 
>>                         label = "USER BUTTON";
>>                         gpios = <&pioA PIN_PB2 GPIO_ACTIVE_LOW>;
>>                         linux,code = <KEY_PROG1>;
>> diff --git a/arch/arm/boot/dts/at91-sama5d2_icp.dts b/arch/arm/boot/dts/at91-sama5d2_icp.dts
>> index 806eb1d911d7..d7b59e16a081 100644
>> --- a/arch/arm/boot/dts/at91-sama5d2_icp.dts
>> +++ b/arch/arm/boot/dts/at91-sama5d2_icp.dts
>> @@ -42,14 +42,14 @@ main_xtal {
>>                 };
>>         };
>>
>> -       gpio_keys {
>> +       gpio-keys {
>>                 compatible = "gpio-keys";
>>
>>                 pinctrl-names = "default";
>>                 pinctrl-0 = <&pinctrl_key_gpio_default>;
>>                 status = "okay";
>>
>> -               sw4 {
>> +               switch-4 {
> 
> Same here, button not switch.
> 
> Other than this, looks good to me.

Thanks for checking


Best regards,
Krzysztof
