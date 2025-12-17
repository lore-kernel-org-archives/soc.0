Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4357B1D5CF2
	for <soc@lists.linux.dev>; Wed, 17 Dec 2025 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981366; cv=none; b=VCheqUsJP9n4WRG62Vu4rBURaeD/vppJxp9efQck7pzGbG3qyOid+8UYy/oqqQHMTnjxQbWpULZG2Sw+WRKQAQu2/IvRIwAEUZDS4FUPRY2vA9gnTAazF2YIOuNmP9dFcqTK031twychWun2NIu5+Mg8RBtbBATQg3rE9VbZGKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981366; c=relaxed/simple;
	bh=3Xlxjs02BTpUT/TrRq4wzpBEx6B0aMFuPsPW5tSNCaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNKG/wYe3BXCx/ywOfU+sJYzjMBEsKjPYFQw7bMAsCYV1iMi1phfMA1onOpqzvTBwI+MQKT+kJ/wACeTgmYG7uLWdUf2CzdcXUNFfMIWpHV1aEOlxbz40WMSH8npn4seVQj2vZhrAEpbPN/0F0V4RowM+uFsTa3CMzxC76BxDwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DDB2DC4CEF5; Wed, 17 Dec 2025 14:22:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id C6B84C116C6
	for <soc@kernel.org>; Wed, 17 Dec 2025 14:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6B84C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02564106F
	for <soc@kernel.org>; Wed, 17 Dec 2025 06:22:37 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE2A13F73B
	for <soc@kernel.org>; Wed, 17 Dec 2025 06:22:43 -0800 (PST)
Date: Wed, 17 Dec 2025 14:21:58 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: vexpress/v2m-rs1: Use documented
 arm,vexpress,config-bus child node names
Message-ID: <aUK8hkoz0LmsIZXA@e142607>
References: <20251216191212.2879226-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216191212.2879226-2-robh@kernel.org>

On Tue, Dec 16, 2025 at 01:12:12PM -0600, Rob Herring (Arm) wrote:
> Update the arm,vexpress,config-bus child node names to use the
> documented ones. Most of these were updated a while back, but I missed
> these.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> SoC maintainers may want to take this directly?
> 
>  arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
> index 158b3923eae3..248b8e492d43 100644
> --- a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
> +++ b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
> @@ -420,7 +420,7 @@ mcc {
>  					compatible = "arm,vexpress,config-bus";
>  					arm,vexpress,config-bridge = <&v2m_sysreg>;
>  
> -					oscclk0 {
> +					clock-controller-0 {
>  						/* MCC static memory clock */
>  						compatible = "arm,vexpress-osc";
>  						arm,vexpress-sysreg,func = <1 0>;
> @@ -429,7 +429,7 @@ oscclk0 {
>  						clock-output-names = "v2m:oscclk0";
>  					};
>  
> -					v2m_oscclk1: oscclk1 {
> +					v2m_oscclk1: clock-controller-1 {
>  						/* CLCD clock */
>  						compatible = "arm,vexpress-osc";
>  						arm,vexpress-sysreg,func = <1 1>;
> @@ -438,7 +438,7 @@ v2m_oscclk1: oscclk1 {
>  						clock-output-names = "v2m:oscclk1";
>  					};
>  
> -					v2m_oscclk2: oscclk2 {
> +					v2m_oscclk2: clock-controller-2 {
>  						/* IO FPGA peripheral clock */
>  						compatible = "arm,vexpress-osc";
>  						arm,vexpress-sysreg,func = <1 2>;
> @@ -447,7 +447,7 @@ v2m_oscclk2: oscclk2 {
>  						clock-output-names = "v2m:oscclk2";
>  					};
>  
> -					volt-vio {
> +					regulator-vio {
>  						/* Logic level voltage */
>  						compatible = "arm,vexpress-volt";
>  						arm,vexpress-sysreg,func = <2 0>;
> -- 
> 2.51.0
> 
