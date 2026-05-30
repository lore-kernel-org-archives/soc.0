Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF18548EE
	for <soc@lists.linux.dev>; Sat, 30 May 2026 19:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780169537; cv=none; b=i+f7ubQ4PSrXPi+5NHxp6Q5bzp6FjA3v+xsr43Y77XysHDHeTq0Y6tPbXm0+bqUu8FTF+KBLAVoBMJKSlBvg5T65BMTyuYhmUcu5SSM3rMb4jOTPXiv79NqAT/8qMFINqgJPtf8LqzFkRg/TrK8Hb5cJQjVmvowcxL6L9Czliuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780169537; c=relaxed/simple;
	bh=uCluxbUQUF0KJf6nI8f+sw4COCRzK2mX+VnuNMLn7Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3AY5w5zaM3dvAqaZxMp1VLBbPs35YtcarkcjYyPAn4dUzqWbORzxC7LEAFdogUTqnmrxt+nLh518WqH7ujXPR3aHVOg2UBJXLzEjYurXTdyn/e0V+hrciwXsA/LbjxuS+tA6LtyTdRymlPqRx5YfvmanP1AkbAL4k3s2JwNVt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1kx1UDB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1kx1UDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955811F00893;
	Sat, 30 May 2026 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780169536;
	bh=T+c+usL06YdXGQD2wlM+jbeU/8sQ6SgTc25rVC+XGKE=;
	h=From:To:Cc:Subject:Date;
	b=E1kx1UDBsEyG0XFs/Q3PX6AwKj8ignz71omvZRF+hA9TjOKkPxrK7tKyvkFmEnPse
	 CDMu7zfqQs7t21pJdv4pw6cPofVq1918ccFP2vQNvuD7irR3GaKzDpM5mYNl+w0QlS
	 ph6dcH83Pdvg6PXTBGra/QLexXerrW6x+Z3rUvK5ECgdGGGmAwy3Ij+p60LYrHge/q
	 +LIoDtEc91PUP55pG5nmh2VgeY7hw7HDgdtUl6RzObMe0OQmfli2WnkMagaOJQ5CDM
	 4hwBt9OkjPTPiCwTD0+gJiz3K8Fw7r+KjWT5r3NFqbMF1DKJ5qijbPoYSGYk6gCnpl
	 c1e5ZP1dyv5dQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: fix for v7.1
Date: Sat, 30 May 2026 14:32:13 -0500
Message-ID: <20260530193213.158229-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v7.1

for you to fetch changes up to 63838c323924fe4a78b2323bd45aa1030f72ca60:

  ARM: socfpga: Fix OF node refcount leak in SMP setup (2026-05-26 09:53:20 -0500)

----------------------------------------------------------------
SoCFPGA dts fix for v7.1
- Fix OF node refcount leak

----------------------------------------------------------------
Yuho Choi (1):
      ARM: socfpga: Fix OF node refcount leak in SMP setup

 arch/arm/mach-socfpga/platsmp.c | 1 +
 1 file changed, 1 insertion(+)
