Return-Path: <SRS0=OACn=WV=arm.com=liviu.dudau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACECC43334
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 08:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13DE2C3411E; Tue, 14 Jun 2022 08:41:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 2EE29C341C0
	for <soc@kernel.org>; Tue, 14 Jun 2022 08:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2EE29C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A848323A
	for <soc@kernel.org>; Tue, 14 Jun 2022 01:41:54 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 57C123F66F
	for <soc@kernel.org>; Tue, 14 Jun 2022 01:41:54 -0700 (PDT)
Date: Tue, 14 Jun 2022 09:41:49 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: arm: adjust whitespace around '='
Message-ID: <YqhJzRYdgwn0i/wc@e110455-lin.cambridge.arm.com>
References: <20220526204350.832361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220526204350.832361-1-krzysztof.kozlowski@linaro.org>

On Thu, May 26, 2022 at 10:43:50PM +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the cleanup!

Sudeep, can you pick this one up in your tree?

Best regards,
Liviu

> 
> ---
> 
> Output compared with dtx_diff and fdtdump.
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi    | 44 +++++++++++------------
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi | 16 ++++-----
>  2 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 065381c1cbf5..8d0d45d168d1 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -581,36 +581,36 @@ cti_sys0: cti@20020000 { /* sys_cti_0 */
>  
>  		trig-conns@0 {
>  			reg = <0>;
> -			arm,trig-in-sigs=<2 3>;
> -			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> -			arm,trig-out-sigs=<0 1>;
> -			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +			arm,trig-in-sigs = <2 3>;
> +			arm,trig-in-types = <SNK_FULL SNK_ACQCOMP>;
> +			arm,trig-out-sigs = <0 1>;
> +			arm,trig-out-types = <SNK_FLUSHIN SNK_TRIGIN>;
>  			arm,cs-dev-assoc = <&etr_sys>;
>  		};
>  
>  		trig-conns@1 {
>  			reg = <1>;
> -			arm,trig-in-sigs=<0 1>;
> -			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> -			arm,trig-out-sigs=<7 6>;
> -			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +			arm,trig-in-sigs = <0 1>;
> +			arm,trig-in-types = <SNK_FULL SNK_ACQCOMP>;
> +			arm,trig-out-sigs = <7 6>;
> +			arm,trig-out-types = <SNK_FLUSHIN SNK_TRIGIN>;
>  			arm,cs-dev-assoc = <&etf_sys0>;
>  		};
>  
>  		trig-conns@2 {
>  			reg = <2>;
> -			arm,trig-in-sigs=<4 5 6 7>;
> -			arm,trig-in-types=<STM_TOUT_SPTE STM_TOUT_SW
> +			arm,trig-in-sigs = <4 5 6 7>;
> +			arm,trig-in-types = <STM_TOUT_SPTE STM_TOUT_SW
>  					   STM_TOUT_HETE STM_ASYNCOUT>;
> -			arm,trig-out-sigs=<4 5>;
> -			arm,trig-out-types=<STM_HWEVENT STM_HWEVENT>;
> +			arm,trig-out-sigs = <4 5>;
> +			arm,trig-out-types = <STM_HWEVENT STM_HWEVENT>;
>  			arm,cs-dev-assoc = <&stm_sys>;
>  		};
>  
>  		trig-conns@3 {
>  			reg = <3>;
> -			arm,trig-out-sigs=<2 3>;
> -			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +			arm,trig-out-sigs = <2 3>;
> +			arm,trig-out-types = <SNK_FLUSHIN SNK_TRIGIN>;
>  			arm,cs-dev-assoc = <&tpiu_sys>;
>  		};
>  	};
> @@ -628,24 +628,24 @@ cti_sys1: cti@20110000 { /* sys_cti_1 */
>  
>  		trig-conns@0 {
>  			reg = <0>;
> -			arm,trig-in-sigs=<0>;
> -			arm,trig-in-types=<GEN_INTREQ>;
> -			arm,trig-out-sigs=<0>;
> -			arm,trig-out-types=<GEN_HALTREQ>;
> +			arm,trig-in-sigs = <0>;
> +			arm,trig-in-types = <GEN_INTREQ>;
> +			arm,trig-out-sigs = <0>;
> +			arm,trig-out-types = <GEN_HALTREQ>;
>  			arm,trig-conn-name = "sys_profiler";
>  		};
>  
>  		trig-conns@1 {
>  			reg = <1>;
> -			arm,trig-out-sigs=<2 3>;
> -			arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +			arm,trig-out-sigs = <2 3>;
> +			arm,trig-out-types = <GEN_HALTREQ GEN_RESTARTREQ>;
>  			arm,trig-conn-name = "watchdog";
>  		};
>  
>  		trig-conns@2 {
>  			reg = <2>;
> -			arm,trig-out-sigs=<1 6>;
> -			arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +			arm,trig-out-sigs = <1 6>;
> +			arm,trig-out-types = <GEN_HALTREQ GEN_RESTARTREQ>;
>  			arm,trig-conn-name = "g_counter";
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> index 2e43f4531308..ba88d1596f6f 100644
> --- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> @@ -96,24 +96,24 @@ cti_sys2: cti@20160000 { /* sys_cti_2 */
>  
>  		trig-conns@0 {
>  			reg = <0>;
> -			arm,trig-in-sigs=<0 1>;
> -			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> -			arm,trig-out-sigs=<0 1>;
> -			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +			arm,trig-in-sigs = <0 1>;
> +			arm,trig-in-types = <SNK_FULL SNK_ACQCOMP>;
> +			arm,trig-out-sigs = <0 1>;
> +			arm,trig-out-types = <SNK_FLUSHIN SNK_TRIGIN>;
>  			arm,cs-dev-assoc = <&etf_sys1>;
>  		};
>  
>  		trig-conns@1 {
>  			reg = <1>;
> -			arm,trig-in-sigs=<2 3 4>;
> -			arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
> +			arm,trig-in-sigs = <2 3 4>;
> +			arm,trig-in-types = <ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
>  			arm,trig-conn-name = "ela_clus_0";
>  		};
>  
>  		trig-conns@2 {
>  			reg = <2>;
> -			arm,trig-in-sigs=<5 6 7>;
> -			arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
> +			arm,trig-in-sigs = <5 6 7>;
> +			arm,trig-in-types = <ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
>  			arm,trig-conn-name = "ela_clus_1";
>  		};
>  	};
> -- 
> 2.34.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
