Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CD525A642
	for <soc@lists.linux.dev>; Mon,  9 Jun 2025 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466345; cv=none; b=VNxBHWsE6erhF65p2Rc2W3hzPVpgVngvXTe1w6wiqoWODvkm/ZH009OSypo0aSffqgiNmsR4J0NGu8+uD3LBZ4SMrKFXHWQMqJlatymO9PnZTF3vMHGgJZT9lCqPkkgGThofRD6GqtIVbU7STeSGP8gX+r+ruqY4vfknzN7SQR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466345; c=relaxed/simple;
	bh=IuDm8fHHc3aTOLw83+uoTcmN9YosnPP283b36QWBLz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NXVmTIsPcfSCbO/i7iSUKv+TPZdDWenJNtpJoZBNBm3S3VrqYigV3SQSFg13e98jr3mkgIRxt8RMyn+B8MlpDcpjT5+XNDsKY9+WjV6SDqeQczmxk0bb+Jy10HD3MBVgiwJydpAJg50ZDD5KtDLujnCP4vkcg5ss5x62ClubiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 916C5C4CEED; Mon,  9 Jun 2025 10:52:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 9619EC4CEEB;
	Mon,  9 Jun 2025 10:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9619EC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1100150C;
	Mon,  9 Jun 2025 03:52:03 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 92BB93F59E;
	Mon,  9 Jun 2025 03:52:21 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v6.16
Date: Mon,  9 Jun 2025 11:52:07 +0100
Message-Id: <20250609105207.1185570-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-6.16

for you to fetch changes up to 4c46a471be12216347ba707f8eadadbf5d68e698:

  firmware: arm_ffa: Fix the missing entry in struct ffa_indirect_msg_hdr (2025-06-09 11:24:43 +0100)

----------------------------------------------------------------
Arm FF-A fixes for v6.16

Couple of fixes to address:

1. The safety and memory issues in the FF-A notification callback handler:

   The fixes replaces a mutex with an rwlock to prevent sleeping in atomic
   context, resolving kernel warnings. Memory allocation is moved outside
   the lock to support this transition safely. Additionally, a memory leak
   in the notifier unregistration path is fixed by properly freeing the
   callback node.

2. The missing entry in struct ffa_indirect_msg_hdr:

   The fix adds the missing 32 bit reserved entry in the structure as
   required by the FF-A specification.

----------------------------------------------------------------
Sudeep Holla (3):
      firmware: arm_ffa: Fix memory leak by freeing notifier callback node
      firmware: arm_ffa: Move memory allocation outside the mutex locking
      firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in atomic context

Viresh Kumar (1):
      firmware: arm_ffa: Fix the missing entry in struct ffa_indirect_msg_hdr

 drivers/firmware/arm_ffa/driver.c | 71 ++++++++++++++++++++-------------------
 include/linux/arm_ffa.h           |  1 +
 2 files changed, 37 insertions(+), 35 deletions(-)
