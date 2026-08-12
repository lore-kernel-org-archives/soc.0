Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510D5329C6B
	for <soc@lists.linux.dev>; Wed, 12 Aug 2026 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515608; cv=none; b=iogs7SebLKnD3+0itVRd/1XLC7l1dYf2+k2wA2wfPfMJW+gK/aXAuBYqB71dhfqiLF05Onp7HzwmF3jCTJWzhFWHHA7itI9fRxDOJwIJyMuuec8ve4iOedGJRtd0UTE5i9swWcnHrfB0RS2A3uAcmqn0yjrpgb8+qyEcjKys2XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515608; c=relaxed/simple;
	bh=lB6xXBdomdQiS1b7fJ3I0FgYJo4d8F8nIQf38tVgWR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXbbUKDAq9SgSYvgYGvpYcvATLnm0vICZsv5msegVrkOXaEt8RITfLJ5yzzMwFrGLoI37R8pDBFIZIYvMn2qluow4/RHdlFOCz+Fnfr6YsLBFVpCFC+y0vAi8hg1i8u6pUX/OR4fpyKiflh3+WwhfM8vLPqklYyFoHx0qYqXFN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 0B7B21F00A3D; Wed, 12 Aug 2026 06:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541821F000E9;
	Wed, 12 Aug 2026 06:20:05 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	conor@kernel.org
Subject: [GIT PULL] Microchip ARM64 device tree updates for v7.3
Date: Wed, 12 Aug 2026 09:20:03 +0300
Message-ID: <20260812062003.1285582-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.3

for you to fetch changes up to 8258a4bcfaa9ded9b19b3c230ed85df44d580935:

  arm64: dts: microchip: lan969x: add QSPI nodes (2026-07-27 09:57:02 +0300)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v7.3

This update includes:
- the device tree nodes for the QSPI controllers on LAN9691 SoC

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: microchip: lan969x: add QSPI nodes

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
