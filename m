Return-Path: <mani@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7793CC2B9F4
	for <soc@archiver.kernel.org>; Mon, 28 Jun 2021 07:28:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 49BF861C29; Mon, 28 Jun 2021 07:28:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BA0C619C4;
	Mon, 28 Jun 2021 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624865307;
	bh=Ms7Rd2sSbBokxxB0neJlyI+D9rad26ItSTvKowHnX1k=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=S8Lt8lve0JUIurnLicj5+O8WTcDz2qOxpPmibZw8xstASeZFEV/2p1Epvxe2eYHfB
	 C1r/os6VPwMgEPImrpMfyqfvjW+KcwTKwL6kANNsNN8G4ctsIrIoZZGuO7a5dznou4
	 RIJR7dapI3ACtznGhtt/eZmdJ28wmrvjnUTq9m+khDTXdlUlVjdqYIp4gx+tnb02Vf
	 dQQfBrA79HVMdB4YJ6lh7Rs1/kv0lcd3LiLKBfaQ844mOoJEaV6itFqOszjI0p5IIK
	 XvRTHldQXCfhsNDPUp5qdKrMo8PyBt/JAoJsweUx3L7ZvFWFF8KO0KArUilyMMfj6l
	 De1w47KH0gMOw==
From: Manivannan Sadhasivam <mani@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: olof@lixom.net,
	arnd@arndb.de,
	afaerber@suse.de,
	linux-actions@lists.infradead.org,
	thomas.liau@actions-semi.com,
	cristian.ciocaltea@gmail.com,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH 0/2] ARM: Actions updates for v5.14
Date: Mon, 28 Jun 2021 12:58:15 +0530
Message-Id: <20210628072817.8269-1-mani@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Olof,

Sorry for submitting this short series so late. I was waiting for the clk
patches to be picked by Stephen.

For the Actions ARM32 platform, we have just couple of patches for v5.14 cycle
adding Ethernet support to the S500 SoC and enabling it on the Roseapple Pi dev
board. The EMAC controller is an in-house IP from Actions Semi capable of
operating at 10/100Mb/s in half-duplex and full-duplex modes. The emac driver
patches are already merged into netdev and the clk patches are just queued for
v5.14.

The ethernet node depends on the clk binding update for which the patch has
already been merged into clk tree[1].

Please consider applying!

Thanks,
Mani

[1] https://lore.kernel.org/lkml/1d0902cf073f76a1a602410061481ccb3fc36a72.1623354574.git.cristian.ciocaltea@gmail.com/

Cristian Ciocaltea (2):
  ARM: dts: owl-s500: Add ethernet support
  ARM: dts: owl-s500-roseapplepi: Add ethernet support

 arch/arm/boot/dts/owl-s500-roseapplepi.dts | 45 ++++++++++++++++++++++
 arch/arm/boot/dts/owl-s500.dtsi            | 10 +++++
 2 files changed, 55 insertions(+)

-- 
2.25.1

