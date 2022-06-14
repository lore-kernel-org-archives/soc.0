Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B67C433EF
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 16:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37217C3411D; Tue, 14 Jun 2022 16:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D3AC3411B;
	Tue, 14 Jun 2022 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655223479;
	bh=40xG9Pr/DoOfwZP7IVcnLxrGUa6C77zxsdLmMPmLKHk=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=S3YgxcqTmfCVn/7tghxFDmjbjt9BxYyX2WuftYjwXHAoMEngIo1MLT2fEWZtJ/bwu
	 XP6slzyKJBLlt+O53JRVoShcUsaakKdkxJdbwN/l3cfHwbRDEeZSYtjcxcd6TkPIIW
	 oxJ/pF9+/nh5oNlRq1W/fXQqrGxacsTgxBBjhEDv8bVdDnJSbvkrPedE1/wPgCmh+S
	 jpnwsHQRvFMXv65JUuPbKv4/WSQrFbAJ4Z/Oy7JuNFagPeRUeLN0XR5VKLhYbjJpQe
	 9Ez2Mis40Big7vzEe6AazI1Nd+9TkF/6v02lGTUs+RqnJ0AFc0psM3BT/1kDZC+L+1
	 0Fq8XrBcayyRQ==
Message-ID: <bdf09cb6-86ff-70d0-bb63-be0d96e1d8b8@kernel.org>
Date: Tue, 14 Jun 2022 11:17:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/5] arm64: dts: altera: adjust whitespace around '='
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/26/22 15:46, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.
> ---
>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index aa2bba75265f..db771690641b 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -594,7 +594,7 @@ emac0-tx-ecc@ff8c0400 {
>   		};
>   
>   		qspi: spi@ff8d2000 {
> -			compatible =  "intel,socfpga-qspi", "cdns,qspi-nor";
> +			compatible = "intel,socfpga-qspi", "cdns,qspi-nor";
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <0xff8d2000 0x100>,

Applied!

Thanks,
Dinh
