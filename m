Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8567018C26
	for <soc@lists.linux.dev>; Sun,  9 Nov 2025 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762706748; cv=none; b=MCL6j8eha57fsZOyNxFDko28nTJ9N1An97Er4k90BQnvYtXgNMZ3mb5qB26A3ESNh6xzcqSC7o2r/LhbCf3FZxbz9SJ5jc6Zmew+sRFZTH+ZONyapqogYO4as/Rmrs4goVizREvoX6DGKNEp1f0VdwDzIMfcQUud9lz8+2/0/FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762706748; c=relaxed/simple;
	bh=ik+4aosHhyO6/rQVOj9rheFpqfTnvqznAsICy3sGW8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNXPklqnVG1czbgzs/yG7HBZbOVkR4t1mZkfOnzQ5XRsoe/vanYlWk4zKbtgOVRieUB2tHJV9ydQ1gSKIZeBXYvGiAYVjbvJe5lkD+WoIRjfUD4MKE0IIQdBq7Xg1l/VfDV9ZJlQ+9XVEy1g5tm0ppV4QwoFMixjHCWXx6r3lnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PS8RVllp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PS8RVllp"
Received: by smtp.kernel.org (Postfix)
	id 2822EC4CEF8; Sun,  9 Nov 2025 16:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CA3C4CEFB;
	Sun,  9 Nov 2025 16:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762706748;
	bh=ik+4aosHhyO6/rQVOj9rheFpqfTnvqznAsICy3sGW8g=;
	h=Date:From:To:Cc:Subject:From;
	b=PS8RVllptFDKzJ8RYx6F7JO2hkFHkeGGS4VHKNBAtIz2aAQZLvF8GQAtMeHRPIP90
	 5z/LeSpJzg3HCt2soYXKy4KjgEL80gV89xguY1cMSx5LCLf+EbY2dioI0FuSf/dwTz
	 EIhDlJ0tEqbAzw7ZDpagmwSuD5hlSUcO0Ni8MCZRQ7UXrb7BNpqK4NRFpRwGbaT3ch
	 1JJbXz+0Xb867vf6YGEcHV4G5snx0vmUQ5yAfkhK6Hm29sRDMzNFYfO3/93LzbGg+z
	 fwPrrJ4IgEMHBOxuQf2lTco+jw1E3lWk142a1yhMjioPtLT7eVTsAP1U90iTRA0WWs
	 JCX7mWrJ0aBYA==
Date: Sun, 9 Nov 2025 08:45:46 -0800
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.19
Message-ID: <aRDFOnmcW6GIJ6bt@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v6.19

for you to fetch changes up to d8a174babf649346b6dad6784ae1e9bc8417af71:

  riscv: dts: thead: Add reset controllers of more subsystems for TH1520 (2025-10-31 10:17:11 +0000)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.19

Add PWM controlled fan and it's associated thermal management for the
Lichee Pi 4A board.

Enable additional ISA extenstions supported by the T-Head C910 cores:
Zfh, Ziccrse, XTheadvector.

Add reset controllers of more TH1520 subsystems: AP, AO, DSP, MISC, VI.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Han Gao (3):
      riscv: dts: thead: add xtheadvector to the th1520 devicetree
      riscv: dts: thead: add ziccrse for th1520
      riscv: dts: thead: add zfh for th1520

Michal Wilczynski (2):
      riscv: dts: thead: Add PWM controller node
      riscv: dts: thead: Add PWM fan and thermal control

Yao Zi (1):
      riscv: dts: thead: Add reset controllers of more subsystems for TH1520

 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 67 +++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi             | 72 ++++++++++++++++++++---
 2 files changed, 131 insertions(+), 8 deletions(-)
