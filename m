Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA27156C6A
	for <soc@lists.linux.dev>; Tue,  3 Feb 2026 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770087459; cv=none; b=U3jZ/fWoMiZNvLVP8Z4QKuNx5elBtcxAbz5qgeqzvnYA2jLzEa7FOMrGEr6eO1QcPHOupDIlXg/nx9+Z3NFvBMWc1nafYNKOMRYCBHUyl9SSXpehoPCoKb0OhoObzA/5+LD6bp1DRmWzNZAj5kMthmJ7MMMj3wyPnrshAuq0BV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770087459; c=relaxed/simple;
	bh=k9cR3G+PJSfE37UeQ68RBhjrTADJObLs/02JvNcFNXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b4CqpHN9kzE+OaRRiM+s1R3PIH+G+bXgBYqSvBgUrA75pjtvA+Y7UHEzA5BHtPwmltFLhGyKpWTS8d0pBu9+9zfTKKBB+iBK+Gu5jbjcUz/j+m/6Os5qXKlkAe4LWVT3+7WIoIlO1qMhF1GHwUZBloUGzMO0OIIfmZM+p06+edc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YndZp4oS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YndZp4oS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7068AC116C6;
	Tue,  3 Feb 2026 02:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770087458;
	bh=k9cR3G+PJSfE37UeQ68RBhjrTADJObLs/02JvNcFNXA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YndZp4oSlflNB1o2wkRKHVU1ddKVbVpgqMXnGRFJqYZVaURxFHlhn3wOy7HfMzTp/
	 GGkBBG+4ClVyUAnTmSQRnXeicXoAOAUMizl/mezeWINvfRC2+G1QRyFDgxMWK+w7bL
	 c7V9E/eqjdrb7K7TVeVWljYdIRaLZOltDfSd51s+DX4cp8t4OTuhvGdGrAB8R9bznT
	 9KgDyr7cSUgzjwIMmILI4Pj6mv/FXjG6X/G9KsL1UDIGRQEPFa1wFHCRsyVMWLW6lS
	 Ytuv1GlLBwhkI805Gw3ymeqh5VrP8AGlBqBJ/hyFiZSUhs9ghZq/5U06zSkoN1atu6
	 13wAXaYO36XBg==
Message-ID: <bc4d75bd-3d72-42c3-93bc-e9659b36f1bb@kernel.org>
Date: Mon, 2 Feb 2026 20:57:37 -0600
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v2] arm/arm64: dts: socfpga: updates for v6.20, version
 2
Content-Language: en-US
To: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
References: <20260131174656.30403-1-dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260131174656.30403-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/31/26 11:46, Dinh Nguyen wrote:
> Hi soc maintainers,
> 
> This is version 2 of the PR that had dt-bindings for dma and mtd patches[1]. This
> version has those patches removed and I'm taking them through the respective
> maintainer's tree.
> 
> Thanks,
> Dinh
> [1] https://lore.kernel.org/soc/7c6de5dc-8396-4793-a4fa-184bfe4096f3@kernel.org
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>    Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20_v2
> 
> for you to fetch changes up to 42a8d7d72185247c0bbada1d2c44bef743ee6a5d:
> 
>    dt-bindings: intel: Add Agilex eMMC support (2026-01-30 09:50:07 -0600)
> 
> ----------------------------------------------------------------
> SoCFPGA DTS updates for v6.20, version 2
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
>        dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
>        dt-bindings: altera: document syscon as fallback for sys-mgr
>        ARM: dts: socfpga: add #address-cells and #size-cells for sram node
>        ARM: dts: socfpga: fix dtbs_check warning for fpga-region
> 
> Khairul Anuar Romli (2):
>        arm64: dts: socfpga: agilex5: Add dma-coherent property
>        arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node
> 
> Krzysztof Kozlowski (1):
>        arm64: dts: altera: Use lowercase hex
> 
> Nazim Amirul (1):
>        arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes
> 
> Ng Tze Yee (2):
>        arm64: dts: socfpga: agilex: add emmc support
>        dt-bindings: intel: Add Agilex eMMC support

Please disregard this PR. I made a mistake with one of the patches. I 
will send a follow-up v3.

Sorry for the churn.

Dinh

