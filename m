Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0137B2571BA
	for <soc@lists.linux.dev>; Tue, 20 May 2025 02:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747708973; cv=none; b=rianNEQDEZTrXLsIygUdcFozXXGPVEpDAFlzaBTIOoFjAFzP2rpRjk3/LtJCckaqqs84dpT64zchjx1hxnUTH2YDWIjbgxa1w2UcEJoN6+VT/tGbbdOus6yQ/0rglg1D6xC2MPbqhnLjj2gCXMVjcb4VE6go+O9552GdMwMyMCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747708973; c=relaxed/simple;
	bh=zQpunA4UKCo0q3mvvJsKk1YpJ4ueKKrLShl1Ahbk5gA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Woe9jEFr0VNHBJoxg3xtcQRWVFXB6i3LV2RyfvN/csnILAQSz4ppfx+7ryJmg0nz7kmTf5S8U9PUIBLfKh4cItXeSltMG9ztGIlUgo3lm2fLBCMUExGuZ4tDJ8Loj1EIEXebXW64lFNSKk5nhl2cgjOv8QT1SLS+uZQX4fkxYIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVUfasAe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVUfasAe"
Received: by smtp.kernel.org (Postfix)
	id 781BDC4AF0C; Tue, 20 May 2025 02:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B478CC4CEE4;
	Tue, 20 May 2025 02:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747708972;
	bh=zQpunA4UKCo0q3mvvJsKk1YpJ4ueKKrLShl1Ahbk5gA=;
	h=From:To:Cc:Subject:Date:From;
	b=hVUfasAeSsMQGkML85hMA/TUkaXE1JpZQkwp5qeMMgQx9qYwN9/M4FA9aU3aDqgHi
	 qhbkcoXqqKcxA1KT8MiIe4QbbWzsul12ObTQmTmuwdRkCRU4AVBG3/V4grQ2Z9+ohV
	 bfhh80CyDvPa+weCiGL+s7BANJl58eO7BkrsbSyvjb8jcgMJfVamBiDSh671icD3kN
	 UhdghL3TRpVyaiYVCLHZ1ZiXLoTY21CVTRAFjgYMalqfdVnxpcwEIErm7OFTjxYd96
	 nbrEywOEj5inr5+5MxRDYsneMEXUTsu8F8WK8PDROQTnfUn4tlYHAhuiHE5vo66c/J
	 SezwbTjgP/Uvg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Kaushal Kumar <quic_kaushalk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Abhinaba Rakshit <quic_arakshit@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Xilin Wu <sophon@radxa.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree updates for v6.16
Date: Mon, 19 May 2025 21:42:47 -0500
Message-ID: <20250520024248.38904-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit a18226be95c7ae7c9ec22fd31a6124bef5675c64:

  arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support (2025-05-11 17:34:23 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.16-2

for you to fetch changes up to 654ac800d4ac6bd4bffa7e98997a1e0d336999b1:

  arm64: dts: qcom: sm4450: Add RPMh power domains support (2025-05-19 15:33:51 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree updates for v6.16

Support for CPU frequency scaling is enabled on the X Elite platform.
Also on X Elite, support for the HP EliteBook Ultra G1q is introduced.

Support for the QCS6490 RB3gen2 Industrial Mezzanine is also added.

PCIe controllers and PHYs are described and enabled across IPQ5018,
IPQ5332, and IPQ5424. On IPQ9474 the missing MHI register range is
added. The TCSR block is described and used to enable download mode
flags on IPQ5018.

The venus video encoder/decoder is enabled on the MSM8998-based Lenovo
Miix 630 laptop.

The crypto engine is enabled on QCM2290 and QCS615. Bluetooth is enabled
on the QCM2210-based RB1 board.

The Fairphone FP5 gains Displayport sound support.

SAR2130P display nodes are added.

On 8cx Gen3 the sensor remoteproc (SLPI) is introduced and this is
enabled on Lenovo Thinkpad X13s and the CRD.

The SDM845-based Samsung Galaxy S9 gains graphics, modem and initial
sound support.

On SDX75 the QPIC BAM and NAND support is added, and these are enabled
on the IDP board.

LLCC is added for SM8750. SM8550 gains Iris video decoder support.

For X Elite, Lenovo ThinkPad T14s support for the SDX62 modem, as well
as audio headset, is added. ASUS Vivobook S 15 gains Bluetooth support,
Microsoft Surface Laptop 7 models gets support for DP over USB Type-C,
HP Omnibook X 14 gains audio support. The devkit gets the USB multiport
controller and the two USB Type-A ports described.

Additionally a variety of Devicetree fixes are introduced, primarily
identified through binding validation.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: x1e001de-devkit: Enable support for both Type-A USB ports

Abhinaba Rakshit (1):
      arm64: dts: qcom: qcs615: add QCrypto nodes

Ajit Pandey (1):
      arm64: dts: qcom: sm4450: Add RPMh power domains support

Alok Tiwari (1):
      arm64: dts: qcom: sm8350: Fix typo in pil_camera_mem node

Dikshita Agarwal (1):
      arm64: dts: qcom: sm8550: add iris DT node

Dmitry Baryshkov (5):
      arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus node
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP
      arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
      arm64: dts: qcom: sar2130p: add display nodes

Dzmitry Sankouski (3):
      arm64: dts: qcom: sdm845-starqltechn: add initial sound support
      arm64: dts: qcom: sdm845-starqltechn: add graphics support
      arm64: dts: qcom: sdm845-starqltechn: add modem support

George Moussalem (1):
      arm64: dts: qcom: ipq5018: enable the download mode support

Jens Glathe (1):
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add retimers, dp altmode support

Johan Hovold (2):
      arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
      arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer

Juerg Haefliger (4):
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Enable SMB2360 0 and 1
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label
      dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
      arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q

Kaushal Kumar (3):
      arm64: dts: qcom: sdx75: Add QPIC BAM support
      arm64: dts: qcom: sdx75: Add QPIC NAND support
      arm64: dts: qcom: sdx75-idp: Enable QPIC BAM & QPIC NAND support

Konrad Dybcio (15):
      arm64: dts: qcom: x1e80100-romulus: Enable DP over Type-C
      arm64: dts: qcom: sc8280xp: Fix node order
      arm64: dts: qcom: sc8280xp: Add SLPI
      arm64: dts: qcom: sc8280xp-crd: Enable SLPI
      arm64: dts: qcom: sc7180: Add specific APPS RSC compatible
      arm64: dts: qcom: sdm845: Add specific APPS RSC compatible
      arm64: dts: qcom: msm8998: Remove mdss_hdmi_phy phandle argument
      arm64: dts: qcom: qcs615: Remove disallowed property from AOSS_QMP node
      arm64: dts: qcom: msm8998-fxtec: Add QUSB2PHY VDD supply
      arm64: dts: qcom: msm8998-mtp: Add QUSB2PHY VDD supply
      arm64: dts: qcom: msm8998-yoshino: Add QUSB2PHY VDD supply
      arm64: dts: qcom: sm6350-pdx213: Wire up USB regulators
      arm64: dts: qcom: msm8996-oneplus: Add SLPI VDD_PX
      arm64: dts: qcom: sa8775p: Clean up the PSCI PDs
      arm64: dts: qcom: qcs615: Fix up UFS clocks

Krishna Chaitanya Chundru (1):
      arm64: dts: qcom: x1e80100: Add PCIe lane equalization preset properties

Loic Poulain (1):
      arm64: dts: qcom: qcm2290: Add crypto engine

Luca Weiss (1):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support

Manikanta Mylavarapu (2):
      arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller nodes
      arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers

Maud Spierings (1):
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

Melody Olvera (1):
      arm64: dts: qcom: sm8750: Add LLCC node

Nirmesh Kumar Singh (1):
      arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2

Nitheesh Sekar (2):
      arm64: dts: qcom: ipq5018: Add PCIe related nodes
      arm64: dts: qcom: ipq5018: Enable PCIe

Pengyu Luo (1):
      arm64: dts: qcom: sm8650: add the missing l2 cache node

Praveenkumar I (2):
      arm64: dts: qcom: ipq5332: Add PCIe related nodes
      arm64: dts: qcom: ipq5332-rdp441: Enable PCIe phys and controllers

Sibi Sankar (2):
      arm64: dts: qcom: x1e80100: Add cpucp mailbox and sram nodes
      arm64: dts: qcom: x1e80100: Enable cpufreq

Srinivas Kandagatla (1):
      arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

Varadarajan Narayanan (1):
      arm64: dts: qcom: ipq9574: Add MHI to pcie nodes

Viken Dadhaniya (1):
      arm64: dts: qcom: sa8775p: Add default pin configurations for QUP SEs

Xilin Wu (1):
      arm64: dts: qcom: sc7280: Mark FastRPC context banks as dma-coherent

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  40 ++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 246 ++++++-
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts        |  76 +++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              | 252 ++++++-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |  41 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 525 +++++++++++++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  40 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |   5 +
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts      |   2 +
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts     |   2 +
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |   1 +
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |   6 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |   1 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |   1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  40 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  31 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |  40 +-
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |  21 +
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  83 +++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         | 133 ++--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 757 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 394 +++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  15 +
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   6 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 709 ++++++++++---------
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 329 +++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |  18 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |  33 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |  68 ++
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |   7 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   4 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   4 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   4 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  81 +++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   9 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  18 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  86 +++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  90 +++
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 167 +++++
 .../dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts   |  30 +
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 156 +----
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 476 ++++++++++++-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  18 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 100 ++-
 51 files changed, 4574 insertions(+), 610 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
