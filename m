Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DA83BB9EB;
	Mon, 13 Apr 2026 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776092288; cv=none; b=vBo9EAz7oTHYAKDasXb3sA5pvzfUwQiuNPZwhGwgc9KkH86fJdS0bNzMt7KYVJn0f9123/PHWP1PRpjLP5h3S5/unqH5p4jExKZm1BSZzDWrvmXY+3XqV0YJELlJT93bKBUCs9+PqOtxFIUx0ZiDZnLlA2a302sTP/2vL9IaBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776092288; c=relaxed/simple;
	bh=c/crgD2cydhjzHPYC0Jib4vZAZ370Vr36kI0vZgqROU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bw7vUmaseNtOCTZsTjaP9EtsFi0gl09o3E3n0uFFBDFAAwKlPIH2XMeO5IW2rA/KCgVPMrZVQy75+es3lISUPAbFxl7JsXSf28yyhtj0cbAnL4JiYCQpNLg2TzxnFTNBhGWbET8zglqz+WjD+r0VMxYNa3zDZDTdu+JwgByiqoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEnAxJqY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEnAxJqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00411C2BCAF;
	Mon, 13 Apr 2026 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776092288;
	bh=c/crgD2cydhjzHPYC0Jib4vZAZ370Vr36kI0vZgqROU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cEnAxJqYidHsfLI5Q5LLp7L+MALVzEAcMA3d9iuNv5vgTUM7vvFiF7GVUN5rZvpgT
	 7WbICuo5qKFrJoeHZZTcxuoXfEoAmkrNk9Jx5vKuvhQj79sgU8D2tHJGQKevyT+f9d
	 wu8bUn2qa60JSctaHquVCUHi16ZVyni0ikezYzS7Cd+MFS4xdCTdAXteNmzhI+mTLX
	 FRgjmc8L/oj86kjGoYd99IzV2K0e2YO9FCJ+cfiLD5YyXIYhX7L3+WsWnOKLz2Tvon
	 2HjJO6uTXNhqDbXnINlxDA8swy3c1D68c1wtAZT5ZzIMkTJja3MeXKlqZ2rBua+7Rm
	 CbjCmLtIiy2Wg==
Message-ID: <c74c0245-7651-4cc8-8550-4b25f662a03e@kernel.org>
Date: Mon, 13 Apr 2026 09:58:00 -0500
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/12/26 12:12, Krzysztof Kozlowski wrote:
> I2C_DESIGNWARE_PLATFORM is default=y via I2C_DESIGNWARE_CORE, which is
> enabled.  No impact on include/generated/autoconf.h.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm/configs/hisi_defconfig      | 1 -
>   arch/arm/configs/multi_v7_defconfig  | 1 -
>   arch/arm/configs/pxa_defconfig       | 1 -
>   arch/arm/configs/socfpga_defconfig   | 1 -

...

> diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> index f2e42846b116..19a8e30a7b22 100644
> --- a/arch/arm/configs/socfpga_defconfig
> +++ b/arch/arm/configs/socfpga_defconfig

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
