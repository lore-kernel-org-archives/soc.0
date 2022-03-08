Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026D4C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E01DDC340EB; Tue,  8 Mar 2022 16:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A05C340F5;
	Tue,  8 Mar 2022 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758485;
	bh=FqT/k0ezpryEVl36D+32pDONBPt0VUNdNcp3WkQR3nQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tw25013fPzc3WxXHW6wFGg3QQ3Ld9r8jLs7L0lHM/Psv7IZlhYi85AWjdPKfAX8R2
	 AmSlyQ8Qe3fGS7Tl10zfGtPfLI1z6o/xGGHLmLCfi4dFBjxq/2O0mxxJ2jVv78duP7
	 XfXcQ+K2ESQipW/Hzbx27k7zP/I3TBddcjacRzXgCnML/UmIQnNjbIGgQilmRbNcw5
	 ZzABB3NtFW1DreWHlzCo/E6IkdfKEzJhRePTmxzkSTonqBiIrp+WDXjec4S36IE97I
	 shJqQ/zO8EI28rTnNO0/fE9M6IVsO+HTRs5uQWyvQxMWGLiftyMTXcQQEfp0DyZL+8
	 qyJy1ZcjNJF3A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.18
Date: Tue,  8 Mar 2022 17:54:01 +0100
Message-Id: <164675831433.4164581.4439793823341816815.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
References: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:38:55 +0100, Matthias Brugger wrote:
> Please have a look on the SoC driver updates for v5.18.
> As you can see, we get quite some support for SoC devices based on mt8186.
> 
> Regards,
> Matthias

Merged into arm/drivers, thanks!

merge commit: 16e769e2ae1fd6c32e657046b2ca9da7a7728257

       Arnd
