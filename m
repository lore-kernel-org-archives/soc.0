Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34546410D36
	for <soc@lists.linux.dev>; Mon, 15 Jun 2026 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542371; cv=none; b=BlQcRSVqqAo9FyYLQFxS42BrdRdaLofFhZxuYt+MfZFvLB0E1nbuAXnQoRQsmNvvu9XkXiD4A3EumfayhzBMsGNR9RUyyoNkisohAit0/996mM6QEJFcwgcgQ/gi3h0iORCDODJlipFsrqx43fIH7k0D7OibPByBvhDZTveCA2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542371; c=relaxed/simple;
	bh=Qmi/AOaMkcFtfNTdKRIWe8kkWkitA6F3lJzIHoFugx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qY0up4g+ZPwPU7+91BLsf7G1+7AdwMGhw+WhrhYYVsTKYp9W9XyDnlqMGwHiAZV0ko88Zo4ZTFLASVXbWHPJaG+BC9lIm+4f5jR9atyl0W7+ZCUVY25I2HyxOX+s7psNhmTZIIXexiviazGFHTDaML6fWCMbIc/licZHBsD0Tec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwGSJco2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwGSJco2"
Received: by smtp.kernel.org (Postfix)
	id 031951F00A3A; Mon, 15 Jun 2026 16:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36891F000E9;
	Mon, 15 Jun 2026 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542369;
	bh=bP7ChGpxyRiB4mXS8hZE8VD5rxmZWWniItxxswm0PHs=;
	h=Date:From:To:Cc:Subject;
	b=KwGSJco2JrXS5nmKp/vYZ6UBePAxCoh9RM/GIDUTjIQDSVoGBYCBl0ZfQ2C+U0ms0
	 Ui4pJ5i2XGzvaxH7JFknkWgltRkFvgdnpKfVYg7GuSwVsSqXe0LK3opKn643KBU6tq
	 yPrG/HhYAWu39qNJD4MI1mXa9wwIkOsYT2rxIRZa3DCW4/c0114YhbWjTEZUPLW8QE
	 ilSNay3WC5OicEXnWXeBXIXPZvVs2UF+v3tAfnukUriyrCbxKMKknTdYyVorUN4GmT
	 WwnEOTB/mRQmNLOFvMdFQ+4Vim3JALauH5lG8xxcDDtPV56zSB1eRSGzPrrA3e2q3P
	 Vt0tDabgB47fA==
Date: Mon, 15 Jun 2026 09:52:46 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V defconfig changes for v7.2
Message-ID: <ajAt3ml9pMIMTLTq@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, this is a late pull request so no problem if it misses this window.
It is just a single patch for the WiFi driver on the TH1520-based LPi4a.

I recently setup new branches for riscv defconfig patches and they have
been added to linux-next. I talked with Conor and this seemed like a
good way to pull in defconfig patches that RISC-V SoCs need without
adding more to the plate of the arch maintainer (Paul).

Thanks,
Drew

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git@github.com:tenstorrent/linux.git riscv-config-for-v7.2

for you to fetch changes up to fb266bbe9aef17d547db468a1a7187b59ed33e9a:

  riscv: defconfig: thead: enable PCA953X GPIO driver (2026-06-08 11:31:26 -0700)

----------------------------------------------------------------
RISC-V defconfig changes for 7.2

Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
the Sipeed Lichee Pi 4a board which is based on the T-HEAD TH1520 SoC.

----------------------------------------------------------------
Marek Szyprowski (1):
      riscv: defconfig: thead: enable PCA953X GPIO driver

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
