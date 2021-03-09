Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFED8C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Mar 2021 13:26:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9864D65173; Tue,  9 Mar 2021 13:26:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C317650E6;
	Tue,  9 Mar 2021 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615296396;
	bh=WdtJLOZRt8UAfoNxy/JF9a72rBNh6A9ZqMX0DOyZtig=;
	h=Subject:List-Id:To:Cc:References:From:Date:In-Reply-To:From;
	b=StLZ/wMFX00il7iZXQKGjaw/6ED/qIQiuf69fBOFxsmjep77lM/gsv7SGvwutJQXH
	 69K2uS1QFpfAL2drAjXvQOdI0tPqKNpyCpKUSh4yNJkvcNHglyZM0sQ+6l66mRg7Fz
	 oHA+dtqYFs6W7AaLaLQiFuniftajCw8UhOlaZXRHOzyOn0ALtpJxh4MKLE5+35Zwc2
	 hZwZTby2QN3/ogkuSy8Xy4qPzupyINpwRXCiLiA0lr98Y+4Wkr5hbQoHCw/29FIMJw
	 Ia1tRISAswhWTvUVcmDsf21U5uyo8nF+k+EX8vEXYeI9h9uy2CAwVLywT7XKk/0K8A
	 QjFlkrnajbkFw==
Subject: Re: [PATCH v2] arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and
 Keem Bay SoC
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
References: <20210308174824.278372-1-krzysztof.kozlowski@canonical.com>
 <776e0c26-4f05-2a3c-1536-f730b9109b1b@kernel.org>
 <7462eeec-5c4e-b4d5-cf94-9945042fc1d1@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <73dafebf-5c47-5d90-e29e-e1811f370a54@kernel.org>
Date: Tue, 9 Mar 2021 07:26:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7462eeec-5c4e-b4d5-cf94-9945042fc1d1@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/9/21 3:29 AM, Krzysztof Kozlowski wrote:
> On 08/03/2021 20:07, Dinh Nguyen wrote:
>> Hi Krzysztof,
>>
>> On 3/8/21 11:48 AM, Krzysztof Kozlowski wrote:
>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>
>>> Enable in defconfig two Intel ARM64 architectures: the eASIC N5X SoCFPGA
>>> and Keem Bay SoC.  This allows compile coverage when building default
>>> config.
>>>
>>> For the N5X (and Agilex) enable also DesignWare SPI controller in MMIO.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>
>>> ---
>>>
>>> Hi Arnd,
>>>
>>> You asked me to check if all drivers are enabled for these platforms.
>>> In general the answer is yes. In particular:
>>> 1. Keem Bay is does not have much in upstream, but everything described
>>>      in DTS is there,
>>> 2. N5X shares a lot with Agilex SoCFPGA which already (mostly) is
>>>      supported.
>>>
>>> Changes since v1:
>>> 1. Enable also SPI_DW_MMIO
>>> ---
>>>    arch/arm64/configs/defconfig | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index d612f633b771..9f9adcb8b0e9 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -29,6 +29,7 @@ CONFIG_KALLSYMS_ALL=y
>>>    CONFIG_PROFILING=y
>>>    CONFIG_ARCH_ACTIONS=y
>>>    CONFIG_ARCH_AGILEX=y
>>> +CONFIG_ARCH_N5X=y
>>
>> I just submitted a patch for this as well. From the looks of the
>> defconfig file, it looks like the platforms are in alphabetical order,
>> but then I see that ARCH_SUNXI is not in it's correct spot if there is a
>> rule for keeping things in alphabetical order.
>>
> 
> The rule is that order comes from savedefconfig, not alphabetical. This
> way you avoid reshuffling of symbols on any future savedefconfig.
> 

Got it. But I've done savedefconfig in the past and Arnd adviced against 
that because what if multiple patches come in with savedefconfig, 
wouldn't that cause a messy merge?

Dinh
