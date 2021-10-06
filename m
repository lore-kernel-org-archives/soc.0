Return-Path: <SRS0=GOBS=O2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA658C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 15:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FB5610A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 15:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2FB5610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AFk1g00Rvgd4tRA1ya3YxFlJUVm5ybwvTzn3jeDeUNU=; b=g+2EQW2veIsUZ7
	W0sirAmtEMFMAW0Re/kbGA4pBJ2L247xcKYoFJ3Jn7S5Yb+yguptZk3TuRzzIQfV1gDnFdGWL69KG
	hIfoXrgGgsgJcJQjrKUsiF3kk+7c1HbgO9LMOuWetIqfNj0NXxO8eCU05RVTDbxsqUoz+TPJqqChN
	q2mD611wqd6u4+jLBu/wHEV+bH9NQJZ1u0vImvfvtOO9ks6og/uQGXQO+JqnruWMcmd6u9fblvD5M
	emjknwrDxkTwOu1sc58mlcO6IyTla0VbnFkRoT/Z96hPOgGXDrzJLkwUA/T2Z9whb3aNcuHGj/HOR
	U1Ch+VqtcebN7hByQ+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY8uT-00EoAJ-I0; Wed, 06 Oct 2021 15:32:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY8uP-00Eo9h-75
 for linux-arm-kernel@lists.infradead.org; Wed, 06 Oct 2021 15:32:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26ABF6D;
 Wed,  6 Oct 2021 08:32:40 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37B1B3F7D7;
 Wed,  6 Oct 2021 08:32:39 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v5.15
Date: Wed,  6 Oct 2021 16:32:31 +0100
Message-ID: <20211006153231.4061789-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_083241_326247_6012B86D 
X-CRM114-Status: UNSURE (   8.49  )
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
Message-ID: <20211006153231.kjZp_OAmHoHsEkj2cRVJcPKjlhb7Lc6huI1rEnM-FRY@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-5.15

for you to fetch changes up to eb7b52e6db7c21400b9b2d539f9343fb6e94bd94:

  firmware: arm_ffa: Fix __ffa_devices_unregister (2021-10-05 10:39:47 +0100)

----------------------------------------------------------------
Arm FF-A driver fixes for v5.15

Couple of fixes addressing issues when FFA driver is build as a module.
One adds the device unregistration which was missing and causes issue
when loading the module second time after unloading once. Another one
adds the missing remove callback on the ffa bus which was missing due
to which modules depending on FFA(e.g. OPTEE) will fail to remove the
device and faults next time that module is loaded again.

----------------------------------------------------------------
Sudeep Holla (2):
      firmware: arm_ffa: Add missing remove callback to ffa_bus_type
      firmware: arm_ffa: Fix __ffa_devices_unregister

 drivers/firmware/arm_ffa/bus.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
