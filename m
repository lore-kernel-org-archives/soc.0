Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16526277C9D
	for <soc@lists.linux.dev>; Mon, 30 Mar 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870127; cv=none; b=gGMFKs2DIhgPfQlHrtNSqEsGqqdvj/pKm6FSoY6T3gCO48yH8UiX0QAJr2/lmgGZcZc9sRluKylCnKPgnlcCHONmTPg/yHt8SpcxssWbq71N0InVGoAs8fE+igrMshW1Rdqw9Rfsbu8qI2Nv1RlGnuFrz/7xjDzewAnpB2WcdxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870127; c=relaxed/simple;
	bh=/kIe06bQ1ZqdXxCqLUyAT+Aw6K5Z0TFaajwnV5ej9X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azug/OJBfFH1t51zJvhd5CxFsBogaijEGPp8f8oboUlx7JUJC8t14+foH165NBlN1Xj87bajvlUfEihRdJkne7IsFRe5KE9f+yeYZVNzJMu/XtoAkuHsBY8OMIUNw11fTbAustGiehiw9ZpoCikJjJK4F6k0eVJS9wJdezGBhNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQyvAvve; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQyvAvve"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAF6C4CEF7;
	Mon, 30 Mar 2026 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774870126;
	bh=/kIe06bQ1ZqdXxCqLUyAT+Aw6K5Z0TFaajwnV5ej9X4=;
	h=From:To:Cc:Subject:Date:From;
	b=eQyvAvve9HFbrQsXGQxGSG6EM+gbhlTHeZT76QlEzJZrdjr8+w9z9oiGe5kN55Csv
	 t/OXGvNeAc5vAWQ8Q9BiipvxAbdzHgLQoEtXyIP4NOSU25u4AGQxHVBD3qoFM3G2v3
	 zQKW+Jp92QfqYLe4hQhWXqDnOFQeh3NFbUL/WzlwBZefNiBOB/Y6ohwYezg5wC0t6r
	 TIndDZc4UaOr1NjSV5DuNwSLjkDtKXy2widMLlaMk229wZuHz4qZh6sFpJwYooNf5i
	 hsF7h78jBUENKLs1IjFZo/OLP/GgdQwFQWVGFKVYgX3VjrzGfMHfCm2ScVA4AKbsFv
	 GrMZRdwgGzGJA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v7.1
Date: Mon, 30 Mar 2026 06:28:44 -0500
Message-ID: <20260330112844.240664-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_updates_for_v7.1

for you to fetch changes up to 9d29bcefcdbec4498fe0539e6d8a4e7962d92489:

  arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts (2026-03-10 21:10:05 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.1
- dt-bindings updates:
	- Document fallback compatible for Stratix10 SoCDK eMMC board
	- Document compatible for the Agilex5 SoCFPGA modular board

- Add emmc support for the Stratix10
- Drop CPU masks from the GICv3 PPI interrupts for Agilex5

----------------------------------------------------------------
Dinh Nguyen (1):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board

Geert Uytterhoeven (1):
      arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts

Ng Tze Yee (2):
      dt-bindings: altera: Add fallback compatible for Stratix 10 SoCDK eMMC variant
      arm64: dts: socfpga: stratix10: Add emmc support

 Documentation/devicetree/bindings/arm/altera.yaml  |  7 ++
 arch/arm64/boot/dts/altera/Makefile                |  1 +
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 67 +-----------------
 .../boot/dts/altera/socfpga_stratix10_socdk.dtsi   | 71 +++++++++++++++++++
 .../dts/altera/socfpga_stratix10_socdk_emmc.dts    | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  8 +--
 6 files changed, 166 insertions(+), 69 deletions(-)
 create mode 100755 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtsi
 create mode 100755 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
