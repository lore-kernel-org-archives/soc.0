Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5664034C806
	for <soc@lists.linux.dev>; Thu,  5 Feb 2026 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281398; cv=none; b=DL72hhcw050b/T82j1KWr4buUxrJJnmWucpJkHOFO344+leJ4LUxHge0sb02+WBvY64SOetu1HBIQng1jcdQiaY7CzBXZY5MuqBeCqeMrQYsgkKlig7tlvwB5jVTuLx3KSmLTM3zz/H/faEjKc2f6oZxqf4aF3hXDREfSYFqnkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281398; c=relaxed/simple;
	bh=66u/EUj36ytdtqhkkdlwFIOWq8qHVnEcU05bCDIUITA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=i79bJujcfkBNDR1vB7/pVjCjWKp1W3uo7iiLNWbHBcwIQiK7wKhxflqjkIrs7yAkA6qsF/X/RzzncDzcGWLIXVIgvK83CPvdJGkQwVpP3rgdB2wlR9DQwGdW4dmc1bmX0j6k3R+S6LqE//SQIHm9kGdhXZVNXcnMrtWIPmxUtnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIS187gG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIS187gG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09947C4CEF7;
	Thu,  5 Feb 2026 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281398;
	bh=66u/EUj36ytdtqhkkdlwFIOWq8qHVnEcU05bCDIUITA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iIS187gGTIgnass74b0WBQvUo12Jgv/8lHExGAWUoXz2np7P770BMb8O8qcS3qNUV
	 IARtIRWzud17rZaNetf573ZRpiE17uwF8MLTf2tVhx1TV7C149PUoN1wOVlYwtxvpr
	 2Md60pXnbiuES8PONs1fbNA4MVoMA57G6i6yYn9DOh4HYLXYV79+RI32VD2RU7c8Un
	 tphP0kaZ7HpTeTcyVvmoc3Qw6ikC5AqeN1I6AovvKhqovF/FIQ45BTa12vlqv9axX5
	 jsdmB3qzLHoAAtP8lzfFb+VSU2wngg2iIBI+6ijdoVbEKdJbcfiqFOMwC+Uq3+n28w
	 ekDzPcRJmX0iQ==
Message-ID: <2fe11d07-2b95-4c38-8cac-183fd88dabe9@kernel.org>
Date: Thu, 5 Feb 2026 09:49:55 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] arm/arm64: dts: socfpga: updates for v6.20
To: Dinh Nguyen <dinguyen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
References: <20260124200118.2789128-1-dinguyen@kernel.org>
 <2b81a667-adad-4960-bc48-f60fbf740620@kernel.org>
 <7c6de5dc-8396-4793-a4fa-184bfe4096f3@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <7c6de5dc-8396-4793-a4fa-184bfe4096f3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2026 13:12, Dinh Nguyen wrote:
> 
> 
> On 1/28/26 12:48, Krzysztof Kozlowski wrote:
>> On 24/01/2026 21:01, Dinh Nguyen wrote:
>>> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>>>
>>>    Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20
>>>
>>> for you to fetch changes up to 1a457681c075e1bd894df753087cb4268ce9f9e9:
>>>
>>>    arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node (2026-01-02 07:52:44 -0600)
>>>
>>> ----------------------------------------------------------------
>>> SoCFPGA DTS updates for v6.20
>>> - dt-bindings updates:
>>> 	- Add dma-coherent for cdns,hp-nfc and snps,dw-axi-dmac
>>> 	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
>>> 	- Move entries in intel,socfpga.yaml into altera.yaml
>>> 	- Add syscon as a fallback for sys-mgr
>>>
>>> - Add dma-cohrerent property for Agilex5 NAND and DMA
>>> - Add support for the Agilex5 modular board
>>> - Add IOMMUS property for ethernet nodes for Agilex5
>>> - Use lowercase hex for dts files
>>> - Add #address-cells and #size-cells for sram
>>> - Fix dtbs_check warning for fpga-region
>>> - Move dma controller node for Agilex5 under simple-bus
>>>
>>> ----------------------------------------------------------------
>>> Dinh Nguyen (4):
>>>        dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
>>>        dt-bindings: altera: document syscon as fallback for sys-mgr
>>>        ARM: dts: socfpga: add #address-cells and #size-cells for sram node
>>>        ARM: dts: socfpga: fix dtbs_check warning for fpga-region
>>>
>>> Khairul Anuar Romli (4):
>>>        dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
>>>        dt-bindings: dma: snps,dw-axi-dmac: add dma-coherent property
>>
>>
>> These are not SoC patches, unless maintainers are unresponsive which I
>> believe is not a case here, so they should not be going via this tree.
>>
>> None of this, merged on 15th Dec, was fed to linux-next, so you don't
>> even know if this conflicts with maintainer trees thus pushing conflict
>> discover unto soc tree.
>>
>> Not being in the next is already a problem but gets more serious when
>> taking other subsystem patches.
>>
>> That's my comment, but Arnd was looking at these whether to merge.
>>
> 
> Apologies! I did not hear any feedback from those maintainers nor did I 
> remind them, so that's my fault. Let me rework this PR and take those 
> patches through the respective maintainer's tree.


The bigger problem is that none of these were in the next. You need to
solve this problem.

Best regards,
Krzysztof
