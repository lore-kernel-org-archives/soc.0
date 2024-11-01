Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C971CEEA1
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730487648; cv=none; b=ZjSp8IHi3JawzeGnGEbLL2BfxhwI4JW3jCcWO8EVhpokTeqbVQurpYiWNd0suRegyNf2pA+DRQy2hmu6PJ28xAeH4vqboEECa9Nmiip+1StlMycRCw7KQ8H6h5UOZgpaWtOb478KZqCOxEZX6T13Tcwim9RUZWDv6lNltasj6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730487648; c=relaxed/simple;
	bh=W46vRNXJQ3DYG85XuJzSRWclYlvTlL4zg845K6CRZCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BfuiCgJ4VOT7q2XEj8xv+AChI5uv5StD93GYYVbl8fNTpdUSAJGcg00iRohVeu6PO40np0ZC7tYixtKbFG91XWrVCidINk3dRzr5d9oAr9OLlooDCkk8bPCDRzfGyS0agb8PVlFse7KNFn1cJlgk/nPDbEj2y3rtQZmjAWshx84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ButoImwo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ButoImwo"
Received: by smtp.kernel.org (Postfix)
	id 392F8C4CED3; Fri,  1 Nov 2024 19:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E147C4CECD;
	Fri,  1 Nov 2024 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730487648;
	bh=W46vRNXJQ3DYG85XuJzSRWclYlvTlL4zg845K6CRZCA=;
	h=From:To:Cc:Subject:Date:From;
	b=ButoImwoCq378qyIV85eoAD9Tah4KmUhx+wX42uKQlh72/RlaarNB/yfn7mb/oi5+
	 KisqDRQt6SRDjP24OrRKEmNilBL5YIFqT9ikNDr3aq2Z5II4Y7KyHyIMs58ectjWVN
	 D9jtc61Uh3scSaFUPg6bNx8JYHMS1iBHHeBqPEl7iLLlq3o8Ltc+etM9gfAeXRfLNh
	 uqom2R3NxYb5EqNlwaztmn8fkIyCvW7e0fQ+lYbDQv6ioOucN4BdDhpuSzKGiqJ8Fh
	 6644Tkn9S2msBoVFkBEjymMwBQSiDaTa/3ifN5d53WIY6yTnjWUBSrC3aSaztpQaqu
	 dSqwYLZwzOXDA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: update for v6.13
Date: Fri,  1 Nov 2024 14:00:46 -0500
Message-Id: <20241101190046.912598-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.13

for you to fetch changes up to 44dae95e61288a72a8a182e7c68a9a72a36496dc:

  ARM: dts: socfpga: Fix at24 EEPROM node names (2024-10-01 21:35:49 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.13
- Fix dts warning for at24 EEPROM node names

----------------------------------------------------------------
Rob Herring (Arm) (1):
      ARM: dts: socfpga: Fix at24 EEPROM node names

 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
