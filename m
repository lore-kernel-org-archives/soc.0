Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1A9C433E6
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:55:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 69A0564F64; Tue,  2 Feb 2021 21:55:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 629CF60295;
	Tue,  2 Feb 2021 21:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612302900;
	bh=gGEvHficg0Vy/ZBHTv3itrJdnUnN7ePz6T29hli7iGA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsmuU8AaEPLw8GjRKsUwuvNuV5AAipUnRCEfAkidyHRvVZTXK5W9L0fPvLh49lTUe
	 piU6HicQZ3vy/98/edmoQKN1CvyMZaCKI9ujise4o3pDhuSLyph9L0/Vckg9W3gN2Y
	 AciLX4wf5CF7SPGm8iCpoc2UrPrMrDMafmd7Pfc/JW8jSAFhggZ48/8yApt0mDr3UB
	 aSVk1x10Opgt4m6MmoOdfTYw9QBBWwQUI/ZPi8yTGgjAknUOw/Y8lpp6bIHgY8+RiN
	 CuMS/VKGrw8bPEm66UDklPxNnUq8nke0iIpn3U5JCGbjXnVAhWEX3Gfb3mAaHbyfhz
	 lhcwjSnnMaiNQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Fabien Parent <fparent@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.12
Date: Tue,  2 Feb 2021 22:54:56 +0100
Message-Id: <161230288968.1906562.2884320159496470329.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5faa52c2-0ddb-b809-7444-ce6f6ff6d8ad@gmail.com>
References: <5faa52c2-0ddb-b809-7444-ce6f6ff6d8ad@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 10:53:59 +0100, Matthias Brugger wrote:
> Please find below the updates for the mediatek SoC drivers. The most outstanding
> thing is, that we now support also the MT8167 power domains.
> 
> Regards,
> Matthias

Merged into arm/drivers, thanks!

merge commit: d6d58c350f73f20ac426c410e82833e174b88399

       Arnd
