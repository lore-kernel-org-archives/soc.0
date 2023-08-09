Return-Path: <SRS0=x9WF=D2=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3660FC04A94
	for <soc@archiver.kernel.org>; Wed,  9 Aug 2023 02:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8F65C433CA; Wed,  9 Aug 2023 02:12:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B36C6C433C7;
	Wed,  9 Aug 2023 02:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B36C6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 512ABC0003;
	Wed,  9 Aug 2023 02:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691547144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rFEnNQwjkEYrsNofQX5zgngbo+/k9VPRl09iaDkgfw=;
	b=fM1JUYttGO4l1yPqT972IWNuJVhnctqVpdBXINuBxD+8nApZhrNa8mcnHMV4WKIHk8ap9B
	RqJ5YhliqSkKlnIcVDiysBN9l4D5u1V4IF2F+Y/CYYRRZ6OH1Voaj66uA99yBwWY2zDTHP
	eABokGOWzkeePett3NFaEAIJj+QFkFqEIATr+CoH8n9FcnIcEUBjlw8UZC28p3aiH0MeL3
	/uss7CiOLllKYPt3QvzbgHE/9qZnyqW5OSQJcCL6SaBxk+EFqCGtgLNItpnaKOy2xbxKlb
	KTWsJ3/Amn7Kb1ttZbbpt/+CgSO4TudC/m+A074ZxLdZP1f85mHyUuU9uZo30g==
Date: Wed, 9 Aug 2023 04:12:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: a.zummo@towertech.it, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [RESEND PATCH v2 3/3] rtc: Add driver for Nuvoton ma35d1 rtc
 controller
Message-ID: <20230809021224ab4f229f@mail.local>
References: <20230809011542.429945-1-ychuang570808@gmail.com>
 <20230809011542.429945-4-ychuang570808@gmail.com>
 <20230809021025a7c0daec@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809021025a7c0daec@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 09/08/2023 04:10:27+0200, Alexandre Belloni wrote:
> > +static int ma35d1_rtc_probe(struct platform_device *pdev)
> > +{
> > +	struct ma35_rtc *rtc;
> > +	struct clk *clk;
> > +	u32 regval;
> > +	int err;
> > +
> > +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > +	if (!rtc)
> > +		return -ENOMEM;
> > +
> > +	rtc->rtc_reg = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(rtc->rtc_reg))
> > +		return PTR_ERR(rtc->rtc_reg);
> > +
> > +	clk = of_clk_get(pdev->dev.of_node, 0);
> > +	if (IS_ERR(clk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to find rtc clock\n");
> > +
> > +	err = clk_prepare_enable(clk);
> > +	if (err)
> > +		return -ENOENT;
> > +
> > +	platform_set_drvdata(pdev, rtc);
> > +
> > +	rtc->rtcdev = devm_rtc_device_register(&pdev->dev, pdev->name,
> > +					       &ma35d1_rtc_ops, THIS_MODULE);
> > +	if (IS_ERR(rtc->rtcdev))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtcdev),
> > +				     "failed to register rtc device\n");
> 
> This MUST be done last in probe, else you open a race with userspace.
> 
> 
> > +
> > +	err = ma35d1_rtc_init(rtc, RTC_INIT_TIMEOUT);
> > +	if (err)
> > +		return err;
> > +
> 
> I don't believe you should do this on every probe but only when this
> hasn't been done yet.
> 

Also, if you can know that the time has never been set, don't discard
this information, this is crucial information and it needs to be
reported to userspace.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
