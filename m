Return-Path: <SRS0=b6vg=RG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2440C433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 04:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81AA4C36AEC; Tue, 21 Dec 2021 04:22:01 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A777C36AE0
	for <soc@kernel.org>; Tue, 21 Dec 2021 04:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A777C36AE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f48.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso3694961ooa.6
        for <soc@kernel.org>; Mon, 20 Dec 2021 20:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YfcIKzslVYZekJHq1BYulIL1J8boZNWVn+NLo0uiBgA=;
        b=kS5d/44FUi2py7n72gJGJ0x5X7VaKfCQUwNpSqDQRDeqGBNHJldxNxFtBLMzAFf9aq
         eO0Rud+wXQniYHeGNtcT6K1IiweFdJtqNUNG+HC7k02Vdsv0GpL2wBvAfrU4LiBC08Yg
         Mkm9N0rx9e9WvKd5LcQ4BDJFfb1WgHjyWPHecO4FK4sXSt03UQlv15XuJQQAaiZmJwz5
         w4Qg56y0Q3O2OjO1K+jk9hP6XGKFNKedEoynj4+xyaIvkwPQd+mWfnW2RjB5HFR3kTNF
         xCdBOyS1sfZWlm1UPhzXFmTAz5GEMH6k/3tJtQAt0dXNbq7wouLlGn0ajYW2PPG4v5l8
         9BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YfcIKzslVYZekJHq1BYulIL1J8boZNWVn+NLo0uiBgA=;
        b=1fZaZ8JirvxV4Wfzhr0Py+naHuzWa5rwp8Q4HiXO9NgWVDUyGl0HfSvQpBgeqbkPU/
         X9WI6iWhWRYonI2GsrCUAlXpuS4s1GvIKLuuVGdZkvN5I51fbfjpX99SpYaW06tSnNOm
         W1XjZ5Al5saPl3mHs0iDYYUl8x9FFMveKDP1ltFUOaLxe7O1owBJ+0Gn4RAtGxyrHb39
         Y+f15lEOjOOlCl6XDAuM50w9MOAF7S3aXnRnkJfE47HQp/hnaYYmm87wCZGeKRx7zSuf
         3TGASc3hcnNtIJEh7Ab03oUxiZqM+UEQkfedsmW8czdb37W3uW6mkAmcC+T2QDlgh6t/
         pHag==
X-Gm-Message-State: AOAM533hAVp+2o+8jFnu4EtqZKH5EEvi6wJq/UY7ugP9sTNvvuOk5izS
	04vWmJJN3owNCfYd2jkulkqjeQ==
X-Google-Smtp-Source: ABdhPJw5ubsboZodLFZq2UVhYvn/vsgdaCvfn+q4p8iQfDXZTcs+a+ziUGQuWFUF5fpmo1NvRbeqfA==
X-Received: by 2002:a4a:d284:: with SMTP id h4mr824706oos.31.1640060519279;
        Mon, 20 Dec 2021 20:21:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a28sm48488oiy.4.2021.12.20.20.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 20:21:58 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vamsi krishna Lanka <quic_vamslank@quicinc.com>,
	Dang Huynh <danct12@riseup.net>,
	David Heidelberg <david@ixit.cz>,
	Stephan Gerhold <stephan@gerhold.net>
Subject: [GIT PULL] Qualcomm DeviceTree updates for v5.17
Date: Mon, 20 Dec 2021 22:21:54 -0600
Message-Id: <20211221042154.3621955-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.17

for you to fetch changes up to ef5ad2608511596b8bd28f1e2b4fa8fadfd2f536:

  ARM: dts: qcom: Drop input-name property (2021-12-15 16:40:52 -0600)

----------------------------------------------------------------
Qualcomm DeviceTree updates for v5.17

To SDX55 this introduces the description of the IPA, PCIe PHY and PCIe
endpoint controller, as well as enables these for the FN960 device.

The SDX65 5G platform is introduced, currently with definitions
necessary to boot to a shell.

The undocumented property "input-name" is dropped throughout the dts
files, dwc3 nodes throughout gains more specific compatibles and lastly
building of the Dragonboard 410c DTB on ARM32 is enabled, in addition to
its normal operation in 64-bit mode.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge tag 'e15509b2b7c9b600ab38c5269d4fac609c077b5b.1638861860.git.quic_vamslank@quicinc.com' into dts-for-5.17

Dang Huynh (1):
      ARM: dts: qcom: Drop input-name property

David Heidelberg (1):
      ARM: dts: qcom: update USB nodes with new platform specific compatible

Manivannan Sadhasivam (6):
      ARM: dts: qcom: sdx55: Add support for PCIe PHY
      ARM: dts: qcom: sdx55-fn980: Enable PCIE0 PHY
      ARM: dts: qcom: sdx55: Add support for PCIe EP
      ARM: dts: qcom: sdx55-fn980: Enable PCIe EP
      ARM: dts: qcom: sdx55-fn980: Enable IPA
      ARM: dts: qcom: sdx55-t55: Enable IPA

Stephan Gerhold (1):
      ARM: dts: qcom: Build apq8016-sbc/DragonBoard 410c DTB on ARM32

Vamsi krishna Lanka (4):
      dt-bindings: clock: Add SDX65 GCC clock bindings
      dt-bindings: arm: qcom: Document SDX65 platform and boards
      ARM: dts: qcom: Add SDX65 platform and MTP board support
      ARM: dts: qcom: sdx65: Add pincontrol node

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |  80 ++++++++
 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/qcom-apq8016-sbc.dts             |   2 +
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |   1 -
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   4 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   4 +-
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts   |   1 -
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |   1 -
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |   1 -
 .../boot/dts/qcom-msm8974-sony-xperia-amami.dts    |   1 -
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |   1 -
 .../boot/dts/qcom-msm8974-sony-xperia-honami.dts   |   1 -
 arch/arm/boot/dts/qcom-sdx55-t55.dts               |   6 +
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   |  59 ++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  80 ++++++++
 arch/arm/boot/dts/qcom-sdx65-mtp.dts               |  25 +++
 arch/arm/boot/dts/qcom-sdx65.dtsi                  | 222 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx65.h         | 122 +++++++++++
 19 files changed, 609 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
 create mode 100644 arch/arm/boot/dts/qcom-apq8016-sbc.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h
