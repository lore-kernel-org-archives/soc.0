Return-Path: <SRS0=EJTU=TW=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596DEC433F5
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 14:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17FBDC340E9; Fri, 11 Mar 2022 14:33:13 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D04ECC340ED
	for <soc@kernel.org>; Fri, 11 Mar 2022 14:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D04ECC340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 99F843F799
	for <soc@kernel.org>; Fri, 11 Mar 2022 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1647009188;
	bh=OnW6EN46n7vaYBFSgg2vgSftb7Rx3mwGGTomxWm4iNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=jRWetIREIKNVrL4/o42mzVkqKP1aHpmS5Fyi4qT6dNPKHbe0ww+wK/sO4CqHAcZbh
	 ysHr7B0IuQ1TB6nk3ecm23Hdrvm20n7uDxiJkKuNv+Fa/37D9ykn8SD/e8HHTw8bSf
	 H7ZLYcuhmVQBgBXNE09RLg1fo4aC0xCL6iQLrGdcAeb+CC+RFKUit98cNHQJtJxUew
	 OMxycZSJ/NwM+fZhtJ3tO2N2bRWJ84n0uaMjtpE5mM1kdwA5Jk3Rb/TAOVzvT68ynj
	 ZUZDNWZV5zLLPxBfNoai+HKG6q9L8cR3s+qXVH6kr6g4jDTZPOsrON8u7hRSGPsHCD
	 DbkPXcmx5TYzA==
Received: by mail-wm1-f72.google.com with SMTP id 3-20020a05600c230300b00384e15ceae4so5566735wmo.7
        for <soc@kernel.org>; Fri, 11 Mar 2022 06:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OnW6EN46n7vaYBFSgg2vgSftb7Rx3mwGGTomxWm4iNQ=;
        b=6mB48pGn1OC7+OJAoFCcstLvISfA/aMCVfdDiYVe67BU9zahnE4YN/GbZu8H5WeU4O
         FRFZHp3YRCJEY1Zqd7gTIk+fFONI9+GPkLZI6niboCTOdyug31eIMxMiWsk0EyWYRGZT
         ttlqLK4DISpsCaI0MUvyx6mXC7o1EA/j7hBr3ZUyo2ubdbdhGMtvZd1puhNCT709Zxpx
         nFxkmnhUbGonWCysEYanlyJnhzbIS+H6qMg3i7WzogSkTKzzcUjvZ++rOJEv09HJU7Zh
         SsbpeVCaqvPtW8Z3cHhSHfU7cvxWZ38/KYGx1UsJGmH7QGWpdH8e2HYQY1k3jxBdBuw5
         4fBg==
X-Gm-Message-State: AOAM532nPoylSfVwO+o2DXyCw5DzV1jNCrxLAWRs4YeaPic+yTOAKoT/
	WJCQEnyq2vVLsajo+X+6m1Jx01xtdm74lVVAE4TDzxDGe0O9P0XFmeJhKEqr3XANIpj8BXOZzhz
	PBcptmRNyd4S+scn64wchcMw=
X-Received: by 2002:a05:600c:34c4:b0:389:a4c3:c4b1 with SMTP id d4-20020a05600c34c400b00389a4c3c4b1mr7607592wmq.65.1647009188131;
        Fri, 11 Mar 2022 06:33:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFzx1SPSweAq4eva3FzBdIfwL59AEbdj699V43mjce3zliJKeU+w5FN7C7Zd5dBSf5kORNAg==
X-Received: by 2002:a05:600c:34c4:b0:389:a4c3:c4b1 with SMTP id d4-20020a05600c34c400b00389a4c3c4b1mr7607573wmq.65.1647009187861;
        Fri, 11 Mar 2022 06:33:07 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id 10-20020adf808a000000b001edd413a952sm6726713wrl.95.2022.03.11.06.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 06:33:07 -0800 (PST)
Message-ID: <2f53f17a-427c-62d6-a0c6-4a3962ab01f0@canonical.com>
Date: Fri, 11 Mar 2022 15:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] ARM: dts: lpc32xx: Update spi clock properties
Content-Language: en-US
To: Vladimir Zapolskiy <vz@mleia.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
 <20220311093800.18778-4-singh.kuldeep87k@gmail.com>
 <4aae560d-d266-d0d0-136f-32891b15bc01@mleia.com>
 <CAK8P3a3a_WXbDKN-jJUt_Wuvop0rfaUs4ytwyhogOxdtJAPx0w@mail.gmail.com>
 <4f39f086-1932-1729-8761-d5c533356812@mleia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <4f39f086-1932-1729-8761-d5c533356812@mleia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2022 15:07, Vladimir Zapolskiy wrote:
> On 3/11/22 3:38 PM, Arnd Bergmann wrote:
>> On Fri, Mar 11, 2022 at 2:20 PM Vladimir Zapolskiy <vz@mleia.com> wrote:
>>>
>>> On 3/11/22 11:38 AM, Kuldeep Singh wrote:
>>>> PL022 binding require two clocks to be defined but lpc platform doesn't
>>>> comply with bindings and define only one clock i.e apb_pclk.
>>>>
>>>> Update spi clocks and clocks-names property by adding appropriate clock
>>>> reference to make it compliant with bindings.
>>>>
>>>> CC: Vladimir Zapolskiy <vz@mleia.com>
>>>> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
>>>> ---
>>>> v2:
>>>> - New patch with similar changeset
>>>> - Send to soc ML
>>>>
>>>>    arch/arm/boot/dts/lpc32xx.dtsi | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
>>>> index c87066d6c995..30958e02d5e2 100644
>>>> --- a/arch/arm/boot/dts/lpc32xx.dtsi
>>>> +++ b/arch/arm/boot/dts/lpc32xx.dtsi
>>>> @@ -178,8 +178,8 @@ ssp0: spi@20084000 {
>>>>                                compatible = "arm,pl022", "arm,primecell";
>>>>                                reg = <0x20084000 0x1000>;
>>>>                                interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
>>>> -                             clocks = <&clk LPC32XX_CLK_SSP0>;
>>>> -                             clock-names = "apb_pclk";
>>>> +                             clocks = <&clk LPC32XX_CLK_SSP0>, <&clk LPC32XX_CLK_SSP0>;
>>>> +                             clock-names = "sspclk", "apb_pclk";
>>>
>>> In fact I'm uncertain if it is the right change, could it happen that the commit
>>> cc0f6e96c4fd ("spi: dt-bindings: Convert Arm pl022 to json-schema") sets a wrong
>>> schema pattern?
>>
>> Good pointm this doesn't quite seem right: it is unlikely that the same clock
>> is used for both the SPI bus and the APB bus.
>>
>>> Apparently just one clock is wanted on all observed platforms and cases, this
>>> is implicitly confirmed by clock handling in the drivers/spi/spi-pl022.c :
>>>
>>>          pl022->clk = devm_clk_get(&adev->dev, NULL);
>>>
>>> So, I would vote to fix the device tree bindings schema.

Drivers do not describe the hardware. Bindings should not be modeled on
drivers, but on actual hardware, so the example is not convincing.

>>
>> Isn't this just using the wrong name? The name of the macro
>> LPC32XX_CLK_SSP0 might indicate that this is indeed the SPI clock
>> rather than the APB clock, so we only need to change clock-names
>> property here and leave it unchanged otherwise.
> 
> Yes, the name is wrong, here I'm ready to take the blame:
> 
> Fixes: 93898eb775e5 ("arm: dts: lpc32xx: add clock properties to device nodes")
> 
> Noteworthy the commit above presets the same clock name to other PrimeCell
> controllers, namely pl110 (LCD), pl080 (DMA), pl175 (EMC) and pl18x (SD),
> plus this one pl022 (SSP), and all but SSP and SD are AHB slaves in fact.
> 
> On LPC32xx the bus clock source and function clock source for SSP is HCLK.
> 
> My guess is that the misnamed "apb_pclk" migrated into the schema from
> the lpc32xx.dtsi, so I'd suggest, unless some platform really needs it,
> firstly fix the schema by removing "apb_pclk" clock. It will leave just one
> clock, so "clock-names" property can be set as optional, and the drop
> the property from the lpc32xx.dtsi.
> 
>> Looking at the driver, I also see that this refers to the clock as
>> "SSP/SPI bus clock", and it reads the rate from that.
> 
> Yes, that's correct, it's a SPI bus clock with an option to set a rate.

It seems versioning of this patchset lacks proper references to previous
discussions:
https://lore.kernel.org/linux-devicetree/Yip2MZdQNjMz%2FCos@robh.at.kernel.org/


Best regards,
Krzysztof
