Return-Path: <SRS0=Brca=QT=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA656C433F5
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 11:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E7D3C53FD1; Thu,  2 Dec 2021 11:27:04 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E17BC53FCB
	for <soc@kernel.org>; Thu,  2 Dec 2021 11:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E17BC53FCB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 133so8571712pgc.12
        for <soc@kernel.org>; Thu, 02 Dec 2021 03:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zez1rxEqxUa6den/PlCBhFY8prK0HejZIbGceZPfSXw=;
        b=DPqxH0FMX4rAnAr1pchtyHSlHhAZYliOErJIo0K0K7vLF3KTx/rVN+v7emdLAf9sf9
         auuz3FeZsCPJCHzU0WDgMEIpbZ3dXphb7lTY6irmmiCwpgeEVv2ge7hAAL01VEbTZN8v
         SFjTMg/Sm9I9pR8sUzh6kjBUi2Sm/QLBlhtZy3iFnFfioHuM5DX+n+SE4sIoeoPc7X8i
         ob92gmZskSt6xlj8skPpk3CKl77HSXo/7RSy/yliK7Rpxv3WuF2a0UErbLk8HVrEXGR5
         dJUvdXEug8seUadTO2EuJIiEB3TatynOA4rRsM7sEEOdpKZ8stuWzk/1eh5gLOroW7uh
         qNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zez1rxEqxUa6den/PlCBhFY8prK0HejZIbGceZPfSXw=;
        b=vZO7U8jpjMmSD4kUBY4pz4tbu8VX/iGJ6zGFESt8u1JGCp18dcqmq6CQRSfMcbcnQi
         UtiUlHhLoGIZ5Pn50bMz8xXXDfWuQFDJwIdQJnM8U486T/IYvcO51Tvw1Bnebu0Ly6ez
         ShiBbNVRdfoQHrPiXfbaFHDYkLUCyd2Qtn0U9Z1oO5UYGdriyEXKjwkWdtJ50+nsi+6g
         uUg1cEZgtlKCNRLSjauJZBKopArWZQaTj56dS4nrPsFACnEPZtsamWpD331pYmS0TNKa
         23dC3IctFIOtBml7/wthgRDRplEG3HYZvGgUcUKoxGvW/OHlnRCub2BTjEEEU8MSglw0
         w9Bw==
X-Gm-Message-State: AOAM531YArooNosPvt6npkwc++yNh1+9SRMSiFhXiNV6cYZ4+9ef/vOT
	N8t1+ATqFk9kV3bjFnM969TTIQ==
X-Google-Smtp-Source: ABdhPJzH/PVd9bNk2o5EkrDPPp9WP0TgzT0mzFmsPY/nBb6sSAzis/xMBXa0YhWn2cdLzqOn0SWqVA==
X-Received: by 2002:a63:5c05:: with SMTP id q5mr9153548pgb.599.1638444423086;
        Thu, 02 Dec 2021 03:27:03 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id q5sm3528213pfu.66.2021.12.02.03.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:27:02 -0800 (PST)
Date: Thu, 2 Dec 2021 16:57:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Herve Codina <herve.codina@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] spear: Fix SPEAr3XX plgpio support
Message-ID: <20211202112700.mkjmwibabj2cpr6u@vireshk-i7>
References: <20211202095255.165797-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
User-Agent: NeoMutt/20180716-391-311a52

On 02-12-21, 10:52, Herve Codina wrote:
> Hi,
> 
> This patch series fixes the plgpio support on SPEAr3xx SOCs.
> 
> The first four patches of this series fixes a ressources
> sharing issue between the plgpio driver and the pinmux
> driver.
> Indeed, these two drivers can use the same IO address range
> on some SPEAr3xx SOCs.
> To solve the issue, a regmap (syscon managed) is used in both
> drivers and the plgpio driver can reference the pinmux regmap
> to use it.
> 
> The second part of this series is related to IRQs.
> The plgpio on SPEAr320s SOC uses an IRQ line in the reserve
> range (from SPEAr320 point of view).
> This issue is fixed enabling all the 'reserved' IRQs and
> adding a dtsi file for the SPEAr320s with the correct interrupt
> for the plgpio node.

Are these changes backwards compatible ? I mean new kernel will work
with old DTBs ? It may be quite important to not break that here.

-- 
viresh
