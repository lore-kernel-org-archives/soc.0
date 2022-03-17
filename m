Return-Path: <SRS0=FcDo=T4=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4EAC433F5
	for <soc@archiver.kernel.org>; Thu, 17 Mar 2022 08:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3BDAC340EE; Thu, 17 Mar 2022 08:37:11 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86E54C340E9
	for <soc@kernel.org>; Thu, 17 Mar 2022 08:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86E54C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9D2CC3F1D2
	for <soc@kernel.org>; Thu, 17 Mar 2022 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1647506215;
	bh=Aenf1r+odjtoHPxCzbMLtD9uL99h+8AF2uxAxyuOS54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=aLKSpS2oM8UpgSMTh5mmkCVEoIOIvIRaa2x63Jcl9YPHeWk/onyYQzy0MwU3v+8JO
	 O53AlAZ2W294djAu5Ccncv8GGD0p6IO2e+gq8UyJ602A28WbQaSTRZlhZxYcs622N7
	 bejIVp0nokFyaYCZ89t9pMWFpxWNFFQhKL6uCfQTfTQ4r/s1XKFugaTLJeTiQhdvx2
	 rieERVT7BGjh4N/GDqpCQF2zVuMlGf/5pVOtMmvXnLQdLyexRWn4McxByS3GmMMKvM
	 Alb/Wp07s1DtMqJZ7urwKOdOgerI53PZPUVesdZRwfJ9SUXYb+2aj+dZx+tmMpy4ZF
	 h9eP/1BJZ9d0g==
Received: by mail-wm1-f70.google.com with SMTP id m34-20020a05600c3b2200b0038115c73361so1358741wms.5
        for <soc@kernel.org>; Thu, 17 Mar 2022 01:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Aenf1r+odjtoHPxCzbMLtD9uL99h+8AF2uxAxyuOS54=;
        b=b8CEtQb0Y2PTA1Ub1aCH+bihZAQVzL4N6LY8rfVqOrPCmW74kVW4gCLBw2r1JrBIi4
         M1AvNSyDHmQkrtW1a6P0rkeurf4H/MN5527H61+3qM6n0oxsUcPg4k25vbB58CVpl/Cd
         4ApZwO88UAJBpR1v6cTBd5TmnpaQSzKPgKoVt7p1Lqk+XVmvLW53GtdW2dFUdw16wFMg
         RnijKV+G3CeUZKwxcWal7TMs4s84yYIIYhidwhed75DNJWS0ve9o81J+bC/HQxQ4sw5W
         csnmHcdvkHpgHq0+zYuVAWdURHB1AyShNmFBm+tSZ+t9cz7WGuwD8uKtLamCvz61+sug
         mJ7A==
X-Gm-Message-State: AOAM5310V9De1hEcTxxFJi6AoZAg7oqvJY6ukN8QJrPRHOhulh4j+lTH
	XfI/emD6NM5yX6/mUtLID7ojm80TCd0QXHdlYiRAjXPbm1oW9/piX7/cfJpSR5CVzNi4TX6rJBJ
	cCCkZ7OmQfNwBBDBtxkcjPno=
X-Received: by 2002:a5d:6185:0:b0:203:eaa6:7fee with SMTP id j5-20020a5d6185000000b00203eaa67feemr1444631wru.523.1647506213469;
        Thu, 17 Mar 2022 01:36:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJZektFnlITP8f7Plb326+U02zgGEzii73mdienA+JhznN3cxPwQr2vDwz4ClXnOR2D7Jyvg==
X-Received: by 2002:a5d:6185:0:b0:203:eaa6:7fee with SMTP id j5-20020a5d6185000000b00203eaa67feemr1444623wru.523.1647506213260;
        Thu, 17 Mar 2022 01:36:53 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id o41-20020a05600c512900b00389d8c3e2b9sm3787994wms.15.2022.03.17.01.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 01:36:52 -0700 (PDT)
Message-ID: <fb4def96-4b20-604f-d15d-fef87eb2232d@canonical.com>
Date: Thu, 17 Mar 2022 09:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device
 tree
Content-Language: en-US
To: "Hawkins, Nick" <nick.hawkins@hpe.com>,
 "Verdun, Jean-Marie" <verdun@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220310195229.109477-1-nick.hawkins@hpe.com>
 <20220310195229.109477-9-nick.hawkins@hpe.com>
 <eb66cc83-2da9-8e19-db69-633e34fef946@canonical.com>
 <PH0PR84MB1718C31DB71AA2A67FEC5F6E88119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <b1cc2566-cd78-7cb4-f8a5-d6fc8065fe6e@canonical.com>
 <PH0PR84MB1718292B1C11F4FE83326A5388119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <PH0PR84MB1718292B1C11F4FE83326A5388119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/03/2022 21:10, Hawkins, Nick wrote:

(...)

>>>>> I think one of previous comments was that you cannot have "generic-ehci"
>>>>> only, right?
>>>
>>> Yes there was, I removed the usb0: ehci@cefe0000. I see now that this is in reference to the compatible. This is our ehci controller. What would be a more appropriate compatible? Do we need hpe,gxp-ehci perhaps?
> 
>> Yes,, see other cases in generic-ehci.yaml bindings. Your current choice would be pointed out by dtbs_check, that it's invalid according to current bindings.
> 
> For some reason when I compile I am not seeing a warning for that file. I have been using "make dtbs_check" and "make dtbs W=1". Perhaps I am missing an important flag?

My bad, I misread the generic-ehci binding, so your compatible is
actually correct from bindings point of view. Still common practice is
to add own compatible which allows later customization.

> In the case of creating a hpe,gxp-ehci binding would I need to add that to the generic-ehci.yaml?

Yes, add your compatible to that big enum with list of many implementations.

(...)

>>>>>>> +
>>>>>>> +		memclk: memclk {
>>>>>>> +			compatible = "fixed-clock";
>>>>>>> +			#clock-cells = <0>>>>;
>>>>>>> +			clock-output-names = "memclk";
>>>>>>> +			clock-frequency = <800000000>>>>;
>>>>>>> +		};
>>>
>>>>> What are these clocks? If external to the SoC, then where are they? On the board?
>>>
>>> This was the internal iopclk and memclk they were both internal to the chip.
>>> For now I am removing osc and memclk and will just have an iopclk that Gxp-timer will refer to.
> 
>> You should rather have a clock controller driver which defines this (and many others). They can stay as a temporary work-around, if you really need them for some other nodes.
> 
> I am trying to picture what you are saying but I am unsure, I know that on a separate review you mentioned that the gxp-timer needed to have clocks, and clock-names inside the node. Would it be improper for the gxp-timer to reference iopclk?

It all depends on the architecture of your SoC. I could imagine such one:
1. Few external (from SoC point of view) oscillators, usually provided
on the board. It could be 24 MHz, could be 32767 Hz for Bluetooth etc.

2. One or several clock controllers inside the SoC which take as input
these external clocks. The clock controller provides clocks for several
other components/blocks. Allows also gating clocks, reparenting and
changing dividers (rate).

3. Other blocks within your SoC, e.g. gxp-timer, use these clocks.

The true question is where is that memclk or iopclk generated? Is it
controllable (gate/mux/rate)? Even some fixed-frequency clocks, coming
out of that clock controller (point 2.), are defined in the clock
controller because that's the logical place for them.


Best regards,
Krzysztof
