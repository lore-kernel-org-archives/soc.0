Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE071C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA27BC340EF; Tue,  8 Mar 2022 16:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6ADC36AE5;
	Tue,  8 Mar 2022 16:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758482;
	bh=U6ODwZ0lHZ9Peu2ZCYLqVvsDYn8D4fdf3FI2MxZoZso=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XGB4ecG830EkBMf16KlND+uGxx/gj1y+F8ZFvYImcsvQz4l6+UVqn2LxgQJyA7ZvY
	 itDDNY+h7dlT/ll3nCxRg0cpYXnVUiD8x6NxsuD05tPKvZf4gEJrccCrLg1M4cpGS5
	 efumvdBC3fpCHTrFz5Kltk7xQa1E2fEtrnEYLiSt1WuoR4GWh9RCGUh9vYdpoBoxXz
	 RrkLhTQ0DNzMilkfL9k805wlXIcWDAVCDA2bndzgZ8v9ccEfY1p7lsG3nLPKg1ISk9
	 7XlFw18Z0jUyDp5NCaqWdITwZ8ICqBGZJWeq1EfiZ2Ho2ciIKCHuOKDoHAX9fiwo2q
	 4H0FumZzdGOWA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] drivers: soc: mediatek updates for v5.18 take 2
Date: Tue,  8 Mar 2022 17:54:00 +0100
Message-Id: <164675831448.4164581.5272394005791917460.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e1b90372-a041-db6e-f35a-d17b26069e40@gmail.com>
References: <e1b90372-a041-db6e-f35a-d17b26069e40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 4 Mar 2022 11:08:45 +0100, Matthias Brugger wrote:
> Hi Olof,
> 
> This pull request fixes the compilation error in the mmsys driver. Sorry for the
> incovennience.
> 
> Regards,
> Matthias

Merged into arm/drivers, thanks!

merge commit: a2d266a8f1fc9c0576e4407c4d5dee83ee29d6f0

       Arnd
