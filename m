Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B164C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 17:12:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A0C86109E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 17:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A0C86109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GmSw73RM5UEWN1x2lkIiZ5TDSA4naNbeDpL6JOc08w=; b=fNONXzPVLJs5+z
	ON7EmOKIthGeBVbX03Yju6EqmiBqkmiglW+L0iIWFi2JVrysVWx3rMiCViWz0ZLhRKoB2mdrC1pon
	970sanawahljE+6mrsy+nxFOb9aNO9a4DofsRaFyPv5+tVcbxXggn0+1N+ssQ25GkELkdD491yO0r
	Xzdco2Z+yUna5BZdJ4gc7nRRVSyfN5t4kDWfOmmzCM9BMNUuFM5oPnyHlFWsF892nlflh1ICATrPH
	jws47BvL66D6qGan79Sikf/9oYLZLC6qIiCFzJ51+alq8keNjRuMxpdFUoMGFgD3LoAGjjYPKcnLk
	5hw6dN8sl00cndGXFNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsq6C-00FKk1-Ho; Mon, 14 Jun 2021 17:10:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsq5Q-00FKQh-Sc
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 17:09:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789181FB;
 Mon, 14 Jun 2021 10:09:17 -0700 (PDT)
Received: from bogus (unknown [10.57.42.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974BC3F70D;
 Mon, 14 Jun 2021 10:09:15 -0700 (PDT)
Date: Mon, 14 Jun 2021 18:08:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210614170856.rs7jrke3gvpmu4km@bogus>
References: <20210601095838.GA838783@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601095838.GA838783@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_100921_005328_2C23FAB3 
X-CRM114-Status: GOOD (  18.94  )
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
Message-ID: <20210614170856.9WidlIIfsHsLjRgEZnYuosFRb-ivu7h3F8TNHgBTFVI@z>

Hi Olof,

On Tue, Jun 01, 2021 at 10:58:38AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> This is a new driver pull request. One of the arm64 patch is being
> pulled from a stable arm64 branch for-next/ffa as the other patches
> are dependent of the same.
> 
> Background
> ----------
> This has been on the list for almost a year now with changing requirements.
> Initially Arm KVM wanted to use this via userspace interface in VMM to
> communicate with VMs. But it was later dropped in favour of arch-agnostic
> interface[1].
> 
> Also there was some discussion on the dt-bindings which was dropped
> completely. Though we need to workaround the lack of full discoveribility
> in v1.0 spec, it is now being fixed for the next version of the spec.
> 

I see that you have pulled quite a lot of drivers and other SoC code
including my scmi and juno ones that were sent more recently than this
one. Just thought of checking if this is still in queue ? Sorry for the
nag but this has been on a list almost a year. We missed v5.13 due to
DT binding controveries(for good reasons) and we really don't want to
miss v5.14

-- 
Regards,
Sudeep

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
