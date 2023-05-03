Return-Path: <SRS0=BKuy=AY=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7088C77B78
	for <soc@archiver.kernel.org>; Wed,  3 May 2023 06:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C8A9C4339C; Wed,  3 May 2023 06:07:43 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 7F4E8C4339B;
	Wed,  3 May 2023 06:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F4E8C4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 9436280EB;
	Wed,  3 May 2023 06:07:40 +0000 (UTC)
Date: Wed, 3 May 2023 09:07:39 +0300
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Julien Panis <jpanis@baylibre.com>, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] arm: dts: Add am335x-boneblack-pps.dts
Message-ID: <20230503060739.GM14287@atomide.com>
References: <20230428105453.110254-1-jpanis@baylibre.com>
 <8e1ee169-603f-4aa4-9f02-68520d708d57@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e1ee169-603f-4aa4-9f02-68520d708d57@linaro.org>

Hi,

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230428 13:50]:
> On 28/04/2023 12:54, Julien Panis wrote:
> > From: Lokesh Vutla <lokeshvutla@ti.com>
> > +		compatible = "ti,omap-dmtimer-pwm";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pwm7_pins>;
> > +		#pwm-cells = <3>;
> > +		ti,timers = <&timer7>;
> > +		ti,clock-source = <0x00>; /* timer_sys_ck */
> 
> Why this is hex? Should be just 0/1/2?

I think the ti,clock-source can be left out now, this can be done
with assigned-clocks and parents instead. Please grep for some
examples in the current mainline kernel dts files.

Regards,

Tony
