Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DBD2D97BD
	for <soc@lists.linux.dev>; Wed,  9 Jul 2025 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063985; cv=none; b=uGMoRn3v+MsfjEd36VJpNhNv4d+PBpzZtPcWytSNsdLKva0UqysHdIz5n5h//52PddlAK1HLsd4iKwCbLCSOVzb5aNB3CkMzSOhR5f20dzOLDK4IjHcOe+hyu+3PWRCDnJgH2xINe6mYNGmCRs2pmx7206QlYjnV2QH+CsDVUb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063985; c=relaxed/simple;
	bh=qKJnaUMVZ5rqKLbnhV1HbmlOTMjc+tkBstAgHgOi+z0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HM3UHJBHboi0tFbGyfgja+GnmObI/WeTfuSoiyYikPNjJWf8axFIa7T1BGkQEbQzCqtK+Pom6gjvUiH4E5kog/6BEEP188XVKvA0ivMbSTBtUfDbqwdOsmBlt2ty1YOwEdWyBqGuiXYpPk4IzRb5M/xDB/1oBUJP2oaffE4Q8g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C1606C4CEF4; Wed,  9 Jul 2025 12:26:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 74AFBC4CEEF;
	Wed,  9 Jul 2025 12:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74AFBC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C0E7152B;
	Wed,  9 Jul 2025 05:26:11 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9510B3F694;
	Wed,  9 Jul 2025 05:26:21 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [GIT PULL] firmware: smccc: Update for v6.17
Date: Wed,  9 Jul 2025 13:26:15 +0100
Message-Id: <20250709122615.1171419-1-sudeep.holla@arm.com>
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/smccc-updates-6.17

for you to fetch changes up to 1733432638f323d80ec3d6ba411794cc20e2465f:

  firmware: smccc: Support both smc and hvc conduits for getting hyp UUID (2025-06-11 13:55:41 +0100)

----------------------------------------------------------------
firmware: smccc: Update for v6.17

Just a single update extending arm_smccc_hypervisor_has_uuid() to
support both SMC and HVC conduits, enabling UUID retrieval when Linux
runs as the root partition under Microsoft Hypervisor (MSHV), where
SMC is used. It leverages arm_smccc_1_1_invoke() to dynamically select
the appropriate conduit, enhancing compatibility beyond just HVC.

----------------------------------------------------------------
Anirudh Rayabharam (Microsoft) (1):
      firmware: smccc: Support both smc and hvc conduits for getting hyp UUID

 drivers/firmware/smccc/smccc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
