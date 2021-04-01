Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA04CC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8E908610EA; Thu,  1 Apr 2021 20:15:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6C05610D0;
	Thu,  1 Apr 2021 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308148;
	bh=sThdbX3BQH54hzCIqptpC5Z83box7dgsgatbxmU8fSE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h9OjWxiV56BHRCR+kUk1C2rxvKJBGRVhWpba5CPg8s3jazlh3P8f1qBRvyNFUvLAC
	 UwlwqmAp6qGIOFcwmlsl1ofWvoJcSrZr5BQkL0TaAJAwon1MDjQaOT4I1ZhJS81heA
	 KsjuFJA0OlIpQ0zgnspP0DMqx+pYehRy/eoyYduggqgVeT58qxc2tiVDdgdNhW7tlb
	 bR7fr8YfCni1czz/mZgt4uPvaTYZO+URAD76x9ATZDAbXEpYQnG8k1ca7SZyY5U0le
	 xWVn20OonkbDTJPyPTrHTtPyVIjW2SZkroL0FUR8hjVt13Z66YMAuhb4ulQkcTbiRv
	 WL52cPkzojA2g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Matthias Kaehlcke <mka@chromium.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ryan Wu <Yz.Wu@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Michael Kao <michael.kao@mediatek.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Nicolas Boichat <drinkcat@chromium.org>,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13
Date: Thu,  1 Apr 2021 22:15:21 +0200
Message-Id: <161730808707.655497.13146893990691457286.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <d1121630-5778-0955-fac7-f921174defe7@gmail.com>
References: <d1121630-5778-0955-fac7-f921174defe7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 16:14:20 +0200, Matthias Brugger wrote:
> Please have a look at the updates below. As you can see we have quite some
> activity on the MT8183 based devices, with a whole bunch of new Chromebook
> bindings added this round. Apart from that the a bit older MT8173 still gets
> improvement, which is nice to see.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 7d534c3a5e1f52022c889ed10c413c54ac2a4d0f

       Arnd
