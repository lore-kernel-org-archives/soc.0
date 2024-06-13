Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394BCC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 13:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F8E5C4AF1C; Thu, 13 Jun 2024 13:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222E8C4AF1A;
	Thu, 13 Jun 2024 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718285563;
	bh=NDTQr9zJPxn5Q6VGrC1mwJDzi3k5xLmJZ65i3QWN86w=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=kimlCoklyLZMnLUXDq52MqP8XjcaEb/YWNGCxjaqrt6mzh3m0vHUUKkw62FXjHWsK
	 6D9tj/fKuMH1KTMhJf2pwNizBb3LZPV7ec+7/Eui1jcwPMGPI+QHEmtylJj+4Qxj/r
	 zpsAyDlrfMtgpfs48fegTyK1dJXnoggRAYovqq8q6u0cYdWDhHLZ8i1kHoEMOqGx9b
	 EfNGm52bjLOUgo7btoxGTyDb+BqG+oc7dGgEivPl4/Ib+HbC3EVhkVa18F0Xeei5OS
	 E3R0pJ+lrtbDqHkOGX3MY0b9ToXn+M3r2jBiYBZzHSi54t+58g2TsbxoMdGZYkcJJU
	 JFnb+Gh/LJx9w==
Message-ID: <75c7cc7b-21ee-4e80-aef5-256721caf6d4@kernel.org>
Date: Thu, 13 Jun 2024 15:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: airoha: fix pcie ranges properties
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <95e2d79c1c36663cfffce5a20c95f8201670bbec.1704468417.git.lorenzo@kernel.org>
 <CAJ0CqmW2AoXa8XxKzXOtBd3VfnOUjRYwjhj0KXg4mgKKHZ1gQw@mail.gmail.com>
 <b9f827f9-e2e7-43ff-acd5-09a54f7ed4c4@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b9f827f9-e2e7-43ff-acd5-09a54f7ed4c4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/01/2024 18:37, Matthias Brugger wrote:
> 
> 
> On 23/01/2024 17:35, Lorenzo Bianconi wrote:
>>>
>>> Reduce and split pcie controller memory ranges for en7523 SoC
>>> in order to properly load a pcie card on the second port.
>>>
>>> Fixes: 08a4aeb2c23f ("ARM: dts: Add PCIe support for Airoha EN7523")
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Applied to v6.8-next/fixes
> 

I cannot find this patch applied in Linux. I think it was lost.

Matthias, can you re-apply?

I'll send some patch for MAINTAINERS because it seems Airoha is missed.


> Thanks
> 
>>> ---
>>>   arch/arm/boot/dts/airoha/en7523.dtsi | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
>>> index b523a868c4ad..bb78d54e94f6 100644
>>> --- a/arch/arm/boot/dts/airoha/en7523.dtsi
>>> +++ b/arch/arm/boot/dts/airoha/en7523.dtsi
>>> @@ -159,7 +159,7 @@ pcie0: pcie@1fa91000 {
>>>                  clocks = <&scu EN7523_CLK_PCIE>;
>>>                  clock-names = "sys_ck0";
>>>                  bus-range = <0x00 0xff>;
>>> -               ranges = <0x82000000 0 0x20000000  0x20000000  0 0x8000000>;
>>> +               ranges = <0x82000000 0 0x20000000 0x20000000 0 0x2000000>;
>>>                  status = "disabled";
>>>
>>>                  #interrupt-cells = <1>;
>>> @@ -188,7 +188,7 @@ pcie1: pcie@1fa92000 {
>>>                  clocks = <&scu EN7523_CLK_PCIE>;
>>>                  clock-names = "sys_ck1";
>>>                  bus-range = <0x00 0xff>;
>>> -               ranges = <0x82000000 0 0x28000000  0x28000000  0 0x8000000>;
>>> +               ranges = <0x82000000 0 0x22000000 0x22000000 0 0x2000000>;
>>>                  status = "disabled";
>>>
>>>                  #interrupt-cells = <1>;
>>> --
>>> 2.43.0
>>>
>>
>> Hi Matthias,
>>
>> Since you applied the original patch from Felix, I am wondering if
>> this fix is expected to go through your tree or applied directly by
>> Arnd.
>>
>> Regards,
>> Lorenzo
>>

Best regards,
Krzysztof

