Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28818C433FE
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 20:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A5C8C433B5; Tue, 22 Nov 2022 20:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C33C433D6;
	Tue, 22 Nov 2022 20:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669149090;
	bh=ob/ywjN2Na8sjEc8Zkqh8sc0sf95dX37Rljgt+zwfm4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=GWcbs9T534w+8hV4jexwXNk7MKPoKFKc4ESSh0qSSeTTofrJ9fx1ADrXnTm+oWCr1
	 X2aNu+D+hBr5YR3WJG6qcugyDkg6nND9nUMQhCGnpAcXpGK9Ekz3uz9bj8wVxKCq5y
	 8/1k1UOMzmDDk5ClKv4lexH/Gr2/nwr8JF24tiCyA1QiXbfQ1QOn/OhySH6iaY8P4f
	 6Ah9eT1J7kGljrJeY8nX24Aml4djqUI09v31U8xj/6dUUSchdIWDB89eFhU0Pi5T20
	 KCynqfoz+E9UaAewDrHZMw6hTBc3KAIln0JHWdiFUigHJqsJ3pX4Xv9reAjM8SECBd
	 M0AlhMot3tlVA==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for 6.2
Date: Tue, 22 Nov 2022 14:31:29 -0600
Message-Id: <20221122203129.1854877-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.2

for you to fetch changes up to c03fa428ac6e439afa1d437776365a632ce24262:

  arm64: defconfig: build-in Qualcomm SC7180 and SM8450 interconnects (2022-11-05 22:35:12 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for 6.2

This enables more Qualcomm TLMM pinctrl drivers, and the Qualcomm crypto
drivers.

It makes the SC7180 and SM8450 interconnect drivers builtin, in order to
ensure that a console will be registered before init needs it.

----------------------------------------------------------------
Bhupesh Sharma (1):
      arm64: defconfig: Enable Qualcomm QCE crypto

Krzysztof Kozlowski (2):
      arm64: defconfig: enable rest of Qualcomm ARMv8 SoCs pinctrl drivers
      arm64: defconfig: build-in Qualcomm SC7180 and SM8450 interconnects

 arch/arm64/configs/defconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
