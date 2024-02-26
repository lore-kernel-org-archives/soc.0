Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3140AC54E49
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 01:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7615C43394; Mon, 26 Feb 2024 01:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391A0C433F1;
	Mon, 26 Feb 2024 01:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708910730;
	bh=TrYvjGtvE6ePd8XYZL+WkuIo5TC2YTJkSxugKjiV1gA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=eQSFppU21B/4Gdml0b/b6YlD8uqklNMASAgw+wuJ+KNo7/bOhvKiby6OMonS6jJti
	 N4spQtCTDc4AcpKU2/JiZ0P/A5EhQ91prN3iT8hD18s2HrYoufIT4AICdIjKPZpBQI
	 1TH3dEeNYhdIhTBeLYPWj8CMtjKaFjAbTHvwsQVc0ugsRlPfog8iBhH6paevmCPZ9C
	 fRZkzgDPAAJfhEn2fYFcljzgAbQkJPktnjxHS7DRJTkf5c67ps7/oKpDNBv5XzIUP1
	 91+cUAZ3Fm1l9oGJ+0ix8Y1lesYESeRa+dv/DDp4yZc+qAi93+1Jyr5tE/ajntfgnj
	 c0xYfYwggEotg==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: update for v6.9
Date: Sun, 25 Feb 2024 19:25:28 -0600
Message-ID: <20240226012528.20380-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.9

for you to fetch changes up to 2c373e75155bcc9c81060cdc07ee1b59e113bd2b:

  arm64: dts: intel: agilex5: drop "master" I3C node name suffix (2024-02-01 07:25:55 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.9
- Drop the "master" suffix in I3C controller node name

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: intel: agilex5: drop "master" I3C node name suffix

 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
