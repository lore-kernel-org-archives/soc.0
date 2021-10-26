Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1DFC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 20:14:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BC460EB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 20:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77BC460EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DCUnl0RMlz74x+gq5z4jR/NlKutk9+dxR/Rl046w9DA=; b=kEr95rV7PXhUvF
	uxVED4d1J8txj/f3taipP1/JF/5N4iCLdhj4ObiL8maLz6KTFftOukWrmBIXmTFI2uIf5lCB5m13S
	gwshr8W78zdcNT2hyh0SC1fOz5G8n/1+swfr4KSIXOLMXzVjsPlnoM8fSbEFZo7gqPdjjC20JdFFa
	MZFzNQ2zQ8i6a8e1MiYe3e6cbDMU2FUhnRdRJcdVTfbgRccVKT1jMhCSREOtFvfQ/XZBWgqjPcNKs
	pLSpaOyKmsjOWUMiytIvNNCBgAv2adTzlpO/n2qqCzTgMYMiMSeEI/0+ZgatpCCBtdyGuRcb8oJNZ
	9v0oLb4BpLW0PwhuqJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfSoI-002yyn-Kz; Tue, 26 Oct 2021 20:12:38 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfSoE-002yy5-AJ
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 20:12:36 +0000
Received: by mail-oi1-x22d.google.com with SMTP id z126so236683oiz.12
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U6pfmmfqDzPo/dC0ZUU+Hph5f+zxN3I1Xpz+IDrrVyQ=;
 b=PbOKdpiH6Dz1OzS03y+FsoBsOnJJV3Xj9ghJyq2lsQkfP7guMREwdm9SVp5ZKXmvLo
 xQ3/Xur3nusaAnaJafv8VZ8iUBw+WbK1SPjMJ7LccHJriuKrAF4RT+eL5tdHidk/l1gX
 POT1xJoFPnDF85NNtIWO/EDXb/vhwyedEIFCLNRLTZgVmhHPNGMJwyUFTqv9qlfvc/6c
 RVEbjk0SQvj6Y3wZxJWNSY+QKxQKOInNipDcSwyjy5jTbOJvqjPgh4R87qrLV34GiS3A
 bl8IUuIWjWNfrhoyW6hyU2AQx0q8cZAPdb2VlucHXTOQOvbcKRP6U1y46kvGIn3+yKLZ
 j1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U6pfmmfqDzPo/dC0ZUU+Hph5f+zxN3I1Xpz+IDrrVyQ=;
 b=KKLUQtjABsRIUKQHwYg7RCFpqfO73HtpeKG2zpNvfdEI4mBDLta2Q58RIpwWOeCoYr
 tcp046uztx4C3Dmv6jQARQyr5s7q8ljdu/t5+k+QIJA02JRYBjcVJpFAHp8ErCFdmX6b
 UtOgIsQWqy++oB+nd9Wa/dU52At7aSxFBarCPZP2qWOCWn33FcIEKPQ4njmwKvHSLle8
 jw1rpilLJZgkvJJFZb5hGkeAln9fteUNx3lXWKzr41dWjhLnKhhBP35KDzj969JA02cJ
 6/pn7HYPJinZEGazvSdlbrOHt8Kk6wdxsOeITdTC5bw6DfNFDpKQimlxc5P7zninfegR
 N/2Q==
X-Gm-Message-State: AOAM532brILVNokXZfw/J3Jy/kSrnZEy0xZ1ykc7ycsTZDmF2/r2u4b9
 rAvQ/7Q+HO96zaz50AP8K7uJ+g==
X-Google-Smtp-Source: ABdhPJxrDc3oMzL1Qm7H5hrxLhxCoV+5GY0PHTYduxOACldOmxSZFuVT6FmMYRsUnoPtTeeNAF+T/A==
X-Received: by 2002:aca:4307:: with SMTP id q7mr657424oia.3.1635279149159;
 Tue, 26 Oct 2021 13:12:29 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id e28sm5098870oiy.10.2021.10.26.13.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 13:12:28 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Stephan Gerhold <stephan@gerhold.net>, Shawn Guo <shawn.guo@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 "J . R . Divya Antony" <d.antony.jr@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Amit Pundir <amit.pundir@linaro.org>, Maulik Shah <mkshah@codeaurora.org>,
 Philip Chen <philipchen@chromium.org>,
 Prasad Malisetty <pmaliset@codeaurora.org>,
 Rajesh Patil <rajpat@codeaurora.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Caleb Connolly <caleb@connolly.tech>, Chukun Pan <amadeus@jmu.edu.cn>,
 David Heidelberg <david@ixit.cz>, Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Kaehlcke <mka@chromium.org>, Ola Jeppsson <ola@snap.com>,
 Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
 Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS additional patches for v5.16
Date: Tue, 26 Oct 2021 15:12:27 -0500
Message-ID: <20211026201227.1226633-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_131234_396346_38DB9EF9 
X-CRM114-Status: GOOD (  17.50  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211026201227.ZLSlswxE05T_Dd4TUoG5RSBNOpI3OPf_FDXE7cxWKzk@z>

The following changes since commit c22441a7cbd014e2546329af89363b2a43cc8bf2:

  arm64: dts: qcom: sdm630-nile: Correct regulator label name (2021-09-28 10:36:30 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.16-2

for you to fetch changes up to b34a82f06f7eaab799b902841e0558b4e70d9b0d:

  Revert "arm64: dts: qcom: msm8916-asus-z00l: Add sensors" (2021-10-24 17:31:14 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS additional patches for v5.16

The RPM and RPMh sleep stats are introduced on a number of platforms, to
aid the enablement of entering low power mode.

The MSM8916 support receives some polishing touches, followed by
introduction of the necessary pieces to use the DeviceTree on 32-bit
variants of the MSM8916 platform, in particular to boot the secondary
CPUs. Based on this support for the Samsung Galaxy S4 Mini Value Edition
is introduced.

The Asus Zenfone 2 Laser gained touchscreen, sensors and sdcard support.

MSM8996 got support for the its crypto hardware and the Xiaomi Mi 5
gained a description of its LCD panel.

The Trogdor device on SC7180 gained support for a second source eDP
brigde, while SC7280 gains PCIe support and the newly introduced
Herobrine device.

Both MSM8916 and SDM845 has their standalong SMEM node dropped, in favour
of the newly introduced support for specifying the compatible directly
on the reserved-memory node.

The SM7225 platform is introduced, as a derrivative of SM6350, initial
support for the PM6350 PMIC and based on this the Fairphone 4 is
introduced.

The RB3 and RB5 devices gains msm-id and board-id, to allow the two DTBs
to be baked into a single boot.img that can be booted on both devices.

As the GDSC driver has been extended to properly describe the
relationship between MMCX and MDSS_GDSC, the now deprecated mmcx
regulator is removed from SM8250.

SM8350 gained CPU topology, idle-states and fastrpc support. FastRPC was
also added for SM8150 and the SA8155p ADP got a couple of remoteprocs
enabled.

Additionally a number of DT validation issues was corrected across the
various platforms and devices.

----------------------------------------------------------------
Amit Pundir (2):
      arm64: dts: qcom: sdm845-db845c: Add msm-id and board-id
      arm64: dts: qcom: qrb5165-rb5: Add msm-id and board-id

AngeloGioacchino Del Regno (1):
      arm64: dts: qcom: sdm630: Add disabled Venus support

Arnaud Ferraris (1):
      arm64: dts: qcom: add 'chassis-type' property

Bhupesh Sharma (4):
      arm64: dts: qcom: sm8150: Add fastrpc nodes
      arm64: dts: qcom: sa8155p-adp: Enable remoteproc capabilities
      arm64: dts: qcom: ipq6018: Remove unused 'qcom,config-pipe-trust-reg' property
      arm64: dts: qcom: ipq6018: Remove unused 'iface_clk' property from dma-controller node

Bjorn Andersson (3):
      arm64: dts: qcom: sdm845: Drop standalone smem node
      arm64: dts: qcom: sm8350: Add CPU topology and idle-states
      Revert "arm64: dts: qcom: msm8916-asus-z00l: Add sensors"

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: enable second wifi channel

Chukun Pan (1):
      arm64: dts: qcom: ipq8074: Add QUP5 I2C node

David Heidelberg (1):
      arm64: dts: qcom: sdm845-oneplus: remove devinfo-size from ramoops node

Dmitry Baryshkov (6):
      arm64: dts: qcom: sm8250: remove mmcx regulator
      arm64: dts: qcom: pm8916: fix mpps device tree node
      arm64: dts: qcom: pm8994: fix mpps device tree node
      arm64: dts: qcom: apq8016-sbc: fix mpps state names
      arm64: dts: qcom: pm8916: add interrupt controller properties
      arm64: dts: qcom: pm8994: add interrupt controller properties

Douglas Anderson (1):
      arm64: dts: qcom: pmk8350: Make RTC disabled by default; enable on sc7280-idp

J.R. Divya Antony (4):
      arm64: dts: qcom: msm8916-asus-z00l: Add sensors
      arm64: dts: qcom: msm8916-asus-z00l: Add touchscreen
      arm64: dts: qcom: msm8916-asus-z00l: Add SDCard
      arm64: dts: qcom: msm8916-asus-z00l: Add sensors

Konrad Dybcio (5):
      arm64: dts: qcom: sdm845: Add XO clock to SDHCI
      arm64: dts: qcom: sdm845: Disable Adreno, modem and Venus by default
      arm64: dts: qcom: sdm845: Don't disable MDP explicitly
      arm64: dts: qcom: sdm845: Add size/address-cells to dsi[01]
      arm64: dts: qcom: sdm845: Move gpio.h inclusion to SoC DTSI

Krzysztof Kozlowski (1):
      arm64: dts: qcom: msm8996: move clock-frequency from PN547 NFC to I2C bus

Luca Weiss (6):
      arm64: dts: qcom: Add PM6350 PMIC
      arm64: dts: qcom: sm6350: add debug uart
      dt-bindings: arm: cpus: Add Kryo 570 CPUs
      dt-bindings: arm: qcom: Document sm7225 and fairphone,fp4 board
      arm64: dts: qcom: Add SM7225 device tree
      arm64: dts: qcom: sm7225: Add device tree for Fairphone 4

Marijn Suijten (4):
      arm64: dts: qcom: pmi8994: Fix "eternal"->"external" typo in WLED node
      arm64: dts: qcom: pmi8994: Remove hardcoded linear WLED enabled-strings
      arm64: dts: qcom: Move WLED num-strings from pmi8994 to sony-xperia-tone
      arm64: dts: qcom: pm660l: Remove board-specific WLED configuration

Matthias Kaehlcke (1):
      arm64: dts: qcom: sc7280: Add Herobrine

Maulik Shah (2):
      arm64: dts: qcom: Enable RPMh Sleep stats
      arm64: dts: qcom: Enable RPM Sleep stats

Ola Jeppsson (1):
      arm64: dts: qcom: sm8350: Add fastrpc nodes

Philip Chen (2):
      arm64: dts: sc7180: Factor out ti-sn65dsi86 support
      arm64: dts: sc7180: Support Parade ps8640 edp bridge

Prasad Malisetty (2):
      arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
      arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board

Raffaele Tranquillini (1):
      arm64: dts: qcom: msm8996: xiaomi-gemini: Enable JDI LCD panel

Rajesh Patil (2):
      arm64: dts: qcom: sc7180: Add qspi compatible
      arm64: dts: qcom: sc7280: Add 200MHz in qspi_opp_table

Rob Herring (1):
      arm64: dts: qcom: Fix 'interrupt-map' parent address cells

Shawn Guo (7):
      arm64: dts: qcom: msm8996: Move '#clock-cells' to QMP PHY child node
      arm64: dts: qcom: Correct QMP PHY child node name
      arm64: dts: qcom: Drop max-microamp and vddp-ref-clk properties from QMP PHY
      arm64: dts: qcom: Drop reg-names from QMP PHY nodes
      arm64: dts: qcom: msm8998-clamshell: Add missing vdda supplies
      arm64: dts: qcom: Fix IPQ8074 PCIe PHY nodes
      arm64: dts: qcom: ipq8074-hk01: Add dummy supply for QMP USB3 PHY

Stephan Gerhold (15):
      arm64: dts: qcom: apq8016-sbc: Clarify firmware-names
      arm64: dts: qcom: msm8916: Drop underscore in node name
      arm64: dts: qcom: Add device tree for Samsung Galaxy S4 Mini Value Edition
      arm64: dts: qcom: msm8916-samsung-serranove: Add touch screen
      arm64: dts: qcom: msm8916-samsung-serranove: Add touch key
      arm64: dts: qcom: msm8916-samsung-serranove: Add IMU
      arm64: dts: qcom: msm8916-samsung-serranove: Add rt5033 battery
      arm64: dts: qcom: msm8916-samsung-serranove: Add NFC
      ARM: qcom: Add ARCH_MSM8916 for MSM8916 on ARM32
      arm64: dts: qcom: msm8916: Add CPU ACC and SAW/SPM
      ARM: dts: qcom: msm8916: Add include for SMP without PSCI on ARM32
      ARM: dts: qcom: msm8916-samsung-serranove: Include dts from arm64
      arm64: dts: qcom: Fix node name of rpm-msg-ram device nodes
      arm64: dts: qcom: msm8916: Drop standalone smem node
      arm64: dts: qcom: Drop unneeded extra device-specific includes

Vladimir Zapolskiy (2):
      arm64: dts: qcom: msm8996: Add device tree entries to support crypto engine
      arm64: dts: qcom: sdm845: Fix Qualcomm crypto engine bus clock

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 arch/arm/boot/dts/Makefile                         |    1 +
 .../boot/dts/qcom-msm8916-samsung-serranove.dts    |    3 +
 arch/arm/boot/dts/qcom-msm8916-smp.dtsi            |   62 +
 arch/arm/mach-qcom/Kconfig                         |   10 +
 arch/arm64/boot/dts/qcom/Makefile                  |    3 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |  832 +++++++++++-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |  838 ------------
 .../apq8094-sony-xperia-kitakami-karin_windy.dts   |    1 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 1070 ++++++++++++++-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 1076 ---------------
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |    3 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |    6 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   69 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |    1 +
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |  126 ++
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |    1 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |    1 +
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |    1 +
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |   15 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi          |   21 -
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |    1 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |    1 +
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |  534 ++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |    1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   73 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |    2 +
 .../qcom/msm8992-msft-lumia-octagon-talkman.dts    |    1 +
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |    2 +
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |    1 +
 .../qcom/msm8994-msft-lumia-octagon-cityman.dts    |    1 +
 .../dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts  |    1 +
 .../qcom/msm8994-sony-xperia-kitakami-karin.dts    |    1 +
 .../qcom/msm8994-sony-xperia-kitakami-satsuki.dts  |    1 +
 .../qcom/msm8994-sony-xperia-kitakami-sumire.dts   |    1 +
 .../qcom/msm8994-sony-xperia-kitakami-suzuran.dts  |    1 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts           |   24 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi          |   30 -
 .../dts/qcom/msm8996-sony-xperia-tone-dora.dts     |    1 +
 .../dts/qcom/msm8996-sony-xperia-tone-kagura.dts   |    1 +
 .../dts/qcom/msm8996-sony-xperia-tone-keyaki.dts   |    1 +
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |    1 +
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |    2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |   34 +
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |    1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   43 +-
 .../boot/dts/qcom/msm8998-asus-novago-tp370ql.dts  |    1 +
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |    2 +
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |    1 +
 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts    |    1 +
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    1 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |    4 -
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |    1 +
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |    4 -
 .../boot/dts/qcom/msm8998-oneplus-dumpling.dts     |    1 +
 .../dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts |    1 +
 .../dts/qcom/msm8998-sony-xperia-yoshino-maple.dts |    1 +
 .../qcom/msm8998-sony-xperia-yoshino-poplar.dts    |    1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   23 +-
 arch/arm64/boot/dts/qcom/pm6350.dtsi               |   54 +
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |    7 -
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |    9 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |    5 +-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |    1 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    7 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    4 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   12 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    1 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    1 +
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi     |  109 ++
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    1 +
 .../boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |   90 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   86 --
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    9 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts      |   14 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     | 1412 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   12 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   50 +
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |    8 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  130 +-
 .../dts/qcom/sdm630-sony-xperia-ganges-kirin.dts   |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-discovery.dts |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-pioneer.dts   |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-voyager.dts   |    1 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   58 +-
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |    1 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   17 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   16 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   18 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   26 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |    1 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    1 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |   19 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   61 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   16 +-
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |    1 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    7 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |    1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   31 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  320 +++++
 arch/arm64/boot/dts/qcom/sm7225.dtsi               |   16 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    2 -
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    3 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    2 -
 .../dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts |    1 +
 .../dts/qcom/sm8150-sony-xperia-kumano-griffin.dts |    1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  133 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    2 -
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    2 -
 .../dts/qcom/sm8250-sony-xperia-edo-pdx203.dts     |    1 +
 .../dts/qcom/sm8250-sony-xperia-edo-pdx206.dts     |    1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   30 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    2 -
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  272 +++-
 121 files changed, 5812 insertions(+), 2256 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-smp.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm6350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
