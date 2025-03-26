Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D3914D2A0
	for <soc@lists.linux.dev>; Wed, 26 Mar 2025 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742991116; cv=none; b=l6wYouTSA2tlJLeDWiB5HZ0g9csCWUbhS+1dXxG9wJgqF3z8f54v8g1m1MsFQTH7w2m63xlN28GxtkkBd8orwBAAfIUiVqhS5rJw0C5o2mnDEtK+4prx2zSylDVgzCTmqwlTBwMpkymHBgclKsfZ2mINCGDoVWp0OgBCLicYaRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742991116; c=relaxed/simple;
	bh=aLc0K5b/b7l/twdPf626SKCCJoK+Eb6ypuMv1ZrAMbs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Jtnc35KQ4uc6dAnnMgE1gLM4PU082RcWB3FeXTYPUcEC+ZDDJ355rj2LHy7DJNQNXCX7t2DRIettiFVqP0o/m5fn4/OWO3pipUEnc52PytJoViTmeJ8czJ/mkxsv8l5QYFI2SvJOqdtM6weelLmyqGROvLn87RELltJTn6RlRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jd2xddbB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jd2xddbB"
Received: by smtp.kernel.org (Postfix)
	id C7459C4CEEF; Wed, 26 Mar 2025 12:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA56C4CEEA;
	Wed, 26 Mar 2025 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742991113;
	bh=aLc0K5b/b7l/twdPf626SKCCJoK+Eb6ypuMv1ZrAMbs=;
	h=From:To:Cc:Subject:Date:From;
	b=Jd2xddbB8PdhZUBm5P8vWLfzCBcAAmC8YV8QdkFILLHHh9ByygVKktKj0yVb5Q3Lt
	 WFVCeMnejjO833pmKrkBCvZXqXJCFUCHtloZ0/1GXXFEoX6uY6ChxWJIXXgD5mQb/3
	 ZFKZQEwg7EwlxRQRPjdp8ow64WNOcyZYG90is7+DkgepAqgli9tiHHzxesmOEFTpu1
	 KRcPevmR+YDg5HuRotJ2ILtx84BauQrKorH4KmcwasW753ag0aqecaX3vOd/KfEzIj
	 yK6jrLDCcsyoTSqCwHDtknYUq7xFJrxrkQIHZ4VBD45clThNe1Kfyhp02ORRcEubOO
	 sI6jw+ZExDtDw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: updates for v6.15
Date: Wed, 26 Mar 2025 07:11:52 -0500
Message-Id: <20250326121152.1739873-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.15

for you to fetch changes up to e417c5b196bbde4acac1fcad014fe9212d96f97d:

  arm64: dts: socfpga: agilex: Add dma channel id for spi (2025-03-26 06:47:04 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.15
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

Matthew Gerlach (1):
      arm64: dts: intel: socfpga_agilex: add frequencies to internal oscillators

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

 Documentation/devicetree/bindings/arm/altera.yaml  |  1 +
 .../devicetree/bindings/arm/intel,socfpga.yaml     |  1 +
 .../bindings/firmware/intel,stratix10-svc.txt      | 57 -------------
 .../bindings/firmware/intel,stratix10-svc.yaml     | 93 +++++++++++++++++++++
 .../fpga/intel,stratix10-soc-fpga-mgr.yaml         | 36 ++++++++
 .../bindings/fpga/intel-stratix10-soc-fpga-mgr.txt | 18 ----
 arch/arm/boot/dts/intel/socfpga/Makefile           |  1 +
 .../intel/socfpga/socfpga_cyclone5_de10nano.dts    | 95 ++++++++++++++++++++++
 arch/arm64/boot/dts/intel/Makefile                 |  1 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  6 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  4 +-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 51 ++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk_nand.dts  | 89 ++++++++++++++++++++
 13 files changed, 376 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
 create mode 100644 Documentation/devicetree/bindings/fpga/intel,stratix10-soc-fpga-mgr.yaml
 delete mode 100644 Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
