Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08699C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:37:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA6C64E04
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA6C64E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DFfV0j9mOjFB4SasCE+H/pAzRIOlIVKyLN0dPtUDjvo=; b=VhLoBZif7uq6bRbKnr5XtnQBh
	eZlXY4NOc18qQLd5WA6xAYuPrXBx+jsjUERouW2ROsE3q4i9NUz7kpZlWtS+MEU/9Qm57S3/Q4V0a
	3ejyFOOp3vKHushKA0gvNxRUS59npFemEMvet2WF+DrxPqrm/Tej59IIL3FsRe/3xsGw5TPsGC03m
	Aky40b2jyTR+Ha9+MnAjaXOIgX43CjIe32S4d6otiRYuwJlxDFGSHUYMv5/zxY8t6ZJ5If1LQbo58
	CweyoCihmEQxHbjwlhzmsCyOtnpm/Z3fLNDDl++tgAXragOknvZGJfbci7oh+DPdTchq5TaoeCHEj
	+5NvEeVMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oXn-0001wf-FY; Sat, 30 Jan 2021 11:35:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oWS-0001S4-9T
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:34:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B91164E10;
 Sat, 30 Jan 2021 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006475;
 bh=zL/su9NPauJa4Z+FU/FgaGL04PE6Ac/RyR8L45UZm4I=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M5VGUJNFWoHd1afm+sUzEOVcMV1nfSAT0Zt+toOfLaypCnu+jtiju8Ds44QxGSEBA
 /UKi4idmHX68vdr35t3/0F4hRkAdCjvCyF85Pid4iU1dcQCP/9hC7GrlA4hKvy32m+
 Exv/TuXBYIpvpv0LTWN6xYjbUY3efxzEgRqnuQiDKqZ2AcSm9DjsYM3laSSac2Jy3F
 bsTodDnPN/lWIV2PvYMiJL1dE18Fog3lTbDVCNeTX6qfN+8AyNLmXihF0DNqX4w6GO
 pxpvsd+yJqz3zO7eydMCJxY8zFS17Y7oy6SU/pAhggUjdQ174PL+Fkz82DbAbFF/JL
 ZNOxcqFUDMFhA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Wei Xu <xuwei5@hisilicon.com>, arm@kernel.org, soc@kernel.org
Subject: Re: [GIT PULL v2] arm64: dts: hisilicon dts updates for v5.12
Date: Sat, 30 Jan 2021 12:34:15 +0100
Message-ID: <161200641651.2316427.9644464780006221528.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <6013D1C7.90902@hisilicon.com>
References: <6013D1C7.90902@hisilicon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063437_085545_254E3C94 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@kernel.org>, salil.mehta@huawei.com,
 Tangkunshan <tangkunshan@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
 "Leizhen \(ThunderTown\)" <thunder.leizhen@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, john.garry@huawei.com,
 linuxarm@openeuler.org, shameerali.kolothum.thodi@huawei.com,
 huangdaode <huangdaode@huawei.com>, jonathan.cameron@huawei.com,
 olof@lixom.net, liguozhu@hisilicon.com, zhangyi.ac@huawei.com,
 shiju.jose@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113415.xcCq8qhiKdQpmkX_C2I3fmGeltxUb4cYLwSlrsaAoa0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 17:13:43 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/dt, thanks!

merge commit: 0b9c5cdda98ca31b9e49ebcb667f4aa684789b04

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
