Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82073C2BD09
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 19:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52FD5C4AF0C; Tue,  9 Jul 2024 19:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA072C32782;
	Tue,  9 Jul 2024 19:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720552517;
	bh=KBrLhLEYLLooNpL32JyxEFfqPMZZez+JNtnc4LIGG8E=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ssNsR++1splSPnzbDDesbqn3t1BrFttbQRLasXKcAQhZsos8Zzd09OI+MUrcUNWlV
	 8gcxtBMWh/VOsyX1pV8Xf6u8vNOt6j5Hc43kx3vcTZI1P7LZ5hEaa9BRIWs7Q6P06Q
	 nYThtWVFm/62BOqhcCcDOZ0orfenXnQxulX/su3IocBzye2QhTTDzCVLw+EKT3rNOg
	 cclxVqPDs5y98cLWIu599b+LNOMahET4DfJ+cEgHk9i6tnm3uweiYPAHmDOnz0dxHK
	 Z/7XD6BwQsInAdIkp0bVvuw2utFbDLyP8GYWw6mPVqdbQ7xP4qHa1jJod+vKy+X6bJ
	 lxxZF4hQcoZ9w==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	David Heidelberg <david@ixit.cz>
Subject: [GIT PULL] One more Arm32 DeviceTree update for v6.11
Date: Tue,  9 Jul 2024 14:15:05 -0500
Message-ID: <20240709191506.3285-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2a5454d0fe5684855581f8ad958afbcdc476fd64:

  ARM: dts: qcom: qcom-msm8226-samsung-ms013g: Add initial device tree (2024-07-02 22:15:57 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.11-2

for you to fetch changes up to c1842643a3df6004d1bc9df74e34d8b72997d886:

  ARM: dts: qcom: msm8960: correct memory base (2024-07-06 17:04:13 -0500)

----------------------------------------------------------------
One more Arm32 DeviceTree update for v6.11

This fixes the DeviceTree validation warning about MSM8960 /memory node
not having a unit address.

----------------------------------------------------------------
David Heidelberg (1):
      ARM: dts: qcom: msm8960: correct memory base

 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
