Return-Path: <matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F92C433B4
	for <soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:39:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AF2C8611AF; Fri, 16 Apr 2021 14:39:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF653611C2;
	Fri, 16 Apr 2021 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618583973;
	bh=OvwYzUWAq+F6jUu3zv85BIbsufle24EDLBJL80W5lv8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=rDuhQhn1WfFYm3ASpVlGtSjJhme8acFo2yTImNM6LHGiDPwj2Jsgeg0En2xFloRIs
	 nAsNePIbMFbF++dtP5ZbtA/NCcDdYXHk4oA406PpUXs4rCJ8DzHVROaz3rOu6mkbyR
	 yir5Vm207OuErJOpebB8k8/d96GjsRN/Eb+nPyDARDFjNOoeQQ5AhiB8gWY5pJKZRT
	 P1kbzSk8vN9Zrq9mYtC9KPasgm5yDieNDnrNjGIK7vJh7XG+5wqh0ej5IIDBPvCESu
	 0uILVxuhlVXT/eJP6ClpHtolhnOkwzK4JSrk/rpbWDc2XexJl7lVkR25JJc2bqb//1
	 xSWwvj2pn/EvA==
From: matthias.bgg@kernel.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dts: mediatek: fixes for v5.13
Date: Fri, 16 Apr 2021 16:39:21 +0200
Message-Id: <20210416143923.23406-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Brugger <matthias.bgg@gmail.com>

Hi Olof and Arnd,

Here come two smaller fixes for dtbs_check. I realized that we have tons
of warnings, so I'll try to get rid of them over time, but it will be a
longer run :)

Please have a look.
Regards,
Matthias



Matthias Brugger (2):
  arm64: dts: mt8183-pumpkin: fix dtbs_check warning
  arm64: dts: mt8183: fix dtbs_check warning

 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi        | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.30.2

