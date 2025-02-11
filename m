Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB8E1EBFE6;
	Tue, 11 Feb 2025 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261227; cv=none; b=jWPbeN6svvzxIkWtz+P2TDptotRNZQrdzW54Y27IzSmMBDH+IMURvC5EiT7Q0iApUbJMgh0u01dQNF3Yy5P+gip15mSjTdWOUJ5jKDzqSU7uohU0buUpfE9lILbYvs86E19LUm5RGEwXhMWO6PQW6osnUfIbncRjtZw3NEi+Cps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261227; c=relaxed/simple;
	bh=EKdk/i/PYM3yiBMGtdjRxRYsmQllHsBKgApCUH0Smd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtLKeUYvU9TJzJqaoRA2glcgxDgxXKWHN4F3a4yb0RBifPziXF62GhMBqU3TXhSIwTvfnHA/aTfmqODCUI7gdKG58u6io5LmyVR9g+ZBF9b+hiy4bQ/N3YHSw1wAtWOX5r5eKV+lTToA33b1/9d7KedC9N63PXMpZLtPGAwD5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+0qzL21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+0qzL21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127E7C4CEDD;
	Tue, 11 Feb 2025 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739261227;
	bh=EKdk/i/PYM3yiBMGtdjRxRYsmQllHsBKgApCUH0Smd0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l+0qzL21BjGqGYnXkrT7a4kpupAYugKqawqCcjoPR0JzONwH69+uV7qKtyBZcoFNm
	 0KgFfE3Q4zOJ2BN/Xz7jr1QbD1agG+qwTBMRifLzqzGPQnPK6vfTPDQlGLn+Cq49Os
	 Phsyd8U9pEDGr3agyh1c2X5nMjzUnmLjcJNeXveEzBSFCF/AnFTrrb3GB5NWu/75TG
	 RyUPT9WpeFbZMZryoJSnGI+dk+JdV2fVninZUie5wUcuQltbd0vqG020ThXLOa5Hpb
	 x512kLXqc93tE7ZIEY5CJgiXBkxKfcN510E0VuLqibwVuYfAlpuPoEQBmKBaKRsKA3
	 ObW//Bo9W3muA==
Message-ID: <bf8f3ea1-6fb5-40d1-a823-b3bc272a2257@kernel.org>
Date: Tue, 11 Feb 2025 09:07:00 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
 <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
 <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/02/2025 16:01, Alexander Sverdlin wrote:
> Hi Krzysztof!
> 
> On Mon, 2025-02-10 at 09:45 +0100, Krzysztof Kozlowski wrote:
>> On 09/02/2025 23:06, Alexander Sverdlin wrote:
>>> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
>>>
>>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>>> ---
>>>   arch/arm64/boot/dts/sophgo/sg2000.dtsi | 79 ++++++++++++++++++++++++++
>>>   1 file changed, 79 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
>>> new file mode 100644
>>> index 000000000000..4e520486cbe5
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
>>> @@ -0,0 +1,79 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +
>>> +#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
>>> +
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <riscv/sophgo/cv18xx-periph.dtsi>
>>> +#include <riscv/sophgo/cv181x.dtsi>
>>> +
>>> +/ {
> 
> [...]
> 
>>> +	gic: interrupt-controller@1f01000 {
>>
>> MMIO nodes are always in the soc.
> 
> I think I've looked a wrong example (or a counter-example)...
> $ grep -R -P '^\t\tcompatible = "arm,cortex-a15-gic";' *
> arm/boot/dts/intel/axm/axm55xx.dtsi:		compatible = "arm,cortex-a15-gic";
> arm/boot/dts/ti/omap/dra7.dtsi:		compatible = "arm,cortex-a15-gic";
> arm/boot/dts/ti/omap/omap5.dtsi:		compatible = "arm,cortex-a15-gic";
> arm/boot/dts/nvidia/tegra124.dtsi:		compatible = "arm,cortex-a15-gic";
> arm/boot/dts/nvidia/tegra114.dtsi:		compatible = "arm,cortex-a15-gic";

These are all old.

> arm64/boot/dts/nvidia/tegra132.dtsi:		compatible = "arm,cortex-a15-gic";
> arm64/boot/dts/freescale/s32v234.dtsi:		compatible = "arm,cortex-a15-gic";

Well, it happens.

> arm64/boot/dts/apm/apm-storm.dtsi:		compatible = "arm,cortex-a15-gic";
> arm64/boot/dts/apm/apm-shadowcat.dtsi:		compatible = "arm,cortex-a15-gic";

These are strong anti-patterns. Unmaintained.

> 
> But thanks for clarification!
> 
>>> +		compatible = "arm,cortex-a15-gic";
>>> +		interrupt-controller;
>>> +		#interrupt-cells = <3>;
>>> +		reg = <0x01f01000 0x1000>,
>>> +		      <0x01f02000 0x2000>;
>>> +	};
>>> +
>>> +	soc {
>>
>> Override by phandle/label instead of duplicating.
>>
>>> +		ranges;
>>> +
>>> +		pinctrl: pinctrl@3001000 {
>>> +			compatible = "sophgo,sg2000-pinctrl";
>>> +			reg = <0x03001000 0x1000>,
>>> +			      <0x05027000 0x1000>;
>>> +			reg-names = "sys", "rtc";
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +
>>> +&clk {
>>> +	compatible = "sophgo,sg2000-clk";
>>
>>
>> That's discouraged practice. If you need to define compatible, it means
>> the block is not shared between designs and must not be in common DTSI.
> 
> That doesn't come from my series, that's how original cv18xx.dtsi has been

You can change the other file to match real hardware. But if original
cv18xx.dtsi has incorrect or imprecise compatible, I wonder how does it
work....

> designed. Same question as before: do I need to rework it if I will not be able to
> test the changes (I don't even posess the relevant HW). But if not, I have
> to adapt the same pattern into the new sg2000.dtsi.





Best regards,
Krzysztof
