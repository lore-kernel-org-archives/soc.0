Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3734C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 17:28:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2768B20756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 17:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTODdLzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2768B20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SunHnMvsczcluQ2uI7n6qKmh/NrL1Fm8exHrq5MELCE=; b=rTODdLzpiCm8H9JrEpPy+tX5O
	1FdziK0Vpf6lfIxfUxeWGzxga1oVFIYsr0DcDF2WWJKrp+QB6MZm56WhUca6xjgIe6QYiXUDqU7TN
	3PDYMCnuZhPskRJUgqv4sH+hplp/xOXRJiK0BJp0p2n4TnvcYFxMjm/6xrRcMcCmR7DCPOtEO1TTD
	6Tudw97ry4e4S1w0GujrxFL6jCf1dkZ3iUlvqoPFj43YdWkAr/8KQPgDUFNTRBBpNLLpg+021I7s3
	pJXGb3GK99XpRX5HqjXu6um26zvB03sWRHFKPbbHr14/yDC6MNjxPVaAO7AGwfMssk3YpWOqj1Ki3
	uW6KcJexQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khFco-0002AG-0E; Mon, 23 Nov 2020 17:27:38 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khFck-00029Y-2z
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 17:27:34 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id E239D809F;
 Mon, 23 Nov 2020 17:27:36 +0000 (UTC)
Date: Mon, 23 Nov 2020 19:27:26 +0200
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: ti: Enable networking
 options for nfs boot
Message-ID: <20201123172726.GQ26857@atomide.com>
References: <20201030124650.20349-1-grygorii.strashko@ti.com>
 <20201116090429.GB26857@atomide.com>
 <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_122734_175698_10A5F4FA 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Nishanth Menon <nm@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123172726.ohdE_m_WbV7xkYklJFsJk3QE_EQAhuINWk85JbrQgjA@z>

* Arnd Bergmann <arnd@kernel.org> [201123 16:55]:
> On Mon, Nov 16, 2020 at 10:04 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Grygorii Strashko <grygorii.strashko@ti.com> [201030 14:47]:
> > > Enable networking options required for NFS boot on TI platforms, which is
> > > widely for automated test systems.
> > > - enable new TI CPSW switch driver and related NET_SWITCHDEV config
> > > - enable TI DP83867 phy
> > > - explicitly enable PTP clock support to ensure dependent networking
> > > drivers will stay built-in.
> > >
> > > vmlinux size changes:
> > > - before:
> > >    text       data        bss        dec        hex    filename
> > > 14703736    8024602     444976    23173314    16198c2    ./omap-arm/vmlinux
> > >
> > > - after:
> > >    text       data        bss        dec        hex    filename
> > > 14727271    8029150     444528    23200949    16204b5    ./omap-arm/vmlinux
> > >
> > > diff: 27635 (dec)
> >
> > Thanks applying into omap-for-v5.11/defconfig.
> 
> Oops, I just applied it as well (as it was sent to soc@kernel.org it appeared
> in patchwork) and I  noticed too late that you already had it.
> Should I remove it at my end, can you just drop your copy?

Sure no problem, I'll drop my copy.

Regards,

Tony

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
