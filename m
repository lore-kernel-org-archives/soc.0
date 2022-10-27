Return-Path: <SRS0=dZhQ=24=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D2FECAAA1
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 11:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87D4AC433C1; Thu, 27 Oct 2022 11:58:13 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 49394C433D6;
	Thu, 27 Oct 2022 11:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49394C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 27 Oct 2022 20:58:08 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id C7D9920584CE;
	Thu, 27 Oct 2022 20:58:08 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 27 Oct 2022 20:58:08 +0900
Received: from [10.212.157.173] (unknown [10.212.157.173])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id C09C2B62A4;
	Thu, 27 Oct 2022 20:58:07 +0900 (JST)
Subject: Re: [PATCH 4/4] arm64: dts: uniphier: Add NX1 SoC and boards support
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221027045157.23325-1-hayashi.kunihiko@socionext.com>
 <20221027045157.23325-5-hayashi.kunihiko@socionext.com>
 <b3c4f9ec-ba8e-4af1-b347-e07b06530d6c@app.fastmail.com>
 <8c11d7c4-dfc4-b84c-82cd-a9708bd79aab@socionext.com>
 <dcbbde62-fcf1-4435-8f65-665b25ec3b0a@app.fastmail.com>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <fdf94c6b-0293-5dd0-1717-176d1a2056de@socionext.com>
Date: Thu, 27 Oct 2022 20:58:07 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dcbbde62-fcf1-4435-8f65-665b25ec3b0a@app.fastmail.com>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2022/10/27 20:28, Arnd Bergmann wrote:
> On Thu, Oct 27, 2022, at 13:19, Kunihiko Hayashi wrote:
>> On 2022/10/27 19:01, Arnd Bergmann wrote:
>>> On Thu, Oct 27, 2022, at 06:51, Kunihiko Hayashi wrote:
> 
>>>> +			#interrupt-cells = <1>;
>>>> +			interrupt-names = "dma", "msi";
>>>> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			interrupt-map-mask = <0 0 0 7>;
>>>> +			interrupt-map = <0 0 0 1 &pcie_intc 0>,	/* INTA */
>>>> +					<0 0 0 2 &pcie_intc 1>,	/* INTB */
>>>> +					<0 0 0 3 &pcie_intc 2>,	/* INTC */
>>>> +					<0 0 0 4 &pcie_intc 3>;	/* INTD */
>>>> +			phy-names = "pcie-phy";
>>>> +			phys = <&pcie_phy>;
>>>> +
>>>> +			pcie_intc: legacy-interrupt-controller {
>>>> +				interrupt-controller;
>>>> +				#interrupt-cells = <1>;
>>>> +				interrupt-parent = <&gic>;
>>>> +				interrupts = <GIC_SPI 86
>>> IRQ_TYPE_LEVEL_HIGH>;
>>>> +			};
>>>> +		};
>>>
>>> Shouldn't there be an "msi-map" or "msi-parent" property pointing at
>>> the GIC?
>>
>> Since Designware PCIe receives an interrupt from GIC with interrupt-name
> "msi"
>> and passes the interrupt to the linear irq domain corresponding to MSI,
>> I think there is neither "msi-map" nor "msi-parent" properties.
> 
> Usually, you have the choice to use either the built-in
> MSI logic of the PCIe controller, or the one built into the
> GIC itself, assuming you have a modern enough GIC implemetation.

I recognize ITS built into GICv3 can perform the parent of MSI.

> Using the GIC is preferred here, because otherwise you lose
> all the benefits that MSIs offer, regarding latency and CPU
> affinity.

I understand, however, unfortunately GIC-ITS (or something alternative)
isn't supported in this SoC, so I think it is difficult to use the GIC
itself as msi-parent.

Thank you,

---
Best Regards
Kunihiko Hayashi
