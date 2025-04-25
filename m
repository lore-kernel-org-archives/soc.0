Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EFF1A08AF
	for <soc@lists.linux.dev>; Fri, 25 Apr 2025 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584526; cv=none; b=A44ut+RJbGMGdhCTmXQX8JXyz9Wr17Zb3iRICwzENXLWewcnGZEiN+KoL4ArXFbEAV9QqbCobZuPGy9IwDB2kbKmr6lyPKcQFT2HflV0MMamwAu9Zb5SKH06Wkwk0RJzUgsDSltG++CYtOJVGdMN2s7FJdVmnTbTkB/UiHHDaYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584526; c=relaxed/simple;
	bh=d+a1cGYOqft3/rd8lnIjN+xR007wruZx3X1yJdJ2nWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVxwPb5whxwPtU4IsPJamPApVgm+lOA1tbttHppc2ocYC/E9DUwO60VlNt8F0MZGmKOvc5Z4FCCIWdbjDQBY/VaofgJUyJxTVqdkkGveBuxErqu9JYsBuQ0WB9XyRIFbgVBQhMP7lQxd1xHAUUNbUH5hmAsoObUG+/a2RykFMLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id B1510C4CEE8; Fri, 25 Apr 2025 12:35:26 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57AADC4CEE4
	for <soc@kernel.org>; Fri, 25 Apr 2025 12:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57AADC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4ZkXNz243Gz4xX41
	for <soc@kernel.org>; Fri, 25 Apr 2025 14:35:15 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by laurent.telenet-ops.be with cmsmtp
	id hQb42E00816PE0201Qb4lN; Fri, 25 Apr 2025 14:35:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJc-31jS;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGl-0000000CKj0-3zoX;
	Fri, 25 Apr 2025 14:35:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.16
Date: Fri, 25 Apr 2025 14:34:56 +0200
Message-ID: <cover.1745582589.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745582587.git.geert+renesas@glider.be>
References: <cover.1745582587.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.16-tag1

for you to fetch changes up to 33d5bf70fff43fbc612450164bd0bab6b9ada261:

  arm: multi_v7_defconfig: Drop individual Renesas SoC entries (2025-04-09 14:56:03 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.16

  - Enable all Renesas SoCs by default when ARCH_RENESAS is set, and
    remove individual SoC entries from the various defconfigs.

----------------------------------------------------------------
Lad Prabhakar (4):
      soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
      arm64: defconfig: Remove individual Renesas SoC entries
      arm: shmobile_defconfig: Drop individual Renesas SoC entries
      arm: multi_v7_defconfig: Drop individual Renesas SoC entries

 arch/arm/configs/multi_v7_defconfig | 19 -----------------
 arch/arm/configs/shmobile_defconfig | 19 -----------------
 arch/arm64/configs/defconfig        | 23 --------------------
 drivers/soc/renesas/Kconfig         | 42 +++++++++++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 61 deletions(-)
