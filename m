Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD5CC433EF
	for <soc@archiver.kernel.org>; Sat,  9 Apr 2022 03:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BBB1C385A5; Sat,  9 Apr 2022 03:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AEAC385A1;
	Sat,  9 Apr 2022 03:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649473495;
	bh=Dl4QUbKLybXIxOgxOvs4DgIvPbOoFiy2sEFsDyVKSVo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=JWD7ZLGjFwx0PyHiANrm5KgKv7PoVbpSB0zDWG/nE1et6fJBKbir+Wqnwp6Iccz9I
	 FRRwbXk+HscoMcL79climySr8yHc3v4CuCC7KuzP7GzzHlkIDZ3+2djPYbPS3aDQa8
	 VQgELqJSTUtKc/4dvuMULO28Ox3tdkkpLx1ITRegSfZvBbRlMLinjz66OlJHG5pMDE
	 GXaGgqfBLAiDkbdng72KODukVk89twbjKxbfFfKA/7Pv29pi2aP4KojGUTD+Rk+jGr
	 o6rawVpov2+6kMSLqEpHDtG3nLL/snL1iY+l1m36DujRGqat/dw8VDaDPUstpMl9jm
	 jib0sih/4eL/A==
Date: Sat, 9 Apr 2022 11:04:50 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable Layerscape SFP driver
Message-ID: <20220409030450.GZ129381@dragon>
References: <20220304202124.3401165-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304202124.3401165-1-michael@walle.cc>

On Fri, Mar 04, 2022 at 09:21:24PM +0100, Michael Walle wrote:
> Enable the driver for the Layerscape SFP (Security Fuse Processor) found
> on most Layerscape SoCs. For example, a per-device unique serial number
> is stored in the fuses.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

It looks that Arnd picked this up for 5.18-rc1.

Shawn

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b8c216b11dae..46ee2dda2253 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1197,6 +1197,7 @@ CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_UNIPHIER_EFUSE=y
>  CONFIG_MESON_EFUSE=m
>  CONFIG_NVMEM_RMEM=m
> +CONFIG_NVMEM_LAYERSCAPE_SFP=m
>  CONFIG_FPGA=y
>  CONFIG_FPGA_MGR_STRATIX10_SOC=m
>  CONFIG_FPGA_BRIDGE=m
> -- 
> 2.30.2
> 
