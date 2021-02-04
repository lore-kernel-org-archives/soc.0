Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601F7C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:21:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D4C64F47
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D4C64F47
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=deqGgn284W8ipMZWvfZx0hqwhJ0JPBEDzKaKN6XM5j8=; b=uBAJKpZK5LtFsSyVIh0IRAtdem
	0czFis34D9sr7BVNzDiqgiDfcvu8JX+ZEjctmCxZ2pwZhz/dLza/qq2Lz4B0tpp/fH2yHmlMq1+9C
	UrtI/G64IOdKsMF/W9XYb276OiDvBAhstZ/XxqmvUQuMBINTUQOiOn+9e1Y3JKuQhXBU4WaXuIjK9
	iWLbqprdIZucPbpcn0V5kcdk4SLHFK0Rph4xe7ujA2fNzDR64g5MYZYgLWy9Xwe+X8u0WCQiPdosy
	i38JkR4vDBsqQj52fixdfFOQUUoWtsQwE20gM31BpY0O20boyEyJCsXdqsjW+dI2UgURiWNcKVdJh
	LkDUlubg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7X4U-0004kq-OF; Thu, 04 Feb 2021 05:20:50 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7X4R-0004kO-BO
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 05:20:48 +0000
Received: by mail-ot1-x32b.google.com with SMTP id k25so166626otb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 21:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/8uJA5jNje7Thb0EiPxe74F6CPnpjaarskIjDAF+zA=;
 b=EpghJJOrdd5WOM2/0L31KWvrk6sCoBCAvL//Df/huovhnk8PuwRRl0kmpuMc3uVzhv
 y7pPBtdzLnWd86ntUouroL2XO6gYb1+GbKrVmuHQsCqfHme+e1N/PJPTL7hSrBNo9tDn
 wRP6dHLHSOiSBpPh03m85843sd4sFJ4FcTAd+sVlDSJkcsyOrOd5YNMpipYqMPcKn+Rg
 mgXnhDObgOCPjgF34BJp1AwViwgw07DYFcJy6XM9Ip9IEVHkRXtW+Pqi/76mSWt2dUPB
 DLXsIacsaUByy4NPFvCUfIQff6qLRDcCH6yblInpIoa5OK0czId1LyxD4ETwn0alWQcc
 oeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/8uJA5jNje7Thb0EiPxe74F6CPnpjaarskIjDAF+zA=;
 b=qpT1WcGiuDn/Xjn9zIxJ5o4kDx+RwJTrusgtupX+a9W93dqSTEIhNLj1f2vk+JnTL8
 gVUNBAt24MV23sVCoWe/kWSdDLzmacKKFtwLOXtBVmrGO2jrVcpOma1r4NbVFFFiEFbh
 lJzwxGZR1JvCWNx8ZRxCWM+Gk4gEXYBEQZX95wDizpRzr1D8wXYqNtgweLmldE/Iv37A
 8ZTVI6qjHsenK5u/oR1qwomQv4fESWaD7YHqSwCcSq6NzI/pYEdQTZIm0ZftnkFfW5y4
 oU9jOJ40HU6vHWaRCHOD2Z8RWJmD8qfmHDzHmbwhG5hu5PS8yJTQQzmbZp7VdRO9Upxx
 pgfA==
X-Gm-Message-State: AOAM530SIDbfeEUGhGdWX3sNb9aMhP4XOCMZ/lzCFpt8jjsEUaHaPSwH
 W7zps/2hzwY6U0tmjEtlAFwYNw==
X-Google-Smtp-Source: ABdhPJwVI+XpW2363KZ3Fo659qv8EuiOcn3k8u+25f2cWQSrDm+unFsE2zTDhuX25M/dbbets/Q9Kw==
X-Received: by 2002:a9d:4e8d:: with SMTP id v13mr4755102otk.12.1612416045280; 
 Wed, 03 Feb 2021 21:20:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id a13sm932447otr.49.2021.02.03.21.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 21:20:44 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm ARM64 DT updates for 5.12
Date: Wed,  3 Feb 2021 23:20:43 -0600
Message-ID: <20210204052043.388621-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_002047_416242_F8A68876 
X-CRM114-Status: GOOD (  16.85  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Eric Biggers <ebiggers@google.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Steev Klimaszewski <steev@kali.org>,
 Caleb Connolly <caleb@connolly.tech>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Danny Lin <danny@kdrag0n.dev>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 Gustave Monce <gustave.monce@outlook.com>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 "J . R . Divya Antony" <d.antony.jr@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Olof Johansson <olof@lixom.net>,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204052043.V3CgS0SE8p8e-fLt8AqRwRsRXq23zXAioDtCLsIsvO8@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.12

for you to fetch changes up to 7790114893c537176ebab62d002a261b5f01f7a9:

  arm64: dts: qcom: msm8998: Use rpmpd definitions for opp table levels (2021-02-02 16:56:29 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DT updates for 5.12

This introduces initial support for the new SM8350 platform, aka
Snapdragon 888, and the MTP device for this.

It adds PCIe, audio, display, GPU, HDMI watchdog, LLCC and PMIC ADC
support to the SM8250 platform and RB5 in particular, as well as improve
the definition of CPUs, thermal zones and fixes a few smaller issues.

It introduces new Devicetree files for the Alcatel Idol 3, ASUS Zenfone
2 Laser and BQ Aquaris X5, based on the MSM8916 platform.

It contains an overhaul of the existing MSM8992 and MSM8994 platform
files and introduces RPM power domains and SMP2P nodes. It adds
touchscreen, additional regulators, microSD card support and adds the
Sony Mobile Ivy, Karin, Suzuran and Satsuki devices. It joins the common
parts of the Lumia 950 and 950XL and extend these with support for
sensors, NFC, bluetooth, audio, microSD and Type-C mux pins.

It introduces support for the OnePlus6 and 6t, adds the missing higher
frequences for the SDM850 laptops, adds CPU cluster idle support on
SM8150  and a few tweaks to the SC7180 platform.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: dts: qcom: sc7180: Add support for gpu fuse

AngeloGioacchino Del Regno (2):
      arm64: dts: pmi8998: Add the right interrupts for LAB/IBB SCP and OCP
      arm64: dts: qcom: msm8998: Use rpmpd definitions for opp table levels

Caleb Connolly (1):
      arm64: dts: sdm845: add oneplus6/6t devices

Danny Lin (6):
      arm64: dts: qcom: sm8150: Define CPU topology
      arm64: dts: qcom: sm8150: Add PSCI idle states
      arm64: dts: qcom: sm8150: Add CPU capacities and energy model
      arm64: dts: qcom: sm8150: Add support for deep CPU cluster idle
      arm64: dts: qcom: sm8250: Define CPU topology
      arm64: dts: qcom: sm8250: Add CPU capacities and energy model

Dmitry Baryshkov (17):
      arm64: dts: sm8250-mtp: enable USB host nodes
      arm64: dts: qcom: sm8250.dtsi: add display system nodes
      arm64: dts: qrb5165-rb5: add mdss/mdp/dsi nodes
      arm64: dts: qcom: qrb5165-rb5: add gpu/zap-shader node
      arm64: dts: qcom: sm8250-mtp: add gpu/zap-shader node
      arm64: dts: qcom: qrb5165-rb5: correct vdc_3v3 regulator
      arm64: dts: qcom: qrb5165-rb5: add lt9611 HDMI bridge
      arm64: dts: qcom: sm8250: power up dispcc on sm8250 by MMCX regulator
      arm64: dts: qcom: sm8250: rename smem device node to follow schema
      arm64: dts: qcom: qrb5165-rb5: enable cdsp device
      arm64: dts: qcom: qrb5165-rb5: add HDMI audio playback
      arm64: dts: qcom: sm8250: correct sdhc_2 xo clk
      arm64: dts: qcom: qrb5165-rb5: fix uSD pins drive strength
      arm64: dts: qcom: qrb5165-rb5: sort nodes alphabetically
      arm64: dts: qcom: pm8150x: add definitions for adc-tm5 part
      arm64: dts: sm8250-mtp: add thermal zones using pmic's adc-tm5
      arm64: dts: qrb5165-rb5: port thermal zone definitions

Douglas Anderson (3):
      arm64: dts: qcom: Fix SD card vqmmc max voltage on sc7180-trogdor
      arm64: dts: qcom: sc7180: Add "dp_hot_plug_det" pinconf for trogdor
      arm64: dts: qcom: Clean up sc7180-trogdor voltage rails

Eric Biggers (1):
      arm64: dts: qcom: sdm630: add ICE registers and clocks

Gustave Monce (14):
      arm64: dts: qcom: msm8994: Fix remaining BLSP errors/mistakes
      arm64: dts: qcom: msm8992/4-lumia*: Create a common DTS
      arm64: dts: qcom: msm8994-octagon: Fix up the memory map
      arm64: dts: qcom: msm8994-octagon: Add gpio-keys and Hall sensor
      arm64: dts: qcom: msm8994-octagon: Configure regulators
      arm64: dts: qcom: msm8994-octagon: Add QCA6174 bluetooth
      arm64: dts: qcom: msm8994-octagon: Configure HD3SS460 Type-C mux pins
      arm64: dts: qcom: msm8994-octagon: Add uSD card and disable HS400 on eMMC
      arm64: dts: qcom: msm8994-octagon: Configure Lattice iCE40 FPGA
      arm64: dts: qcom: msm8994-octagon: Configure PON keys
      arm64: dts: qcom: msm8994-octagon: Add NXP NFC node
      arm64: dts: qcom: msm8994-octagon: Add sensors on blsp1_i2c5
      arm64: dts: qcom: msm8994-octagon: Add TAS2553 codec
      arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors

J.R. Divya Antony (1):
      arm64: dts: qcom: Add device tree for ASUS Zenfone 2 Laser

Jonathan Albrieux (3):
      arm64: dts: qcom: Add device tree for BQ Aquaris X5 (Longcheer L8910)
      arm64: dts: qcom: msm8916: Add blsp_i2c3
      arm64: dts: qcom: msm8916-longcheer-l8910: Add imu/magnetometer

Konrad Dybcio (22):
      arm64: dts: qcom: msm8992/4: Add RPM Power Domains
      arm64: dts: qcom: Add support for remaining Sony Kitakami boards
      arm64: dts: qcom: msm8992-bullhead: Update regulator config
      arm64: dts: qcom: msm8992-libra: Update regulator config
      arm64: dts: qcom: msm8992/4: Rename vreg_vph_pwr to vph_pwr
      arm64: dts: qcom: msm/apq8994-kitakami: Add regulator config
      arm64: dts: qcom: msm8994-kitakami: Add Synaptics RMI touchscreen
      arm64: dts: qcom: msm8994-kitakami: Add uSD card support
      arm64: dts: qcom: msm8994-kitakami: Add VDD_GFX regulator
      arm64: dts: qcom: msm8994: Fix BLSP2_UART2 node
      arm64: dts: qcom: msm8994/8994-kitakami: Fix up the memory map
      arm64: dts: qcom: msm8994-kitakami: Add missing email in the copyright
      arm64: dts: qcom: msm8994: Add SMP2P nodes
      arm64: dts: qcom: msm8994: Sort hwlock properly
      arm64: dts: qcom: msm8992: Make the DT an overlay on top of 8994
      arm64: dts: qcom: msm8994-octagon: Add FM Radio and DDR regulator nodes
      arm64: dts: qcom: msm8998: Merge in msm8998-pins.dtsi to msm8998.dtsi
      arm64: dts: qcom: msm8998: Add DMA to I2C hosts
      arm64: dts: qcom: msm8998: Add I2C pinctrl and fix BLSP2_I2C naming
      arm64: dts: qcom: msm8998: Add capacity-dmips-mhz to CPU cores
      arm64: dts: qcom: msm8998: Disable some components by default
      arm64: dts: qcom: msm8996: Add missing device_type under pcie[01]

Manivannan Sadhasivam (4):
      arm64: dts: qcom: sm8250: Add support for LLCC block
      arm64: dts: qcom: Add missing "-thermal" suffix for thermal zones
      arm64: dts: qcom: sm8250: Add PCIe support
      arm64: dts: qcom: rb5: Enable PCIe ports and PHY

Matthias Kaehlcke (1):
      arm64: dts: qcom: sc7180: Add labels for cpuN-thermal nodes

Robert Foss (1):
      arm64: dts: qcom: sdm845-db845c: Fix reset-pin of ov8856 node

Sai Prakash Ranjan (4):
      arm64: dts: qcom: sc7180: Add watchdog bark interrupt
      arm64: dts: qcom: sdm845: Add watchdog bark interrupt
      arm64: dts: qcom: sm8150: Add watchdog bark interrupt
      arm64: dts: qcom: sm8250: Add watchdog bark interrupt

Srinivas Kandagatla (6):
      arm64: dts: qcom: sm8250: add apr and its services
      arm64: dts: qcom: sm8250: add audio clock controllers
      arm64: dts: qcom: sm8250: add lpass lpi pin controller node
      arm64: dts: qcom: sm8250: add wsa and va codec macros
      arm64: dts: qcom: sm8250: add mi2s pinconfs
      arm64: dts: qcom: qrb5165-rb5: Add Audio support

Steev Klimaszewski (1):
      arm64: dts: sdm850: Add OPP tables for 2.84 and 2.96GHz

Stephan Gerhold (2):
      arm64: dts: qcom: msm8916-samsung-a5u: Fix iris compatible
      arm64: dts: qcom: msm8916-samsung-a2015: Fix sensors

Stephen Boyd (1):
      arm64: dts: qcom: sc7180: Drop pinconf on dp_hot_plug_det

Vincent Knecht (4):
      dt-bindings: vendor-prefixes: add Alcatel
      arm64: dts: qcom: Add device tree for Alcatel Idol 3 (4.7")
      arm64: dts: qcom: Disable MDSS by default for 8916/8016 devices
      arm64: dts: msm8916: Fix reserved and rfsa nodes unit address

Vinod Koul (5):
      dt-bindings: arm: qcom: Document SM8350 SoC and boards
      dt-bindings: arm: cpus: Add kryo685 compatible
      dt-bindings: firmware: scm: Add SM8250 and SM8350 compatible
      arm64: dts: qcom: Add basic devicetree support for SM8350 SoC
      arm64: dts: qcom: Add basic devicetree support for SM8350-MTP board

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |  15 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |   4 +
 .../apq8094-sony-xperia-kitakami-karin_windy.dts   |  23 +
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      | 291 +++++++
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     | 195 +++++
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      | 267 ++++++
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi         |  16 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  10 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  20 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |  41 +-
 .../qcom/msm8992-msft-lumia-octagon-talkman.dts    |  15 +
 .../boot/dts/qcom/msm8992-msft-lumia-talkman.dts   |  67 --
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |  92 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              | 743 +---------------
 .../boot/dts/qcom/msm8994-msft-lumia-cityman.dts   |  73 --
 .../qcom/msm8994-msft-lumia-octagon-cityman.dts    |  15 +
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 909 ++++++++++++++++++++
 .../dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts  |  26 +
 .../qcom/msm8994-sony-xperia-kitakami-karin.dts    |  45 +
 .../qcom/msm8994-sony-xperia-kitakami-satsuki.dts  |  18 +
 .../qcom/msm8994-sony-xperia-kitakami-sumire.dts   |   4 +-
 .../qcom/msm8994-sony-xperia-kitakami-suzuran.dts  |  20 +
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     | 457 +++++++---
 arch/arm64/boot/dts/qcom/msm8994.dtsi              | 321 +++++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   4 +
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |  16 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |  10 +
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi         | 108 ---
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 393 ++++++++-
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |  12 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |  12 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |  12 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   8 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           | 563 +++++++++++-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  91 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  49 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  12 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   4 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 623 ++++++++++++++
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |  19 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |  23 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   1 +
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   2 +-
 arch/arm64/boot/dts/qcom/sdm850.dtsi               |  21 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 158 ++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            | 269 ++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 940 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            | 250 ++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 499 +++++++++++
 57 files changed, 6479 insertions(+), 1328 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
