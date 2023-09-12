Return-Path: <SRS0=r3Uz=E4=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D28CA0EC3
	for <soc@archiver.kernel.org>; Tue, 12 Sep 2023 12:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79EBAC433C7; Tue, 12 Sep 2023 12:54:57 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53A39C433C8;
	Tue, 12 Sep 2023 12:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53A39C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBE3F6607326;
	Tue, 12 Sep 2023 13:54:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694523293;
	bh=2ZOrTSWdVG6ed/ekxU88dRAtYT7IEpOy67CbW6Jz6Ro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9mrSOCl8o5oUy/F290nNkDTNRLRibjObsvv5WIGzt3R+/gClOcFXuc/Z8jjEm1Wo
	 +uXk9WYouTSWzSbtioFmklaV7i+IJIMa8nWoO41eGKPRW18YbqJ5A6/WHz5xHy6Vnd
	 OoCGg/f22W/PCOE3BfoQR1E3hZcyk6eulP5yLaeq0lKA8BQ3BVi7DqldOa6YiVv5br
	 S/Suhf7K2+jzt826DXYK6NmpKJnBs7h4iuLpnmzGRl3lxGlHUa0kDvLMChrihG/4ax
	 IPcQP+VSmaaL7wSwI6lwK+5vYL4aDL4nW9BCddZVQY85kjcMH0Ge93uejT5ln4kJmY
	 +qzD3SVHjNXTQ==
Message-ID: <f8759d51-f808-8082-ceaf-6c6dcaebe2d9@collabora.com>
Date: Tue, 12 Sep 2023 14:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20230804225813.12493-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804225813.12493-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/08/23 00:58, Rob Herring ha scritto:
> The defined value for "status" is "disabled", not "disable".
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Please take this directly I guess. I think Mediatek maintainership
> needs some help. Maybe AngeloGioacchino should be co-maintainer as
> that's the only response I seem to be getting.

Sorry but I've seen this message just now as I've been on holiday in August.

Thing is, the MediaTek scene is starting to see more and more code, bringing
an obvious increase in the amount of reviews to be done and in the required
efforts to maintain the MTK bits - and we will possibly (hopefully) see even
more of that.

If Matthias needs/wants a co-maintainer for MediaTek I'm here and I will be
proud to become one.

Cheers,
Angelo

> 
> I think for future .dts patches I will not bother splitting them up by
> sub-arch because it's a pain to chase down the maintainers to apply
> stuff in a timely manner. /rant
> 
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index e4605d23fdc8..86cedb0bf1a9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -585,11 +585,11 @@ &pwrap {
>   };
>   
>   &sata {
> -	status = "disable";
> +	status = "disabled";
>   };
>   
>   &sata_phy {
> -	status = "disable";
> +	status = "disabled";
>   };
>   
>   &spi0 {


