Return-Path: <SRS0=bz7N=VA=denx.de=marex@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A640FC4332F
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 16:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 780BDC385A4; Fri, 22 Apr 2022 16:33:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8025AC385A0;
	Fri, 22 Apr 2022 16:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8025AC385A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EFEFF8393B;
	Fri, 22 Apr 2022 18:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1650645180;
	bh=H6Ng9dU4SgWEq5Ejz5YMWUlWTgL9RMB8+WAFzJPrCxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wUbVqSkmAaXvc7xWxOapahlsTdkDRDpelDR7H+PXo3O5FiNGmx2hWE/rkBi47POK4
	 dYthtV04SJcZwaJ+TncknDAUP2CdcL7Aaej2VaPuzUwy0Y8e9u+ikVG92hXT7lZUl9
	 xa33paX4YmxlkY5HgiuGHlK8vp/cv+Nf/VkMrCc5pX76x8GWYITkf+2H5n/ysuqqSK
	 4YQGIQlIkYF/VHtnBVHBC7LhcYslwfv5DkoqVnKb1lmq71oK0/TWDLp1Ig/oHVYu8r
	 j2VY7861GFMg5zvKxn4KNwe6b1MMOwa8srhjVVHTK/XZbwAjOjY+jeJi65FdpBTJ6j
	 WBJW0NZ2TPa0Q==
Message-ID: <174bea56-3e99-e01c-4133-f1350d34448d@denx.de>
Date: Fri, 22 Apr 2022 18:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/8] ARM: dts: stm32: enable optee firmware and SCMI
 support on STM32MP15
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 soc@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, etienne.carriere@st.com
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-7-alexandre.torgue@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220422150952.20587-7-alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean

On 4/22/22 17:09, Alexandre Torgue wrote:
> Enable optee and SCMI clocks/reset protocols support.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 7fdc324b3cf9..1b2fd3426a81 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -115,6 +115,33 @@
>   		status = "disabled";
>   	};
>   
> +	firmware {
> +		optee: optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +			status = "disabled";
> +		};

Doesn't this TEE node get automatically generated and patched into DT by 
the TEE ? I think OpTee-OS does that.
