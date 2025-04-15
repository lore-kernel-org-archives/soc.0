Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA081527B1
	for <soc@lists.linux.dev>; Tue, 15 Apr 2025 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724933; cv=none; b=J8yY+o86H37dZyv5jE8z6EQnqV2t5MJigTLX7louS2/o2OtyDh/PDovsmwT/UQuDgbYkxDq/BF7us1fy0LYi7LSGso4LX6/CKhvsdWMjyYP/PwhP7LgPrF1zISZegTvuao7A5sa0bnhaLPiAbxivg/KlO2aSYsHJvRvTQKEh5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724933; c=relaxed/simple;
	bh=f+I+70mvDeUxlvE287MehxIaRGNimM4VHnTJL/puwjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibf9o+NWI2F1qXc1GQmeEfnPu5Xqj5unFKbC1cRa5666Illydg13O2cuOzYIAOYyVs3df0zSVK+vWQ9Lk/rHKiFwt/iWqFMdL2iEIoKKkcRxcrG6rWVhppji223bpKqcq4V53nKHbAdiqQmcGXYD+GcPb2uBJYwNAWh9DonZjwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 636E3C4CEDD; Tue, 15 Apr 2025 13:48:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 73114C4CEEB;
	Tue, 15 Apr 2025 13:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73114C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6344015A1;
	Tue, 15 Apr 2025 06:48:45 -0700 (PDT)
Received: from gentoo-vm (unknown [10.57.44.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B2B13F59E;
	Tue, 15 Apr 2025 06:48:44 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:48:38 +0000
From: Kajetan Puchalski <kajetan.puchalski@arm.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, maz@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Fugang Duan <fugang.duan@cixtech.com>, 
	Guomin Chen <Guomin.Chen@cixtech.com>, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <7cnhezft5jzvtdjx6m2vjmtaxgla33j4fynd6ef4c6b7dh5pvo@4cbxewawilqp>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415072724.3565533-10-peter.chen@cixtech.com>
User-Agent: NeoMutt/20250109-134-7b7c50

On Tue, Apr 15, 2025 at 03:27:23PM +0800, Peter Chen wrote:
> CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> and Orion O6 is the motherboard launched by Radxa. See below for
> detail:
> https://docs.radxa.com/en/orion/o6/getting-started/introduction
> In this commit, it adds sky1 base, mailbox, clock (scmi firmware baseed)
> and uart, and the kernel could boot up to console.

The commit message style is supposed to be in imperative tone, i.e. "Add sky1 base".

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---

I've tested this on my own Orion O6 with 6.15-rc2, the UART does work and the kernel
does boot up to the expected point. Feel free to add the tag if you'd like.

Tested-by: Kajetan Puchalski <kajetan.puchalski@arm.com>

> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "sky1.dtsi"
> +/ {
> +	model = "Radxa Orion O6";
> +	compatible = "radxa,orion-o6", "cix,sky1";
> +
> +	aliases {
> +		serial2 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x28000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
