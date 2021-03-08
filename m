Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B01C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 19:07:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8C95865296; Mon,  8 Mar 2021 19:07:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B85F65290;
	Mon,  8 Mar 2021 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615230467;
	bh=xaxGTihT+QVlD2+F+3VsZ5xDglHjdbk3phUEl1L1ULs=;
	h=Subject:List-Id:To:Cc:References:From:Date:In-Reply-To:From;
	b=fdVfZ7JRjR/X4Ekdp5XS73IaSsQOoHOIvkrWcu/NikbucUmzWKmbbLapCesQzvRa8
	 ir4is04bZi/1CrvadMOQCR8Mc+4iMoGdi3uekMcez+qQHTsjzs5+5lBMAoRh+g7YT7
	 XAhWHj/YWjY0G9BnU2rmlotlwo0gM+P6e1OwSNW4zDpPTFm7zlUDSZd12bNuN3wVBd
	 PJg6Qw25ymD0NjKtvMo2zFA76YQKzLWTqxiHw+E+KLolJimoADfrGs5au7xz+nQ+Qe
	 1w7QTLPof3NygVrufBn0CPWlNVki6pZlIlcVCV0iVIFhL64x3S3WoFbiSBGUmwEzr8
	 KzojI4JpUT2Jw==
Subject: Re: [PATCH v2] arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and
 Keem Bay SoC
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
References: <20210308174824.278372-1-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <776e0c26-4f05-2a3c-1536-f730b9109b1b@kernel.org>
Date: Mon, 8 Mar 2021 13:07:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210308174824.278372-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 3/8/21 11:48 AM, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Enable in defconfig two Intel ARM64 architectures: the eASIC N5X SoCFPGA
> and Keem Bay SoC.  This allows compile coverage when building default
> config.
> 
> For the N5X (and Agilex) enable also DesignWare SPI controller in MMIO.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Hi Arnd,
> 
> You asked me to check if all drivers are enabled for these platforms.
> In general the answer is yes. In particular:
> 1. Keem Bay is does not have much in upstream, but everything described
>     in DTS is there,
> 2. N5X shares a lot with Agilex SoCFPGA which already (mostly) is
>     supported.
> 
> Changes since v1:
> 1. Enable also SPI_DW_MMIO
> ---
>   arch/arm64/configs/defconfig | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d612f633b771..9f9adcb8b0e9 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -29,6 +29,7 @@ CONFIG_KALLSYMS_ALL=y
>   CONFIG_PROFILING=y
>   CONFIG_ARCH_ACTIONS=y
>   CONFIG_ARCH_AGILEX=y
> +CONFIG_ARCH_N5X=y

I just submitted a patch for this as well. From the looks of the 
defconfig file, it looks like the platforms are in alphabetical order, 
but then I see that ARCH_SUNXI is not in it's correct spot if there is a 
rule for keeping things in alphabetical order.

I'll drop my patch.

Dinh

>   CONFIG_ARCH_SUNXI=y
>   CONFIG_ARCH_ALPINE=y
>   CONFIG_ARCH_BCM2835=y
> @@ -41,6 +42,7 @@ CONFIG_ARCH_K3=y
>   CONFIG_ARCH_LAYERSCAPE=y
>   CONFIG_ARCH_LG1K=y
>   CONFIG_ARCH_HISI=y
> +CONFIG_ARCH_KEEMBAY=y
>   CONFIG_ARCH_MEDIATEK=y
>   CONFIG_ARCH_MESON=y
>   CONFIG_ARCH_MVEBU=y
> @@ -465,6 +467,9 @@ CONFIG_SPI=y
>   CONFIG_SPI_ARMADA_3700=y
>   CONFIG_SPI_BCM2835=m
>   CONFIG_SPI_BCM2835AUX=m
> +CONFIG_SPI_DESIGNWARE=m
> +CONFIG_SPI_DW_DMA=y
> +CONFIG_SPI_DW_MMIO=m
>   CONFIG_SPI_FSL_LPSPI=y
>   CONFIG_SPI_FSL_QUADSPI=y
>   CONFIG_SPI_NXP_FLEXSPI=y
> 
