Return-Path: <SRS0=S0Ur=VD=denx.de=marex@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7DFC433FE
	for <soc@archiver.kernel.org>; Mon, 25 Apr 2022 19:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BFFBC385AC; Mon, 25 Apr 2022 19:35:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2A4AC385A4;
	Mon, 25 Apr 2022 19:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2A4AC385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5A17883B2F;
	Mon, 25 Apr 2022 21:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1650915315;
	bh=FsZzdOsTx0wA9ngioPmnOF9El9tJsq70UI32iV/2VXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sBsXJ88X5iuiGoySi565D7ly4Q7lCcbnwUGgDkCE5k1JCrpc9r+7wPCUXHUrPfw2k
	 BJSgL6Hyib7axRTZlS2GdN/S3GzTcPdc/idG62EKbWHb5HTiubwXqyEHrEvxFVc8G6
	 rdiv/jRW2oU06M9nR5JNODNYpG38Ga0Guwk/8GbfY68OPugdR9xabNgFOdvmQCnaFW
	 Ao9s7pKy5jpoG58+rVARny6ZtMqdhg8qHsHfIQUDmbhmXQvBz7cSmJfiUhHo1bgL8a
	 xK4hi3B4Pjqbo+uPXOHkPBdtBSjaa6J//HoZtY1OguVgxCbC4fzPtoex1HMzvyIT6X
	 +zksEbCtiLjJQ==
Message-ID: <a6fa8050-1860-fffb-e7eb-6603d2e0eec4@denx.de>
Date: Mon, 25 Apr 2022 21:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/8] dt-bindings: clock: stm32mp1: describes clocks if
 "st,stm32mp1-rcc-secure"
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, soc@kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, etienne.carriere@st.com
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
 <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>
 <YmbyUc5uTXoTD/nt@robh.at.kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YmbyUc5uTXoTD/nt@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean

On 4/25/22 21:11, Rob Herring wrote:
> On Fri, Apr 22, 2022 at 06:31:25PM +0200, Marek Vasut wrote:
>> On 4/22/22 17:09, Alexandre Torgue wrote:
>>> In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
>>> security support hardened), "clocks" and "clock-names" describe oscillators
>>> and are required.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>>> index 7a251264582d..bb0e0b92e907 100644
>>> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>>> @@ -58,14 +58,8 @@ properties:
>>>              - st,stm32mp1-rcc-secure
>>>              - st,stm32mp1-rcc
>>>          - const: syscon
>>> -
>>> -  clocks:
>>> -    description:
>>> -      Specifies the external RX clock for ethernet MAC.
>>> -    maxItems: 1
>>> -
>>> -  clock-names:
>>> -    const: ETH_RX_CLK/ETH_REF_CLK
>>> +  clocks: true
>>> +  clock-names: true
>>
>> It looks like this should rather be a property than a compatible string --
>> the compatible string is used by the OS to determine which hardware is
>> represented by a node, but here it is the same hardware in either case,
>> "st,stm32mp1-rcc" and "st,stm32mp1-rcc-secure", it is still the same
>> STM32MP1 RCC block, just configured differently by some bootloader stage.
>>
>> So why not just add one-liner property of the RCC block like ?
>> st,rcc-in-secure-configuration
> 
> Because using compatible was already decided.

I see ... may I ask why compatible is OK in this case even though this 
is encoding a policy (secure/non-secure configuration of the same clock 
IP) into DT ?
