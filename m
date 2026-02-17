Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FE25776
	for <soc@lists.linux.dev>; Tue, 17 Feb 2026 00:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288067; cv=none; b=SocGa5HNASJRmTr1MAtiXH78l113PSAbXD6HoZGD7rPVK9QOEECV+ObYalM2V8Zz/CKtx3wNd47G36g2nHR9iefEgj0n7gFJ11LrZF4H/CI3vG/Yeo8eyXncdxGlSrYJCMXUGhUXt2Qu8D9HFAIrvgt6uG28s6pg19wDt3RPYGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288067; c=relaxed/simple;
	bh=miH1HOpckvuMUtbowPwhwMGcskk67oyMGA3dDmxBoBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qC2p2Q2H+eKuZehoFdP0D0fAH4ty2YOlBOiWV7l//D+aMsxzdaHUsu2Ke0cIGE/Vhm4LdCYdbrj9stAmfRYmaBBDH2CFC9bcvQVK9dWtd7rQFZb56DSwkgwHohGDt45/U/kmMQL12GJsg7FzYxlzbE+FxKfoQ+lPLIjj4NHM9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Suy4n9P3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Suy4n9P3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3455C116C6;
	Tue, 17 Feb 2026 00:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771288067;
	bh=miH1HOpckvuMUtbowPwhwMGcskk67oyMGA3dDmxBoBw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Suy4n9P3m1e4VefBZUGeo4z1+Fz6iQ/5kCZ6Ht0Vo+RnL5PSdwNZMwlQelsO1iXqG
	 BEoRKkWfaoLp6IcqP199Fm6UGcysVRpbU+XiK4XPYsuG4PvqyOiO23+pHCYkbmniHu
	 NLH7jbdHaDlJGdSQt0u1W1Et+WKlUJLgI781Faq099YAaRHLiaQ1f8ZWlPhnNJjKwJ
	 IZptX91D0btxN+mAZxCQglgVn4298M9zIkKH05idT6ZthiR1ez06jSyRiDqWbY25BD
	 HJiSAblulel8CDOWi03DAWOzwzApmkGbuZGRYKC6YqLf/wPY7aKvdqn23aQ2/Hc/d+
	 PPr07GluVFi2w==
Message-ID: <c31efa4e-28b8-4b7d-80c0-0082702dd996@kernel.org>
Date: Mon, 16 Feb 2026 18:27:44 -0600
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v3] arm/arm64: dts: socfpga: updates for v6.20, version
 3
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
References: <20260203033211.149355-1-dinguyen@kernel.org>
 <dab3bfc2-adfc-44c8-a1f6-7f02acfe8cfc@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <dab3bfc2-adfc-44c8-a1f6-7f02acfe8cfc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/13/26 10:03, Krzysztof Kozlowski wrote:
> On 03/02/2026 04:32, Dinh Nguyen wrote:
>> SoCFPGA DTS updates for v6.20, version 3
>> - dt-bindings updates:
>> 	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
>> 	- Add intel,socfpga-agilex-emmc for the Agilex eMMC daughter board
>> 	- Move entries in intel,socfpga.yaml into altera.yaml
>> 	- Add syscon as a fallback for sys-mgr
>>
>> - Add dma-cohrerent property for Agilex5 NAND and DMA
>> - Add support for the Agilex5 modular board
>> - Add IOMMUS property for ethernet nodes for Agilex5
>> - Use lowercase hex for dts files
>> - Add #address-cells and #size-cells for sram
>> - Fix dtbs_check warning for fpga-region
>> - Move dma controller node for Agilex5 under simple-bus
>> - Add support for the Agilex eMMC daughter board
>>
>> ----------------------------------------------------------------
>> Dinh Nguyen (4):
>>        dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
>>        dt-bindings: altera: document syscon as fallback for sys-mgr
>>        ARM: dts: socfpga: add #address-cells and #size-cells for sram node
>>        ARM: dts: socfpga: fix dtbs_check warning for fpga-region
>>
>> Khairul Anuar Romli (2):
>>        arm64: dts: socfpga: agilex5: Add dma-coherent property
>>        arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node
>>
>> Krzysztof Kozlowski (1):
>>        arm64: dts: altera: Use lowercase hex
>>
>> Nazim Amirul (1):
>>        arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes
>>
>> Ng Tze Yee (2):
>>        arm64: dts: socfpga: agilex: add emmc support
>>        dt-bindings: intel: Add Agilex eMMC support
>>
>> Niravkumar L Rabara (2):
>>        dt-bindings: intel: Add Agilex5 SoCFPGA modular board
>>        arm64: dts: socfpga: agilex5: add support for modular board
>>
> 
> I checked few of here and none of them were in the next at the time you
> sent pull request, even though some were sent and applied long time ago.
> 
> Like this one - applied on 24th Dec:
> https://lore.kernel.org/all/4bd0643c-b9d4-49fa-92a5-f8878f75d1e1@kernel.org/
> 
> but never in the next.
> 
> In case if something is not clear: there must be in the linux-next at
> shortest interval after you apply the patches, so the NEXT linux-next
> after you apply.
> 

Sorry, I will make sure my branch gets pulled into linux-next in the future.

THanks,
Dinh
