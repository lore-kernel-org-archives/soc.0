Return-Path: <SRS0=XIvY=RF=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D64EC433EF
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 04:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8B60C36AE9; Mon, 20 Dec 2021 04:20:20 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01228C36AE5
	for <soc@kernel.org>; Mon, 20 Dec 2021 04:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01228C36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id n16so6308554plc.2
        for <soc@kernel.org>; Sun, 19 Dec 2021 20:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=idRrPNY8lT9qvJ1RX4lP6sDX0kRhviqifoOXKRGv1rY=;
        b=HI/6YkCt3ky43jRDNEN2lf6M22JE6+kU4T+uMtFrbfWX8vNs6ZusoVEID1nBzvAShn
         S5ZTX7Ta1P9uRa9kd/zrtJZhAtjeuHfoK85oJ1GeE2Dmh+H8ThxhaXpqrOXewiNLqOSQ
         o5L6XC7ifvxgGIy6Rq0q29P9z//gZq4zSt2X6nIn1ewKEtKWFLpzMiRl3XaW+2KCsW1H
         pPvGUDfqd1gxPY4X2f+ExStB3eDWtWpgRF3Gwdq/IRh/vjDpkLIdJ3PHlddVT2e1m4bx
         FfoHQpIUHyIZn/2ipJ3kPNh1POZNSW/ZlOciYn3QWbrNNhMav5W8xhcr1PHVOQgsXOqL
         pRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=idRrPNY8lT9qvJ1RX4lP6sDX0kRhviqifoOXKRGv1rY=;
        b=PX4qJZGoGH7qq3HZh8m9Ldn4YGKpkQgE2ghs7TQlRAH187FC3Hnxa4bfFPNMsI/bwz
         c0MReUY9b5uIC9eL6AJJEHKrAYbsO7VMejVE0ZDlFchfiypFoPA5JjBC/OrMz+2AOfuW
         87a5vwU7jvqRn6UBVpwJtZwftctF4D/aZXDdTBKgbbHs54k4bslExPJ0mWgZi2qjTUuk
         ztu5OHiGoT7uXlYGVdtRcLFNkTNj2KPFPtdW/rVDxLsMs1epGGkeVXBMh69A87BLAEBD
         cz2KHIFbcPdbHg9qJwRMwBGxeg0z97cMFkpxjnhRFVtPimkfTmOuElX/9MopZ33noBV3
         z9QA==
X-Gm-Message-State: AOAM532dEu/SkzaXRFb8okVbacuwJ52a4uVSTv1INqC1VQdp2mtjZKdo
	n4aXhPUoAkfUKD864SLp6iQERA==
X-Google-Smtp-Source: ABdhPJzGZHTTmdWj0H2HUPNmPUFshIz7BAck3SWavB9iLe038KjqDHtpEYTn5mz3kFKV/RLuZgwPPw==
X-Received: by 2002:a17:90b:164c:: with SMTP id il12mr17891712pjb.241.1639974019397;
        Sun, 19 Dec 2021 20:20:19 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id n14sm6000281pgd.80.2021.12.19.20.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 20:20:18 -0800 (PST)
Date: Mon, 20 Dec 2021 09:50:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Remove "spidev" nodes
Message-ID: <20211220042016.cnk332uthdxziv5a@vireshk-i7>
References: <20211217221232.3664417-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217221232.3664417-1-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52

On 17-12-21, 16:12, Rob Herring wrote:
> "spidev" is not a real device, but a Linux implementation detail. It has
> never been documented either. The kernel has WARNed on the use of it for
> over 6 years. Time to remove its usage from the tree.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Olof, Can you please apply this directly.
> 
>  arch/arm/boot/dts/spear1310-evb.dts           | 16 ---------
>  arch/arm/boot/dts/spear1340-evb.dts           | 16 ---------

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
