Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A123566A
	for <soc@lists.linux.dev>; Wed, 12 Mar 2025 00:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741739436; cv=none; b=pE3SCd3O/aNnY+CWvr/FIpwPen2Gam47OKglroikTK8eZraPc3oBMflOYmvXHDmTh9tZWOfgdGO9M/8jWiOkimtrTbaZiTOTXQSv1fwcrjEaH1Q67gLULElzlSZgn4HULUbxdjSBySwlXob6xZJ5Vox2YGyrAy8nv2NEIpUihvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741739436; c=relaxed/simple;
	bh=cXzXgxJw4BfZbHJoxbEuCD45od5Yh7nLFzCNoRlhu/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXfU7MZCRn1WnIAA42mNf5OQl6InkTP+u4TpCpiN2ZfQEdFZoCH7Jva+azg1fnNYRt9g/n5LI9yJTYe6xuTprtldkY75BsrSeeuRIo8Bbq2sXny42lJhRnBXS7gvJxEjy7tSGI8HP3fuXGhRT0dpo4mgm6SYbTpOGjr4C/b4mlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id E2C88C4CEEA; Wed, 12 Mar 2025 00:30:35 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F259BC4CEE9;
	Wed, 12 Mar 2025 00:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F259BC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BAC8534313D;
	Wed, 12 Mar 2025 00:30:33 +0000 (UTC)
Date: Wed, 12 Mar 2025 00:30:23 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	spacemit@lists.linux.dev
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.15
Message-ID: <20250312003023-GYA76989@gentoo>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd:

Here is SpacemiT's device tree changes for v6.15, thanks


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.15-1

for you to fetch changes up to 5b90a3d6092d9292d3c4fe4eef8969282e070ae3:

  riscv: dts: spacemit: Add Milk-V Jupiter board device tree (2025-02-17 21:11:50 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.15

- Add Milk-V Jupiter board
- MAINTAINERS info

----------------------------------------------------------------
Javier Martinez Canillas (2):
      dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
      riscv: dts: spacemit: Add Milk-V Jupiter board device tree

Yixun Lan (1):
      MAINTAINERS: spacemit: update various info

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 MAINTAINERS                                        |  3 +++
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 27 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
