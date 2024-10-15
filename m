Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D951B6D0C
	for <soc@lists.linux.dev>; Tue, 15 Oct 2024 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018248; cv=none; b=lC2Tzcwky63jaB631GKDX7bifQIYxiSh1Gnbrn2TpMC/Bgc51Wv/3I0+5Dw+tjW1bD7W+FAx2dcZLASSBTs/oplUrptzTVqe/QJVvAbs4A+S4k2a+NRy8OHibV7SR9wVUddb0s+pwC2I0JqTzmYCrxkSLHHKLc4dssmCNqEMJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018248; c=relaxed/simple;
	bh=DpfY7ctXZ4SkPBO61b9HhqnCPoJ3prBnbUsqyP3sMmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uOsDXlTj5PoHqp2PiAn1S8OPJgJAt+D/y3zhqUQOrRrTeXO2qfJJxK1+tF5SoltsCHw9z+JLqf6S9iarAjOG9mUi+Vy3Bf5Fvw9m+QAnIq1bo3diFRlWdU/yhLOEx8n362IrA3kvvES8tRlyvC4/eoUhv/fWn1qt9oiDncCnoPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 278FAC4AF0B; Tue, 15 Oct 2024 18:50:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 55E7CC4CECF;
	Tue, 15 Oct 2024 18:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55E7CC4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3A94DA7;
	Tue, 15 Oct 2024 11:51:13 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B08F3F58B;
	Tue, 15 Oct 2024 11:50:43 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v6.12
Date: Tue, 15 Oct 2024 19:50:37 +0100
Message-Id: <20241015185037.1000435-1-sudeep.holla@arm.com>
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-6.12

for you to fetch changes up to b0798838418abe996d9b618d341d865462264cbe:

  firmware: arm_ffa: Avoid string-fortify warning caused by memcpy() (2024-10-15 13:50:10 +0100)

----------------------------------------------------------------
Arm FF-A fixes for v6.12

Couple of fixes to avoid string-fortify warnings in export_uuid()
and memcpy() from the recently added functions to support
FFA_MSG_SEND_DIRECT_REQ2 and FFA_MSG_SEND_DIRECT_RESP2.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_ffa: Avoid string-fortify warning in export_uuid()

Gavin Shan (1):
      firmware: arm_ffa: Avoid string-fortify warning caused by memcpy()

 drivers/firmware/arm_ffa/driver.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
