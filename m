Return-Path: <SRS0=3KZd=R6=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846B4C433EF
	for <soc@archiver.kernel.org>; Fri, 14 Jan 2022 07:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4DF71C36AED; Fri, 14 Jan 2022 07:49:49 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C979FC36AEA
	for <soc@kernel.org>; Fri, 14 Jan 2022 07:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C979FC36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E4BF93F1DE
	for <soc@kernel.org>; Fri, 14 Jan 2022 07:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642146579;
	bh=OfGvrCtC8xlimA6cEB+wdrguTqUYJCj+ZRy5BPwVdRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=rvnhcpIsdT0H1KLlqRxKjJWod5k29zZ1KWg/DoQ5NPBvzBUXEFDaF51HSKrZDSxPK
	 UoAUxQBx/4R5/aXTaIrDD1ILeNgF9cyZy4wzRvw7y8s4bvuys+TCdVeaouOf8R04Go
	 +gzLv52SDoU8wPwWwcObJTg8y1PfCP1b1wKpxzzrdQcfvF3M3eJZcn/w3HUn1TORwP
	 cdYidNoDlU1jr1m9+L52ccAlrb8PhbaHtrKPJh9F9snnU7+qY1B7VIH3u2QcvMoJZs
	 7ldH4OJwP2rHwsnFiMO0mB1cgnz6dXWFcHKetzoKGravtVDZPr4JEQR02yXOkeBLPG
	 BCBLC3VHVYWGg==
Received: by mail-ed1-f69.google.com with SMTP id h1-20020aa7cdc1000000b0040042dd2fe4so6362493edw.17
        for <soc@kernel.org>; Thu, 13 Jan 2022 23:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OfGvrCtC8xlimA6cEB+wdrguTqUYJCj+ZRy5BPwVdRo=;
        b=BgQYei2TBP8S3mnNZdNeeJ7hiCBUmD1t+RmWLZT4ITCKQHGmH1tvbX5RWDSAF4g231
         JuwT3YXKYevhRAymjCPJZrjG3CMwVNxA76Ri6h3FLvVrYEcOJ0DhiTgCRAt1WGcX0ZGp
         bBI6uTUPJQ5DXGeJHTf4PSoSl5K85VN6MF7A6bLC8TEtqlTVmhYuqaOzJIU/RxsESLII
         DgCQPc9M3Y0NKEIpvmOYvQXXocjBzmVFo1RswkUmSWJ98XXr5PPx3/wNxgvX9xnfmgFA
         W8cRGtxNVbVdKa3CddHw2h5O8qfbh+4m0RRs/b3XmO5DjAm19tssNFo0F0WwUHWfgRK1
         eGhg==
X-Gm-Message-State: AOAM5319MK58e4P42PEUTBvSpOaOZMyhTaAjEzoAUT8YgbmwyhJ3rKLq
	iQiaCiGfhqK5k80HO1+IqPz8MG5PAQ2NMtHqJmmR0f0h4gbOQb2mBtXL6pFeuZlXGGBEhlpatJH
	qIN4BJH0RNpG+KtVoOYpqavQ=
X-Received: by 2002:a05:6402:2685:: with SMTP id w5mr7710430edd.151.1642146578015;
        Thu, 13 Jan 2022 23:49:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx28rjBXLGcKe6hIBmUk/lmPK/ygVLWajiItPMzl6kJqav/dcWM9ZuCOshtlFa/+UuDpfMTkw==
X-Received: by 2002:a05:6402:2685:: with SMTP id w5mr7710414edd.151.1642146577885;
        Thu, 13 Jan 2022 23:49:37 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id jg41sm1602954ejc.101.2022.01.13.23.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 23:49:37 -0800 (PST)
Message-ID: <65e6f034-278a-81fa-844d-10a1865a25a4@canonical.com>
Date: Fri, 14 Jan 2022 08:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 10/23] dt-bindings: pinctrl: samsung: Add compatible for
 Tesla FSD SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122354epcas5p19e5cebe9e85e9ba1758fa0b9d7d1ef75@epcas5p1.samsung.com>
 <20220113121143.22280-11-alim.akhtar@samsung.com>
 <849c7772-0f7e-32ff-6ea6-c46aa6837bb4@canonical.com>
 <076101d80909$d5849060$808db120$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <076101d80909$d5849060$808db120$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2022 06:44, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Thursday, January 13, 2022 5:57 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Cc: soc@kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
>> olof@lixom.net; linus.walleij@linaro.org; catalin.marinas@arm.com;
>> robh+dt@kernel.org; s.nawrocki@samsung.com; linux-samsung-
>> soc@vger.kernel.org; pankaj.dubey@samsung.com; linux-fsd@tesla.com
>> Subject: Re: [PATCH 10/23] dt-bindings: pinctrl: samsung: Add compatible for
>> Tesla FSD SoC
>>
>> On 13/01/2022 13:11, Alim Akhtar wrote:
>>> Add compatible for Tesla Full Self-Driving SoC. The pinctrl hardware
>>> IP is similar to what found on most of the exynos series of SoC, so
>>> this new compatible is added in samsung pinctrl binding.
>>>
>>> Cc: linux-fsd@tesla.com
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>  Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>>> b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>>> index b8b475967ff9..ba972998a0e4 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>>> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>>> @@ -24,6 +24,7 @@ Required Properties:
>>>    - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
>>>    - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
>>>    - "samsung,exynosautov9-pinctrl": for ExynosAutov9 compatible pin-
>> controller.
>>> +  - "tesla,fsd-pinctrl": for Tesla FSD SoC compatible pin-controller.
>>>
>>
>> Please rebase this on my latest Samsung pinctrl dtschema patches. You also
>> need a tesla vendor prefix patch (separate).
>>
> Sure will rebase when sending v2, your latest patches are in Linux-next or still in your tree?

The SPI (v3) and pinctrl (v2) dtschema patches are on mailing lists.
They seem to be done, so after merge window they will make to
linux-next. If you want earlier, grab them from mailing list or from
branches:
https://github.com/krzk/linux/tree/n/dt-bindings-samsung-spi-schema-v3
https://github.com/krzk/linux/tree/n/dt-bindings-samsung-pinctrl-schema-v2


Best regards,
Krzysztof
