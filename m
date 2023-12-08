Return-Path: <SRS0=1HNv=HT=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9214BC4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 12:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76F89C433CA; Fri,  8 Dec 2023 12:18:53 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A8C3C433C7;
	Fri,  8 Dec 2023 12:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A8C3C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id C3EF6604F7;
	Fri,  8 Dec 2023 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1702037929;
	bh=ACweZUEhXFrqtvkmpi3kfh9N6DmnisvMgBTDys7hoDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pcxa3nfAW3Js7wzzfSzVm42H1Snf6H5gr+AuPJhpdO9qqXlSk7iTwi5bjLndkl+Dv
	 HvCxNbrSv52TFIYzsHefUcAROg88IuxhoddtQaS1pnagWg80cfNqXVzA22mKY4CSza
	 81JD3kk5p51useCYE0+vNBocq+EY1NYeBvy187TewP9AKTD65A+NLBwqUUdr4e+sAr
	 cV8eGdG2IDr4JLfR5+BEcK+GdWx1AIt0EZRZGyN7L9xwMsUpV4yRwT4ZHtMzrEmxUj
	 RAQIA0jctWc7lVNlxir2niMGlvKy5WIiZFILLxCJEo1uGWMKup16NLtaqBWp5NuoM1
	 hR7c+pNSqwU5Q==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Defconfig changes for omaps for v6.8
Date: Fri,  8 Dec 2023 14:18:18 +0200
Message-ID: <pull-1702037869-295608@atomide.com-2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <pull-1702037869-295608@atomide.com>
References: <pull-1702037869-295608@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.8/defconfig-signed

for you to fetch changes up to ac10d6c3c5f9b85e780ec5cfaf0608ae048c5205:

  ARM: omap2plus_defconfig: enable I2C devcies of bt200 (2023-12-01 08:48:15 +0200)

----------------------------------------------------------------
Defconfig changes for omaps

Defconfig changes to enable I2C devices for bt200 as loadable modules
for the PMIC, sensors and LEDs.

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable I2C devcies of bt200

 arch/arm/configs/omap2plus_defconfig | 5 +++++
 1 file changed, 5 insertions(+)
