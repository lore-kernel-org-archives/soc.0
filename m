Return-Path: <SRS0=h569=UG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCD6C433EF
	for <soc@archiver.kernel.org>; Sun, 27 Mar 2022 19:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 995BFC340ED; Sun, 27 Mar 2022 19:14:14 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEEC2C340EC;
	Sun, 27 Mar 2022 19:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BEEC2C340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id 1so9916924qke.1;
        Sun, 27 Mar 2022 12:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A9CFJgUP2awfrdRyvcJZlVsnkzemv2E9bRx9IkqLSpw=;
        b=RABDT1UvIgfs+0gsswBm8nKHVoEn9ahba0gZNNiPyBfg20ODYkKOkf+6w7wgCae2GB
         TOepgNu0ANmgOZTRuAsC5t7PK1Gd5kpJWxoycfuF7eH31ly8UD3/+CatusD8dRl9zZet
         +XhcSiOEG2isDxl5jHrBilPZ8VfkYyPKJA1PwdmqNEu5rI929SasNWqLcdExaht6V/yi
         pcvJhGdmtfm4b9tsimcfrVNw82AfnIKbrKL4pk1AwoBDkKLcnGxi/5MaxvFRj+Akec04
         HjIXC0fNBw44T7nqIVpKfgtHMS+Ht2Dg+K04CvQcJdj8a2RIVuv9PmEUWnxFfj8kIlam
         5fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A9CFJgUP2awfrdRyvcJZlVsnkzemv2E9bRx9IkqLSpw=;
        b=IsJRFu+EzYCf+88bA3TBxQERIy79AgSrYueLUV05WhvuH+dW0FILd+ilwciPqwuLOs
         XXzLb4/e0SxEuehkGiN1t5phKzjzRlcaBZXEfjfl8vLkJPKIzMbht1/MA1i4qlb8vLo8
         NfvmGVVYphtGzKUaGroDcnyDn6IhFX+OwfCoNVrtiRdAZcfOe6Nl1OXv9Z60l7vNMsWk
         L9Xa4NPVILVMlSkB4xjDBC8vlm8bpsMo9tnh03ety1zRV5NLVtRvZpV8LsiYnpWgGJia
         ZjOIcoy7YHBLipF1lrCdB3z3Cut9jPbSEQw5HXoR8y4Ex5oh00oh+dLmjaIbDqcrJPHc
         wpgg==
X-Gm-Message-State: AOAM530go2gUe4ZGGzfHLDOcQVdB6nkM/pbZ4FO6UPbvOFOkszuNJXqb
	1wo8kEywqNy/zCdAww5YTysbCIq522GlhQ==
X-Google-Smtp-Source: ABdhPJwb3aJO02v5hTdlVjaWdOpqQQb7aYBwYQtrv+VUIaBVEI3QQ2+yzwBkjCsRNY85++BKSn/Jfw==
X-Received: by 2002:a05:620a:199a:b0:67d:4bf0:4a73 with SMTP id bm26-20020a05620a199a00b0067d4bf04a73mr13511957qkb.684.1648408452470;
        Sun, 27 Mar 2022 12:14:12 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 64-20020a370343000000b0067b31f32693sm6888023qkd.109.2022.03.27.12.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 12:14:11 -0700 (PDT)
Message-ID: <8ce4ea34-f389-6eff-2e5b-0f23641df219@gmail.com>
Date: Sun, 27 Mar 2022 15:14:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 03/12] dt-bindings: pinctrl: add i.MXRT1170 pinctrl
 Documentation
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
 linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com,
 tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com,
 cniedermaier@dh-electronics.com, clin@suse.com,
 giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
 <20220326144313.673549-4-Mr.Bossman075@gmail.com>
 <2af35b48-c49d-3a76-256b-c31d2650ed39@kernel.org>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <2af35b48-c49d-3a76-256b-c31d2650ed39@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/27/22 15:08, Krzysztof Kozlowski wrote:
> On 26/03/2022 15:43, Jesse Taube wrote:
>> Add i.MXRT1170 pinctrl binding Documentation
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>>   .../bindings/pinctrl/fsl,imxrt1170.yaml       | 77 +++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
>> new file mode 100644
>> index 000000000000..2e880b3e537c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/fsl,imxrt1170.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MXRT1170 IOMUX Controller
>> +
>> +maintainers:
>> +  - Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +  - Jesse Taube <Mr.Bossman075@gmail.com>
>> +
>> +description:
>> +  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
>> +  for common binding part and usage.
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imxrt1170-iomuxc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +# Client device subnode's properties
>> +patternProperties:
>> +  'grp$':
>> +    type: object
>> +    description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +
>> +    properties:
>> +      fsl,pins:
>> +        description:
>> +          each entry consists of 6 integers and represents the mux and config
>> +          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
>> +          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
>> +          be found in <arch/arm/boot/dts/imxrt1170-pinfunc.h>. The last
>> +          integer CONFIG is the pad setting value like pull-up on this pin. Please
>> +          refer to i.MXRT1170 Reference Manual for detailed CONFIG settings.
>> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +        items:
>> +          items:
>> +            - description: |
>> +                "mux_reg" indicates the offset of mux register.
>> +            - description: |
>> +                "conf_reg" indicates the offset of pad configuration register.
>> +            - description: |
>> +                "input_reg" indicates the offset of select input register.
>> +            - description: |
>> +                "mux_val" indicates the mux value to be applied.
>> +            - description: |
>> +                "input_val" indicates the select input value to be applied.
>> +            - description: |
>> +                "pad_setting" indicates the pad configuration value to be applied.
>> +    required:
>> +      - fsl,pins
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> You miss pinctrl.yaml, why?
In the file name? Because I forgot for the fsl,imxrt1050.yaml, I can 
change for both files.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    iomuxc: iomuxc@400e8000 {
>> +        compatible = "fsl,imxrt1170-iomuxc";
>> +        reg = <0x400e8000 0x4000>;
>> +        pinctrl_lpuart1: lpuart1grp {
>> +            fsl,pins =
>> +              <0x16C 0x3B0 0x620 0x0 0x0  0xf1>,
>> +              <0x170 0x3B4 0x61C 0x0 0x0	0xf1>;
>> +        };
>> +    };
> 
> 
> Best regards,
> Krzysztof
