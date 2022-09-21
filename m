Return-Path: <SRS0=N/cV=ZY=arm.com=anshuman.khandual@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18848ECAAD8
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 11:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1598C433C1; Wed, 21 Sep 2022 11:53:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id BADA3C433D6;
	Wed, 21 Sep 2022 11:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BADA3C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9BBB143D;
	Wed, 21 Sep 2022 04:53:48 -0700 (PDT)
Received: from [10.163.58.166] (unknown [10.163.58.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58AF63F73B;
	Wed, 21 Sep 2022 04:53:40 -0700 (PDT)
Message-ID: <d7e7c2be-1b34-dbc6-b48f-3ee332039293@arm.com>
Date: Wed, 21 Sep 2022 17:23:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: configs: Enable all PMUs provided by Arm
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org
References: <20220919162753.3079869-1-broonie@kernel.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220919162753.3079869-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/19/22 21:57, Mark Brown wrote:
> The selection of PMUs enabled in the defconfig is currently a bit random
> and does not include a number of those provided by Arm and present in a
> fairly wide range of SoCs. Improve coverage and defconfig utility by
> enabling all the Arm provided PMUs by default.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/configs/defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5a4ba141d15c..91116804e488 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1241,8 +1241,14 @@ CONFIG_PHY_UNIPHIER_USB3=y
>  CONFIG_PHY_TEGRA_XUSB=y
>  CONFIG_PHY_AM654_SERDES=m
>  CONFIG_PHY_J721E_WIZ=m
> +CONFIG_ARM_CCI_PMU=m
> +CONFIG_ARM_CCN=m
> +CONFIG_ARM_CMN=m
>  CONFIG_ARM_SMMU_V3_PMU=m
> +CONFIG_ARM_DSU_PMU=m
>  CONFIG_FSL_IMX8_DDR_PMU=m
> +CONFIG_ARM_SPE_PMU=m
> +CONFIG_ARM_DMC620_PMU=m
>  CONFIG_QCOM_L2_PMU=y
>  CONFIG_QCOM_L3_PMU=y
>  CONFIG_HISI_PMU=y
