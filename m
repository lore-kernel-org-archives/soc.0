Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD5AC2BD09
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 19:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7DEDC32782; Tue,  9 Jul 2024 19:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F897C3277B;
	Tue,  9 Jul 2024 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720552378;
	bh=DQI62k7kcsp3CMcZHmhnN1w2qqdhPg59f6cvsYKMeQ4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=oICOtEAtHM3ePfCghLXolTrchVKg0q+v67LAfI1HDBUyznBgB/S5/X+rqGVnyTA+A
	 UZ/yi6POnmINoXBmufnpXWfBpzsYDn6OpLKubM4H3+B4+GPrIyxELJu0gYYq6yGM6R
	 abe0vFkxEn5N2O14D6ygjx+50MIL6y9SfMzzokLxbQ6uYJQ3/SeW6+epSgsyhXHVU2
	 KM8AqvpwBXYNxZiLR93urVRibXQ8Gaem8IDgrVCns04js4mDE6xefkLVitT04AWnCX
	 5eyCdtLFYbhtdnrczb3IzBvSm/XcyungzA8o/Thn6MkqOd9QEYr9Rj+8X+u52OzAwN
	 3MO2gm2XrHiGg==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [GIT PULL] A few more Qualcomm driver updates for v6.11
Date: Tue,  9 Jul 2024 14:12:45 -0500
Message-ID: <20240709191246.3053-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit e49380c155940cb47e291a4b3fcb7fdffee6aa4d:

  soc: qcom: smp2p: Use devname for interrupt descriptions (2024-07-01 22:31:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.11-2

for you to fetch changes up to 55751d3e9e96d5d64dc6ebb5bbdf70f45098f279:

  firmware: qcom: tzmem: blacklist more platforms for SHM Bridge (2024-07-06 12:59:50 -0500)

----------------------------------------------------------------
A few more Qualcomm driver updates for v6.11

This adds a quirk to skip using the newly introduced SHM Bridge
implementation while regressions are being investigated.

One occurance of return no_free_ptr() is replaced with return_ptr() to
make code easier to read. llcc, mdt_loader, ocmem, pdr, socinfo and
wcnss drivers gets simplified using cleanup.h.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      firmware: qcom: tzmem: blacklist more platforms for SHM Bridge

Krzysztof Kozlowski (6):
      firmware: qcom: tzmem: simplify returning pointer without cleanup
      soc: qcom: llcc: simplify with cleanup.h
      soc: qcom: mdt_loader: simplify with cleanup.h
      soc: qcom: ocmem: simplify with cleanup.h
      soc: qcom: pdr: simplify with cleanup.h
      soc: qcom: wcnss: simplify with cleanup.h

Luca Weiss (1):
      soc: qcom: socinfo: Add PM6350 PMIC

 drivers/firmware/qcom/qcom_tzmem.c |  4 +++-
 drivers/soc/qcom/llcc-qcom.c       |  6 ++----
 drivers/soc/qcom/mdt_loader.c      |  6 ++----
 drivers/soc/qcom/ocmem.c           | 10 ++++------
 drivers/soc/qcom/pdr_interface.c   | 38 ++++++++++++++------------------------
 drivers/soc/qcom/socinfo.c         |  1 +
 drivers/soc/qcom/wcnss_ctrl.c      | 11 +++++------
 7 files changed, 31 insertions(+), 45 deletions(-)
