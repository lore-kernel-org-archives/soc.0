Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C535201A
	for <soc@lists.linux.dev>; Mon, 28 Sep 2026 06:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578254; cv=none; b=j5d/tEyEn4FjBOfm1q4O/g9nnQPPvSSCJUcuivX5Ycrm68yNTt2j8OqcaRPbRr5i2Em6orYRFx8qGkFbYmD4QHsYpzofFNP20FfvFptH2/q98i95mL+EyxtBc7tMx9On3h96SVt5NXU3szRKCtejmf4/PkCL6vIrLtTBLb2+mZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578254; c=relaxed/simple;
	bh=UoOh5weM7mUndGJmNGKNAyH8eBCIma1NMWiOL1FuD1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rj8laruhAQ3JaKmfOCDOx0/0qpnkQd7+no8sIN/sQ7SJ5xPNf8xT1qABTe23AOpBsjqAE3imw3DfvceEJuti00QJddQEdrZeTWOU+YyhDgLC//meGedbbc/npvcmxqyJMtu8bjozTnRDBLtA+yThVrKWIAELOzAsMuAmwIWpjkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jq7TurLP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jq7TurLP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC921F000FF;
	Mon, 28 Sep 2026 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790578252;
	bh=NzkSAe0TCXPSJQwB89BLISVshE/TIgZbQKmglk7brGU=;
	h=From:To:Cc:Subject:Date;
	b=Jq7TurLPs2dIE6F3JxGJrMn085gO+w/GsaAlgqA/svBU9dacGNa+ABIreh2janZQ2
	 1/jTg/II5VUnz6kYL0+CfIHCwpOd3yPSAbs797UCCZJkMKTUU0Cakwn9uszR+tMeDq
	 dtdMoeljh/H7jaImd7oFVl3xRKuXjHe4VoWFs0z4aTX2MguH8vrNwon2xpSQ8sATsr
	 kov4JuUHW3c5u6X5m9LluQsucFmeLJlYzsdQvDaTaiI0sGRrkfGVow8Jm2WTjcpdU5
	 442dim/cJyiLrOI82qT6ESxdc1crNa8SK8pn9u8+8lY6O/R2OddVRDDqFdu+avgCLz
	 stOIISElpbDwQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: fvp/juno: Updates for v7.4
Date: Mon, 28 Sep 2026 07:50:47 +0100
Message-ID: <20260928065048.2492112-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.4

for you to fetch changes up to d8e88ad6f769ec55d3d8510dc53c2b08ddfea645:

  arm64: dts: fvp: Add additional PCIe memory region (2026-09-16 09:20:29 +0100)

----------------------------------------------------------------
Arm FVP/Juno device tree updates for v7.4

Three updates to the FVP RevC device tree:

- Add the missing CPU topology information by describing the eight
  CPUs as two clusters of four in cpu-map.
- Add the EL2 Generic Watchdog control and refresh frames.
- Add a 4 GiB PCIe memory window, matching the range advertised
  by the ACPI description.

----------------------------------------------------------------
Pierre Gondois (3):
      arm64: dts: fvp: Add cpu-map property
      arm64: dts: fvp: Add EL2 Generic watchdog
      arm64: dts: fvp: Add additional PCIe memory region

 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 42 ++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)
