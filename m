Return-Path: <SRS0=gNlH=FR=linaro.org=mathieu.poirier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A19E7AD71
	for <soc@archiver.kernel.org>; Tue,  3 Oct 2023 15:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22B6EC433CB; Tue,  3 Oct 2023 15:20:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24D21C433C9
	for <soc@kernel.org>; Tue,  3 Oct 2023 15:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24D21C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c5ff5f858dso8046415ad.2
        for <soc@kernel.org>; Tue, 03 Oct 2023 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696346454; x=1696951254; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Fi0GvVL1UlJlWvA6+wPBTvjnYAhizI6Olhrf8X5QnE=;
        b=KKkVn60b7evo6AcJdKOIoFpGu9p5wOIFHnGgjVyrHplctDfU4FPQEbXtwWnTOQwnS8
         PUdw+iWbpQvHNhesDsCuHzg3/ZSPj/O80WVbKCfOirLG0t1uSujrc7ahE7OQFjUvIjH4
         spexcoh2HXGYcx/4xb47gUfLRVgdM4I3U8Kv88wrUY58dhl43gqe/6SMAuSDkfT9KotG
         ZYymk8svkKbxYdDjgwPPEWwwWS0nTzI4w9c95Tl1tJdHIj98OFlSDGtg7aBSEDC3HNoF
         qSAznlFPSs10zjyM3luC5n+seLsl7pGJq4X9Tl0+AKcT/Uuf/8GYxSKvYFVJemVZVjfT
         //JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696346454; x=1696951254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Fi0GvVL1UlJlWvA6+wPBTvjnYAhizI6Olhrf8X5QnE=;
        b=YxfAP6HcUI1prT2v+J9jsgFvYjW+E1Er2jRPWatOdGlHHhCDhIyxYhvsAV7tg9I8pN
         vFGhb11rzsdvIxjhSYxhgMxo5lPJTMBw98C21K9iCbYNcChxK12BzCxk36Ov2Rxhb4YL
         yGOXnZBMDsnbyXABznOcqd7spwRw5vxBUGIcQU1OqJlRpxXmJ33vdlaCRYS1ltxTNt2l
         pgDO2o7CHxEG2m/qEisE/AwfPWjdv2Zq1k5VsQgI3CeqEAA86Rqm6sHTTUIie2NKesgn
         X2qdSKHys78XJgYq1rE1WhHzjioXruRhz19X6mJnLcIeMuWbqMEaRrwP9b1+JdovZVZS
         3PfA==
X-Gm-Message-State: AOJu0YzqiEpu9j2jirT9RGnoLFEHVZdgrXYJJlLq3jDzr4ii6WgTNQfE
	nOH8VUQoj7nXElT5urSWvaL2vA==
X-Google-Smtp-Source: AGHT+IHbk4360AQXMEM8OHKJjDDmSkblY5FgQIBA5Fra9XDJdxKFPKgQIzSaAMDLRapNNLqBYtu7wQ==
X-Received: by 2002:a17:902:d512:b0:1c4:c5d:d7fa with SMTP id b18-20020a170902d51200b001c40c5dd7famr13112626plg.45.1696346454478;
        Tue, 03 Oct 2023 08:20:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9379:e1e1:dd3c:a271])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902d3c500b001c74df14e72sm1684106plb.212.2023.10.03.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 08:20:53 -0700 (PDT)
Date: Tue, 3 Oct 2023 09:20:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabien Parent <fparent@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Jieyy Yang <jieyy.yang@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
Message-ID: <ZRwxUz+K1SwGVQU3@p14s>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
 <20231003-mediatek-fixes-v6-7-v1-1-dad7cd62a8ff@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-1-dad7cd62a8ff@collabora.com>

On Tue, Oct 03, 2023 at 01:13:43PM +0200, AngeloGioacchino Del Regno wrote:
> I am a top reviewer mainly for MediaTek SoC related patches in most
> subsystems and I've also been upstreaming both improvements, fixes
> and new drivers and devicetrees when required.
> 
> The MediaTek scene saw a generous increase in number of patches that
> are sent to the lists every week, increasing the amount of required
> efforts to maintain the MTK bits overall, and we will possibly see
> even more of that.
> 
> For this reason, and also because of suggestions and encouragement
> coming from the community, I'm stepping up to be a co-maintainer of
> MediaTek SoCs support.
> 
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Link: https://lore.kernel.org/r/20230929082009.71843-1-angelogioacchino.delregno@collabora.com
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..57f82fcea1e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2327,7 +2327,7 @@ F:	drivers/rtc/rtc-mt7622.c
>  
>  ARM/Mediatek SoC support
>  M:	Matthias Brugger <matthias.bgg@gmail.com>
> -R:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  L:	linux-kernel@vger.kernel.org
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> 
> -- 
> 2.42.0
> 
> 
