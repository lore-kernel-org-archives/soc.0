Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC6FC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:22:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59114610CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59114610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iE4yWf6RP0UG8Q952vucR/VJgRHxDaKbBZhYuACTndg=; b=HTndWH2E9ZnXtXIyz8Wjw9frX
	pBjd+BoXLDKwactEGrJe6sFnKyUpY3AnlQLSzNNjkZWfDsjEd4SZfAE7Bfbyofw5ZgmrnK2lPNKkq
	Rs3+d+ZcRMertswa+onY9dNix10ooVL7qcylYQcIIQgIJwyFKvA8eCbDyoZraL1oNq0z+sc0VYUYy
	pXxh/CBNEue1fgB/J4unqf+Q/OGA92MwylfAthZepsq/yf6sR01YKde1/taJckfd9zTZPvWH1Or+u
	AeABgyup5six2gwEDLZXx+zEN3y5p+7Ntoh+/imC9ltFkwmkwK4o6HDag5oVVs9q2eh3aZEaheNV6
	imlFznu9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3nC-00Aurb-BJ; Thu, 01 Apr 2021 20:19:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jU-00At7P-QS
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:16:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8763610EA;
 Thu,  1 Apr 2021 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308159;
 bh=9RH7iG3o3uUenCTrIvDL8kj/TD5cEDI6UioCY4zI9Tc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aElTdEihNHmcJJaOWZcH+oI0/Sl11gMXWr6QOehEoo1stztXMPx2n0Mx2DA0h4zHw
 9bakLlfxzCgz5M0Y3nU5YhKEheqb8Taks51LELmoDgR9nALsRiec8byLdHznsXrjCP
 EKnwnpFv86dnVlqfqAwcFxA6+F8a1EKGxXgAVfk2vYbTPz8cZkfEUUsUuIWQIZj5L7
 oxuot1Zzr0VNREMvBNfZ3/MTFDYE4l1Wbsir+RyXPUetwdy0S6/WdYpO4G+BodOiMF
 xF/mnaAXxMuwfnnO4JbAZZh6BF8h+fxgbpAG/hTRX/BtbVO0FU3laFwHlhKLcQUv/+
 8KAjuBM+qxRNw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Olof Johansson <olof@lixom.net>, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [GIT PULL] arm64: dts: juno: Updates for v5.13
Date: Thu,  1 Apr 2021 22:15:26 +0200
Message-ID: <161730808648.655497.9953607257021480984.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331100410.cenuhvpqoumvsk52@bogus>
References: <20210331100410.cenuhvpqoumvsk52@bogus>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211601_355647_134A5751 
X-CRM114-Status: UNSURE (   5.99  )
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
Message-ID: <20210401201526.DISMUgGv5PX0Amkf2t4KS7odL3v5zz0CYD_PysX-jXg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 11:04:10 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 45f174d8a13cd877034189628f6b00bf30c832c6

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
