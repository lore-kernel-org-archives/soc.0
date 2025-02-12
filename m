Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C07924C663;
	Wed, 12 Feb 2025 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378781; cv=none; b=ZxgESaQrhkz9w/kEDVMoZbQWYHkKLxCTwgkeh7Qcy+xHZZiZAhpGiD/xbDSvsrKKYUWBiiRfUJuzya05HqaeRjniO7Y3RJ8158aezerIb/txjtEXUA4j23HfGOFm5KfhTMVnVSbEO/p76q0sTxmpbGn6KwdRW1dS6zuqfO7yiho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378781; c=relaxed/simple;
	bh=dBlv29benpRXnHK6aFHmeoFcTFBzZcFMV33Vx/ypJEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ko3iMHffDd/W0WYSSKcFcuhcKSQ5AgVLC7VQxHh3sz9OQC7tAmtoVpmmuyanTwWV5I/1uYBxza6OxZdfWmwFVIGy1LlEBzZ9BpHlMpSUWfbUwHDDeCm5IPUfUBYKRe4h1ZpAR139V+tN6DK0fPfysJhZ+dV8BazRRwTIllU2Pyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1HyDBMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1HyDBMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADD3C4CEE2;
	Wed, 12 Feb 2025 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739378781;
	bh=dBlv29benpRXnHK6aFHmeoFcTFBzZcFMV33Vx/ypJEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e1HyDBMdqOGCUvxXYvV+Ko7K2m4FxzxOSSxHOlqRcjl+f3935/0l3rF3nJOydXeUY
	 6GG/aZtFFY9/eZpYbSCsYxGxJcciAMYPoKB4WQOEWPv3QbHv6MOuKy2i9atXxb+XGe
	 oW5PBZpyDHTVtDsj6VfBhhySSuEppnf3pyZ+N2XmIvPvsAQrBuxTPKpSbQYxXEx2nU
	 AMRf2RwEGOPXxAElqs4uGtn7viYUsqQzzwtgcYa0iMs8DtjXsNOLWt4GIrZwymZ7Ip
	 qaVmfm+Z4VGzjBSo86sPiwwx1mxMO7+YriMGfKsxMarEP6n34EGT5meo5e0itT6wUK
	 vmYnIIqwuvDNQ==
Message-ID: <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
Date: Wed, 12 Feb 2025 17:46:12 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Chao Wei <chao.wei@sophgo.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/02/2025 10:26, Alexander Sverdlin wrote:
> Hi Inochi, Krzysztof,
> 
> On Wed, 2025-02-12 at 08:31 +0800, Inochi Amaoto wrote:
>> On Mon, Feb 10, 2025 at 11:09:41PM +0100, Alexander Sverdlin wrote:
>>> Make the peripheral device tree re-usable on ARM64 platform by moving CPU
>>> core and interrupt controllers' parts into the respective per-SoC .dtsi
>>> files.
>>>
>>> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
>>> into "plic" interrupt-controller numbering.
>>>
>>> Have a nice refactoring side-effect that "plic" and "clint" "compatible"
>>> property is not specified outside of the corresponding device itself.
>>>
>>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>>> ---
>>> Changelog:
>>> v2:
>>> - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
>>> core, interrupt controllers) and spread them among 3 SoC .dtsi files which
>>> included cv18xx.dtsi;
>>> - define a label for the "soc" node and use it in the newly introduced DTs;
>>>
>>>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi    | 64 ++++++++++++---
>>>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi    | 64 ++++++++++++---
>>>  arch/riscv/boot/dts/sophgo/cv181x.dtsi     |  2 +-
>>>  arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
>>>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi     | 91 ++++++----------------
>>>  arch/riscv/boot/dts/sophgo/sg2002.dtsi     | 64 ++++++++++++---
>>>  6 files changed, 240 insertions(+), 102 deletions(-)
>>>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
>>>
>>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> index aa1f5df100f0..eef2884b36f9 100644
>>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> @@ -3,6 +3,8 @@
>>>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>>>   */
>>>  
>>> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
>>> +
>>>  #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
>>>  #include "cv18xx.dtsi"
>>>  
>>> @@ -14,22 +16,62 @@ memory@80000000 {
>>>  		reg = <0x80000000 0x4000000>;
>>>  	};
>>>  
>>
>>> -	soc {
>>> -		pinctrl: pinctrl@3001000 {
>>> -			compatible = "sophgo,cv1800b-pinctrl";
>>> -			reg = <0x03001000 0x1000>,
>>> -			      <0x05027000 0x1000>;
>>> -			reg-names = "sys", "rtc";
>>
>>
>>> +	cpus: cpus {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +		timebase-frequency = <25000000>;
>>> +
>>> +		cpu0: cpu@0 {
>>> +			compatible = "thead,c906", "riscv";
>>> +			device_type = "cpu";
>>> +			reg = <0>;
>>> +			d-cache-block-size = <64>;
>>> +			d-cache-sets = <512>;
>>> +			d-cache-size = <65536>;
>>> +			i-cache-block-size = <64>;
>>> +			i-cache-sets = <128>;
>>> +			i-cache-size = <32768>;
>>> +			mmu-type = "riscv,sv39";
>>> +			riscv,isa = "rv64imafdc";
>>> +			riscv,isa-base = "rv64i";
>>> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
>>> +					       "zifencei", "zihpm";
>>> +
>>> +			cpu0_intc: interrupt-controller {
>>> +				compatible = "riscv,cpu-intc";
>>> +				interrupt-controller;
>>> +				#interrupt-cells = <1>;
>>> +			};
>>>  		};
>>>  	};
>>>  };
>>
>> Make all soc definition include the common cpu file. 
>> Not just copy it.
> 
> I was acting according to Krzysztof's suggestion:
> https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org/
> 
> Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core + interrupt
> controllers into it. Would it make sense?


I don't understand the original suggestion.

Inochi, please trim unnecessary context from replies.

Best regards,
Krzysztof
