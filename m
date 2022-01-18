Return-Path: <SRS0=keMm=SC=samsung.com=alim.akhtar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E1BC433F5
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69B4BC00446; Tue, 18 Jan 2022 15:00:24 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6951C340E5
	for <soc@kernel.org>; Tue, 18 Jan 2022 15:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6951C340E5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220118150014epoutp0431493c32820c2626c5e0d5c28a1ddb43~LZW6Y8XvH1679416794epoutp04a
	for <soc@kernel.org>; Tue, 18 Jan 2022 15:00:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220118150014epoutp0431493c32820c2626c5e0d5c28a1ddb43~LZW6Y8XvH1679416794epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1642518014;
	bh=Qx3gCAkpMFE3yWJlRYOzvvsdJehEpXNkVuWR2y56IY8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=nuEhssP1F8D6VlDUQc3UJrADitJSNGaQbdIuN8lQHzKlvI+0cdFHuWQu6eFAOHaHW
	 tIN5/eweufFreyZWK4GabyfJLDCIiCNCfV+d5H9V/D7U4hPbj4Z84VaVeFrmrqNOSl
	 3Gc2RL0xFm22GXvEtluMsX6JHrCewr6IGptPu1DE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20220118150014epcas5p4e52e88693eca86d5e4e1f3574e4e7078~LZW6ECQyl2208322083epcas5p4-;
	Tue, 18 Jan 2022 15:00:14 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4JdX4m6PVrz4x9Pw; Tue, 18 Jan
	2022 15:00:08 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BE.F8.06423.8F5D6E16; Wed, 19 Jan 2022 00:00:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20220118150008epcas5p40d1c79616bb17797e79e1769f5e2c19c~LZW0RYB1C2208722087epcas5p4u;
	Tue, 18 Jan 2022 15:00:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220118150008epsmtrp2e04d3b60281e89c675ec1e9a513d85aa~LZW0QRA4k1935719357epsmtrp2y;
	Tue, 18 Jan 2022 15:00:08 +0000 (GMT)
X-AuditID: b6c32a49-b01ff70000001917-e1-61e6d5f80bcc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	89.91.29871.8F5D6E16; Wed, 19 Jan 2022 00:00:08 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
	[107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20220118150005epsmtip16dc6a4bf20208b65004d59959cf5b2fa~LZWyIH7f51211512115epsmtip1i;
	Tue, 18 Jan 2022 15:00:05 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
	catalin.marinas@arm.com, robh+dt@kernel.org,
	krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH v2 00/16] Add support for Tesla Full Self-Driving (FSD) SoC
Date: Tue, 18 Jan 2022 20:18:35 +0530
Message-Id: <20220118144851.69537-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHKsWRmVeSWpSXmKPExsWy7bCmuu6Pq88SDXa+1bN4MG8bm8XfScfY
	Ld4v62G0mH/kHKvFxrc/mCym/FnOZLHp8TVWi48991gtLu+aw2Yx4/w+JotT1z+zWSza+oXd
	onXvEXaLw2/aWS0eX//D5sDvsWbeGkaP378mMXrMauhl89i0qpPN4861PWwem5fUe1w50cTq
	0bdlFaPH501yAZxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkou
	PgG6bpk5QB8oKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OLS/PS9fJS
	S6wMDQyMTIEKE7Izlq14xVQwTariw/ajTA2M7SJdjJwcEgImEmevTmbpYuTiEBLYzSjRvuw9
	E4TziVHixIqFUM43RolL35azwrScbHnPCpHYyyjxfeIKKKeFSeLG/amMIFVsAtoSd6dvYQKx
	RQTcJG40doCNYha4wSRxaNdWIIeDQ1jAW2LedFOQGhYBVYmVpz6wgdi8AjYSt2ZPYILYJi+x
	esMBZgi7k0Piz2ZNCNtF4vHzM1AXCUu8Or6FHcKWkvj8bi8byHgJgWyJnl3GEOEaiaXzjrFA
	2PYSB67MYQEpYRbQlFi/Sx8kzCzAJ9H7+wkTRCevREebEES1qkTzu6tQndISE7u7WSFKPCSu
	XIsEMYUEYiX6vzFNYJSZhTByASPjKkbJ1ILi3PTUYtMCw7zUcnjEJOfnbmIEJ0Qtzx2Mdx98
	0DvEyMTBeIhRgoNZSYRXqv5ZohBvSmJlVWpRfnxRaU5q8SFGU2AQTWSWEk3OB6bkvJJ4QxNL
	AxMzMzMTS2MzQyVx3tPpGxKFBNITS1KzU1MLUotg+pg4OKUamLh2LIv+udDwTKtW2IsL5oVN
	jXrrDiZL19r+q6ht+HQ37HzWefnz09S8v5i+eCu0I2PZOsMv29Ktd1/e/tbzl9WjSe99V736
	FuV+s6mx+9fxWM9Ky8XmKQ8cnCd/Yq1JkFp5QL1dnGG61dIlC46sffx158SJSXkq7dXy4la3
	581O8GJUWqLKbH3m68zyU8WqO6ILZqfubfWPKMqpUruZKTfpX4FMwbuP7rOWzLiYopq0aYr+
	4uiV80xWOe35/OHOHKupM8IO6Fx6JCEwXcP1vYLtzdT8k79c/W2eWVzvUNC5a8dWwL/84b7W
	C63H/f/leOrsXjP3CsMnK6bp2umHnwTF/ZD/G+yvrK22Zvndz2+UWIozEg21mIuKEwFvc72W
	EQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWy7bCSnO6Pq88SDS5t5rZ4MG8bm8XfScfY
	Ld4v62G0mH/kHKvFxrc/mCym/FnOZLHp8TVWi48991gtLu+aw2Yx4/w+JotT1z+zWSza+oXd
	onXvEXaLw2/aWS0eX//D5sDvsWbeGkaP378mMXrMauhl89i0qpPN4861PWwem5fUe1w50cTq
	0bdlFaPH501yAZxRXDYpqTmZZalF+nYJXBnLVrxiKpgmVfFh+1GmBsZ2kS5GTg4JAROJky3v
	WbsYuTiEBHYzSly78ZUNIiEtcX3jBHYIW1hi5b/n7BBFTUwS3zpugRWxCWhL3J2+hQnEFhHw
	kGj7d48ZpIhZ4BmTxKt9c4HGcnAIC3hLzJtuClLDIqAqsfLUB7BeXgEbiVuzJzBBLJCXWL3h
	APMERp4FjAyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCg1dLcwfj9lUf9A4xMnEw
	HmKU4GBWEuGVqn+WKMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgs
	EwenVAMT23J9lUzvw4VT05Z4G/6fHvSimX/CsYXMCwq02OfxCzG8XFXG2NuVbZN9IH1XxUvj
	ubbndmhPnlBw9ZNVjkzm6kSlvMLkNI3JP/qTv7lu3ayd9i/3T9UadtNUuWf800KvKDUtnBt4
	LpVLe8vxI3tcVnC9fRXXWrF/povsFq6Jpls9zv9ctWrXag6uif2uSxslQj1XqlRO2W89TbLP
	5YL1/5Pf9b4ZMJg2/vN5J3fr6CZnRs/GbTx2eeqZ9SkZTZE2Lu+5dq2YleR7lkFmo/FBL7/3
	9t82zFgtviv6iBbbv3CbCa/97hoaTxBonf3w78bLWx8pz2rpyZDdZ/+XPWLnDP877G9fdcmc
	bL4t2N6pxFKckWioxVxUnAgAWxIaSs0CAAA=
X-CMS-MailID: 20220118150008epcas5p40d1c79616bb17797e79e1769f5e2c19c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220118150008epcas5p40d1c79616bb17797e79e1769f5e2c19c
References: <CGME20220118150008epcas5p40d1c79616bb17797e79e1769f5e2c19c@epcas5p4.samsung.com>

Adds basic support for the Tesla Full Self-Driving (FSD)
SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
as well as several IPs.

Patches 1 to 9 provide support for the clock controller
(which is designed similarly to Exynos SoCs).

The remaining changes provide pinmux support, initial device tree support.

- Changes since v1
* fixed make dt_binding_check error as pointed by Rob
* Addressed Krzysztof's and Rob's review comments
* Added Reviewed-by and Acked-by tags
* Reordered the patches
* Dropped SPI, MCT and ADC from this series (to be posted in small sets)

NOTE: These patches are based on next-20220118

Alim Akhtar (16):
  dt-bindings: add vendor prefix for Tesla
  dt-bindings: clock: Add bindings definitions for FSD CMU blocks
  dt-bindings: clock: Document FSD CMU bindings
  clk: samsung: fsd: Add initial clock support
  clk: samsung: fsd: Add cmu_peric block clock information
  clk: samsung: fsd: Add cmu_fsys0 clock information
  clk: samsung: fsd: Add cmu_fsys1 clock information
  clk: samsung: fsd: Add cmu_imem block clock information
  clk: samsung: fsd: Add cmu_mfc block clock information
  clk: samsung: fsd: Add cam_csi block clock information
  dt-bindings: pinctrl: samsung: Add compatible for Tesla FSD SoC
  pinctrl: samsung: add FSD SoC specific data
  dt-bindings: arm: add Tesla FSD ARM SoC
  arm64: dts: fsd: Add initial device tree support
  arm64: dts: fsd: Add initial pinctrl support
  arm64: defconfig: Enable Tesla FSD SoC

 .../devicetree/bindings/arm/tesla.yaml        |   27 +
 .../bindings/clock/tesla,fsd-clock.yaml       |  198 ++
 .../bindings/pinctrl/samsung-pinctrl.txt      |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    8 +
 arch/arm64/Kconfig.platforms                  |    7 +
 arch/arm64/boot/dts/Makefile                  |    1 +
 arch/arm64/boot/dts/tesla/Makefile            |    3 +
 arch/arm64/boot/dts/tesla/fsd-evb.dts         |   39 +
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi    |  335 +++
 arch/arm64/boot/dts/tesla/fsd.dtsi            |  673 ++++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/samsung/Kconfig                   |    7 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-fsd.c                 | 1801 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    1 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |   71 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 include/dt-bindings/clock/fsd-clk.h           |  149 ++
 21 files changed, 3329 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
 create mode 100644 arch/arm64/boot/dts/tesla/Makefile
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-evb.dts
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/tesla/fsd.dtsi
 create mode 100644 drivers/clk/samsung/clk-fsd.c
 create mode 100644 include/dt-bindings/clock/fsd-clk.h


base-commit: 6f59bc242877fcb9c9a5136ea62d383fce5615df
-- 
2.25.1

