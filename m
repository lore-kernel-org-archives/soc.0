Return-Path: <SRS0=M/jh=56=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12EDC05027
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 11:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92F30C4339B; Thu,  2 Feb 2023 11:42:45 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1677DC433EF;
	Thu,  2 Feb 2023 11:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1677DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CB65A6602EED;
	Thu,  2 Feb 2023 11:42:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675338160;
	bh=ptjOx1Sz/Aegw0n395roYj59RnSkl74upxkTKsW43E8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWTzeL/eICovsuOm/RCxqmOM4YRvCVBBN/EB+Y2S9H4gBuFEAahGDEPPOcRdD5UPU
	 SH6fEyribjAwVxU7TjhL5sIp68F9ImESvQlLMNKfXXfpnpYnDYcFGUAL/cF32ITEoh
	 F7LlhLeN5Z0DLBMP7JXS3r7fXkxGqvPoAvUSO7RDw7DNMeqnFYPBhXRSrLfSqHzV0y
	 xglcleEUmkvATKZ6R7J7YcpfdbQjIFBDTtCc/FHBwA34Yz1f/bzMTSFtr7wmQ8tp6K
	 CeFe9p1KPzI06H2U5PNHanOt7EV0e6oBBjadluPSZaUT96VLkeihDQP49iVq9mZ2MQ
	 ui9xkanezDwmQ==
Message-ID: <4b5bb022-eb5d-2ed1-2123-eb9e502299dc@collabora.com>
Date: Thu, 2 Feb 2023 12:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix vdosys* compatible
 strings
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 soc@kernel.org
References: <20230202104014.2931517-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230202104014.2931517-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 02/02/23 11:40, Chen-Yu Tsai ha scritto:
> When vdosys1 was initially added, it was incorrectly assumed to be
> compatible with vdosys0, and thus both had the same mt8195-mmsys
> compatible attached.
> 
> This has since been corrected in commit b237efd47df7 ("dt-bindings:
> arm: mediatek: mmsys: change compatible for MT8195") and commit
> 82219cfbef18 ("dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible
> for MT8195"). The device tree needs to be fixed as well, otherwise
> the vdosys1 block fails to work, and causes its dependent power domain
> controller to not work either.
> 
> Change the compatible string of vdosys1 to "mediatek,mt8195-vdosys1".
> While at it, also add the new "mediatek,mt8195-vdosys0" compatible to
> vdosys0.
> 
> Fixes: 6aa5b46d1755 ("arm64: dts: mt8195: Add vdosys and vppsys clock nodes")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
> Since we are at -rc6 and Matthias already sent out pull requests, I've
> CC-ed soc@ so that this may be picked up directly on top of them. This
> should be merged for -next.
> 
> Thanks
> 

