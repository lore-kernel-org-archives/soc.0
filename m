Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CB8C0032E
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 19:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B197C433CB; Wed, 25 Oct 2023 19:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F2EC433C9;
	Wed, 25 Oct 2023 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698261262;
	bh=ocuGPC9AMoqRRC9LLm/H1i3c7S91ACcCQErJf+YcrHs=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=lgnJrcfTijfSrwJ1knGPvTdzfMYQsGU3cNRAUf9aOqcS53TRYs7DapyHrcmtL6zaN
	 IEsIcyi5iOyHVVlzmhrk9or+R6zlX+7Fl13iziFXvcbGs4ehC4QFvB2JwlJQdanvgG
	 UOBrJTlTot6hvEXsyKJapWc5ye0JF9CEsgpQtMhhQmo1rcdT9ijtizgo5TURPr3fnz
	 EeitLE45QRO6mS3FUJxhTHepDoe6bCPijxRxv6uhbMAnnp7CFLKiUed3FAsmNN7J/C
	 w9HODgQuFJCUPrSW1smdnFqexZ6jE3x3LWG2NdPWhHhMgsgmYBK1ngLatsa+S09KqE
	 BFPAWXRH63I6Q==
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] Few more ARM64 defconfig updates for v6.7
Date: Wed, 25 Oct 2023 12:18:40 -0700
Message-ID: <20231025191841.1015192-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit b46d856cb9b3bd2fef54cc8caec8595a232a23b6:

  arm64: defconfig: Enable M31 USB phy driver (2023-09-19 20:01:52 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.7-2

for you to fetch changes up to f93b8a5705c6886a4c5ec6d142730927d891b6f7:

  arm64: defconfig: enable DisplayPort altmode support (2023-10-18 07:58:03 -0700)

----------------------------------------------------------------
Few more ARM64 defconfig updates for v6.7

This enables the Qualcomm PMIC-based USB Type-C port manager, found in
e.g. SM8250, and hence RB5, as well as the Type-C DisplayPort altmode
support to get display working on the same.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
      arm64: defconfig: enable DisplayPort altmode support

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
