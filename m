Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B4AC43334
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F263C341C7; Mon, 27 Jun 2022 09:35:19 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51E05C3411D
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51E05C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id u15so17840363ejc.10
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TeN/iwsTV4FhP/OywXKY/fx1M3aFIWw7RCkbflk2R9o=;
        b=WdWufUduLcKXBmqthhLKerQLhk1pUFi7XWTD9qKZ3PlDx5Y7FjMPp8ypB8pn82kYKi
         BWSaxzMgNqx9STnQ46/HTMxh014kcmYRTqsqAQ08HNwys5PInRLlaxCG7RqB2iU3/pQK
         Y3UHsv5GwvBYbZdrNKivf/IuS2O6MgYLqD08RMXgfElnyrjg+waj73Eseg3z+rGjdnkM
         A5Ec6P/315Yqt3hvigPyvgpTsZtqSSM+S7JoXw2IUzApO34x6jRHqwaTk4bk7podakac
         ESSpBJdo7E1FoMYDyDkzql1ExNYhOqa4sVgaUB31NUnwCifu/DcaIfCxeWsEPjwBizit
         QkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TeN/iwsTV4FhP/OywXKY/fx1M3aFIWw7RCkbflk2R9o=;
        b=f70h6AgpbtcZYB3ApPJGDEeH+VAug3wqcKx+IMCMRJid8RlKf7/maoOysF5pH4drvb
         fxXhNs8EP3QX5iy0rxs3iJFz86kyKnNiRvNAditEyRBO0cJgfV9iHPDrcYRObib+ILWJ
         ufPLIM+j6rSbt0N/6eJhBGDbzlGlyg/8f6vCUqkVLc6e/9pw+02FKmJsK5T47f04NhZh
         xhsIQrNzyA51WrPM4luVDJYixb/WbfS0pP1eTpkr5wNepFTsEKsoygGm55eUrQL2aSKF
         i0OwH185fcmyG5aynw4CTF81jd0Pvsrw9WFEbm2Jhm++d1WFopreT165GIhu1MigPkcM
         2eWg==
X-Gm-Message-State: AJIora8l3svNN8CFjIqnGMHVYogTewBp0+H40lGvDSfVgPQtWZ37kbra
	zz1ti6eA5pvf0WGg1sj6ETCPNw==
X-Google-Smtp-Source: AGRyM1uTdIi0aYEYixohA+nAVSHM9M59wtJB/1A4P8XfRZh7rsryDIKZ3vrVQ13PulLSe/wHT/dBAg==
X-Received: by 2002:a17:907:62a9:b0:726:2a3b:8507 with SMTP id nd41-20020a17090762a900b007262a3b8507mr12026191ejc.666.1656322516674;
        Mon, 27 Jun 2022 02:35:16 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z21-20020a170906815500b00722e7e26d22sm4812672ejw.58.2022.06.27.02.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 02:35:16 -0700 (PDT)
Message-ID: <aafd58d6-8705-96ee-7813-9b3bae7bb3d1@linaro.org>
Date: Mon, 27 Jun 2022 11:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
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
Cc: Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220621092120.2427152-1-quan@os.amperecomputing.com>
 <97934f38-4da5-ab9e-7089-d6e48edd5e6a@linaro.org>
 <9120c167-38c2-f8c4-e039-4202d5844639@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9120c167-38c2-f8c4-e039-4202d5844639@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2022 11:32, Quan Nguyen wrote:
>>> +
>>> +	ltc2497_reg: ltc2497_regulator {
>>
>> No underscores in node name, no specific names (Devicetree spec requires
>> generic), so ltc2497 has to go. You could add some more specific
>> prefix/suffix to describe the function.
>>
> This is to monitor peripheral voltage so it would be updated to:

But it is a regulator, not a voltage monitor, so the node name could be:
regulator-0
regulator-voltage-mon
voltage-mon-regulator

> 
>           voltage_monitor: voltage-monitor {
> 
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "ltc2497_reg";
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +		regulator-always-on;
>>> +	};
>>> +


Best regards,
Krzysztof
