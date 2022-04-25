Return-Path: <SRS0=S0Ur=VD=denx.de=marex@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFC8C433F5
	for <soc@archiver.kernel.org>; Mon, 25 Apr 2022 10:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 247FAC385AD; Mon, 25 Apr 2022 10:26:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 381D8C385A4;
	Mon, 25 Apr 2022 10:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 381D8C385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6C5E1810FC;
	Mon, 25 Apr 2022 12:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1650882357;
	bh=gXw9wbk3lFJ9g4L4B5F3yY9pXLjcZ/owkMTe5ZZCa0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dgMcUi0GQt8nE0WH0AGCxbOzQ2uuSYSHeELx4TvjT+IWv+1SU9KXo9B/pdVY0lH/J
	 1+oi3EOMyMQhPRjB35uJRr2ir3prdwPQY3RKpr4lhNNlnQ7OZdpCUvucwWAFJSGvKy
	 aDz1l0nTTYM873Qck3SFEruHonUDYnwHioshjwVVL5cAgw+3G7vFXItRGK+fT8zx4F
	 5qklaoVmnu0qg5WcSJ2a1vqCxZofuxxcHkXRoCic37VlLg5/HIbdFKe+dxikxfmiLa
	 kQUBY70C8jE7IcQxuPe3Jfv+D+AQUWGxLq7pZjWlwJrVoc2xwCMt4ZxVKBpCOnwxJP
	 bawPT+pWtWsUw==
Message-ID: <71c0dd94-8cd3-9ca0-f06d-ee13ad063618@denx.de>
Date: Mon, 25 Apr 2022 12:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/8] ARM: dts: stm32: enable optee firmware and SCMI
 support on STM32MP15
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Etienne CARRIERE <etienne.carriere@st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, "soc@kernel.org" <soc@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-7-alexandre.torgue@foss.st.com>
 <174bea56-3e99-e01c-4133-f1350d34448d@denx.de>
 <PAXPR10MB4687B8C3DF485E814AE8158BFDF89@PAXPR10MB4687.EURPRD10.PROD.OUTLOOK.COM>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <PAXPR10MB4687B8C3DF485E814AE8158BFDF89@PAXPR10MB4687.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean

On 4/25/22 12:19, Etienne CARRIERE wrote:
> Hello Marek,

Hi,

>> From: Marek Vasut <marex@denx.de>
>>
>>> On 4/22/22 17:09, Alexandre Torgue wrote:
>>> Enable optee and SCMI clocks/reset protocols support.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi
>>> b/arch/arm/boot/dts/stm32mp151.dtsi
>>> index 7fdc324b3cf9..1b2fd3426a81 100644
>>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>>> @@ -115,6 +115,33 @@
>>>                  status = "disabled";
>>>          };
>>>     
>>> +     firmware {
>>> +             optee: optee {
>>> +                     compatible = "linaro,optee-tz";
>>> +                     method = "smc";
>>> +                     status = "disabled";
>>> +             };
>>
>> Doesn't this TEE node get automatically generated and patched into DT by
>> the TEE ? I think OpTee-OS does that.
> 
> OP-TEE OS does that if it gets passed the DT from early boot stage which is not always the case.

Shouldn't that be something to fix ?

I think R-Car3 does that already.
