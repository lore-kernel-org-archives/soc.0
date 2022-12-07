Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB5FC352A1
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 15:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8957EC43145; Wed,  7 Dec 2022 15:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF5AC433C1;
	Wed,  7 Dec 2022 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670427820;
	bh=nkDrrL9+uzqmd46oaJsD6VT2l7LnraBR2Mn/qgKFKoI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=K0adPwK7kBLbKYAu99U5gHSkWARjQqGBquBS+I+rVAR99BQG5oi26bBEY9H5G8PBL
	 cKBI2pVltDJkZmu2hbYmSKmFH/4dHXkiHIzmvQHqMi/d8eE/pMEz9xJuMsifYJI5DS
	 yXziK2/9DGbS/wOmflOHXFy9vlq9MmXostV9e/9ByLH2qNBgBR1kZ4X5k62uAFJJCC
	 8rwXie5wl22HmY1tGrHTKwnq80oTHNP5VK39mKtjG0qN5KaHRuSY4Ps14C87O7VPDG
	 fZt5yeZ5Yik2iI981HEYXKa0+dreXkIzzJCoORsmrZY/lYvcn7uLYaBNVlM21XUbXO
	 eYWTgdYY2WHlw==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>
Subject: [GIT PULL] More Qualcomm ARM64 defconfig updates for 6.2
Date: Wed,  7 Dec 2022 09:43:39 -0600
Message-Id: <20221207154339.3234068-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit c03fa428ac6e439afa1d437776365a632ce24262:

  arm64: defconfig: build-in Qualcomm SC7180 and SM8450 interconnects (2022-11-05 22:35:12 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.2-2

for you to fetch changes up to 5d4bf8607be1683b09378ff1dba71cfe3d4ff6ec:

  arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and Pinctrl (2022-12-05 16:37:15 -0600)

----------------------------------------------------------------
More Qualcomm ARM64 defconfig updates for 6.2

This enables Globalc Clock Controller (GCC) and TLMM pinctrl for SM6115
and SM4250.

----------------------------------------------------------------
Bhupesh Sharma (1):
      arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and Pinctrl

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
