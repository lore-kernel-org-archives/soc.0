Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C013C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 15:53:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14DA323888
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 15:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14DA323888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xn+cuOHxRp5TrFKIbR9LqvphYCgg0zl9XDiuBUrbNus=; b=aUFYmEK5zkJMIRurC8xBZktf9
	RhtlrZbxYFTWXZqNaLgxuQE6JC/RAhpCGDkD3JkBwuRtDI7oDG+8fmKnjdpHCxWF68ukptdNDHyca
	TCIHWFr5XhSScOA5GlBAt2InYWVJnyfW2ACWbI0jsxnbK6b7bgX2rjS57L0mYoImfiN/eOKfLFsyg
	KnXJPvhDHvA9fpcoid1ooLPt9sWIceJOMqiEImxBDoXuKvaStr1hTSMIRCYaOmwbBPOeD3o13mKxC
	7XFrrsrIaGZ5ui+gZigWEoWtV7xV+uEWrlzEVPShQpgzhsD+FeB4FpdMMmgfDk4qUSFGj1LPoytbw
	VW+lHCFXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxu3G-0007KT-T0; Fri, 08 Jan 2021 15:51:47 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxu2s-0007Jt-MS
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 15:51:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E07ED1;
 Fri,  8 Jan 2021 07:51:14 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1040C3F70D;
 Fri,  8 Jan 2021 07:51:12 -0800 (PST)
Date: Fri, 8 Jan 2021 15:51:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Message-ID: <20210108155110.GC84941@C02TD0UTHF1T.local>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_105122_809925_922F667F 
X-CRM114-Status: GOOD (  17.52  )
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
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108155110.alH64ShFmD4-q_VP5Hgw2ulQ1dh4Y1l3HZ5ASQ4QQdY@z>

On Fri, Jan 08, 2021 at 03:23:23PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 8, 2021 at 1:54 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > As a general rule, we avoid the use of IMPLEMENTATION DEFINED features
> > in Linux, as they pose a number of correctness/safety challenges and
> > come with a potentially significan long term maintenance burden that is
> > generally not justified by the features themselves. For example, such
> > features are not usable under virtualization (where a hypervisor may set
> > HCR_EL2.TIDCP, or fail to context-switch state that it is unaware of).
> 
> I am somewhat less concerned about the feature being implementation
> defined than I am about adding a custom user interface for one
> platform.

I completely agree that adding a custom interface that's platform
specific is undesireable.

> In the end, anything outside of the CPU core that ends up in a SoC
> is implementation defined, and this is usually not a problem as long
> as we have an abstraction in the kernel that hides the details from
> the user, and the system is still functional if the implementation is
> turned off for whatever reason.

I think that peripherals and other bits out in the SoC are quite
different to things built into the CPU, where there's inevitably most
significant and subtle interactions with the architecture, and can be so
closely coupled as to not have a good point to apply abstraction. We
have common ways of abstracting storage devices, but the same is not as
true for userspace instructions.

Thanks,
Mark.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
