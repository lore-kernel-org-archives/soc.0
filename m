Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60D1993BD
	for <soc@lists.linux.dev>; Fri, 11 Apr 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363987; cv=none; b=bFip3MuVe7al99HYplonfe1zj49tRbJGFsR+TKOjVXPEKTF6HLAl75YLU0Z3IodScpQxCjfC6KG5nrApyOdFO6v3tMcCQn3rEdH3ltSdY1RBAsaarXFK2eMuySM7pxN9wT3dy3sVPTs4WIqZECSN5P8n2Q+NHIcfxx1u2yjYpyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363987; c=relaxed/simple;
	bh=BYGMpUK6fucoGv2pU86frMAwJnWjLsqYYKE+kzTbT4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EZtINABYl9GMrRLI3kh3haJlliwFD1QXhgpxkOBFwR5ZPgIc0mta31831GILmJc6dw9ugeLRMo54uedz1PcKBWO3o4DDrWSCwsM5dJK4LTRuiqizEWqDAEtl4IdiBtJZIbirV4qR8JLKN1/rPg3+iRgszFS3Vyy8+QMPrChpv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 79CFAC4CEE8; Fri, 11 Apr 2025 09:33:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 5332EC4CEE2;
	Fri, 11 Apr 2025 09:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5332EC4CEE2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9346D106F;
	Fri, 11 Apr 2025 02:33:04 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A60E3F6A8;
	Fri, 11 Apr 2025 02:33:03 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: morello: Fix for v6.15
Date: Fri, 11 Apr 2025 10:33:01 +0100
Message-Id: <20250411093301.1060540-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fix-6.15

for you to fetch changes up to 0c562281199f225a849dbb5b9a40b079ee31dc0e:

  arm64: dts: morello: Fix-up cache nodes (2025-04-10 14:04:03 +0100)

----------------------------------------------------------------
Armv8 Morello fix for v6.15

Just a single fix addressing the cache node inconsistencies. It removed
unnecessary CPU number from L2 cache node names since they are local to
CPU nodes and should simply be named "l2-cache" and relocates the shared
L3 cache node from under cpu@0/l2-cache to the /cpus node, which is the
standard location for shared caches.

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: morello: Fix-up cache nodes

 arch/arm64/boot/dts/arm/morello.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)
