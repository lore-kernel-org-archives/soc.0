Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68450225775
	for <soc@lists.linux.dev>; Fri, 13 Feb 2026 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770998632; cv=none; b=iEvP+dIXNy0/91bLxthLdqBO08W+/GJfBQJt6IsCuha+pdu9gfWe78Ik6Nmz0YoZu7aywO4MOi2lCvtXYPvNmYnV+kPrVGYWQ3ufyBj9TlnYR2VTiq8mXV0YEeIulpZnX4VFHaDZbLhD9K2EDLHQlVBn/IBAvP/PFqHlV4RG7oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770998632; c=relaxed/simple;
	bh=odlojMx3qMyWKPR8XdiQyzidUO/YvlWWV3K7E4/PER8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u/wOKMrQYotaYquYuxsh5KhEa9KKnGIQhyQcOWt5j3+K54upi4KqCfMxkLJfadMWUOGHgdZKw6ssHOToOnIrotFuPSqaTkCzEfBUmT/49lVfkey88GEBiz2P9UuCL2w3pfLtz4BnRGrKlN616liL/ENGX7LOihvXXUEpf3QGREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hkncu3km; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hkncu3km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130E5C116C6;
	Fri, 13 Feb 2026 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770998632;
	bh=odlojMx3qMyWKPR8XdiQyzidUO/YvlWWV3K7E4/PER8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Hkncu3kmVvS/KGiXAdjcG1O8DDpjHExxFpRk9ltjjS7x18mjle44qavwfRkqf2oSF
	 FiaSGz3y4UwOqF3w8LLHDF9arRV1StnrE7YAcREIaI7D5h7OjA3pydpD9T4xguWxH9
	 39RT8szBZuBZjMNisS73rVgcxewqZTQP8JS/xhuOGffV499Axltrzq7w9Ffql9iILN
	 pbg2fn4exYwl/oNqrI9D6uJ0Ry01McyFT1AhsyxeBeA34pxxI/zR5ktOHNAgjDTZED
	 nMZKepz5jgufsBeA5zPyDu858XtHVrhZlJ03t8TBvIQTUmWZPpPxGBwoOUM3cbu5dP
	 5qyq4lhYpLsZw==
Message-ID: <dab3bfc2-adfc-44c8-a1f6-7f02acfe8cfc@kernel.org>
Date: Fri, 13 Feb 2026 17:03:49 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v3] arm/arm64: dts: socfpga: updates for v6.20, version
 3
To: Dinh Nguyen <dinguyen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
References: <20260203033211.149355-1-dinguyen@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260203033211.149355-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2026 04:32, Dinh Nguyen wrote:
> SoCFPGA DTS updates for v6.20, version 3
> - dt-bindings updates:
> 	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
> 	- Add intel,socfpga-agilex-emmc for the Agilex eMMC daughter board
> 	- Move entries in intel,socfpga.yaml into altera.yaml
> 	- Add syscon as a fallback for sys-mgr
> 
> - Add dma-cohrerent property for Agilex5 NAND and DMA
> - Add support for the Agilex5 modular board
> - Add IOMMUS property for ethernet nodes for Agilex5
> - Use lowercase hex for dts files
> - Add #address-cells and #size-cells for sram
> - Fix dtbs_check warning for fpga-region
> - Move dma controller node for Agilex5 under simple-bus
> - Add support for the Agilex eMMC daughter board
> 
> ----------------------------------------------------------------
> Dinh Nguyen (4):
>       dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
>       dt-bindings: altera: document syscon as fallback for sys-mgr
>       ARM: dts: socfpga: add #address-cells and #size-cells for sram node
>       ARM: dts: socfpga: fix dtbs_check warning for fpga-region
> 
> Khairul Anuar Romli (2):
>       arm64: dts: socfpga: agilex5: Add dma-coherent property
>       arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node
> 
> Krzysztof Kozlowski (1):
>       arm64: dts: altera: Use lowercase hex
> 
> Nazim Amirul (1):
>       arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes
> 
> Ng Tze Yee (2):
>       arm64: dts: socfpga: agilex: add emmc support
>       dt-bindings: intel: Add Agilex eMMC support
> 
> Niravkumar L Rabara (2):
>       dt-bindings: intel: Add Agilex5 SoCFPGA modular board
>       arm64: dts: socfpga: agilex5: add support for modular board
> 

I checked few of here and none of them were in the next at the time you
sent pull request, even though some were sent and applied long time ago.

Like this one - applied on 24th Dec:
https://lore.kernel.org/all/4bd0643c-b9d4-49fa-92a5-f8878f75d1e1@kernel.org/

but never in the next.

In case if something is not clear: there must be in the linux-next at
shortest interval after you apply the patches, so the NEXT linux-next
after you apply.

I already commented about this on 28 Jan and then again on 5 Feb. I
don't understand why I need to ask three times about this, but that's
the last time I ask/remind.

Best regards,
Krzysztof

