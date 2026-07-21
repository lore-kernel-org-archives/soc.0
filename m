Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCACA46DFEE
	for <soc@lists.linux.dev>; Tue, 21 Jul 2026 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650834; cv=none; b=cw7v/7+6ZQy/FrNwCcejgNIStR8IFLvul4oY8gxibiwkyLA16Ok2j4lT55eNdzFVSq2GZjr6D3xsaIar8X+0slt36tDmWJZm9BFTmtlq9Q0AEKVYZGm2j/QkJBVr9PBdCNDg9t36caQ8uEAgH18qvQ4KbOVvN7hCAXKnwRwZRdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650834; c=relaxed/simple;
	bh=mf/BQMsAPvYVyqHyUvchrbGGWL6ugeuGmuY/USCeoXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O3I5bOr4xJF00a/SVmeUuRjzM3M01uq2Og4WiwFN3jtqw3lUcwVL39xGiIDzuswl4zpVkWKjNR8M1kVnkLGkw4exGfm+m/am6InlcCd7TmXQwVqWMJQcj4N4A+tp2Is7S6NGLAIVuVN8n8BhhznobFzMLqoYtCbglTwKyn2hfYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1u/YUKH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1u/YUKH"
Received: by smtp.kernel.org (Postfix)
	id 95CD71F00A3A; Tue, 21 Jul 2026 16:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D121F000E9;
	Tue, 21 Jul 2026 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784650833;
	bh=aVk7UBu/o6xF4f2qHRc2ya+W/TOdLCBo++HYfTuftnI=;
	h=Date:From:To:Cc:Subject;
	b=B1u/YUKH69zLlxbeEOv5Is9YO79Ruq+QPwwEU9m66KqGjWAvEbFVvOPkZWI3r780U
	 bLNX2c6C6opyEJ9QA9eVx+9uLNlNOIhiF8WE2sXADQZ+SbOoyi5/+2I2/4BUe8cd2C
	 XmN7i/TVHw44aiUMRVeWG0fyhHCVhCoUfL178tOGazKoXHf1q+AdyuXt318zNWeBrN
	 Y7p9s8Hbul/YkxzTQ5MLbxl+MnIcBeOjvbBMqjAwySdNcRIp3Th86fB1i4MqmH0HMG
	 45sZYUrSY+A9pJOVx1xbKzWULl2vjBz5IQUxr7BraxAMzXegF2w/iTUOEtRAh+MbOk
	 PvGd6NXAcdALw==
Date: Tue, 21 Jul 2026 09:20:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V defconfig changes for v7.3
Message-ID: <al+cTw/+z7xoJXxp@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, I created my riscv-confg branches to shepard defconfig patches
related to the riscv platforms that I maintain. The branches are in
linux-next. For 7.3, there is just a single patch for the WiFi driver on
the TH1520-based LPi4a.

Thanks,
Drew

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/riscv-config-for-v7.3

for you to fetch changes up to 020e209272bee0b8add8cba21125e4744f034b26:

  riscv: defconfig: thead: enable PCA953X GPIO driver (2026-07-20 22:05:33 -0700)

----------------------------------------------------------------
RISC-V defconfig changes for 7.3

Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
the Sipeed Lichee Pi 4a board which is based on the T-HEAD TH1520 SoC.

----------------------------------------------------------------
Marek Szyprowski (1):
      riscv: defconfig: thead: enable PCA953X GPIO driver

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
