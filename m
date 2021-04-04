Return-Path: <SRS0=86YY=JB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3336C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Apr 2021 16:51:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E1C611EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Apr 2021 16:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E1C611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=90GE1QhKj1Ho5wadpdb6LVMxUtq4UB4hsB6HR9bW1so=; b=GwKuJbu5wytgCRj8XL0CVEerHh
	Vl0FjHL5CdwP5YMaXTwhFl1SYqUC1XJ5P2oa24xY7AduRd0UI1WFGD4ocGjp7t7ovjYG9l2fzsolp
	fZ861xmgJAZh9k6L5sJBbj8PWCxVm2zy1wHhDKGW/t17sQw0B5zVVniX7vq+/QwL7q67WZbKu90Xu
	X9/kporkMBV5aAu8AvDsHZvxGXQTAHkLYk9SMlyJ/rLTuOlvdQvw08GKTPFfgx1i+6mmZ5BH02eJO
	RjnrwrQZVxyyz7nTpRzJKdptCn+7O3HVxvTZvHlgnE/MHhvhJwGPiof5SdP3WCj3aPyCgILmfF4Fr
	qaPtGv/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lT5wD-00FzcA-6u; Sun, 04 Apr 2021 16:49:25 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lT5w5-00FzbG-9V
 for linux-arm-kernel@lists.infradead.org; Sun, 04 Apr 2021 16:49:22 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so9418714otr.4
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 04 Apr 2021 09:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WvpKVxkr11cSrwrSA2TIlZoNH745gMhmN8B21UocYa4=;
 b=jPJIqTkkr9QaWXm93eYRjbvMVUxApwVsGrFVqqemJXUUx3wmL1ts3BOl1yWn4h7aNJ
 AOwxdoCWv0W0fOVm9NiIlQDrVDq3r0aNeWIChJIRVECU6Mv6JXO6rTzETKcBT51eWTzM
 5MGCAXFz/+v6xVDPtyyJr9MS8i29YYalOwMfBHpJ5zy8cIEtzpnaJ/dyflxYD1UO4Yta
 +oK+GvbUXyjYf0yWrMqeDrQGDQu6hjA/FPwol8Z7D+i9wxepRVJkEjkuSedUFVeQqJAG
 R52sTdYDNKpWGKo00zm3Rck6SvbLNffz7NR4NUco3fj+zMGss15OHYAzkhZAkeya7zSt
 U7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WvpKVxkr11cSrwrSA2TIlZoNH745gMhmN8B21UocYa4=;
 b=VmPogIFqDOh4fR+f/3/1Er2JKoppiPQCp0T6DFsPrkxroKhKD423LShL8jSRSoRaeN
 nXOIKRPr6YRa6JKoFFfzfaWGHd23anT0k3W8Hrz+6h2/63/fRInltkITskFt38ZO0eii
 kiHyZqbG4rduc2WF052+C9Nn930ZZlPvAc1v/OaIe+8TUIYYU0KeNFQmXcAxZU2bku/F
 x+K9hmYsnNNSXIuQQKW6NsNeTAQ5YdNbjgOJdxzzLepMXrujZTDYqOGVzulGGlDuDbs+
 Pt925QKltPZcszd+unqsfz2wnRzkwvcj9r0BYbF/1AWJ9rMph1CzaVFDlFV73n2n7tpN
 AhMQ==
X-Gm-Message-State: AOAM531wCLVxpZT2U9Ue+Zou+4ZLdeNyyk5wtret2OAYyU0e5C8MAouc
 0rcFH+6/XFXmS28FWR6VPtZHtg==
X-Google-Smtp-Source: ABdhPJyKgIplmYX5sgdWQ/W2XwLbJAMu6BQjt+/7iiBSvFoDOKuMWmR08p4hPSkikgj5GySeXWxPFg==
X-Received: by 2002:a05:6830:118f:: with SMTP id
 u15mr18791631otq.43.1617554956020; 
 Sun, 04 Apr 2021 09:49:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d13sm3374946otk.74.2021.04.04.09.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 09:49:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Vinod Koul <vkoul@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Maulik Shah <mkshah@codeaurora.org>,
 Robert Foss <robert.foss@linaro.org>, Jack Pham <jackp@codeaurora.org>,
 Abhishek Kumar <kuabhs@chromium.org>,
 Alexandru M Stan <amstan@chromium.org>,
 Sandeep Maheswaram <sanm@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
 satya priya <skakit@codeaurora.org>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
Date: Sun,  4 Apr 2021 11:49:14 -0500
Message-ID: <20210404164914.712946-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_174919_159738_248152B1 
X-CRM114-Status: GOOD (  15.94  )
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
Message-ID: <20210404164914.orC9UZ71NW2bPS9cWR8w-KvmTFDWYrC2r4nlfAz5gk4@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13

for you to fetch changes up to e9269650db2f5b4aeeafced1a42b2e51d10bcdf5:

  arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS (2021-03-18 09:35:42 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DT updates for 5.13

This extends the initial SM8350 description merged in v5.12 with
CPUfreq, SMMU, UFS, RPMHPD, SPMI, USB and remoteproc support. It adds
initial PMIC definitions for the 6 PMICs found on the MTP and it
introduces the new SM8350 Hardware Development Kit (HDK).

SC7180 is further polished, the DisplayPort portion of the QMP phy is
defined and several new SKUs of the Trogdor devices are introduced.

The new SC7280 platform is introduced, with RPMH, RPMHPD, RPMCC, SPMI,
CPU idle, SMMU and watchdog defined.

SDM845 gains the camera related nodes and some cleanups.

For SM8250 it brings some cleanups and migrates SPI0 to use GPIO for
chip select.

----------------------------------------------------------------
Abhishek Kumar (1):
      arm64: dts: qcom: sc7180: add GO_LAZOR variant property for lazor

Alexandru M Stan (1):
      arm64: dts: qcom: sc7180-trogdor: Remove fp control pins in prep for coachz

Bjorn Andersson (3):
      arm64: dts: qcom: Introduce SM8350 HDK
      dt-bindings: arm: qcom: Add SM8350 HDK
      arm64: dts: qcom: pm8150: Enable RTC

Dmitry Baryshkov (4):
      arm64: dts: qcom: sm8250: split spi pinctrl config
      arm64: dts: qcom: sm8250: further split of spi pinctrl config
      arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
      arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS

Douglas Anderson (7):
      arm64: dts: qcom: Move sc7180 MI2S config to board files and make pulldown
      arm64: dts: qcom: Prep sc7180-trogdor trackpad IRQ for new boards
      arm64: dts: qcom: Unify the sc7180-trogdor panel nodes
      arm64: dts: qcom: Add sc7180-lazor-limozeen skus
      arm64: dts: qcom: Add sc7180-trogdor-pompom skus
      arm64: dts: qcom: Add sc7180-trogdor-coachz skus
      arm64: dts: qcom: sc7180: Avoid glitching SPI CS at bootup on trogdor

Jack Pham (2):
      arm64: dts: qcom: sm8350: add USB and PHY device nodes
      arm64: dts: qcom: sm8350-mtp: enable USB nodes

Matthias Kaehlcke (5):
      arm64: dts: qcom: sc7180: trogdor: Add label to charger thermal zone
      arm64: dts: qcom: sc7180: Disable charger thermal zone for lazor
      arm64: dts: qcom: sc7180: trogdor: Fix trip point config of charger thermal zone
      arm64: dts: qcom: sc7180: trogdor: Use ADC TM channel 0 instead of 1 for charger temperature
      arm64: dts: qcom: sc7180: Set up lazor r3+ as sc7180-lite SKUs

Maulik Shah (3):
      arm64: dts: qcom: sc7280: Add RSC and PDC devices
      arm64: dts: qcom: sc7280: Add reserved memory for fw
      arm64: dts: qcom: sc7280: Add cpuidle states

Rajendra Nayak (4):
      dt-bindings: arm: qcom: Document sc7280 SoC and board
      arm64: dts: qcom: sc7280: Add basic dts/dtsi files for sc7280 soc
      arm64: dts: qcom: SC7280: Add rpmhcc clock controller node
      arm64: dts: qcom: sc7280: Add rpmh power-domain node

Robert Foss (3):
      arm64: dts: qcom: sdm845: Add CAMSS ISP node
      arm64: dts: qcom: sdm845-db845c: Configure regulators for camss node
      arm64: dts: qcom: sdm845-db845c: Enable ov8856 sensor and connect to ISP

Sai Prakash Ranjan (9):
      arm64: dts: qcom: sc7180: Rename the qmp node to power-controller
      arm64: dts: qcom: sdm845: Rename the qmp node to power-controller
      arm64: dts: qcom: sm8250: Rename the qmp node to power-controller
      arm64: dts: qcom: sm8350: Rename the qmp node to power-controller
      arm64: dts: qcom: sm8250: Fix level triggered PMU interrupt polarity
      arm64: dts: qcom: sm8350: Fix level triggered PMU interrupt polarity
      arm64: dts: qcom: sm8250: Fix timer interrupt to specify EL2 physical timer
      arm64: dts: qcom: sc7280: Add device node for APPS SMMU
      arm64: dts: qcom: sc7280: Add APSS watchdog node

Sandeep Maheswaram (1):
      arm64: dts: qcom: sc7180: Use pdc interrupts for USB instead of GIC interrupts

Shawn Guo (4):
      arm64: dts: qcom: sdm845: fix number of pins in 'gpio-ranges'
      arm64: dts: qcom: sm8150: fix number of pins in 'gpio-ranges'
      arm64: dts: qcom: sm8250: fix number of pins in 'gpio-ranges'
      arm64: dts: qcom: sm8350: fix number of pins in 'gpio-ranges'

Srinivas Kandagatla (1):
      arm64: dts: qcom: db845c: fix correct powerdown pin for WSA881x

Stephen Boyd (4):
      arm64: dts: qcom: sc7180: Update dts for DP phy inside QMP phy
      arm64: dts: qcom: trogdor: Only wakeup from pen eject
      arm64: dts: qcom: Disable camera clk on sc7180-trogdor devices by default
      arm64: dts: qcom: sc7180: Drop duplicate dp_hot_plug_det node in trogdor

Venkata Lakshmi Narayana Gubba (1):
      arm64: dts: qcom: sc7180: Remove clock for bluetooth on Trogdor

Vinod Koul (25):
      arm64: dts: qcom: sm8350: Add apss_smmu node
      arm64: dts: qcom: sm8350: Add UFS nodes
      arm64: dts: qcom: sm8350-mtp: enable UFS nodes
      arm64: dts: qcom: sm8350-mtp: add regulator names
      arm64: dts: qcom: sm8350: fix typo
      arm64: dts: qcom: sm8350: Add rpmhpd node
      arm64: dts: qcom: sm8350: Add rmtfs node
      arm64: dts: qcom: sm8350: Add SMP2P nodes
      arm64: dts: qcom: sm8350: Add remoteprocs
      arm64: dts: qcom: sm8350-mtp: Enable remoteprocs
      arm64: dts: qcom: sm8350: Use enums for GCC
      arm64: dts: qcom: sm8350: Add cpufreq node
      arm64: dts: qcom: apq8016-sbc: drop qcom,sbc
      arm64: dts: qcom: msm8916: don't use empty memory node
      dt-bindings: arm: qcom: Document ipq6018-cp01 board
      arm64: dts: qcom: msm8994: don't use empty memory node
      dt-bindings: arm: qcom: Document sony boards for apq8094
      arm64: dts: qcom: sm8350: Add spmi node
      arm64: dts: qcom: pmk8350: Add base dts file
      arm64: dts: qcom: pm8350: Add base dts file
      arm64: dts: qcom: pm8350b: Add base dts file
      arm64: dts: qcom: pm8350c: Add base dts file
      arm64: dts: qcom: pmr735a: Add base dts file
      arm64: dts: qcom: pmr735B: Add base dts file
      arm64: dts: qcom: sm8350-mtp: Add PMICs

satya priya (1):
      arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280

 Documentation/devicetree/bindings/arm/qcom.yaml    |  18 +
 arch/arm64/boot/dts/qcom/Makefile                  |  13 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/pm8350.dtsi               |  25 +
 arch/arm64/boot/dts/qcom/pm8350b.dtsi              |  25 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |  25 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |  25 +
 arch/arm64/boot/dts/qcom/pmr735a.dtsi              |  25 +
 arch/arm64/boot/dts/qcom/pmr735b.dtsi              |  25 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  18 +-
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts |  18 +
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     | 154 +++++
 .../boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts |  18 +
 .../boot/dts/qcom/sc7180-trogdor-coachz-r2.dts     |  15 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi | 240 +++++++
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts |  34 +
 .../qcom/sc7180-trogdor-lazor-limozeen-nots.dts    |  26 +
 .../dts/qcom/sc7180-trogdor-lazor-limozeen.dts     |  42 ++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |   9 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |   9 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |   5 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |   4 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |  10 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |  39 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dts |  14 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |  26 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  14 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2.dts     |  44 ++
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 288 ++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |  35 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       | 162 ++---
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  51 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  47 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 608 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  27 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 139 +++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   4 -
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 548 ++++++++--------
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 319 +++++++++
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            | 116 ++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 726 ++++++++++++++++++++-
 45 files changed, 3553 insertions(+), 453 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-hdk.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
