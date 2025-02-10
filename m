Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE522397A0;
	Mon, 10 Feb 2025 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201509; cv=none; b=gvWj3Rx4QGY3JLOyIidy0cTwaKSRiElk46BZAAoJoF+oVyVrDP+yt8OKUbRL0H3ZfOVcYLU6avXRfYLOOytk9rr/zx6MhLrBSRoaxIhhtGcCYX4relVa+RACzc1/oLDlpRDyoOqlAeqpEycHcNCKL/E2bO1NeCHm7v9q4B+jRIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201509; c=relaxed/simple;
	bh=ZwDJ0wYVxWq9z5KRz0NCZ9cLEb8iWGgDrmAEcJ43FGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lREew3wQJU/CBrlYAkHAwBdOGW15Ux9TN0IvFp2IYlgDw9PaCWwbNgPU9y0Ilz0ZJO9VWwI4+XnJ0iH5F0nyfwF3b5LCGIe3ytshFA6Z6c31D8C6NqZ39+HELZ6oXD71Y+7s6xWLKXcnm3sIYEQxFM7obBjGL5KIsYYAPLhcACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7SoGIuh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7SoGIuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288EBC4CED1;
	Mon, 10 Feb 2025 15:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739201509;
	bh=ZwDJ0wYVxWq9z5KRz0NCZ9cLEb8iWGgDrmAEcJ43FGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z7SoGIuhzGUt9ZodMmXD9pD9erQLR42hWX6ks7ABD3b3o0Rhg1Iv9V68JuZFD/fAM
	 FYwCjruKIfiaH4Ljp0i6kTCfMYHdDheX65u52lP3Q+31BwOkv++RZTKCh7FiIStUW6
	 +b0JrjjnN0rzWKmewCnXD2sTzNIJ++dPQcykY9Rjoyp/c8KqF0EjByv0TQhaCy2eTv
	 cRCi0RZQ6iQwtla9OgRUDPCZIjOnofcoJTCQwWSbroVrFT4XZbSrLnpAcR1XqzgHV7
	 DSULcDB9oh50bEHlNS+AabE29In+4N71fSjfQijgeD4uCuvi34iAdqb69sZGSQcnac
	 tp2Q/qFiz242A==
Message-ID: <d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org>
Date: Mon, 10 Feb 2025 16:31:45 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core and
 peripheral parts
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
 <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
 <4d171a4fdf7ce9bfbe6352b36d6b6791584f86c4.camel@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <4d171a4fdf7ce9bfbe6352b36d6b6791584f86c4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 15:26, Alexander Sverdlin wrote:
> Hi Krzysztof!
> 
> On Mon, 2025-02-10 at 09:43 +0100, Krzysztof Kozlowski wrote:
>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
>>> new file mode 100644
>>> index 000000000000..53834b0658b2
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
>>> @@ -0,0 +1,313 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>>> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>>> + */
>>> +
>>> +#include <dt-bindings/clock/sophgo,cv1800.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +/ {
>>> +	osc: oscillator {
>>> +		compatible = "fixed-clock";
>>
>> I really doubt that external oscillator is a peripheral. This is either
>> part of board or the SoC.
>>
>>
>>> +		clock-output-names = "osc_25m";
>>> +		#clock-cells = <0>;
>>> +	};
>>> +
>>> +	soc {
>>> +		compatible = "simple-bus";
>>> +		#address-cells = <1>;
>>> +		#size-cells = <1>;
>>
>> No, override by phandle/label instead of duplicating SoC.
> 
> Is this one critical? Otherwise I struggle in v2 to both keep

Yes, because duplicated definition is both pain and confusing. It is IMO
semantically not correct - there is only one soc, not two SoCs. If you
have two, then you miss proper unit address.

> SOC_PERIPHERAL_IRQ() in [a new] cv18xx-cpu.dtsi and reference &soc

SOC_PERIPHERAL_IRQ() does not belong here, but to the base DTSI for your
arch. I would rather recommend not to create fake DTSI structure
reflecting some arbitrary choice. cv18xx-cpu.dtsi is not better - for
example type of interrupts are rather arch or GIC specific, not the CPU.
Unless you meant something else by CPU, but then it is getting more
confusing.

Look how others, e.g. Renesas, defines it - no problem overriding soc,
no problem with SOC_PERIPHERAL_IRQ().

> from cv18xx-cpu.dtsi. It's kind of circular-dependency.
> 


Best regards,
Krzysztof
