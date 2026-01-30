Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B4298CBC
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775166; cv=none; b=Sayg1zNG2huJGUT9T8OGJRnwbhIzQuUKR3hXU1GHY0mz1gHj+YYuv5LGNLoFGSxygggpJN6+vMiWopKh6PQcnGNg5rfNdycDz4R+VRcYXrzxePK2U82ddDrbb5QBNfHVXhMZSGdrul4uCNE5+waMTD1Kh96BFAVvEhRKTFcCJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775166; c=relaxed/simple;
	bh=xp4eTBr8ddeQsKKKuwnkL++/y0gEy1Zw2KOQCgvaTmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DIDb4GxVA45cRFwV6WsNRdn3jkeHXy3E9lRmWDJPnhZ3iqfvCCPGYYtTf5rZRUMJZYMxwepAShj5ccGTWen5adME6UcvEvBGiW4a+KWGSQrkqooJROJaz1KJ8YfiGlgsMkEIQOwB8JkHcreZ2Op+eTTJbbuuc4umI6S35FgztDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snjfWkhp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snjfWkhp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B98FC4CEF7;
	Fri, 30 Jan 2026 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769775165;
	bh=xp4eTBr8ddeQsKKKuwnkL++/y0gEy1Zw2KOQCgvaTmc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=snjfWkhp2yX/vqJRSnyVxVeUnHSZEBPYCntB86Zn1QafQmChppi+l7ixYwDarsX2+
	 DFgTlqwyDwFXCecDzu19KjDTYeJDa4Vi+gAA2Sqbfvy39lyOm1bggsB7zpjPWMpWws
	 H3SH8McAgoQHuNgmMsUAQuzvJquq8tNDOsayN/nATzW5YNaGdqd3qNVcSwBhLqgAzS
	 7M5YiifHcCdyHrHxEx6YyuLpT8uPJgfkPopOd2NGHarGIawiSHTSoNLRK9XNKVdAas
	 0Ob0/DXgXOSmOydOmjgw/IUJIcvg6HsZRZlYGJJmU0HMEXvkzyacQJZlJBxQdunL8G
	 JQpQngfbFNslw==
Message-ID: <7c6de5dc-8396-4793-a4fa-184bfe4096f3@kernel.org>
Date: Fri, 30 Jan 2026 06:12:44 -0600
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] arm/arm64: dts: socfpga: updates for v6.20
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
References: <20260124200118.2789128-1-dinguyen@kernel.org>
 <2b81a667-adad-4960-bc48-f60fbf740620@kernel.org>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <2b81a667-adad-4960-bc48-f60fbf740620@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/28/26 12:48, Krzysztof Kozlowski wrote:
> On 24/01/2026 21:01, Dinh Nguyen wrote:
>> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>>
>>    Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20
>>
>> for you to fetch changes up to 1a457681c075e1bd894df753087cb4268ce9f9e9:
>>
>>    arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node (2026-01-02 07:52:44 -0600)
>>
>> ----------------------------------------------------------------
>> SoCFPGA DTS updates for v6.20
>> - dt-bindings updates:
>> 	- Add dma-coherent for cdns,hp-nfc and snps,dw-axi-dmac
>> 	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
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
>>
>> ----------------------------------------------------------------
>> Dinh Nguyen (4):
>>        dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
>>        dt-bindings: altera: document syscon as fallback for sys-mgr
>>        ARM: dts: socfpga: add #address-cells and #size-cells for sram node
>>        ARM: dts: socfpga: fix dtbs_check warning for fpga-region
>>
>> Khairul Anuar Romli (4):
>>        dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
>>        dt-bindings: dma: snps,dw-axi-dmac: add dma-coherent property
> 
> 
> These are not SoC patches, unless maintainers are unresponsive which I
> believe is not a case here, so they should not be going via this tree.
> 
> None of this, merged on 15th Dec, was fed to linux-next, so you don't
> even know if this conflicts with maintainer trees thus pushing conflict
> discover unto soc tree.
> 
> Not being in the next is already a problem but gets more serious when
> taking other subsystem patches.
> 
> That's my comment, but Arnd was looking at these whether to merge.
> 

Apologies! I did not hear any feedback from those maintainers nor did I 
remind them, so that's my fault. Let me rework this PR and take those 
patches through the respective maintainer's tree.

DInh


