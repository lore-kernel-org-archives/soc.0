Return-Path: <SRS0=wqEb=HM=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B529BC4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 07:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FF51C433C7; Fri,  1 Dec 2023 07:02:28 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2D0AC433C9
	for <soc@kernel.org>; Fri,  1 Dec 2023 07:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2D0AC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 9CAB36032E;
	Fri,  1 Dec 2023 07:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701414146;
	bh=T8JMiYZNsTJUoKXUtVyfyVWVbi2lERt92r3CrXZczEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWrBD8D4Wn/H8eg46GPJijn8NrOiUogrLvyhwt6MGVWraVexd/b1Rz8d8Iv7AEHLp
	 mJ4SJ/+1eiUrqDasiruVR/TQiaf3X0Szq7LC/xw9ymIX//JjAYCUPJddzqCqVdDDKl
	 87YYbaZNzemSW0GfGTacF/JRXqLWEa23aW/SeU1TapuiwUDq1D4d5jjZJlEzav4GQz
	 4cJ0Np27jEJCSVyHUbexC9vCa0QEaISeKNcl8yF3eOuZSRWIpzPuhL4Ltn4VbYLVpp
	 eOHM90yiYKtYvsRq7/BOzkVhtfQRHTLDPQtF5/hjZp9bJcRhSxTosAyKWPVs3T/Zrh
	 8HBVXwX9oSTgw==
Date: Fri, 1 Dec 2023 09:02:07 +0200
From: Tony Lindgren <tony@atomide.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for
 OMAP{3,4,5}
Message-ID: <20231201070207.GI5169@atomide.com>
References: <20231025112136.3445-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025112136.3445-1-lukas.bulwahn@gmail.com>

* Lukas Bulwahn <lukas.bulwahn@gmail.com> [231025 14:21]:
> Simply reuse the config DEBUG_OMAP2UART{1,2}; there is no need to define
> separate config symbols for OMAP{3,4,5}. So, just delete the dead
> references to DEBUG_OMAP{3,4,5}UART{1,2}.

Thanks applying into omap-for-v6.8/debug.

Tony
