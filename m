Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5611FFC57
	for <soc@lists.linux.dev>; Tue,  4 Mar 2025 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085931; cv=none; b=DmNU8EPAKbEzRPRXk5jjW4daLf6e2R678dNbgq/wHdnN5Cwd/E5pcVQErpgHhT7918oaGxNO1RVXXFQqi62BdvglCFhvEm8sr+LB5nGxMGihRHat5Gd1Su69Oqz0eWPa0dBImo5GKUm/c39zN/QPCBQfZf21o+AMtkY+B+6R1os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085931; c=relaxed/simple;
	bh=J3tqSLgEYbirjOuyzWRPm/+IlnWYcEkBO6pFiqZPvCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m8vH4vqsIc23+/W1uVvh6KM5Dd7JFJfdzrvLx92RjzWbCK1n5ugJy4urmW9Yp4/7RgcDay8RizyGFxqPk/PqJPXssJhbh5DF3zz0AunR6ZFClZC32zjRB8VHp9q/uwZGhomWWTHaTxqURL+kOUMjx4lVh/2x6jPJSgDr361FtFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 4739FC4CEEB; Tue,  4 Mar 2025 10:58:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 12797C4CEE5;
	Tue,  4 Mar 2025 10:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12797C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06972FEC;
	Tue,  4 Mar 2025 02:59:03 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3B823F5A1;
	Tue,  4 Mar 2025 02:58:47 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [GIT PULL] firmware: smccc: Update for v6.15
Date: Tue,  4 Mar 2025 10:58:45 +0000
Message-Id: <20250304105845.432813-1-sudeep.holla@arm.com>
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/smccc-update-6.15

for you to fetch changes up to 5f9c23abc47744f2578af4a362655c31254c93b5:

  firmware: smccc: Support optional Arm SMCCC SOC_ID name (2025-03-03 14:53:46 +0000)

----------------------------------------------------------------
Arm SMCCC update for v6.15

Just a single update introducing the support for the optional SOC_ID
name string from the Arm SMCCC v1.6 specification.

If the SOC_ID name string is implemented, the machine field of the SoC
Device Attributes will reflect it.

The original intent of SOC_ID was to provide a JEP-106 code for the SiP
and the SoC revision to uniquely identify the SoC. However, there has
been a request to add this optional name so that SoC firmware can
directly provide the SoC name to the OS.

This change avoids the need for frequent updates to various tools that
would otherwise require maintaining hardcoded model/machine name tables
for new SoCs.

----------------------------------------------------------------
Paul Benoit (1):
      firmware: smccc: Support optional Arm SMCCC SOC_ID name

 drivers/firmware/smccc/soc_id.c | 80 +++++++++++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h       | 40 +++++++++++++++++++++
 2 files changed, 120 insertions(+)
