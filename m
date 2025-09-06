Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AE5A944
	for <soc@lists.linux.dev>; Sat,  6 Sep 2025 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757186143; cv=none; b=fXQbe7QEZZGggwv/J1aSULtds96zXWzEs2l/m+KNEsEemB7EFykjscd2YQwx5ayoVKt2102+1aBG53ODjrLvX/tLkMho7grpbyTZ1R4d82Dz2MerkQx+0fom2eufxI0nrmBMXmh8uDYmyaFV1FEQsTb4orYnVJ3AAlHbqzcS9k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757186143; c=relaxed/simple;
	bh=XOwKVqtcDN9k49oRYkZUzZnxSFvtc1z2zGDKWcxVwjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXdY5FrQNHsXRJeKt0FiYTPNsB9/j1JJqtvTEoHINIiVD32Iuy0e/4lYZqUkiHSrSQW2MSHxLtrRbbNaLRwhiUMnv/mJJupQBHhQ1N8cjytcef6OWsqYM6jAmuiu21MmGih36xzMMm0BP89ovJNuUUcO5mDnYTznIm6yWa781ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HaTRfP0k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HaTRfP0k"
Received: by smtp.kernel.org (Postfix)
	id BD5CCC4CEF9; Sat,  6 Sep 2025 19:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD96C4CEE7;
	Sat,  6 Sep 2025 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757186143;
	bh=XOwKVqtcDN9k49oRYkZUzZnxSFvtc1z2zGDKWcxVwjM=;
	h=Date:From:To:Cc:Subject:From;
	b=HaTRfP0kXVAUlsc6FZ3zqW7nlDOh7zgiy4DkAhm44KE91VFS0XCE9ZvNhotvxwcKv
	 Vw4AKa5gX3wKmS/s0BKSaINpc7bVFO+qbVDgm4R6JelSOuWXKevQb2h8aFUL55bSl7
	 +cZ5B04PB3nAQqwTDPC6glf8tZQKpmyJqBybjuVaG7kv7SpNwOuG/A+7uhwk6wgvJa
	 GGxmU+GO2ccDmW9KNMCDhOfUaOvBSP0mZ+l3X/2o+iWpf/O2aFX85nMBVjNEvW1FM6
	 IQyo7V/ux7ZI/vxr3UyyVtCF9yjEX5gVcWo0cYU5X4nwRIZpl1k9ynzzqgOH+oXhil
	 DrYytDbQi5uIw==
Date: Sat, 6 Sep 2025 12:15:41 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.18
Message-ID: <aLyIXR1G9DUzwGWc@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v6.18

for you to fetch changes up to dfa743da83ab7ba51ec5692d5939ba1bab4b78c1:

  MAINTAINERS: Add RISC-V T-HEAD SoC patchwork (2025-09-06 11:05:03 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.18

Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
the GPU using the drm/imagination driver.

By adding this node, the kernel can recognize and initialize the GPU,
providing graphics acceleration capabilities on the Lichee Pi 4A and
other boards based on the TH1520 SoC. The display controller and HDMI
output are still a work in progress.

Also included is a MAINTAINERS patch that adds an entry for the T-Head
SoC patchwork.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Drew Fustini (1):
      MAINTAINERS: Add RISC-V T-HEAD SoC patchwork

Michal Wilczynski (1):
      riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node

 MAINTAINERS                           |  1 +
 arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
