Return-Path: <SRS0=535g=HY=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CF6C4167B
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 11:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 936ECC433C9; Wed, 13 Dec 2023 11:09:16 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6511BC433C8;
	Wed, 13 Dec 2023 11:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6511BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702465751;
	bh=NEHwKtbRnYhX3LWvP/fAiGtmTiEiGlfArlGHrTXrUNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AIljSdK/n19r3+FHLdHy6sFro3d9Xknwrhfn+lvGWIJ47oCtK1u492nOkSoELAQkN
	 8pJMb0JW5iigzv9ssllNrsPkeDxxoDLoCWtPsBqkBgL2M+VGUjZ/siQ2W2bm4nE9oB
	 AffkJps4SxHvNZFpFLJNDBcd8B2sM9VJk/KDAl+hD/SRXf6cFComQy18fU5fiDXiN3
	 MZzLkul80r6gY8pJ61Mj97xrTVhTKzY9H7gJjst/e9YLA58B42Ta65HAPYGQPnjm0s
	 HTqhQUw+Rx8+9gCiaphCqOIxkWjLkFExDWJ/Xqnjc/HM5zxVucjG77tIqwxNMd/cM2
	 kkXyZdyUetn3Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CBFAE3781453;
	Wed, 13 Dec 2023 11:09:10 +0000 (UTC)
Message-ID: <bc5dafe4-5487-4794-97f1-f4e4d967a665@collabora.com>
Date: Wed, 13 Dec 2023 12:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mediatek: remove broken pmic interrupt property
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, soc@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Ben Lok <ben.lok@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231212214737.230115-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212214737.230115-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 12/12/23 22:47, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The pmic is connected to the GIC, which uses four-cell interrupt properties,
> but its interrupt is specified as two-cell that would only make sense for
> the GPIO irqchip:
> 
> arch/arm64/boot/dts/mediatek/mt8195.dtsi:464.4-27: Warning (interrupts_property): /soc/i2c@11d01000/pmic@34:#interrupt-cells: size is (8), expected multiple of 16
> 
> Remove the interrupt for now to shut up the warning. When someone figures out
> what the correct interrupt and parent are, we can add it back.
> 

Please, can anyone from MediaTek comment on that?

I see a mt6360_pins on PIO:
			pinmux = <PINMUX_GPIO17__FUNC_GPIO17>,
				 <PINMUX_GPIO128__FUNC_GPIO128>;

...and that's GPIO128, which may effectively be the IRQ pin for MT6360.

Still, I'm not sure whether the interrupt is on GIC or PIO, please clarify,
otherwise we will have to get this commit upstream.

Thanks,
Angelo

> Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> index 70b465f7c6a7..a409ef998746 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> @@ -238,8 +238,6 @@ &i2c6 {
>   	mt6360: pmic@34 {
>   		compatible = "mediatek,mt6360";
>   		reg = <0x34>;
> -		interrupts = <128 IRQ_TYPE_EDGE_FALLING>;
> -		interrupt-names = "IRQB";
>   		interrupt-controller;
>   		#interrupt-cells = <1>;
>   		pinctrl-0 = <&mt6360_pins>;


