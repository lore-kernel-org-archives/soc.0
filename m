Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C92B665
	for <soc@lists.linux.dev>; Sat, 12 Jul 2025 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752323571; cv=none; b=pYNNnjZgSWaGHCHq81Cff/qDfbdd4cqyA67dxL9oiphP01wfvDTX35eOUZx2KGl40RR+48oPCkSmRN1jL8fheqH8PpYpCCJj0OSCjx1wgNyFkzw7yFXMHObppo4/GKiSInDRn4152SuXq1P8kWCey5SBuFhC/JKtbycxMHyQA0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752323571; c=relaxed/simple;
	bh=Fa3zONeW8o1dNAGBSO84wwt6uQEhk+3PUi5qbt8JCwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ze7DQtzR7hONHaUotPVO2oM4dB9ZcItsHALKNYWflMtqKEhH3g+roDdxhpg+RZjyqollfswh+FkVJUJ0tUTlB+XDvMCEHgnheOOSJXQiUaNcrZzhEvtWp0s0ZGyz32QWL4Cg9S8h4TZIvXmKvdNWBvgSoh9JYMtcUiN9t05YJjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcJm3HUO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcJm3HUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97A6C4CEEF;
	Sat, 12 Jul 2025 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752323571;
	bh=Fa3zONeW8o1dNAGBSO84wwt6uQEhk+3PUi5qbt8JCwE=;
	h=From:To:Cc:Subject:Date:From;
	b=PcJm3HUOdBk9gGa8QRk72Ifb2v4AeC8y1mrK9a9KoAjhWDwSH8ZZuddNwKSO6cJD4
	 aFmSZ1ipdnGB9OC4TsT3djcB5sCuIwKNKjRKUVIyKtwbLaUetKoKP070vIa0YlnIi3
	 E0MuadoPJ+8r/kOKO1ZXa4qVryKz+kqziEX9cTo2yYeKv7HlsGCZPaz+Lv0gC8APzj
	 AuzJVt4lQuVp3FDkLZPe1NKmKWgt5y1iX3EbdUf3R3EmqNmGZ3O8tUYn8mteQozgyg
	 IKaCKr7a8rmF24/+Qs8qFishYtaC1cUJ8fbzUIXev3ZhaVVsXkPZjQFplq/eFLMq7t
	 Yf1ZY5XaDbRuQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: updates for v6.17
Date: Sat, 12 Jul 2025 07:32:48 -0500
Message-ID: <20250712123248.16981-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.17

for you to fetch changes up to 203b862057d08fbabcd4e475707751c0f2a9258b:

  arm64: dts: altera: socfpga_stratix10: update internal oscillators (2025-07-12 07:24:48 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.17
- Fix dt_binding_check warnings
	- agilex - f2s-free-clk
	- stratix10 - rstmgr
	- swvp - remove phy-addr, cpu1-start-addr and altr,modrst-offset

----------------------------------------------------------------
Dinh Nguyen (5):
      arm64: dts: socfpga: agilex: fix dtbs_check warning for f2s-free-clk
      arm64: dts: socfpga: stratix10: fix dtbs_check for rstmgr
      arm64: dts: socfpga: swvp: remove altr,modrst-offset
      arm64: dts: socfpga: swvp: remove cpu1-start-addr
      arm64: dts: socfpga: swvp: remove phy-addr in the GMAC node

Matthew Gerlach (1):
      arm64: dts: altera: socfpga_stratix10: update internal oscillators

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi     | 5 ++++-
 arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dts | 6 ------
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi         | 1 +
 3 files changed, 5 insertions(+), 7 deletions(-)
