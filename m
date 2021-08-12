Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BEEC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:06:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7C56860C3E; Thu, 12 Aug 2021 21:06:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F401B6101E;
	Thu, 12 Aug 2021 21:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802361;
	bh=xxKg3QKtgOFfe3J4sDO6Rigeg11oPtnhlnbs8G71jss=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jwjflFxFCYdVW/oDzDtLYVnwiUN9AuCfIcuhRI8XnLAfDTC2TCokn9CAWvP4X2kXE
	 p3z+yRjUo6GFuGpxl7Sq7Tgh0cQQi/GIbjZ+ISq64X0ufOIiACS+UaJPoECMbTCELo
	 V6uLl5cuiPMzWkKA/yy3ev2OLcKgjeJ9irbu7mvZApWw1hCFXCZCKs84JK+e8AvEeC
	 Z1CvpwFzFPHNxV9sdDzO1OdHMG5WapmKh4qs2iu57BhzMnDS5h7iM2TVWPrIZ0vwOT
	 zGfkDJ0/YDGrF1XhKXg7sWOyGA7Q5Rb39f3ldJ1n0yHSpqt3pGcNqZjpPz/BLipF0H
	 70k626ap8jydQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [GIT PULL] ARM: dts32 updates for v5.15
Date: Thu, 12 Aug 2021 23:05:40 +0200
Message-Id: <162880206129.1376011.4763501085198621615.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <289ded1c-dae7-54ef-6b56-9433bfcaf9de@gmail.com>
References: <289ded1c-dae7-54ef-6b56-9433bfcaf9de@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 14:20:03 +0200, Matthias Brugger wrote:
> Please have a look on the single patch in this pull request for arm32 MediaTek.
> 
> Thanks,
> Matthias

Merged into arm/dt, thanks!

merge commit: eaf05c1fdc14ed04a47c8632db5ed45010fccd09

       Arnd
