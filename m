Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1606E3AEDE0
	for <soc@lists.linux.dev>; Tue,  6 May 2025 00:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492509; cv=none; b=s7Kns1d7wfkTpVp7362ysvhsMGdc23nsyWXS8eI1aQtwXRXw7i07kpWSuPhAkij0XSRD2MY3YbhHwkvJ+cYigM319a0+Qtph8aRI8PEmnobLggTTUOQalR62HYHIhirXsXnzywFJ9LA6cteccdbGI5o+OiwGRq8IcmvKS4bWNH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492509; c=relaxed/simple;
	bh=02j748KEFR6vVfQ3vTwTd3p15GubcdTG5s8xGlAPQh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iNh8SuiMUmRqB1ncPGkIOtXp57M8N4/0KUFf2dX4ipGGqB4CQP9tb64dg9r+9YcEdEokJ3Q/m6OOgAFoxDhbczhxnIOngaobvgHlQBanxOiAhui70m+I/+VK5wZ27gV1w9vFZ08APfeTCjED3oCclfXiO9/Lsb2b8kQ2AgllYSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9WorxHE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9WorxHE"
Received: by smtp.kernel.org (Postfix)
	id 93574C4AF09; Tue,  6 May 2025 00:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1608AC4CEE4;
	Tue,  6 May 2025 00:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746492507;
	bh=02j748KEFR6vVfQ3vTwTd3p15GubcdTG5s8xGlAPQh8=;
	h=From:To:Cc:Subject:Date:From;
	b=F9WorxHEhq1XceIaLGMGVa2Kyqoj2y3kld0KqHBC3fFY50mWGTQxa5480JuwP0Sco
	 wQjRo9w+o2f42H9sMo7nX/Mv+UT6LXvfPvCf8QG/4sm/pOec9/RwBMt3sqPaAx1U/a
	 VXkZ7rFRPcU4LHW8xDKGpr6xoL5reWmFcR0ppQFJq6dBL6hBloQZlDdXrs3kjHJFrH
	 nO78oKG24SzdJCIK2La6Dl7c/nIqEpgKeGacFv74j5dEhA3YLJYYmHJke+847TkZ/+
	 ek5xe2hxz/cvPc3F7ZijvpO+ZMSc8dcxHAv/+gXhlBjQPefakupWrHsygBOe6c+Hbl
	 ee+hTnsWAQFLQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: updates for v6.16
Date: Mon,  5 May 2025 19:48:11 -0500
Message-ID: <20250506004825.134929-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=q
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.16

for you to fetch changes up to 8dbffe5f5dd531a3c3f9d603462e499085449277:

  dt-bindings: clock: socfpga: convert to yaml (2025-05-03 13:33:23 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.16
- Updates to dt-bindings
	- Document Agilex5 NAND daughter board
	- Convert Stratix10 FPGA Manager to json-schema
	- Convert Stratix10 Service Layer to json-schema
	- Add document for Terasic's DE10-nano board
- Add support for Agilex5 NAND daughter board
- Add basic support for Terasic's DE10-nano board

----------------------------------------------------------------
Mahesh Rao (2):
      dt-bindings: fpga: stratix10: Convert to json-schema
      dt-bindings: firmware: stratix10: Convert to json-schema

Matthew Gerlach (2):
      arm64: dts: intel: socfpga_agilex: add frequencies to internal oscillators
      dt-bindings: clock: socfpga: convert to yaml

Niravkumar L Rabara (6):
      dt-bindings: intel: document Agilex5 NAND daughter board
      arm64: dts: socfpga: agilex5: add NAND daughter board
      arm64: dts: socfpga: agilex5: fix gpio0 address
      arm64: dts: socfpga: agilex5: add qspi flash node
      arm64: dts: socfpga: agilex5: add led and memory nodes
      arm64: dts: socfpga: agilex: Add dma channel id for spi

Uwe Kleine-König (2):
      dt-bindings: altera: Add compatible for Terasic's DE10-nano
      ARM: dts: socfpga: Add basic support for Terrasic's de10-nano

 Documentation/devicetree/bindings/arm/altera.yaml  |   1 +
 .../bindings/arm/altera/socfpga-clk-manager.yaml   | 102 ++++++++++++++++++++-
 .../devicetree/bindings/arm/intel,socfpga.yaml     |   1 +
 .../devicetree/bindings/clock/altr_socfpga.txt     |  30 ------
 .../bindings/firmware/intel,stratix10-svc.txt      |  57 ------------
 .../bindings/firmware/intel,stratix10-svc.yaml     |  93 +++++++++++++++++++
 .../fpga/intel,stratix10-soc-fpga-mgr.yaml         |  36 ++++++++
 .../bindings/fpga/intel-stratix10-soc-fpga-mgr.txt |  18 ----
 arch/arm/boot/dts/intel/socfpga/Makefile           |   1 +
 .../intel/socfpga/socfpga_cyclone5_de10nano.dts    |  95 +++++++++++++++++++
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |   6 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |   4 +-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |  51 +++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk_nand.dts  |  89 ++++++++++++++++++
 15 files changed, 477 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt
 delete mode 100644 Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
 create mode 100644 Documentation/devicetree/bindings/fpga/intel,stratix10-soc-fpga-mgr.yaml
 delete mode 100644 Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
