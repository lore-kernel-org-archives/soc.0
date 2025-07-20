Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE71A185955
	for <soc@lists.linux.dev>; Sun, 20 Jul 2025 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752981001; cv=none; b=gfKnl/BDZUwdF+CLpL5j4uPWcjkYK31Q7Ge2uBEEPdG3JhI1vWOSvoUijdRdnlkcJYcN3qCdycHPjPHF9+SXObZnFFo/cO0R4/OKINZm5wUweg1qZdOCTnIMQwlWg8O8Q/35Rt36PC8g1FjcAjEuAwEfjB7qF3NzAITOiX9M/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752981001; c=relaxed/simple;
	bh=OZffXe6azFV9FeftGR9X58+sCMXsqv0J8LxCnzDlNhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBmp4JvMxC8hJkAsaAkn1X8DxBiqhy2Im1ray2ffhyUyXxRiRNKgkxl3ZsJfVxhqbeswQni/VAgpeO0xnrfRSIN+nIgHH1G19zn2UkieFybMD7YtoUf/Go1p7Lcs9qSnNf4WqHnFISYnm8qI3wY/WR7CmM6X9Yvt6quzjWhMpqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PI/M4KWw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PI/M4KWw"
Received: by smtp.kernel.org (Postfix)
	id 54DDEC4CEF7; Sun, 20 Jul 2025 03:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31E0C4CEF4;
	Sun, 20 Jul 2025 03:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752981001;
	bh=OZffXe6azFV9FeftGR9X58+sCMXsqv0J8LxCnzDlNhI=;
	h=From:To:Cc:Subject:Date:From;
	b=PI/M4KWwkMYal/3sU4kxPhbeKgO4moVSM8ZLuwFeR+8sr87bxxA4Sefprpa/KdCli
	 D3/jv6aMGoHK+ZXJx2WsgPb/0aglrQSiRl+4FTXjRoS0c2RDXUPYRr4YN7zkSvkykS
	 xZTSO84taA3RP2Y/mUXVmB+lhG17jwNS40S/dpEmP4z+U6lhnIsKRqIR+unAK/877p
	 tybF1dRUs/pWduBTwdsxa2Q9ngrsOwoj3RDY/oEX3BfNm5r3OYIHlwv+VyuGPC57Se
	 eHXJFrkz3Z4z8nMHKm4TPaKMj8Of3heLFBTcp1Bl30nWUx16vc+vfD5qidLPX6hGVq
	 vaLpE2659XF3w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Shinjo Park <peremen@gmail.com>
Subject: [GIT PULL] More Qualcomm Arm32 DeviceTree updates for v6.17
Date: Sat, 19 Jul 2025 22:09:58 -0500
Message-ID: <20250720030959.285762-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit fb84f0ec527c50c54ab662d45c441f6789ec3550:

  ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1 (2025-06-11 21:40:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.17-2

for you to fetch changes up to f36e10fa6e1ed424058b2121c174e105e7c53f1d:

  ARM: dts: qcom: pm8921: add vibrator device node (2025-07-16 15:19:53 -0500)

----------------------------------------------------------------
More Qualcomm Arm32 DeviceTree updates for v6.17

Enable GSBI8 and define the SDCC3 pinctrl state on MSM8960, then add
support for the Sony Xperia SP phone based on this platform.

----------------------------------------------------------------
Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
      ARM: dts: qcom: msm8960: add gsbi8 and its serial configuration
      ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5 nodes in msm8960 dtsi
      dt-bindings: arm: qcom: add Sony Xperia SP
      ARM: dts: qcom: add device tree for Sony Xperia SP

Shinjo Park (1):
      ARM: dts: qcom: pm8921: add vibrator device node

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |   6 +
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  40 +++
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   5 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    | 361 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  32 ++
 7 files changed, 452 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
