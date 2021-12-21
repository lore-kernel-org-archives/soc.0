Return-Path: <SRS0=b6vg=RG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D31C433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 05:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF00FC36AEB; Tue, 21 Dec 2021 05:12:10 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24E2DC36AE2
	for <soc@kernel.org>; Tue, 21 Dec 2021 05:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24E2DC36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f170.google.com with SMTP id q25so19310788oiw.0
        for <soc@kernel.org>; Mon, 20 Dec 2021 21:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZDzTStLoIHvlX5hygl4lmOy/VhHL2isPfBbV0Yjj4Is=;
        b=F/x/59dGbLvOvNHq2gLpXQbmnNy8UlEK1EDEfvikNkzY31yGRu++RfbYPQ8w4CrM3A
         Pqsp22GdDnOBwaqgIUdIJZnqqsnvxJ0dtUtHC3H5TbA4N7cTBCDRU2/cCunTuzPLYP/I
         bd+3sY6ZutVDaR3EMaTr4+Ysd+0NY0wVIb9Asl5ITm+JHjWfRudkK6jqN+yywnOxJOJl
         cU/A1WL+FVtlN5EFP9sgjC7wYh0wDkjBfiv00bTGgy1YqC0ltBSHb7UfyddAkeSajrIM
         VcAv/4G7RCA2i7Koe7dQWNwGt7NmsP/8hwLQPJ4N3Kkqmln5gsTexkoA5EG/zMMC58BK
         93dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZDzTStLoIHvlX5hygl4lmOy/VhHL2isPfBbV0Yjj4Is=;
        b=AWYqFG5zgr2+5iSxxNirq+3ZB1qaAs9Tf3mEofO2x0nk9Swj+PNrRKMdVFjN8BKrkf
         JrLLU1jEyGMgVvOSivBjZ+rwfXwdNlD+38QO1WDb2PaZmGoBVUrAV+moQlBzq2jc6QEq
         ZgmD7uV9OBUSvJo/9wb93BgQIRAY1vAgSWNLP6iV7LxiO3Jm4cYxPK6zjlCB1/Dxa5ZX
         IbP088IJsK0iwI6YG1lanpf8trxeDPS/aRV3+ZMNkF62rMD4rS9yvCHVVQ4S1FlSD4JD
         HLDZl1z4BjeLMM9Sp8VGSPJsh2vCQafW1Z2i+Yjc0v5Ze79aSC/7b40H3RKHcjvx7BLZ
         fBXA==
X-Gm-Message-State: AOAM532f2c3cF7tsKG/b2A1Esw2ghrTYKxWocpGqYgXnEHMDtRyVZyrx
	AXQaho/wlzG8zzZcWRmkrpqNRw==
X-Google-Smtp-Source: ABdhPJxvazy2JmQULIP5+PzkVbZyJCL5quLB4oYxWrUrVC19MfByHG2TWUgsNULVAEBKfxX3BxlnQQ==
X-Received: by 2002:a05:6808:301e:: with SMTP id ay30mr1286008oib.36.1640063528055;
        Mon, 20 Dec 2021 21:12:08 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bb7sm3611870oob.14.2021.12.20.21.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 21:12:07 -0800 (PST)
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
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Vinod Koul <vkoul@kernel.org>,
	Dang Huynh <danct12@riseup.net>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Philip Chen <philipchen@chromium.org>,
	David Heidelberg <david@ixit.cz>,
	Prasad Malisetty <pmaliset@codeaurora.org>,
	Kate Doeen <jld3103yt@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Alexey Min <alexey.min@gmail.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Dikshita Agarwal <dikshita@codeaurora.org>,
	Julian Ribbeck <julian.ribbeck@gmx.de>,
	Katherine Perez <kaperez@linux.microsoft.com>,
	Kshitiz Godara <kgodara1@codeaurora.org>,
	Kshitiz Godara <kgodara@codeaurora.org>,
	Robert Marko <robimarko@gmail.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v5.17
Date: Mon, 20 Dec 2021 23:12:03 -0600
Message-Id: <20211221051203.3625155-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.17

for you to fetch changes up to bf0a257a9418ebcbe6ab2a73728f76969942e52a:

  arm64: dts: qcom: sm8450: add i2c13 and i2c14 device nodes (2021-12-15 16:30:58 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree updates for v5.17

This introduces initial support for the brand new Snapdragon 8 Gen 1,
aka SM8450 platform, with SMP, CPUfreq, cluster idling, low speed buses,
TLMM pinctrl, SMMU, regulators, clocks, power-domains, UFS storage
currently supported.

SDM845 adds new support for Sony Xperia XZ2, XZ2C and XZ3. The Lenovo
Yoga C630 gains a few audio related fixes. The PMIC's VADC channels are
described as thermal zones. OnePlus devices gains msm-id and board-id,
to facilitate a single firmware image for the multiple devices.

On SM8350 the Sony Xperia 1 III and 5 III, as well as initial
description of Microsoft's Surface Duo 2 are introduced.  On the
platform side, LLCC, QUP nodes, redistributor stride and all the
low-speed QUPs are added

MSM8996 gained various regulator fixes, and adsp firmware name to
faciliate pushing firmware to linux-firmware. Xiaomi Mi Note 2 gained
touchkey controller definition.

On SDM660 the Xiaomi Redmi Note 7 gained power and volume keys, RPM and
regulator definitions, USB, eMMC and SD-card and a simple-framebuffer
description.

MSM8916 has the mmc aliases corrected, to stop the storage devices to
move around and the RPM sleep stats memory is described. Support for the
Samsung J5 2015 smartphone is introduced.

SM6350 validation errors are fixed and and description of the audio,
compute and modem remoteprocs are added.

A couple new revisions of the SC7180 based Google devices are added.
The SC7280 platform gains venus and a few fixes. The CRD development
device is introduced, with the EC, touchscreen and touchpad.

On SM8250 CPU opp-tables, for scaling L3 cache and DDR frequency based
on CPU frequency, are added. As is TX, RX macros and SoundWire blocks
and used to enable audio on the SM8350 MTP.

----------------------------------------------------------------
Alexey Min (1):
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB

Baruch Siach (1):
      arm64: dts: qcom: ipq6018: Fix gpio-ranges property

Bjorn Andersson (3):
      Merge tag '20211207114003.100693-2-vkoul@kernel.org' into arm64-for-5.17
      arm64: dts: qcom: pm8998: Add ADC Thermal Monitor node
      arm64: dts: qcom: sdm845: mtp: Add vadc channels and thermal zones

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus-*: add msm-id and board-id

Dang Huynh (8):
      arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
      arm64: dts: qcom: sdm630-pm660: Move RESIN to pm660 dtsi
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM and fixed regulators
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add PWRKEY and RESIN
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
      arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
      arm64: dts: qcom: Drop input-name property

David Heidelberg (3):
      arm64: dts: qcom: msm8996: drop not documented adreno properties
      arm64: qcom: dts: drop legacy property #stream-id-cells
      arm64: dts: qcom: sdm845: add QFPROM chipset specific compatible

Dikshita Agarwal (1):
      arm64: dts: qcom: sc7280: Add venus DT node

Dmitry Baryshkov (8):
      arm64: dts: qcom: apq8096-db820c: specify adsp firmware name
      arm64: dts: qcom: apq8096-db820c: add missing regulator details
      arm64: dts: qcom: apq8096-db820c: correct lvs1 and lvs2 supply property
      arm64: dts: qcom: msm8994-sony-xperia-kitakami: correct lvs1 and lvs2 supply property
      arm64: dts: qcom: msm8996-sony-xperia-tone: fix SPMI regulators declaration
      arm64: dts: qcom: msm8916: fix MMC controller aliases
      arm64: dts: qcom: sm8450: Add rpmhpd node
      arm64: dts: qcom: sm8450: add i2c13 and i2c14 device nodes

Julian Ribbeck (1):
      arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)

Kate Doeen (2):
      arm64: dts: qcom: sdm845-oneplus-common: set venus firmware path
      arm64: dts: qcom: sdm845-xiaomi-beryllium: set venus firmware path

Katherine Perez (1):
      arm64: dts: qcom: add minimal DTS for Microsoft Surface Duo 2

Konrad Dybcio (18):
      arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)
      arm64: dts: qcom: sm8350: Move gpio.h inclusion to SoC DTSI
      arm64: dts: qcom: sm8350: Add missing QUPv3 ID2
      arm64: dts: qcom: sm8350: Add redistributor stride to GICv3
      arm64: dts: qcom: sm8350: Specify clock-frequency for arch timer
      arm64: dts: qcom: sm[68]350: Use interrupts-extended with pdc interrupts
      arm64: dts: qcom: sm8350: Shorten camera-thermal-bottom name
      arm64: dts: qcom: *8350* Consolidate PON/RESIN usage
      arm64: dts: qcom: sm8350: Describe GCC dependency clocks
      arm64: dts: qcom: sm8350: Set up WRAP0 QUPs
      arm64: dts: qcom: sm8350: Set up WRAP1 QUPs
      arm64: dts: qcom: sm8350: Set up WRAP2 QUPs
      arm64: dts: qcom: sm8350: Assign iommus property to QUP WRAPs
      arm64: dts: qcom: Add support for Xperia 1 III / 5 III
      arm64: dts: qcom: sm8350-sagami: Enable and populate I2C/SPI nodes
      arm64: dts: qcom: sm8350-sagami: Configure remote processors
      arm64: dts: qcom: sm8350: Add LLCC node
      Revert "arm64: dts: qcom: sm8350: Specify clock-frequency for arch timer"

Kshitiz Godara (2):
      arm64: dts: qcom: sc7280: Define EC and H1 nodes for IDP/CRD
      arm64: dts: qcom: sc7280-crd: Add Touchscreen and touchpad support

Luca Weiss (5):
      arm64: dts: qcom: sm6350: Fix validation errors
      arm64: dts: qcom: sm6350: Add MPSS nodes
      arm64: dts: qcom: sm6350: Add ADSP nodes
      arm64: dts: qcom: sm6350: Add CDSP nodes
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable ADSP, CDSP & MPSS

Martin Botka (2):
      arm64: dts: qcom: sm6125: Add RPMPD node
      arm64: dts: qcom: sm6125: Add power domains to sdhc

Philip Chen (4):
      arm64: dts: qcom: sc7180: Include gpio.h in edp bridge dts
      arm64: dts: qcom: sc7180: Specify "data-lanes" for DSI host output
      arm64: dts: qcom: sc7180: Support Lazor/Limozeen rev9
      arm64: dts: qcom: sc7180: Support Homestar rev4

Prasad Malisetty (3):
      arm64: dts: qcom: sc7280: Fix incorrect clock name
      arm64: dts: qcom: sc7280: Add pcie clock support
      arm64: dts: qcom: sc7280: Fix 'interrupt-map' parent address cells

Rajendra Nayak (2):
      dt-bindings: arm: qcom: Document qcom,sc7280-crd board
      arm64: dts: qcom: sc7280-crd: Add device tree files for CRD

Robert Marko (1):
      arm64: dts: qcom: ipq8074: add MDIO bus

Shawn Guo (1):
      arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY

Srinivas Kandagatla (6):
      arm64: dts: qcom: sm8250: Add nodes for tx and rx macros with soundwire masters
      arm64: dts: qcom: sm8250-mtp: Add wcd9380 audio codec node
      arm64: dts: qcom: sm8250-mtp: Add wsa8810 audio codec node
      arm64: dts: qcom: sm8250-mtp: add sound card support
      arm64: dts: qcom: c630: Fix soundcard setup
      arm64: dts: qcom: c630: add headset jack and button detection support

Stephan Gerhold (2):
      arm64: dts: qcom: Add missing 'chassis-type's
      arm64: dts: qcom: msm8916: Add RPM sleep stats

Thara Gopinath (1):
      arm64: dts: qcom: sm8250: Add CPU opp tables

Vinod Koul (9):
      dt-bindings: clock: Add SM8450 GCC clock bindings
      arm64: dts: qcom: Add base SM8450 DTSI
      arm64: dts: qcom: sm8450: Add tlmm nodes
      arm64: dts: qcom: sm8450: Add reserved memory nodes
      arm64: dts: qcom: sm8450: add smmu nodes
      arm64: dts: qcom: Add base SM8450 QRD DTS
      arm64: dts: qcom: sm8450-qrd: Add rpmh regulator nodes
      arm64: dts: qcom: sm8450: add ufs nodes
      arm64: dts: qcom: sm8450-qrd: enable ufs nodes

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8450: add cpufreq support

Yassine Oudjana (2):
      arm64: dts: qcom: msm8996-xiaomi-scorpio: Add touchkey controller
      arm64: dts: qcom: msm8996-xiaomi-common: Change TUSB320 to TUSB320L

yangcong (1):
      arm64: dts: qcom: sc7180: Fix ps8640 power sequence for Homestar rev4

 Documentation/devicetree/bindings/arm/qcom.yaml    |    2 +
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |   85 ++
 arch/arm64/boot/dts/qcom/Makefile                  |   19 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |   10 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   12 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |  209 ++++
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |    1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    9 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |    1 -
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |    1 -
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |    3 +-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   30 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |    4 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |   28 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    4 -
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |    1 +
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |    3 -
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |    1 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |    2 -
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/pm660.dtsi                |   12 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |   10 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |    7 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r2.dts   |    2 +
 .../boot/dts/qcom/sc7180-trogdor-homestar-r3.dts   |    6 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r4.dts   |   21 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    3 -
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts |    2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts |   31 +
 ...s => sc7180-trogdor-lazor-limozeen-nots-r9.dts} |    8 +-
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts  |   46 +
 ...en.dts => sc7180-trogdor-lazor-limozeen-r9.dts} |    6 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |    2 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |    2 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |    9 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |    9 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |    8 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |   22 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |   30 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts      |   18 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    3 -
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi     |    2 +
 .../boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |    3 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    4 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/sc7280-crd.dts            |   93 ++
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi     |  105 ++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |    1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   89 +-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   17 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    6 +-
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |    1 +
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |  351 +++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  140 +++
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    1 +
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |    2 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    2 +
 .../dts/qcom/sdm845-sony-xperia-tama-akari.dts     |   13 +
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |   29 +
 .../dts/qcom/sdm845-sony-xperia-tama-apollo.dts    |   13 +
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |  438 +++++++++
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |    1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |    3 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   30 +
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |    1 -
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   55 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  299 +++++-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   32 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |  191 ++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  472 ++++++++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    1 -
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |  369 +++++++
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |   10 +-
 .../dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts  |   19 +
 .../dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts  |   13 +
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  259 +++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  756 ++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |  375 +++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 1026 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8450.h        |  244 +++++
 82 files changed, 6042 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-lazor-limozeen-nots.dts => sc7180-trogdor-lazor-limozeen-nots-r9.dts} (60%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-lazor-limozeen.dts => sc7180-trogdor-lazor-limozeen-r9.dts} (82%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8450.h
