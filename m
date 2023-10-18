Return-Path: <chanwoo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B43CDB47E
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 16:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4DCDC433C9; Wed, 18 Oct 2023 16:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A405C433C8;
	Wed, 18 Oct 2023 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697647890;
	bh=TLlKRjH6eUmr/KaJhdVqQS2L/pLOYpGQdGsTTIzdRRc=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=i1hDhNupfiFQ3szQGBsMoVRmua1xcR7ribPOkw1ytMZaceum26lB3HQX8DJwqkU0T
	 vm8khMDQPtZrd9Sicik+PIlAkuqNODE0P8Cj9Ahi+GD4TDLVctwQaQXdCMlq8pqF06
	 f5wDVd1sVeEDq49gN1okVFdMuUtH+6TKKkF+nu4U9nquxHb8vS/BUbWV+TBfKyMynC
	 F6DoCPx6k0VYguVDyvn3G+puOwvnLBPgKNLLtcIdwIoQqZCyFZfPxfhPwImB7InUXl
	 wMQ6dqUZEY4e+fwA/IgFYIGvwcIGoL/gcfc8Y1CSFEbje9KS1yeUH2NsrUgb6NKS4i
	 1DTaGdRUYloWA==
Message-ID: <aae4e6cd-dcfc-442d-9ed7-d5a73c419ba8@kernel.org>
Date: Thu, 19 Oct 2023 01:51:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-11-peter.griffin@linaro.org>
From: Chanwoo Choi <chanwoo@kernel.org>
In-Reply-To: <20231011184823.443959-11-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peter,

On 23. 10. 12. 03:48, Peter Griffin wrote:
> CMU_TOP is the top level clock management unit which contains PLLs, muxes
> and gates that feed the other clock management units.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/Kconfig     |    9 +
>  drivers/clk/samsung/Makefile    |    2 +
>  drivers/clk/samsung/clk-gs101.c | 1551 +++++++++++++++++++++++++++++++
>  3 files changed, 1562 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-gs101.c
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 76a494e95027..14362ec9c543 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -12,6 +12,7 @@ config COMMON_CLK_SAMSUNG
>  	select EXYNOS_5410_COMMON_CLK if ARM && SOC_EXYNOS5410
>  	select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
>  	select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
> +	select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
>  	select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
>  
>  config S3C64XX_COMMON_CLK
> @@ -95,6 +96,14 @@ config EXYNOS_CLKOUT
>  	  status of the certains clocks from SoC, but it could also be tied to
>  	  other devices as an input clock.
>  
> +config GOOGLE_GS101_COMMON_CLK
> +	bool "Google gs101 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	depends on EXYNOS_ARM64_COMMON_CLK
> +	help
> +	  Support for the clock controller present on the Google gs101 SoC.
> +	  Choose Y here only if you build for this SoC.
> +

(snip)

> +
> +/* gs101 */
> +static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst = {
> +	/* CMU_TOP_PURECLKCOMP */
> +	MUX(CLK_MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
> +	    PLL_CON0_PLL_SHARED0, 4, 1),
> +	MUX(CLK_MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
> +	    PLL_CON0_PLL_SHARED1, 4, 1),
> +	MUX(CLK_MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_p,
> +	    PLL_CON0_PLL_SHARED2, 4, 1),
> +	MUX(CLK_MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_p,
> +	    PLL_CON0_PLL_SHARED3, 4, 1),
> +	MUX(CLK_MOUT_SPARE_PLL, "mout_spare_pll", mout_spare_pll_p,
> +	    PLL_CON0_PLL_SPARE, 4, 1),
> +
> +	/* BUS0 */
> +	MUX(CLK_MOUT_BUS0_BUS, "mout_cmu_bus0_bus", mout_cmu_bus0_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS, 0, 2),
> +	MUX(CLK_MOUT_CMU_BOOST, "mout_cmu_boost", mout_cmu_cmu_boost_p,

In order to keep the consistent naming style,
I think that need to change from 'mout_cmu_boost' to 'mout_cmu_cmu_boost'.

> +	    CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST, 0, 2),
> +
> +	/* BUS1 */
> +	MUX(CLK_MOUT_BUS1_BUS, "mout_cmu_bus1_bus", mout_cmu_bus1_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS, 0, 2),
> +
> +	/* BUS2 */
> +	MUX(CLK_MOUT_BUS2_BUS, "mout_cmu_bus2_bus", mout_cmu_bus2_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS, 0, 2),
> +
> +	/* CORE */
> +	MUX(CLK_MOUT_CORE_BUS, "mout_cmu_core_bus", mout_cmu_core_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> +
> +	/* EH */
> +	MUX(CLK_MOUT_EH_BUS, "mout_cmu_eh_bus", mout_cmu_eh_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),

'mout_cmu_core_bus' and 'mout_cmu_eh_bus' uses the same register/shift/width information. 
I think it should be modified by changing the regiter or changing the shift/width information.

> +
> +	/* CPUCL{0,1,2,} */
> +	MUX(CLK_MOUT_CPUCL2_SWITCH, "mout_cmu_cpucl2_switch", mout_cmu_cpucl2_switch_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH, 0, 2),
> +
> +	MUX(CLK_MOUT_CPUCL1_SWITCH, "mout_cmu_cpucl1_switch", mout_cmu_cpucl1_switch_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH, 0, 2),
> +
> +	MUX(CLK_MOUT_CPUCL0_SWITCH, "mout_cmu_cpucl0_switch", mout_cmu_cpucl0_switch_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH, 0, 2),
> +
> +	MUX(CLK_MOUT_CPUCL0_DBG, "mout_cmu_cpucl0_dbg", mout_cmu_cpucl0_dbg_p,
> +	    CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 2),
> +
> +	MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm", mout_cmu_hpm_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 2),
>

(snip)

> +	/* PDP */
> +	MUX(CLK_MOUT_PDP_BUS, "mout_cmu_pdp_bus", mout_cmu_pdp_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_PDP_BUS, 0, 2),
> +
> +	/* PDP */
> +	MUX(CLK_MOUT_PDP_VRA, "mout_cmu_pdp_vra", mout_cmu_pdp_vra_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_PDP_VRA, 0, 2),
> +
> +	/* IPP */
> +	MUX(CLK_MOUT_IPP_BUS, "mout_cmu_ipp_bus", mout_cmu_ipp_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_IPP_BUS, 0, 2),
> +
> +	/* G3AA */
> +	MUX(CLK_MOUT_G3AA, "mout_cmu_g3aa", mout_cmu_g3aa_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 0, 2),

I think that need to change the mux name and mux parent name
because other mux name use the twice word according to the register name
even if use the same work such as 'mout_cmu_g2d_g2d', 'mout_cmu_mcsc_mcsc' and 'mout_cmu_mfc_mfc'.
- mout_cmu_g3aa -> mout_cmu_g3aa_g3aa
- mout_cmu_g3aa_p -> mount_cmu_g3aa_g3aa_p

(snip)

> +	/* CSIS */
> +	GATE(CLK_GOUT_CSIS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
> +	/* PDP */
> +	GATE(CLK_GOUT_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_PDP_VRA, "gout_cmu_pdp_vra", "mout_cmu_pdp_vra",
> +	     CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> +
> +	/* IPP */
> +	GATE(CLK_GOUT_IPP_BUS, "gout_cmu_ipp_bus", "mout_cmu_ipp_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_IPP_BUS, 21, 0, 0),
> +	/* G3AA */
> +	GATE(CLK_GOUT_G3AA, "gout_cmu_g3aa", "mout_cmu_g3aa",
> +	     CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 21, 0, 0),

ditto.
gout_cmu_g3aa -> gout_cmu_g3aa_g3aa
mout_cmu_g3aa -> mout_cmu_g3aa_g3aa

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

