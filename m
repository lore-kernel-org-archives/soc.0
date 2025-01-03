Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A44219F115
	for <soc@lists.linux.dev>; Fri,  3 Jan 2025 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735871415; cv=none; b=SLLwE/5EzXkPs3Zez9rHl6P4ONKL0BUzzLftwdGoV+KpjNsk7gex7PloAjDPmQTz5nvbCuRb9NTVHtVcqn6jbiqd+0rsKQgAOGmxRXvrMuGG6UcbcKO3qMPZoymGKetp7AlP1RaBj+g2z20JMD+1GYdaK8csZFMDNpXpSu71vRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735871415; c=relaxed/simple;
	bh=eDa4cTns4ZpsC1KAed9K1B4poYLkM2NfiNQiiwEUVLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ssPErtgR33GL3HDsxT5HuoAfVF6n53BEZpzRACFJ2cZx9ejOkUHPi4zv3uYP6n2+yi6KeO3WOJhfLugmcABU2/BZYCF4a2cYbZfGh+BrsGdIZQW/5+VKa2BngQ+2sCLJxCQnhj0ChD+2a/Id3ueEMKyX97JhP2t8+1dHWsB8OlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIFvUl62; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIFvUl62"
Received: by smtp.kernel.org (Postfix)
	id C714FC4AF09; Fri,  3 Jan 2025 02:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA41C4CED0;
	Fri,  3 Jan 2025 02:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735871414;
	bh=eDa4cTns4ZpsC1KAed9K1B4poYLkM2NfiNQiiwEUVLc=;
	h=From:To:Cc:Subject:Date:From;
	b=ZIFvUl62tl7Md530nM6ZVvTLh4v2vol0cKi3Dvy8XJd8x1DHDZ5S23l0kGKLSDUaB
	 7YYm40vE3+kORdebg4BzGVzYLFocv/x0yKhRgJ2r1VSqe/56upIEh18221zKsSLqKF
	 OjG/xTF6zGEoMcqMNZV2fhA8xjNk8hOphO1BJ2oRloNtyR7XQdCS+AveIafC6BvyWt
	 vts+prq4Uo4pNcCkwVG6d1llRqEJ+jxaZeKvqQZOzf0CBN3Nx1T8w8tH59s4mDGcLk
	 MUC4ghzjk2njfO+E9Rv05kdMlms4cnsKtGEuwpDu7mZpnEJm3tn9HxirlviIpmW0m4
	 w0kUTB45sZR6Q==
From: Dinh Nguyen <dinguyen@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: updates for v6.14
Date: Thu,  2 Jan 2025 20:30:12 -0600
Message-Id: <20250103023012.1268627-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_v6.14

for you to fetch changes up to 91e8b7cff8e9445c56b0e433a51f2fd360a9b070:

  arm64: dts: altera: Remove unused and undocumented "snps,max-mtu" property (2024-12-16 19:02:35 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.14
- Remove unused and undocumented property "snps,max-mtu"
- Add gpio and spi node for Agilex5
- Add VGIC maintenance interrupt for Agilex
- Use correct reset name of "stmmaceth-ocp" instead of "ahb"
- Drop unused #address-cells/#size-cells in the cyclone5-mcvevk

----------------------------------------------------------------
Mamta Shukla (1):
      arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb"

Niravkumar L Rabara (2):
      arm64: dts: socfpga: agilex: Add VGIC maintenance interrupt
      arm64: dts: socfpga: agilex5: Add gpio0 node and spi dma handshake id

Rob Herring (Arm) (1):
      arm64: dts: altera: Remove unused and undocumented "snps,max-mtu" property

Uwe Kleine-König (1):
      ARM: dts: socfpga_cyclone5_mcvevk: Drop unused #address-cells/#size-cells

 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |  6 +++---
 .../dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts  |  2 --
 .../boot/dts/altera/socfpga_stratix10_swvp.dts     |  1 -
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  3 +++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 24 +++++++++++++++++++++-
 5 files changed, 29 insertions(+), 7 deletions(-)
