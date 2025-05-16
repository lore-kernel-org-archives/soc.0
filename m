Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47013790B
	for <soc@lists.linux.dev>; Fri, 16 May 2025 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393303; cv=none; b=Oq1nr6qjEyK9tGrTgqjrQcRm/wSUxfKFSjbpLFPW5iocfDGm4RXOGXHmmlzRbW/4YYHsZqIwO6Y5xeZYVuOUJdoH+fxAeFQLia04QuGPoGTnZ4EmenDAfrlOsjD2kpFWOHOVr10XrITr6+wqmRQsMd1DVoCNMetA2JP1gZ56kPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393303; c=relaxed/simple;
	bh=Vq+12IYot7g5r+2zqoGU+kI4hthH7/3l7cf08q+d388=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gdcSbiw2Mz68O6Ede7e15IPYwYRKO0k6OcqRxyoENfe/Dd9GMQsIMDjdbQwD46yM2wsqsr70SzhHjAB5cRs4/fPszaoGhhbzqxXK+JP9habaVcGXOqZUOb7O0gsBUNhz53MEcSCh76d2RwYeNRELYK8iDOWxvNWAwygeLrH8KBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgyhdOX+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgyhdOX+"
Received: by smtp.kernel.org (Postfix)
	id 99602C4CEED; Fri, 16 May 2025 11:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62B4C4CEE4;
	Fri, 16 May 2025 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747393302;
	bh=Vq+12IYot7g5r+2zqoGU+kI4hthH7/3l7cf08q+d388=;
	h=Date:From:To:Cc:Subject:From;
	b=EgyhdOX+CJ2vlu031JvYZH+rZ/QwLZNiko7qrjukTDrmR939JSyd7QGd/9qyzESHi
	 66wlcn28ZvP4bBn5k29LdKz6ICPGh5uZyfxJUf34Eu0VWBv6EvcnXQk/pT0dRWqsUg
	 p7/3kMRguCIgAKwr3t5J2wKa5hlgtc3ZPZSKSETkawUCFhQpvdeOAHyuqo+zR7nlKa
	 2jS3gJZfts2gZcCAbYwIQ4rzCuj89+t5p1+5zThEz5lMA1ku9W/BSPSz7axOLtOn/W
	 0GHDeiBpLejKNL4X58bKt6M5MJ/Yq+eUAMj7C+WaFLXQRTuceFiKtu7nGUt+ir+Yo6
	 QAO1j0Pn+H7sQ==
Date: Fri, 16 May 2025 12:01:39 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL 3/3] RISC-V Devicetrees for v6.16
Message-ID: <20250516-gap-exploring-f8f516ab4e1c@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2IJr7IMmKSXyj3sE"
Content-Disposition: inline


--2IJr7IMmKSXyj3sE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd

Please pull some ~RISC-V~Starfive updates for 6.16. They're a bit late
and only went into linux-next today, cos I was stalling out for some
acks before picking them up.

Thanks,
Conor.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.16

for you to fetch changes up to d50108706a63dfd896db42172bf9f6aebec219c5:

  riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader (2025-05-15 21:08:27 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.16

Starfive:
All Starfive this time (again), enabling the usb3 port on the framework
laptop mainboard, and a few cleanup patches that are syncing things with
the dts used by U-Boot.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (4):
      riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to syscrg
      riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2 cycles max 100MHz
      riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
      riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader

Icenowy Zheng (1):
      riscv: dts: starfive: jh7110-common: use macros for MMC0 pins

Sandie Cao (1):
      riscv: dts: starfive: fml13v01: enable USB 3.0 port

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 52 ++++++++++++++++------
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts | 19 ++++++++
 2 files changed, 57 insertions(+), 14 deletions(-)

--2IJr7IMmKSXyj3sE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCcbEwAKCRB4tDGHoIJi
0pzoAQDcMeUjjl0jWfUF3Z+3zScNmhO6A2N3lq3xsK3VLEH2vwD+LdAfnMEhjgtn
F6YEEBh7DUs3v7gQqbV5gfvWv/zx0g8=
=KifE
-----END PGP SIGNATURE-----

--2IJr7IMmKSXyj3sE--
