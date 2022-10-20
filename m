Return-Path: <SRS0=1LSc=2V=ucw.cz=pavel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B64C4332F
	for <soc@archiver.kernel.org>; Thu, 20 Oct 2022 12:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 054A2C433B5; Thu, 20 Oct 2022 12:16:25 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6380AC433C1;
	Thu, 20 Oct 2022 12:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6380AC433C1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 674681C09DA; Thu, 20 Oct 2022 14:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1666268174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UETEyythYJwSfqKA2WGuDN9V57KqBhfyFfz8g5NHVJM=;
	b=E1CFfEzgFnS8JGKtZOp7rGe7NBGnphs/wm1GMt7TQCY/MqlqPFfBq4ZzkDX9v9IXqaH+j/
	ndk8Jc9HeCD7+wE7a7M/g2VeKsAb8WViB5w+RCZfI/6HaNqWPe5N6w5p+kTOCe9Ik6AGJV
	vpRAXIiNcEXGOFtXw5nvQXCdQ94rbqY=
Date: Thu, 20 Oct 2022 14:16:08 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, arnd@arndb.de,
	f.fainelli@gmail.com, krzyszccf.kozlowski+dt@linaro.org,
	nsaenz@kernel.org, olof@lixom.net, robh+dt@kernel.org,
	soc@kernel.org, stefan.wahren@i2se.com, william.zhang@broadcom.com
Subject: Re: [PATCH] ARM: dts: Add Raspberry Pi Compute Module 4 CANOPi Board
Message-ID: <20221020121608.GA1774@bug>
References: <20220916153156.30412-1-ariel.dalessandro@collabora.com>
 <e652ad18-3a35-e8a0-939c-5f2a59cfc3d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e652ad18-3a35-e8a0-939c-5f2a59cfc3d0@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)

Hi!

> > +		led-pwr {
> > +			label = "PWR";
> > +			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
> > +			default-state = "keep";
> > +			linux,default-trigger = "default-on";
> > +		};

NAK on the label, see/modify well-known-leds.txt.

