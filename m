Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3B6C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 19:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 982CB610A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 19:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 982CB610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1rDTysE5anJiornhhgFxneI6y4sY+NJC8QyuomXIbY=; b=K1/i/WmCB0gKxq
	+yILwcoF/Abrj3BW21dkNxxYbSV2YOXzd/b2I06i/EW//AfwJj+5imXhsF9zyA5QWwQEkj5AuD8Ty
	SG428Uth/A96cLRy2sSLjB5+/w5qfgpUmwq9daYsSO8jFy08KVijPFNJbnNytE0uLA+Lm+lB+FATi
	fyxmikKaXPXjlTpVnQy/jdFkYm9NQTad3LtECNJg1tnQ8LPgPubHUPwaP9+j2JM9kCR10YDUFVR1Y
	sPxnG/DuNcz1sqXrWjreCuanhwaMS0g890p9oKH0gXxJVj5r/aYUgagHfvpR2nlMU4se1oGhJkCQT
	APNDmrKjxL2LS89sf4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltF4F-002ZvN-LE; Tue, 15 Jun 2021 19:49:48 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltB5b-0010iE-UV
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 15:34:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D36DD6E;
 Tue, 15 Jun 2021 08:34:54 -0700 (PDT)
Received: from bogus (unknown [10.57.40.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAD153F70D;
 Tue, 15 Jun 2021 08:34:52 -0700 (PDT)
Date: Tue, 15 Jun 2021 16:34:30 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Arnd Bergmann <arnd@kernel.org>, Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210615153430.qslynmqo5urwfugt@bogus>
References: <20210601095838.GA838783@bogus>
 <20210614170856.rs7jrke3gvpmu4km@bogus>
 <20210615152149.GB11724@lx2k>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615152149.GB11724@lx2k>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_083456_072085_E0485B1A 
X-CRM114-Status: GOOD (  32.01  )
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
Message-ID: <20210615153430.c8ExFBcPdOxba3kIpK1wKDfv6rDx0q3HPdme78wyl0Q@z>

Hi Olof,

On Tue, Jun 15, 2021 at 08:21:49AM -0700, Olof Johansson wrote:
> Hi,
>
> On Mon, Jun 14, 2021 at 06:08:56PM +0100, Sudeep Holla wrote:
> > Hi Olof,
> >
> > On Tue, Jun 01, 2021 at 10:58:38AM +0100, Sudeep Holla wrote:
> > > Hi ARM SoC Team,
> > >
> > > Please pull !
> > >
> > > This is a new driver pull request. One of the arm64 patch is being
> > > pulled from a stable arm64 branch for-next/ffa as the other patches
> > > are dependent of the same.
> > >
> > > Background
> > > ----------
> > > This has been on the list for almost a year now with changing requirements.
> > > Initially Arm KVM wanted to use this via userspace interface in VMM to
> > > communicate with VMs. But it was later dropped in favour of arch-agnostic
> > > interface[1].
> > >
> > > Also there was some discussion on the dt-bindings which was dropped
> > > completely. Though we need to workaround the lack of full discoveribility
> > > in v1.0 spec, it is now being fixed for the next version of the spec.
> > >
> >
> > I see that you have pulled quite a lot of drivers and other SoC code
> > including my scmi and juno ones that were sent more recently than this
> > one. Just thought of checking if this is still in queue ? Sorry for the
> > nag but this has been on a list almost a year. We missed v5.13 due to
> > DT binding controveries(for good reasons) and we really don't want to
> > miss v5.14
>
> I held off because I wanted to spend a few cycles on looking into it before
> blindly merging it.
>

Sure, just wanted to make sure it was in your list.

> Are there any implemented users of this (on either side) today? We normally
> don't merge a framework in the kernel without having at least one user of it
> also available.
>

Fair enough.

Yes, OPTEE patches are on the list[1]. Just to avoid complexity in merging
Jens(OPTEE maintainer) held it off for next cycle allowing more time. But we
have been testing all the versions of this driver posted on the list with
OPTEE. There are other users too but they need userspace interface which
is still work in progress.

--
Regards,
Sudeep

[1] https://lore.kernel.org/r/20210527081404.1433177-1-jens.wiklander@linaro.org/

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
