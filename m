Return-Path: <SRS0=7SpG=5T=postmarketos.org=newbyte@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECC8C25B4E
	for <soc@archiver.kernel.org>; Sun, 22 Jan 2023 14:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1D4AC433A0; Sun, 22 Jan 2023 14:50:15 +0000 (UTC)
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
	by smtp.kernel.org (Postfix) with ESMTP id 3581FC433D2;
	Sun, 22 Jan 2023 14:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3581FC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=postmarketos.org
Received: from shock.lan (2-248-191-197-no36.tbcn.telia.com [2.248.191.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 961631403EE;
	Sun, 22 Jan 2023 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=donut; t=1674399005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XZ48KyrdXx/omQ0ya+/qEXDSGlTqVrVn5v4sm9m+VDE=;
	b=YMUDAjSq9lNKIHKRCp38o4iW7ZD9oaW8d/ywbmwy0Zmb9YwZioO1yKzizsvDSqoZa97p5W
	CkVIwPVFQTp1mzIa0w37bG1no75yGPgwWNweQbK2T3J0XwmHqAOdSP8gE+o++KViCbmFkZ
	G3tIfCHz07HjR8aM1LBaPWIA5QBUNb4=
From: Stefan Hansson <newbyte@postmarketos.org>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	matti.lehtimaki@gmail.com,
	Stefan Hansson <newbyte@postmarketos.org>
Subject: [PATCH 0/3] Add samsung-matisselte and common matisse dtsi
Date: Sun, 22 Jan 2023 15:47:47 +0100
Message-Id: <20230122144749.87597-1-newbyte@postmarketos.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a common samsung-matisse dtsi and reworks
samsung-matisse-wifi to use it, and introduces samsung-matisselte. I
choose matisselte over matisse-lte as this is how most other devices
(klte, s3ve3g) do it and it is the codename that Samsung gave the
device. See individual commits for more information.

Stefan Hansson (3):
  ARM: dts: qcom: samsung-matisse-common: Add initial common device tree
  dt-bindings: arm: qcom: Add MSM8926 and Samsung Galaxy Tab 4 10.1 LTE
  ARM: dts: qcom: Add support for Samsung Galaxy Tab 4 10.1 LTE
    (SM-T535)

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/qcom-apq8026-samsung-matisse-wifi.dts | 511 +-----------------
 .../qcom-msm8226-samsung-matisse-common.dtsi  | 510 +++++++++++++++++
 .../dts/qcom-msm8926-samsung-matisselte.dts   |  39 ++
 5 files changed, 568 insertions(+), 499 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8226-samsung-matisse-common.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts

-- 
2.39.0

