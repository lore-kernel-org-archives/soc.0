Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7F1E260C
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780008334; cv=none; b=eGrxK4klcK9GmISRHefaO1aC6RZsqvDSgNr0twWTWAx2dsLhBSlCO+QnzLGTmMUt9aoQuCaIWXjYCm7veslvcpAJkFHIQhZc7LTKFLhIba+F9lfQSh1H3qVQnqctOXFYpjZ0Nrvqq2NtkGTRNSwcCVZxo7cn8UR9kC/qFKqQpfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780008334; c=relaxed/simple;
	bh=luJ7o3Fq9dr9FP6r+ruVIW5cKdzwpakuT9XmlU3y9LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pc3OPcwI3HiFjDK9/g/mtNXNS3eCMIcGlT7K8hRzdQXOYsIDi8R9crQLTDaWNnvdn8i5Mzp2iLxhCNYKZoi0n8JyD7M4QwIgePx6nGmHIkVGbqCIgV0c7iHi2CyuK2GfFJ2dPQOg3jHgLA3VX/8RI9ZHh8OCFAvXuI2u8FqTX6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoTkmPdF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoTkmPdF"
Received: by smtp.kernel.org (Postfix)
	id 2CAC91F00A3A; Thu, 28 May 2026 22:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291451F000E9;
	Thu, 28 May 2026 22:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780008333;
	bh=8P9iu4RhzPImSb8s5YG8wEEPl94iLkOJbZ39O0b5yeY=;
	h=From:To:Cc:Subject:Date;
	b=QoTkmPdF79SFJudB6lyX7mEizNTrE0s69VUXfLHvcCHHhyUZC2W7XMqiu9Wt1VP4M
	 FpQe+Rwy0gFEaqOLY7YyxTdY0GBX58dC6SgZeYrAh1vu237lBi0bsLnO9bJuemEAY0
	 meaUw/C5PkfHSKEMCtgms7KKpkwPnxSGiPdqQVI9FM0jxcLRAPZ8nBNqLpYX0DRo+E
	 dToFMEwMVrkCpwZ2amXSgGSRxcUiPCBXMJLcmDS9qTOeBkuufm+UMC4NC7o2U/cgKe
	 tgYnfbtOOePMYADfbq4HO41IRUefAB3pX5d6QmlQFc0KsyP5UFNKI9tbFcLl0TywSG
	 qOIY6GqyWjO5Q==
From: Alexander Sverdlin <asv@kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: Alexander Sverdlin <asv@kernel.org>
Subject: [GIT PULL] ep93xx cleanup for 7.2
Date: Fri, 29 May 2026 00:45:04 +0200
Message-ID: <20260528224507.3772367-1-asv@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear SoC maintainers,

Please pull the following small ep93xx cleanup for 7.2:

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/asv/linux.git tags/ep93xx-20260529

for you to fetch changes up to 7afbe21e94a439874f2df071265a8105efae1244:

  arm: boot: ep93xx: don't rely on machine_is_*() for removed board files (2026-05-29 00:21:38 +0200)

----------------------------------------------------------------
The patch removes the dependency on <asm/mach-types.h> in the decompressor
for EP93xx-based boards that no longer have legacy board files. This is a
preparatory step for cleaning up a large number of stale entries in
mach-types.

Link: https://lore.kernel.org/all/20260509223820.50347-1-enelsonmoore@gmail.com/
----------------------------------------------------------------
Ethan Nelson-Moore (1):
      arm: boot: ep93xx: don't rely on machine_is_*() for removed board files

 arch/arm/boot/compressed/misc-ep93xx.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)
