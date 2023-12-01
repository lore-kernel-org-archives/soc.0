Return-Path: <SRS0=wqEb=HM=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F45DC4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 07:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21F54C433C9; Fri,  1 Dec 2023 07:06:12 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3223EC433C7
	for <soc@kernel.org>; Fri,  1 Dec 2023 07:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3223EC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 5494060476;
	Fri,  1 Dec 2023 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701414370;
	bh=RXpbKQwq6L7Fxm/0BkFGv54CyvhTReyPPdkffpuvbsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwGaHDPbV2JUMhJAKfc8j7Oy8P/WEbo+xFfr15UKt2im8yKC2LOjQMJCewDqx96jE
	 aSpg2thl/1PEa9AAgZ3zAxGK7PamGvw8cf4LGwEvS9y8pz32Pq9V7R0r8b/JvY3onO
	 hL6fD6K/kf1NYVkvcgzntGzcqcsGH7plpBC1P0chyvE6IuaS6seg05FMm1yy7U3xVh
	 kDAIW+LTJ/xqEvT34t5Q3LW1enGtJuC1kx9Msk2qc+/27leT2CBwMKeLItMVLfNd4I
	 gqu3P9kcEH/z9f6T+MXXZ+3O/pNw6AFdQf0lk+BbDJBF38evhqGzPSl6ZxZSrbOAHe
	 5hLhE3He+9HYg==
Date: Fri, 1 Dec 2023 09:05:51 +0200
From: Tony Lindgren <tony@atomide.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for
 OMAP{3,4,5}
Message-ID: <20231201070551.GJ5169@atomide.com>
References: <20231025112136.3445-1-lukas.bulwahn@gmail.com>
 <20231201070207.GI5169@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201070207.GI5169@atomide.com>

* Tony Lindgren <tony@atomide.com> [231201 09:02]:
> * Lukas Bulwahn <lukas.bulwahn@gmail.com> [231025 14:21]:
> > Simply reuse the config DEBUG_OMAP2UART{1,2}; there is no need to define
> > separate config symbols for OMAP{3,4,5}. So, just delete the dead
> > references to DEBUG_OMAP{3,4,5}UART{1,2}.
> 
> Thanks applying into omap-for-v6.8/debug.

It's been already applied by Arnd, no need to do anything :)

Regards,

Tony
