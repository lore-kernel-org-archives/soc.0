Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8A2D1911
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 05:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821770; cv=none; b=eadIf+Y2M5/LWxWi9FJ4v+Impt1Qg6ye2Loahz2sNzym09+Pub3rmXJow3TmuISvrFGbLevg3fc0LavmI4U1mk5oEgyBRnoBsQ2UjyTHyAfvmf3V+IUXOWt9FaEThJR1weiO4bx67ZZpPvfMdouf7rtwsvmC7KKYHJ3YUyB3BGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821770; c=relaxed/simple;
	bh=KSYkKZHDGB1opkd83aZ1P2kNBmcnc0wBI6peeSfWDK4=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=m0hxargzsyulzjQ8JPmY5oZuQf68+xkqWYIsFxAff99iz3dHbPDBqb2cPk5jdR6iohta2wWrIoitCtDOr3ewQgrEJDphup+s6wvHX70SWP+7K3vekUaboZLkrqIAe5AMadSy6cNflAIxHoaUeW1hWIWTGeq5v9RfKXbJEKmgW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=m1MRgEct; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="m1MRgEct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785821766;
	bh=HUzmDv8dlY9hJpk3TBvoU3edR9tSDvSdfT2jQQqZ4hc=;
	h=Subject:From:To:Cc:Date;
	b=m1MRgEctHCoSjVbYDOJlLmw7m2Jk/8V65lDiaGymSNOhsntYXlV0556jD84kH0vI+
	 nDobRlI3Z+59Fxuqs+HeJJnm6HeUxMxFBV8nPzkkQsx/gW08QEPlIWatXlQD8DYQy+
	 7/vRK2OzKVISRSUF9DUdJxVGI9pXHqDjofP4soFT7UF3Y5hOCTBRyj6l/tFxn2DiFN
	 /BYhfryqxSvgVzIyBct1XXxWe24fTK097U4w0kU2sAZKIgA2h6AhcbbCz4JxBJvwAD
	 29mDGdK4zB6mGIWp5BZQ3pXtQKadJT2f5Ry7/BIaXFqQZLrSjybKpZtMR6zQN8kgQQ
	 oZKZYlCVhnUeA==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3FDF8655A9;
	Tue,  4 Aug 2026 13:36:06 +0800 (AWST)
Message-ID: <a0dbb1b1642b5d30f01adb5f48c51e426414dc90.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of ARM devicetree changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 15:06:05 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git aspeed-arm-=
7.3-devicetree-0

for you to fetch changes up to 749c34389679f8d56cb200a69b62f9a64670034f:

  ARM: dts: aspeed: Correct indentation (2026-07-23 00:52:02 +0930)

----------------------------------------------------------------
aspeed: First batch of ARM devicetree changes for 7.3

No significant changes this time around. Instead, several cleanups
for Meta's San Miguel platform, along with some changes enabling
dt-check-style.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: aspeed: Correct indentation

Mike Hsieh (1):
      ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt resistor

Potin Lai (2):
      ARM: dts: aspeed: sanmiguel: Fix FIO IOEXP interrupt pin
      ARM: dts: aspeed: sanmiguel: Fix PWRGD_RMC_N active-low hog configura=
tion

 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   |  14 +-
 .../aspeed/aspeed-bmc-inventec-transformers.dts    | 432 ++++++++++-------=
----
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts |   2 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   2 +-
 4 files changed, 225 insertions(+), 225 deletions(-)
