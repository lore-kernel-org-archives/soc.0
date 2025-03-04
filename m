Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64871FFC6A
	for <soc@lists.linux.dev>; Tue,  4 Mar 2025 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085961; cv=none; b=gJ8T/onPmt/nDNL65bzDyjvqfcTlxtKJhVICvobEOdjAto3iSbYXg9jdvz5DbwsChRLoAfjFzeTMKVYCiyFbLMVBRPk3lWcbvJHvZ/1oUgHQ6OdoBlRP63kH5Okg4eO7xyn5KozJBeps2ziz7n/dm2qthUa8qpzgBbECO+1wsrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085961; c=relaxed/simple;
	bh=jxoVBZCXnHW1vMBYSoaajWfJldaszVAbzKoRWHFBqrI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XQrIckvzWlvTs0xp+O4CiHsfEteDzBXy1Wfp+2C4xElp2NqYjr83SqIo9r9J4c2fb8k0/+sii4p0/mY295YwXbE14ODKfAwZXGDzaN/zSqDDuv4lQk6GSW/D9s30K7Np+aUA7GkL2J+bDuHors1whwixPaFJW8kqvVUn7+Rwuto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 57B75C4AF0B; Tue,  4 Mar 2025 10:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 59A9FC4CEE5;
	Tue,  4 Mar 2025 10:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59A9FC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EC58FEC;
	Tue,  4 Mar 2025 02:59:32 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3AFD83F5A1;
	Tue,  4 Mar 2025 02:59:17 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.15
Date: Tue,  4 Mar 2025 10:59:15 +0000
Message-Id: <20250304105915.432967-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.15

for you to fetch changes up to d069c33f5ce2fe8f13489ba396080fcf28c10f60:

  firmware: arm_scmi: Emit modalias for SCMI devices (2025-02-03 10:50:11 +0000)

----------------------------------------------------------------
Arm SCMI updates for v6.15

Couple of updates around the flexibility in SCMI device names and
addition of name, protocol id attributes and modalias for SCMI
devices in the sysfs.

Currently, in the scmi_protocol_device_request() function, SCMI device
names ust be unique across all protocols. However, this constraint is
being relaxed, allowing devices in different protocols to share the
same name. The change aims to provide more flexibility in naming devices
across various protocols.

Two attributes: name and protocol ID is being added to the SCMI device
in the sysfs along with the support for the modalias. These attributes
aim to enhance device identification and management.

----------------------------------------------------------------
Sudeep Holla (3):
      firmware: arm_scmi: Relax duplicate name constraint across protocol ids
      firmware: arm_scmi: Add name and protocol id attributes
      firmware: arm_scmi: Emit modalias for SCMI devices

 drivers/firmware/arm_scmi/bus.c | 69 +++++++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 13 deletions(-)
