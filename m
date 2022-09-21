Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA2ECAAD8
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 15:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85DD9C433B5; Wed, 21 Sep 2022 15:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1372C433D6;
	Wed, 21 Sep 2022 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663774656;
	bh=4WWdCZTfaqK/fRtt9TaEQfsAAq5h/fYwhO8J8y7mpMU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Lj7lx5XiNLn97tKPXg4DBWtjWWcgjhzFp41tsQ8F1cA0RNOIwbnt8P1n1wM0JCzZ9
	 awN6w0SHHzEBV87OyNssKjH4s9u0CApgJXDR909Ih3L3BZod9nvm8LPeT9OjVBwdzk
	 0uS4lPgu7XeUNSSoQOrwR8zdhmhABjcsVpDXvW04GyHKSOLaPtppck/eRb54vm9exO
	 ltmXmgv2dyBO8CuFQfXtpgttGmn3q+w43F8AA97T6aQ2qNR+AaI58MWdWsxLL7sWWy
	 qwsLkCprDbN4zT1Plzs766uwWR0yXdnJBIXHGfjHDMJXn/OUyTGJ/XC0SsbJQ+5yQA
	 WUP/9tJzjNmCw==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for 6.1
Date: Wed, 21 Sep 2022 10:37:34 -0500
Message-Id: <20220921153734.1314952-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-defconfig-for-6.1

for you to fetch changes up to 10fa117bfc0a9ba5f38a36fa59ccd4e1e36a2b7f:

  ARM: qcom: include defconfig in MAINTAINERS (2022-08-18 14:13:21 -0500)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for 6.1

This enables command-db, ocmem, rpmh and rpmhpd drivers in the
multi_v7_defconfig, used on SDX55, SDX65 and MSM8974. For qcom_defconfig
rmtfs-mem, rpmpd, socinfo and qcom-stats are enables as they are used
across MSM8974, MSM8226, MSM8916 and APQ8084.

Lastly the MAINTAINERS entry is updated to include the qcom_defconfig.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: qcom_defconfig: enable more Qualcomm drivers
      ARM: multi_v7_defconfig: enable more Qualcomm drivers
      ARM: qcom: include defconfig in MAINTAINERS

 MAINTAINERS                         | 1 +
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 arch/arm/configs/qcom_defconfig     | 4 ++++
 3 files changed, 9 insertions(+)
