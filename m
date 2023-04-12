Return-Path: <SRS0=6Rzd=AD=gmail.com=musashino.open@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE826C77B73
	for <soc@archiver.kernel.org>; Wed, 12 Apr 2023 05:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5669C4339B; Wed, 12 Apr 2023 05:21:37 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED10EC433EF;
	Wed, 12 Apr 2023 05:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED10EC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id pc4-20020a17090b3b8400b0024676052044so10472562pjb.1;
        Tue, 11 Apr 2023 22:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681276892; x=1683868892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYmSw4M2zSpTHIuVL2VCqZClUYz7peu+YKffC8bhUuM=;
        b=OP0qz1nv8X3eJDsXpGpbCfRAl8ZpuUjgXe3XrpJB96Hw0MVetiRnvjeb/F96BbMO7O
         bV1CfCSMFBVUYbvHb3Zp1O9Dn3h+aH37EKieZKib+Vbi2VMQglBIcVHojIM5WeSdL6PC
         TgaqozIiyCvNPH861mQyyovpdq47Svu5kCopVwIV/rS9V0miQWHhE+NC/W/Tg/V2MQ3b
         WJTSECW2GR36aMOXDA/1ioTvfunpnuzFQ2+VDb342a2XsBLrGVd8y2iB4fv84jRRCJQS
         ooDPd+tw0Grwqo5GvcJMARn/YRgZeLdO6EpbUMgEz2kcCBfb6dpVS0E50iJUgDUk6bGU
         1uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681276892; x=1683868892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYmSw4M2zSpTHIuVL2VCqZClUYz7peu+YKffC8bhUuM=;
        b=lJ3NLP924RaoBE9LXR+oyhjYJQ8jOb7a5PEeWBiO80zhDiATEnM+shcRR3QXEC9FsL
         h7KeZTElq60WgHXbij1lzzMdlm7RSwg9bvJ0RF4zN3WW2U+MrV2XqK9tzrv91N5nsYAH
         I9gIkAXDUgM1ee0Xv5apvxKpOqwrdqeyKhtl0GCfeHDBAPAo7e+Y+FS5P4IDSC27m++2
         cqoPukJGMD1V9EREqIyMJLCpgDzFaWdrxOGqRnrQqgCyAMHoImddFWlVxkaeJPjReejU
         13073wSo1iiEhwJQDbVq3G98Ez5Ed+BcsP4HRT3xHHNp0npz4bThnZhMerGahaGOPFrx
         u8yQ==
X-Gm-Message-State: AAQBX9eyLEu4yEiDSf3SIJ3x3D07EzJNtjtDCvIiKEfh/IGNCzsEXPgL
	1ApTVE30LkxL+fhvhzKZ7qk=
X-Google-Smtp-Source: AKy350Y9MweMdSI7XakQOqVias4XTj4mCMW1++u0u7/TthH3sBNsst8tkfffQ3rzVeyEjyNlrn+UfQ==
X-Received: by 2002:a17:902:c942:b0:1a6:6177:5f4f with SMTP id i2-20020a170902c94200b001a661775f4fmr942241pla.53.1681276892239;
        Tue, 11 Apr 2023 22:21:32 -0700 (PDT)
Received: from ?IPV6:240b:12:500:6500:bd4f:1cf3:a969:fcfe? ([240b:12:500:6500:bd4f:1cf3:a969:fcfe])
        by smtp.gmail.com with ESMTPSA id a19-20020a1709027d9300b001a065d3ea3bsm10474558plm.295.2023.04.11.22.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 22:21:31 -0700 (PDT)
Message-ID: <231f9093-968b-e008-f2ff-899d8b24459c@gmail.com>
Date: Wed, 12 Apr 2023 14:21:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com> <Y/d7gjqQCKKXMHqj@lunn.ch>
 <7d4a218d-8b8a-5a1d-eff8-e154bfde69be@gmail.com> <87jzyn3dv9.fsf@BL-laptop>
 <64b5504d-c81d-f77e-da67-c6d9e76aedd6@gmail.com>
 <b153523b-45cf-4e2e-8d62-de15b01a158d@lunn.ch>
From: INAGAKI Hiroshi <musashino.open@gmail.com>
In-Reply-To: <b153523b-45cf-4e2e-8d62-de15b01a158d@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Andrew Lunn,

thank you for your guidance, I'll do it.

Regards,
Hiroshi

On 2023/04/09 23:07, Andrew Lunn wrote:
> On Sun, Apr 09, 2023 at 02:13:11PM +0900, INAGAKI Hiroshi wrote:
>> Hello Gregory CLEMENT,
>>
>> On 2023/04/08 0:34, Gregory CLEMENT wrote:
>>> Hello INAGAKI Hiroshi,
>>>
>>> do you plan to send a v2 soon based on the reviews you got ?
>> Yes, I'm planning to send the next series.
>> But I don't know the details about "documenting the board compatibles"
>> suggested by Krzysztof Kozlowski and I don't know what to do for it, so I'm
>> pausing this contribution...
> Create Documentation/devicetree/bindings/arm/marvell/armada-380.yaml
>
> Put in it
>
> # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> %YAML 1.2
> ---
> $id: http://devicetree.org/schemas/arm/marvell/armada-380.yaml#
> $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> title: Marvell Armada 380 SoC architecture
>
> maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
>
> description:
>    Platforms based on Marvell Armada 380 SoC architecture.
>
> properties:
>    $nodename:
>      const: '/'
>    compatibnle:
>      oneOf:
>
>        - description: Marvell Armada 380 SoC based platforms
>          items:
>            - enum:
>                - phytec,pcm049   # Phytec OMAP 4460 SoM
>            - const: "marvell,armada380"
>
> additionalProperties: true
>
>
> But replace the phytex,pcm049 with the compatible for your board.
>
>      Andrew
