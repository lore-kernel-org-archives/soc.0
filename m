Return-Path: <SRS0=mfZn=QF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BE8C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Nov 2021 12:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7DF6140A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Nov 2021 12:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED7DF6140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a/RHnH5cVoUCgwH56gDtY4LXsZl6c0zAhzVoXifGr2Q=; b=1Xqoqgnbt/i7Uy
	2M70qz9ADZcPXSJOrEzqaUmbJDMGFuJaJ7tTNuStxHZAIb0eHkXxf4fc/JqE+4mWXDPGMicHCMs6R
	1vlUgeegI6qO6a8DjMtAF2B59g1R0jFcfxIMGiFm6XDvXJjX0sgXkYwwKaqQSjy1KB8BI76IPfIWR
	oq4zJIJPPzEX3BFZ9dvi6eCRIN2nv4WmTMhyMapkwSU34cXrDnXj9xJIbjqk31fFckNLIhkS5izKw
	hgeyXduOY3V6R88zb5SJzDIt61TLwBLmLKsMrbqHfKSblMimkGwvtZmzxNzcu9byFF/4VURgklHIm
	8lerG31csMpmPxa8gnhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mngLi-007jfs-98; Thu, 18 Nov 2021 12:17:06 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mngLe-007jfE-It
 for linux-arm-kernel@lists.infradead.org; Thu, 18 Nov 2021 12:17:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A49FF1FB;
 Thu, 18 Nov 2021 04:17:01 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B9753F766;
 Thu, 18 Nov 2021 04:17:00 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.16
Date: Thu, 18 Nov 2021 12:16:56 +0000
Message-ID: <20211118121656.4014764-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_041702_698631_C2A84412 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211118121656.uoHGyeF8T6k6Jgk3U5br4GkN3LaZGuo9wyjeYV-D5iQ@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.16

for you to fetch changes up to 026d9835b62bba34b7e657a0bfb76717822f9319:

  firmware: arm_scmi: Fix type error assignment in voltage protocol (2021-11-17 11:24:50 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v5.16

Couple of fixes for sparse warnings(type error assignment in voltage and
sensor protocols), add proper propagation of error from scmi_pm_domain_probe
handling agent discovery response in base protocol correctly and a fix
to avoid null pointer de-reference in the error path.

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Fix null de-reference on error path
      firmware: arm_scmi: Fix type error in sensor protocol
      firmware: arm_scmi: Fix type error assignment in voltage protocol

Peng Fan (1):
      firmware: arm_scmi: pm: Propagate return value to caller

Vincent Guittot (1):
      firmware: arm_scmi: Fix base agent discover response

 drivers/firmware/arm_scmi/base.c           | 15 ++++++++++++---
 drivers/firmware/arm_scmi/scmi_pm_domain.c |  4 +---
 drivers/firmware/arm_scmi/sensors.c        |  2 +-
 drivers/firmware/arm_scmi/virtio.c         | 10 +++++-----
 drivers/firmware/arm_scmi/voltage.c        |  2 +-
 5 files changed, 20 insertions(+), 13 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
