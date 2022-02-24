Return-Path: <SRS0=Lrvw=TH=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE27C433EF
	for <soc@archiver.kernel.org>; Thu, 24 Feb 2022 23:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A78E7C340F1; Thu, 24 Feb 2022 23:20:30 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A91BCC340EF;
	Thu, 24 Feb 2022 23:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A91BCC340EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nNNPP-0004GA-UW; Fri, 25 Feb 2022 00:20:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 5.18 #1
Date: Fri, 25 Feb 2022 00:20:26 +0100
Message-ID: <9977257.a15B8eIVjX@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-drivers-1

for you to fetch changes up to 7dbb47d64acf4aac131a2aaade726913aa62abe7:

  dt-bindings: soc: rockchip: add rk3568-usb2phy-grf (2022-01-23 13:35:06 +0100)

----------------------------------------------------------------
Compatible for the rk3568-usb2phy-grf.

----------------------------------------------------------------
Peter Geis (1):
      dt-bindings: soc: rockchip: add rk3568-usb2phy-grf

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)



