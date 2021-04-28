Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7047C433ED
	for <soc@archiver.kernel.org>; Wed, 28 Apr 2021 06:12:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 88E386141F; Wed, 28 Apr 2021 06:12:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8197B613B3;
	Wed, 28 Apr 2021 06:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619590327;
	bh=dJJ0tvZ5MJ3qeFn4UO9q5Pg1l0TALUdby7ve1eM2grQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=FeMJIPqH4b6pi+6ue39y49E6677v535gJxnDBnSZ5VfWYi7BftKP4VUX5fFNlK8wN
	 6AxDX48ar/lHxOnMsGAlL5Uv9+Tb/kIbeyCnaLnEGJd1oBb/ar09eo5bhxIQ+BsW0V
	 a9CFOL67dDEAQZlsHU1Vkx9YtcE6PqW0+fGM6e4w=
Date: Wed, 28 Apr 2021 08:12:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ryan Wu <Yz.Wu@mediatek.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: remove duplicate mt8192
 line
Message-ID: <YIj8sySF3W0x8E+/@kroah.com>
References: <20210427210121.1080364-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427210121.1080364-1-arnd@kernel.org>

On Tue, Apr 27, 2021 at 11:01:08PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The same patch was accidentally merged twice, resulting in a
> duplicate line for the mt8192 SoC.
> 
> Fixes: f2674c0c7488 ("dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC")
> Fixes: 2a1405a14c3a ("dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> index d479ad977e24..2f2895b1f06d 100644
> --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> @@ -7,7 +7,6 @@ Required properties:
>  	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
>  	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
>  	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> -	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
>  	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
>  	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192

Shouldn't you drop the bottom one here to keep this in sorted order?

thanks,

greg k-h
