Return-Path: <SRS0=2Xr5=JZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D33C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Apr 2021 09:34:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E620961424
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Apr 2021 09:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E620961424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awBngGNHJZiKccdDoaoCHp31Fj9u0mO/8ohvT/6aWIE=; b=ZpgQgAhZRaywoUebqbsHoN4syt
	e1LXQx8rWwXgMWscTPNuUvTtsczmUt9aFiuiEKKyDJDDgXQDI1QXBfVWj/sIKTSsYvayD+0AyOarm
	khuMey3W1f8o1CwfzaChFbVkLeAe1lUTMnFP9EImyeHJjN7Ff53vYQuoh93ki2mk8JLs4zM59fCnX
	mBC3Jws4oCZ4ojNcJN1YxiKMYqChOXz3CDj7j+4+onZngqMGW3COy8oMyZqpiZ5G0sdiI2xWyQNxT
	s61q0h7oeJ49/t2fNer9zviTEUtqAcbHQ3RfRsVjiLLldUyfSYk480sC44+ZyDXZi3FezeF4lKV1p
	bFk5zoRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbgYC-003CdD-O0; Wed, 28 Apr 2021 09:32:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbgY9-003Ccy-OI
 for linux-arm-kernel@desiato.infradead.org; Wed, 28 Apr 2021 09:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=f5gvvIOw3fhdCHB3xiA0nDoxXKeDKbu9kbWHNzkHVo8=; b=Hqi2nLMJzjPckSYdLy8YEjot9J
 ALOiugv5gsvhL1TaMxJYgRmGAlQh3oG8BrADs7gFZcnWGMvqRYWuxbbGnNVx0kN779z2wYPvkZncA
 OFef1Rb/n5Vf5VlcKbperDCIVlStkB1E/dmohBMPuWnZbnzx3ZlQo6RpYIoUMDvr1uGpXHdwbFMbR
 WmyME2SoDiCdZWV7MMkVYJIhsfpjG8XHo+rNXSuwcKenN7TnzSfw4dPGvocHfin/veM8dGv26Z+68
 2hgIuvbdzXzGoc19CSt6MERJrhV90Du13GxLnV0wmZmDWa5UL43WmzFlPIwAVEadhkr+rHa/JviLY
 xllZs/kA==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lbgY6-00HJpc-QQ
 for linux-arm-kernel@lists.infradead.org; Wed, 28 Apr 2021 09:32:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B08DD6E;
 Wed, 28 Apr 2021 02:31:58 -0700 (PDT)
Received: from bogus (unknown [10.57.61.96])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 270543F70D;
 Wed, 28 Apr 2021 02:31:57 -0700 (PDT)
Date: Wed, 28 Apr 2021 10:31:48 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.13
Message-ID: <20210428093148.flrcowzr2dsj7byz@bogus>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_023202_950873_BC356178 
X-CRM114-Status: UNSURE (   7.90  )
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
Message-ID: <20210428093148.l8pVlkHua8DstsjPCMzjSnSjiujManK04rNRLH5YE4s@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit d4f9dddd21f39395c62ea12d3d91239637d4805f:

  firmware: arm_scmi: Add dynamic scmi devices creation (2021-03-30 16:35:16 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.13

for you to fetch changes up to 03f840c49207e8c125b3df8c29c13137c6675d42:

  firmware: arm_scmi: Remove duplicate declaration of struct scmi_protocol_handle (2021-04-27 11:57:26 +0100)

----------------------------------------------------------------
ARM SCMI fixes for v5.13

A fix for very old possible ternary operation sign extention bug in the old
ARM SCPI firmware driver and a cleanup to remove duplicate structure declartion
in SCMI driver.

----------------------------------------------------------------
Dan Carpenter (1):
      firmware: arm_scpi: Prevent the ternary sign expansion bug

Wan Jiabing (1):
      firmware: arm_scmi: Remove duplicate declaration of struct scmi_protocol_handle

 drivers/firmware/arm_scmi/notify.h | 2 --
 drivers/firmware/arm_scpi.c        | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
