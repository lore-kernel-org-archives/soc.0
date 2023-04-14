Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607F9C77B6E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 02:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10D48C4339C; Fri, 14 Apr 2023 02:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019CAC433EF;
	Fri, 14 Apr 2023 02:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681439625;
	bh=4FLiGnXVYQzYShRWtGxavfiQglKcqiUD3e9N3TGht7Y=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=EZfFtMGhIERXe6mLqgqK1gl6t+jPnsfKVUea55UlDfeBMFBUm9mTl4/6U7ln06CFC
	 JjrWlHW2LGbK7oaHEDUgaW3LYJs4Wi9IazOlmV0DzFHqEeDEPob/m6DWaMDr3TnQ5k
	 X0xur7R9AxEfrAd5QJ0EOOC3bZNvCV7RH5Bt7mLLJoCNn6W3bYaqdUe14okHHkXwi9
	 GXynq4w3O6+sfdOcLxWTUnC10uzzxmLf39ALZlVoZD+Bx5smjCkKdJ0z46wdZhdfJP
	 46Lxx6iKDm+tyE7K7yKK7FYXn21GCDeFR1gzrMkMzpnpKSmpbf1QiKciDbWQck6iyz
	 0wRIPX6eOS2hA==
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
	Alex Elder <elder@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lux Aliaga <they@mint.lgbt>
Subject: [GIT PULL] A few more Qualcomm ARM32 DeviceTree updates for v6.4
Date: Thu, 13 Apr 2023 19:37:23 -0700
Message-Id: <20230414023723.2411793-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 26c56dbddc304cf7304346df4b25b3be0c086e36:

  dt-bindings: arm: qcom: Add Yiming LTE dongle uz801-v3.0 (yiming-uz801v3) (2023-04-04 12:23:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.4-2

for you to fetch changes up to 4e859ef0bae3c0839ad362408d2f7321332e4850:

  dt-bindings: arm: qcom: Document the Qualcomm qrb4210-rb2 board (2023-04-11 05:43:57 -0700)

----------------------------------------------------------------
A few more Qualcomm ARM32 DeviceTree updates for v6.4

This adds IPA definition to the sdx65 platform, and brings a few
stylistic changes to sdx55 and sdx65.

Compatibles for the two new Qualcomm Robotics Platform boards, RB1 and
RB2, are defined, as is Xiaomi Mi A3 and the MI01.6 development baord on
IPQ5332. These are all ARM64 boards, despite being introduced through
the ARM32 pull request...

----------------------------------------------------------------
Alex Elder (2):
      ARM: dts: qcom: sdx65: add IPA information
      ARM: dts: qcom: sdx65: move status properties to end of nodes

Bhupesh Sharma (1):
      dt-bindings: arm: qcom: Document the Qualcomm qrb4210-rb2 board

Kathiravan T (1):
      dt-bindings: arm: qcom: document MI01.6 board based on IPQ5332 family

Konrad Dybcio (1):
      dt-bindings: arm: qcom: Add QRB2210/QCM2290 and RB1 board

Lux Aliaga (1):
      dt-bindings: arm: qcom: Document xiaomi,laurel-sprout board

Manivannan Sadhasivam (2):
      ARM: dts: qcom: sdx55: Move reset and wake gpios to board dts
      ARM: dts: qcom: sdx55-fn980: Move "status" property to the end of node

 Documentation/devicetree/bindings/arm/qcom.yaml  | 20 ++++++++++
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 19 ++++++----
 arch/arm/boot/dts/qcom-sdx55.dtsi                |  2 -
 arch/arm/boot/dts/qcom-sdx65-mtp.dts             | 11 ++++--
 arch/arm/boot/dts/qcom-sdx65.dtsi                | 47 ++++++++++++++++++++++--
 5 files changed, 84 insertions(+), 15 deletions(-)
