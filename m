Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28FEC48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 22:25:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7469611C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 22:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7469611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTB5plJK1PKcwJ9JL2dEMLCR3ng84wIIJWh2KwLKTBM=; b=PTmzI1zrwd0Utv
	5yOJxHlLMxYzsgxPFBHkLrlEbBfUiKXOEbODtNKWOldubdTNr3nPEjCld3wi0pHX8Wg7e7c0jlpT+
	Cl9FbJUXAhTQgZ5Tiv67oNR5U3MhPwDUZp8esP6ROoghpLb8W+vXXq1J2PpkMUiwgDmu0o6wrSsnH
	yZdqrbK+aG677VHsSQkiUVsTBIkiikebAi0tzAlesRTo2NZoc4erSijJgcECEXd91uSpos4Nbn++m
	1iXpQkgZnQUkSCTT367s7VEgRxvclbk0yoFlX87awiHSIeu3fAASnu//Dox4lKA7eVrPs+IsHOPNK
	bJMD3RNIveVEcZ/5zCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHT9-003Wws-IJ; Tue, 15 Jun 2021 22:23:39 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltFB4-002cPe-Sl
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 19:56:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31F31ED1;
 Tue, 15 Jun 2021 12:56:46 -0700 (PDT)
Received: from bogus (unknown [10.57.40.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D48AC3F694;
 Tue, 15 Jun 2021 12:56:44 -0700 (PDT)
Date: Tue, 15 Jun 2021 20:56:25 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210615195625.ldjq2poav5yg76aa@bogus>
References: <20210601095838.GA838783@bogus>
 <20210614170856.rs7jrke3gvpmu4km@bogus>
 <20210615152149.GB11724@lx2k>
 <20210615153430.qslynmqo5urwfugt@bogus>
 <20210615164724.GA6312@lx2k>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615164724.GA6312@lx2k>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_125651_085440_30F65A78 
X-CRM114-Status: GOOD (  45.17  )
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
Message-ID: <20210615195625.pgZPIhL2D9mYpuyw_gDSZCgqnpAvKzVIpLFourqGc3M@z>

On Tue, Jun 15, 2021 at 09:47:24AM -0700, Olof Johansson wrote:
> On Tue, Jun 15, 2021 at 04:34:30PM +0100, Sudeep Holla wrote:
> > Hi Olof,
> > 
> > On Tue, Jun 15, 2021 at 08:21:49AM -0700, Olof Johansson wrote:
> > > Hi,
> > >
> > > On Mon, Jun 14, 2021 at 06:08:56PM +0100, Sudeep Holla wrote:
> > > > Hi Olof,
> > > >
> > > > On Tue, Jun 01, 2021 at 10:58:38AM +0100, Sudeep Holla wrote:
> > > > > Hi ARM SoC Team,
> > > > >
> > > > > Please pull !
> > > > >
> > > > > This is a new driver pull request. One of the arm64 patch is being
> > > > > pulled from a stable arm64 branch for-next/ffa as the other patches
> > > > > are dependent of the same.
> > > > >
> > > > > Background
> > > > > ----------
> > > > > This has been on the list for almost a year now with changing requirements.
> > > > > Initially Arm KVM wanted to use this via userspace interface in VMM to
> > > > > communicate with VMs. But it was later dropped in favour of arch-agnostic
> > > > > interface[1].
> > > > >
> > > > > Also there was some discussion on the dt-bindings which was dropped
> > > > > completely. Though we need to workaround the lack of full discoveribility
> > > > > in v1.0 spec, it is now being fixed for the next version of the spec.
> > > > >
> > > >
> > > > I see that you have pulled quite a lot of drivers and other SoC code
> > > > including my scmi and juno ones that were sent more recently than this
> > > > one. Just thought of checking if this is still in queue ? Sorry for the
> > > > nag but this has been on a list almost a year. We missed v5.13 due to
> > > > DT binding controveries(for good reasons) and we really don't want to
> > > > miss v5.14
> > >
> > > I held off because I wanted to spend a few cycles on looking into it before
> > > blindly merging it.
> > >
> > 
> > Sure, just wanted to make sure it was in your list.
> 
> Yeah, thanks for the ping. Whenever we miss something we almost always say:
> "But you didn't ping us?!". You did, and it'd be awfully bad signaling if we
> somehow got upset by it if we want people to do it more often.
>

Understood, I generally ping observing the pattern of pull requests being
merged. Initially I thought you might be in LIFO mode but then observed
you had even merged other PR around that date. So thought of checking and
I do understand I don't want to annoy repeating that too much. It rarely
happens but once the PR got marked read/done accidentally.

Also the main reason for nagging on this particular one is it missed v5.13
and would help if it lands in upstream for "earlier" adoption(mostly dependent
on android though).

> > > Are there any implemented users of this (on either side) today? We normally
> > > don't merge a framework in the kernel without having at least one user of it
> > > also available.
> > >
> > 
> > Fair enough.
> > 
> > Yes, OPTEE patches are on the list[1]. Just to avoid complexity in merging
> > Jens(OPTEE maintainer) held it off for next cycle allowing more time. But we
> > have been testing all the versions of this driver posted on the list with
> > OPTEE. There are other users too but they need userspace interface which
> > is still work in progress.
> 
> Ok, thanks for that! Ideally, having that in the tag, i.e. also in cover letter
> for patch set would have avoided this round trip next time. But thanks for that
> detail.
>

Agreed, it seem to have missed throughout. I just used to mention that it is
tested with OPTEE in each revision but never referred back to the series as
it was always catch with OPTEE, every time I revised, OPTEE needed to rebase
and I couldn't share something ready. My bad, may be we never synchronised
our work that well. Point taken for any such future dependencies/references.

> I'll queue this up shortly.
>

Thanks for that, much appreciated!

-- 
Regards,
Sudeep

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
