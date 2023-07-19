Return-Path: <SRS0=Ao5Q=DF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F80C0015E
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 19:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90971C433CB; Wed, 19 Jul 2023 19:24:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28231C433C8
	for <soc@kernel.org>; Wed, 19 Jul 2023 19:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28231C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso6454718f8f.2
        for <soc@kernel.org>; Wed, 19 Jul 2023 12:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689794662; x=1692386662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+blPZKyB9kQFw2yoby4zINVsIsHNl22npZY9ACzq+7M=;
        b=bk8lvJ6g3z6EPgXbtKn2Fzd23CEOBNs5B1l2gctQmMUF7pzcwOKdqAWXywZ2qlO7Zs
         KZzMKMmfo8R16jLokoMrLIoWfIK/sQCjrsHJgrN40ivwJoeT1TrqcpbDzqDWvTweDkTL
         xJbOQNl8Zd07wwRany4lpu7oJJ9YB7Ff7Wsalr5En8vLMJNti0/m0E5bawSpG0CdndEh
         x4/QDJlDfCPB1gcsIwcB8GnipJUR4Dvq3xLMLbjDvgOcT1lyJxFO234K/82SS5fWLJdp
         PCGwe5bHlKCoFZi1MVy+rMZ89QxOsG5LWxf5XXIJh+xa5dG6Y7dWwlf7sas/pzNs0P+Z
         32tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794662; x=1692386662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+blPZKyB9kQFw2yoby4zINVsIsHNl22npZY9ACzq+7M=;
        b=KFH+KqMkNKCuodwnF9NhiMwNKiG9vPCnHaAZmqtCspE2R5lKBgGLN8w0TAWBynXJbU
         DtG4tHCJs0QTc4lCEqLazmc2L2WTuDgtOQgDtvMraTIYUMJpF0zXAz+9UZ1YpLjYZX/e
         QEhTrnvIWvXca1w3R3Zfm1YbnNlg11ZIn6jUwrzT7Gum8R4eF1YYFtctoLw8cgi1YOJL
         WR/6nVrYsN3CM6EQ00xgvZXGwSZPYLW3nnVrUFJu9IyvX4VLlKO+zLKkEKU2BPPziLRk
         9BeDvYX7x9/9uIW+kj0gH6YH+NElI3I8FW1W7S4zmh/jT7opxIEV6+R2UF84vGntW2Jo
         +PNQ==
X-Gm-Message-State: ABy/qLZU3VFk15SmHH7QwjSs1F1ZpNrDDi8mq/P3sYN7Ya0zx32Mj8Bw
	tWmXBWai/Bi22wtBdTxrfdIYcA==
X-Google-Smtp-Source: APBJJlG/IP1yeppp6oYFbXTEcgn9BuyhttF9KKLqZS7LmXAJAfIbTTU894byU/ZqPDkhiyIy/y8yOQ==
X-Received: by 2002:a5d:538d:0:b0:314:4915:689 with SMTP id d13-20020a5d538d000000b0031449150689mr642273wrv.34.1689794662315;
        Wed, 19 Jul 2023 12:24:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p1-20020adff201000000b003141f3843e6sm6005395wro.90.2023.07.19.12.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 12:24:21 -0700 (PDT)
Message-ID: <792641d2-3a27-4f87-fa90-2490a302685e@linaro.org>
Date: Wed, 19 Jul 2023 21:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ARM: dts: imx6qdl: Add Variscite VAR-SOM-MX6 SoM
 support
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230719160048.2737423-1-james.hilliard1@gmail.com>
 <03748443-0459-c925-ce76-33ec134a303d@linaro.org>
 <CADvTj4pgA_XjYZyU+D+J2QdC4NPFTxPSBCvrpK8WNjFkzkz-KQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADvTj4pgA_XjYZyU+D+J2QdC4NPFTxPSBCvrpK8WNjFkzkz-KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/07/2023 20:57, James Hilliard wrote:
> On Wed, Jul 19, 2023 at 11:16 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>


>>> +
>>> +/ {
>>> +     model = "Variscite i.MX6 QUAD/DUAL VAR-SOM-MX6";
>>> +     compatible = "fsl,imx6q";
>>
>> That's not correct compatible. It's not Imx6 soc. It's a som.
> 
> I'm confused, AFAIU the VAR-SOM-MX6 uses an imx6q SoC.

True, I should say - that's incomplete compatible. You claim here this
is imx6q. Not that it uses imx6q... Add your own compatible and document
all of them.

> 
>>
>>> +...
>>> +
>>> +     sound: sound {
>>> +             compatible = "simple-audio-card";
>>> +             simple-audio-card,name = "var-som-audio";
>>> +             simple-audio-card,format = "i2s";
>>> +             simple-audio-card,bitclock-master = <&sound_codec>;
>>> +             simple-audio-card,frame-master = <&sound_codec>;
>>> +             simple-audio-card,widgets = "Headphone", "Headphone Jack",
>>> +                                         "Line", "Line In", "Microphone", "Mic Jack";
>>> +             simple-audio-card,routing = "Headphone Jack", "HPLOUT",
>>> +                                         "Headphone Jack", "HPROUT",
>>> +                                         "LINE1L", "Line In",
>>> +                                         "LINE1R", "Line In";
>>> +
>>> +             sound_cpu: simple-audio-card,cpu {
>>> +                     sound-dai = <&ssi2>;
>>> +             };
>>> +
>>> +             sound_codec: simple-audio-card,codec {
>>> +                     sound-dai = <&tlv320aic3106>;
>>> +                     clocks = <&clks IMX6QDL_CLK_CKO>;
>>> +             };
>>> +     };
>>> +
>>> +     wlan_bt_rfkill {
>>
>> No underscores in node names.
>>
>> Just "rfkill"
>>
>>
>>> +             compatible = "rfkill-gpio";
>>> +             name = "wlan_bt_rfkill";
>>> +             type = <2>;     /* bluetooth */
>>> +             gpios = <&gpio6 18 GPIO_ACTIVE_HIGH>;
>>> +     };
>>> +};
>>> +
>>
>> ...
>>
>>> +     tlv320aic3106: codec@1b {
>>> +             compatible = "ti,tlv320aic3106";
>>> +             reg = <0x1b>;
>>> +             #sound-dai-cells = <0>;
>>> +             DRVDD-supply = <&reg_3p3v>;
>>> +             AVDD-supply = <&reg_3p3v>;
>>> +             IOVDD-supply = <&reg_3p3v>;
>>> +             DVDD-supply = <&reg_3p3v>;
>>> +             ai3x-ocmv = <0>;
>>> +             reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>;
>>> +             ai3x-gpio-func = <
>>> +                     0 /* AIC3X_GPIO1_FUNC_DISABLED */
>>> +                     5 /* AIC3X_GPIO2_FUNC_DIGITAL_MIC_INPUT */
>>> +             >;
>>> +     };
>>> +};
>>> +
>>> +&iomuxc {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_hog>;
>>> +
>>> +     imx6qdl-var-som-mx6 {
>>> +             pinctrl_hog: hoggrp {
>>> +                     fsl,pins = <
>>> +                             /* CTW6120 IRQ */
>>> +                             MX6QDL_PAD_EIM_DA7__GPIO3_IO07          0x80000000
>>> +                             /* SDMMC2 CD/WP */
>>> +                             MX6QDL_PAD_KEY_COL4__GPIO4_IO14         0x80000000
>>> +                             MX6QDL_PAD_KEY_ROW4__GPIO4_IO15         0x80000000
>>> +                     >;
>>> +             };
>>> +
>>> +             pinctrl_audmux: audmux {
>>
>> It does not look like you tested the DTS against bindings. Please run
>> `make dtbs_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst or
>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>> for instructions).
>>
>> AFAIR, all of them end with grp
> 
> Ah, that's def throwing a bunch of warnings, although quite a few look
> to be existing
> issues in dependent dtsi files. I'll clean up what I can there.
> 
>>
>>
>> ...
>>
>>> +
>>> +&usdhc3 {
>>> +     pinctrl-names = "default", "state_100mhz", "state_200mhz";
>>> +     pinctrl-0 = <&pinctrl_usdhc3>;
>>> +     pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
>>> +     pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
>>> +     bus-width = <4>;
>>> +     vmmc-supply = <&reg_wl18xx_vmmc>;
>>> +     non-removable;
>>> +     wakeup-source;
>>> +     keep-power-in-suspend;
>>> +     cap-power-off-card;
>>> +     #address-cells = <1>;
>>> +     #size-cells = <0>;
>>> +     status = "okay";
>>> +
>>> +     wlcore: wlcore@0 {
>>
>> Generic node names. Is this wifi?
> 
> I think it also supports bluetooth technically, although that might be
> under a different node.
> 

Bluetooths are usually under serial, so this is just wifi.

Best regards,
Krzysztof

