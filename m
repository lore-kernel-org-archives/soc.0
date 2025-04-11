Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D796A1993BD
	for <soc@lists.linux.dev>; Fri, 11 Apr 2025 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363977; cv=none; b=gsNbFRP9OmavoU3kwhorzPXaUSep3U1kfMSmYa8Q4G0AufRbExPsdE5FEXG2ZjILNOqZBZhkCRhnIhGO4zXHJWzfbHw1qGH4ZYOQ1X33NaVF2a9MxCUshoMswzuXf9CHotfYdOt1LXSfKpnfZCtNvnWvjIPAxDF/WiE8KoHKYOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363977; c=relaxed/simple;
	bh=qKmXTNLM1fUb12YD9nlb3OJy69k0hKI0BYKBabZ7g1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TLDJuDVbek4Thg++doMZ4+5O7vn/fkGZ9Atm9x81ek4bjWleZoQvnQwlSQE/ZMQVKikVgadE7X1KWukgDoUnwqnrzbJWAyduZeId4D4IpYCAh95SsraM1hj6XfVQXqViJy+5KNrTms3onD/rI4CzEWIz5CcX6fHEu6KSr4kJjrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 7C3E2C4CEE7; Fri, 11 Apr 2025 09:32:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 9786AC4CEE2;
	Fri, 11 Apr 2025 09:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9786AC4CEE2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0662F106F;
	Fri, 11 Apr 2025 02:32:56 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 356FA3F6A8;
	Fri, 11 Apr 2025 02:32:55 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v6.15
Date: Fri, 11 Apr 2025 10:32:51 +0100
Message-Id: <20250411093251.1060513-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.15

for you to fetch changes up to 4567bdaaaaa1744da3d7da07d9aca2f941f5b4e5:

  firmware: arm_ffa: Skip Rx buffer ownership release if not acquired (2025-04-08 10:32:15 +0100)

----------------------------------------------------------------
Arm FF-A fix for v6.15

A fix that addresses incorrect release of Rx buffer ownership in the
driver. The fix specificially avoids releasing Rx buffer ownership with
FFA_RX_RELEASE if it wasn’t acquired during a FFA_PARTITION_INFO_GET call
that only requested the partition count. This prevents unnecessary errors
like FFA_RET_DENIED from firmware when buffers are not actually owned by
the driver.

----------------------------------------------------------------
Sudeep Holla (1):
      firmware: arm_ffa: Skip Rx buffer ownership release if not acquired

 drivers/firmware/arm_ffa/driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
