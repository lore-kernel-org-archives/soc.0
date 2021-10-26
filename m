Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233AFC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 14:17:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54AC60E0B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 14:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D54AC60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cixD5byWpdDepOUi5PNBTnoIQQl0/RVsp8QrF+XT64M=; b=glREyUT2JxzAOn
	k+IGVvll0Pd3SIS5VdL3vc10/2Nq4fAECIAQUGJQQex68JSI49USQDo0gROT5puxj7o1lqpqd4wIX
	rVrHauEflIzZiuH3LeT/EvtAant4s2PuM2SBetai5i7YQ1RiEic3uz6kwzX4tf0MFm+AcU7LmFNAe
	kznFAhdhywAXjiNOHAJ9186vhlKdK71vbC3YMr5UmVUiC2TBK9CFcUxZZ3xecLR4cDMu4pkPLj7ZM
	gKCXvqz/27obOVZCEdjzP4Lgv6CEm+y/LmM1iPTE4tk4K1App7b9iCyYBPpU1OwgUWkf6Sit5QI7H
	VVk2rylfL6tFKPXIOcvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfNEz-0020Km-03; Tue, 26 Oct 2021 14:15:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfNEv-0020KN-Mp
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 14:15:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0F89D6E;
 Tue, 26 Oct 2021 07:15:41 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF2853F73D;
 Tue, 26 Oct 2021 07:15:40 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>, Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for 5.16
Date: Tue, 26 Oct 2021 15:15:35 +0100
Message-ID: <20211026141535.1920602-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_071545_812287_D0D2EA87 
X-CRM114-Status: UNSURE (   6.84  )
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
Message-ID: <20211026141535.4ZijlMk4TSogpZPvUHV1fuIyebeYjL0ZbkDbj8hEkE0@z>

Hi ARM SoC Team,

Sorry for the late pull request. It is not too big and has been in next
for a week now. I hope it can be still merged.

Please pull !

Regards,
Sudeep

-->8

The following changes since commit eb7b52e6db7c21400b9b2d539f9343fb6e94bd94:

  firmware: arm_ffa: Fix __ffa_devices_unregister (2021-10-05 10:39:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/arm-ffa-updates-5.16

for you to fetch changes up to 01537a078b86917c7bb69aa4b756b42b980c158b:

  firmware: arm_ffa: Remove unused 'compat_version' variable (2021-10-26 12:46:15 +0100)

----------------------------------------------------------------
Arm FF-A updates for v5.16

Just couple of minor updates:
- Adding support for MEMORY_LEND API
- Handling compatibility with different firmware versions(especially
  dealing with newer/higher versions than the one supported by the driver)

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_ffa: Remove unused 'compat_version' variable

Marc Bonnici (1):
      firmware: arm_ffa: Add support for MEM_LEND

Sudeep Holla (1):
      firmware: arm_ffa: Handle compatibility with different firmware versions

 drivers/firmware/arm_ffa/driver.c | 53 +++++++++++++++++++++++++++++++++++----
 include/linux/arm_ffa.h           |  2 ++
 2 files changed, 50 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
