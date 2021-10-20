Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C8AC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 35DAE61374; Wed, 20 Oct 2021 14:50:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35DA3610A1;
	Wed, 20 Oct 2021 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741444;
	bh=folnbwU/0sQ7piXTJc1Lh7Kr4R1HiJgqm3XjMFtsUJo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Be2PYOxe4EFd/xTIn6l/gG4Sw9fOKhbbSumAfugZAf6WkIMq3roC6vIVImmRSDbES
	 AQPI4jV2giUVFUPrdrPHyXTXjPXBVzRVk+DazMZyBynCmdq7YDwqL9cVni/gCxk0JL
	 RLmPTBoX6QgatfvkFmOwCR/OFtSZpPbFsKRJz2joLtUG0JMolr65O8Dl7jZJ+KsBJR
	 eub0QkhXVBjkfNShcI+I+bNAtte9i9Fs4QF6YXOKQg70JuAz/gLZHNtedDAGie7/X3
	 8/PD8ZLknhB02CXHpauOOdypsk8iqitOWDj8NO0IG3F13NyrTGAzqk82zYalPZCGoC
	 I6mau4myj+QXA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Kansho Nishida <kansho@chromium.org>,
	Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Re: [GIT PULL] arm64: dts64: mediatek updates for v5.16
Date: Wed, 20 Oct 2021 16:50:15 +0200
Message-Id: <163474139742.4099414.583373234441838179.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
References: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 11:58:34 +0200, Matthias Brugger wrote:
> Here come the latest updates for arm64 DTS cahgnes.
> Biggest change is, that we have now support for a reset controller inside the
> mmsys. This goes inhand with changes to the driver, that you will find in the
> soc pull request.
> 
> Please have a look.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: ba232d398aee515ee0f8d046ba391f03bed49bfa

       Arnd
