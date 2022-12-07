Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A991C352A1
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 15:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02DC9C43470; Wed,  7 Dec 2022 15:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31C2C433D7;
	Wed,  7 Dec 2022 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670426757;
	bh=thPyZCVaaySxcfsHqqnzn+K3BaIQ3aXAysfhrEgDxAU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ji5NMYDEzFDG0ExrS6taUpZ66xmvY04s7VQhH5XzC8FlwmgvsKkW8u6DAYY6uHwZ+
	 qifzQS2VGgZEpfe2I9M/SGqhWI6vldOlyDC9DG1cIC469ju1iCNCpC150rcjVKRzKd
	 Ogykg2xvaAiVkBpSoEvjDtIIgyrqY9x/hlCG6KmzxA/QhX8EoV1bf84mX77PTqcDfU
	 XJEA6UHjtihZ9f2YddjWwb+FpK9b1/aL3mx5c6NyerIsgr6cVSIlONyO7uH/BPfJsz
	 qFX0Fdsm8weiFeLuwrmKOQzOdxQ1SpE+GYwTyLluZWPEUiaGu04JF/xZMEyc/qGKl0
	 DurbCDxDlqoUg==
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
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Brian Masney <bmasney@redhat.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <kholk11@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Lin,
	Meng-Bo <linmengbo0689@protonmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Owen Yang <ecs.taipeikernel@gmail.com>,
	Parikshit Pareek <quic_ppareek@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [GIT PULL] More Qualcomm ARM64 DT updates for 6.2
Date: Wed,  7 Dec 2022 09:25:54 -0600
Message-Id: <20221207152554.3232434-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please be aware that this will conflict with the iio tree, due to binding
changes that I merged earlier which are now causing dt_bindings_check issues.

The solution to this merge conflict should look like:
https://lore.kernel.org/lkml/20221117121307.264550-1-krzysztof.kozlowski@linaro.org/

Regards,
Bjorn

The following changes since commit afcd946be11c937ed400b1d4727e2b5fe04ba693:

  arm64: dts: qcom: sdm845-polaris: Don't duplicate DMA assignment (2022-11-15 11:45:51 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.2-2

for you to fetch changes up to 51f7be212ae6c9c09e77d17468fe26485f79836d:

  dt-bindings: iio: adc: qcom,spmi-vadc: fix PM8350 define (2022-12-06 11:05:33 -0600)

----------------------------------------------------------------
More Qualcomm ARM64 DT updates for 6.2

This introduce description of MSM8956 and MSM8976 and based on this adds
Sony Xperia X and X Compact.

It adds the SA8540P QDrive 3 automotive development board and enables
PCIe on the same.

Add description of the Vision Mezzanine for the RB5 board and the
Navigation Mezzanine for the SDM845 RB3.

SC8280XP adds L3 and DDR scaling support, resulting in good performance
improvement. PCIe and UFS is marked DMA coherent, resolving data
corruption issues. Reference clocks for UFS phy and device are
corrected, to resolve issues seen in combinations with some bootloaders
where it's not sufficient to rely on the bootloader state.

RTC description is added to the SA8295P ADP board.

For SM6115 GPI, PRNG, tsens, WCN, cpufreq, I2C/SPI and display blocks
are added.

On SM6375 QUP blocks are described, allowing the addition of touchscreen
and remoteprocs for ADSP and CDSP are introduced.  Sony Xperia 10 IV
adds description of regulators, allowing enabling SD-card support.

SM8250 Coresight components are described

It introduces support for the Xiaomi Mi 6 on MSM8998 and adds flash LED
to the Xiaomi Redmi 2.

The SDHCI block on SM8350 is described and enabled on Sony Xperia 5 III.

SM8450 sound and Soundwire blocks are described, and enabled on HDK.
CPU supply clock is described, to satisfy the DT binding and the
opp-framework.
Sony Xperia 5 IV support is added, with touchscreen added.

Lastly a range of changes to align DT source with their bindings.

----------------------------------------------------------------
Adam Skladowski (10):
      arm64: dts: qcom: sm6115: Add cpufreq-hw support
      arm64: dts: qcom: sm6115: Add TSENS node
      arm64: dts: qcom: sm6115: Add PRNG node
      arm64: dts: qcom: sm6115: Add rpm-stats node
      arm64: dts: qcom: sm6115: Add dispcc node
      arm64: dts: qcom: sm6115: Add mdss/dpu node
      arm64: dts: qcom: sm6115: Add GPI DMA
      arm64: dts: qcom: sm6115: Add i2c/spi nodes
      arm64: dts: qcom: sm6115: Add WCN node
      arm64: dts: qcom: sm6115: Add smmu fallback to qcom generic compatible

AngeloGioacchino Del Regno (4):
      arm64: dts: qcom: Add configuration for PM8950 peripheral
      arm64: dts: qcom: Add configuration for PMI8950 peripheral
      arm64: dts: qcom: Add DTS for MSM8976 and MSM8956 SoCs
      arm64: dts: qcom: Add support for SONY Xperia X/X Compact

Bjorn Andersson (6):
      Merge branch 'arm64-fixes-for-6.1' into HEAD
      arm64: dts: qcom: sa8295p-adp: Add RTC node
      arm64: dts: qcom: Align with generic osm-l3/epss-l3
      arm64: dts: qcom: sc8280xp: Add epss_l3 node
      arm64: dts: qcom: sc8280xp: Set up L3 scaling
      arm64: dts: qcom: sc8280xp: Add bwmon instances

Brian Masney (2):
      arm64: dts: qcom: sc8280xp: correct ref clock for ufs_mem_phy
      arm64: dts: qcom: sa8540p-ride: enable PCIe support

Bryan O'Donoghue (7):
      arm64: dts: qcom: sdm845: Define the number of available ports
      arm64: dts: qcom: sdm845-db845c: Drop redundant address-cells, size-cells declaration
      arm64: dts: qcom: sdm845-db845c: Drop redundant reg = in port
      arm64: dts: qcom: sdm845-db845c: Use okay not ok, disabled not disable for status
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
      arm64: dts: qcom: sm8250: camss: Define ports and ports address/size cells
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine

Christian Marangi (1):
      arm64: dts: qcom: ipq6018: improve pcie phy pcs reg table

Dmitry Baryshkov (1):
      Revert "arm64: dts: qcom: msm8996: add missing TCSR syscon compatible"

Douglas Anderson (6):
      arm64: dts: qcom: sa8155p-adp: Specify which LDO modes are allowed
      arm64: dts: qcom: sa8295p-adp: Specify which LDO modes are allowed
      arm64: dts: qcom: sc8280xp-crd: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8150-xperia-kumano: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8250-xperia-edo: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8350-hdk: Specify which LDO modes are allowed

Dzmitry Sankouski (1):
      arm64: dts: qcom: sagit: add initial device tree for sagit

Johan Hovold (14):
      arm64: dts: qcom: sc8280xp: fix ufs_card_phy ref clock
      arm64: dts: qcom: sc8280xp: fix USB0 PHY PCS_MISC registers
      arm64: dts: qcom: sc8280xp: fix USB1 PHY RX1 registers
      arm64: dts: qcom: sc8280xp: fix USB PHY PCS registers
      arm64: dts: qcom: sc8280xp: drop broken DP PHY nodes
      arm64: dts: qcom: sc8280xp: fix UFS PHY serdes size
      arm64: dts: qcom: sc8280xp: fix PCIe DMA coherency
      arm64: dts: qcom: sc8280xp: fix UFS reference clocks
      arm64: dts: qcom: sc8280xp: update UFS PHY nodes
      arm64: dts: qcom: sc8280xp: drop reference-clock source
      arm64: dts: qcom: sm6350: fix USB-DP PHY registers
      arm64: dts: qcom: sm8250: fix USB-DP PHY registers
      arm64: dts: qcom: clean up 'regulator-allowed-modes' indentation
      arm64: dts: qcom: sc8280xp: fix UFS DMA coherency

Konrad Dybcio (24):
      arm64: dts: qcom: sm8450-nagara: Separate out Nagara platform dtsi
      arm64: dts: qcom: sm8450: Add Xperia 5 IV support
      arm64: dts: qcom: sm8450-nagara: Add Samsung touchscreen
      arm64: dts: qcom: pmk8350: Allow specifying arbitrary SID
      arm64: dts: qcom: sm6375: Add GPI DMA nodes
      arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
      arm64: dts: qcom: sm6375: Add QUPs and corresponding SPI/I2C hosts
      arm64: dts: qcom: sm6375: Add SDHCI2
      arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
      arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
      arm64: dts: qcom: sm6375-pdx225: Configure SMD RPM regulators
      arm64: dts: qcom: sm6375-pdx225: Configure Samsung touchscreen
      arm64: dts: qcom: sm6375-pdx225: Enable SD card slot
      arm64: dts: qcom: sm6375: Add SMP2P for ADSP&CDSP
      arm64: dts: qcom: sm6375: Add ADSP&CDSP
      arm64: dts: qcom: sm6375-pdx225: Enable ADSP & CDSP
      arm64: dts: qcom: sm8450: Use defines for power domain indices
      arm64: dts: qcom: sm8150: Use defines for power domain indices
      arm64: dts: qcom: pmk8350: Specify PBS register for PON
      arm64: dts: qcom: sm8350: Add SDHCI2
      arm64: dts: qcom: sm8350-sagami: Add GPIO line names for TLMM
      arm64: dts: qcom: sm8350-sagami: Wire up SDHCI2
      arm64: dts: qcom: msm8994: Drop spi-max-frequency from SPI host
      arm64: dts: qcom: sm8450-nagara: Add gpio line names for TLMM

Krzysztof Kozlowski (10):
      arm64: dts: qcom: align LED node names with dtschema
      arm64: dts: qcom: sc7180-trogdor: use generic node names
      arm64: dts: qcom: sm8450: align MMC node names with dtschema
      arm64: dts: qcom: qrb5165-rb: fix no-mmc property for SDHCI
      arm64: dts: qcom: sa8155p-adp: fix no-mmc property for SDHCI
      arm64: dts: qcom: sda660-inforce-ifc6560: fix no-mmc property for SDHCI
      arm64: dts: qcom: sdm845-sony-xperia-tama: fix no-mmc property for SDHCI
      arm64: dts: qcom: sm8250-sony-xperia-edo: fix no-mmc property for SDHCI
      dt-bindings: iio: adc: qcom,spmi-vadc: extend example
      dt-bindings: iio: adc: qcom,spmi-vadc: fix PM8350 define

Lin, Meng-Bo (1):
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add flash LED

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sm8450: Supply clock from cpufreq node to CPUs

Mao Jinlong (1):
      arm64: dts: qcom: sm8250: Add coresight components

Nícolas F. R. A. Prado (2):
      arm64: dts: qcom: sc7180-trogdor: Add missing supplies for rt5682
      arm64: dts: qcom: sc7180-trogdor: Remove VBAT supply from rt5682s

Owen Yang (1):
      arm64: dts: qcom: sc7280: Add DT for sc7280-herobrine-zombie

Parikshit Pareek (1):
      arm64: dts: qcom: add SA8540P ride(Qdrive-3)

Satya Priya (1):
      arm64: dts: qcom: sc7280: Add the reset reg for lpass audiocc on SC7280

Srinivas Kandagatla (3):
      arm64: dts: qcom: sm8450: add GPR node
      arm64: dts: qcom: sm8450: add Soundwire and LPASS
      arm64: dts: qcom: sm8450-hdk: add sound support

Srinivasa Rao Mandadapu (1):
      arm64: dts: qcom: sc7280: Remove unused sleep pin control nodes

Ulf Hansson (1):
      arm64: dts: qcom: sm8250: Disable the not yet supported cluster idle state

 .../bindings/iio/adc/qcom,spmi-vadc.yaml           |   94 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    9 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |    3 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |   22 +
 .../dts/qcom/msm8956-sony-xperia-loire-kugo.dts    |   35 +
 .../dts/qcom/msm8956-sony-xperia-loire-suzu.dts    |   17 +
 .../boot/dts/qcom/msm8956-sony-xperia-loire.dtsi   |  282 +++++
 arch/arm64/boot/dts/qcom/msm8956.dtsi              |   18 +
 arch/arm64/boot/dts/qcom/msm8976.dtsi              | 1198 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    2 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    2 +-
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |  711 ++++++++++++
 arch/arm64/boot/dts/qcom/pm8450a.dtsi              |   77 ++
 arch/arm64/boot/dts/qcom/pm8950.dtsi               |  165 +++
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |    8 +
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |   97 ++
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |   22 +-
 .../boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts |   62 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    2 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   11 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   16 +
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |  270 +++++
 arch/arm64/boot/dts/qcom/sa8540p.dtsi              |   39 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    8 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi   |    1 +
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi      |    6 +-
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi     |    2 +-
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |    4 +-
 ...sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts |    1 +
 ...sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts |    1 +
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |    6 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    4 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    2 +-
 .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |    8 -
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   |   20 -
 .../boot/dts/qcom/sc7280-herobrine-zombie-lte.dts  |   16 +
 .../boot/dts/qcom/sc7280-herobrine-zombie.dts      |   16 +
 .../boot/dts/qcom/sc7280-herobrine-zombie.dtsi     |  312 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   20 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   45 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    4 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  251 +++-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |    2 +-
 .../qcom/sdm845-db845c-navigation-mezzanine.dts    |  104 ++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  101 --
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   18 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  573 +++++++++-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |   10 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |    5 +-
 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  |  320 ++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |  592 ++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   10 +-
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |    4 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   14 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  567 ++++++++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    8 +
 .../dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts  |  206 ++++
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  232 +++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   79 ++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  186 +++
 .../dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts  |  809 ++++---------
 .../dts/qcom/sm8450-sony-xperia-nagara-pdx224.dts  |  234 ++++
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  631 +++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  379 ++++++-
 68 files changed, 8035 insertions(+), 950 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pm8450a.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8950.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8950.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8540p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
