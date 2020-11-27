Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF551C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 10:01:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5427C221F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 10:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GL1oG+Cr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5427C221F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=syCjZF7jBDuUaygXBnwQIFJis++Zn6vfox+pv2iJTew=; b=GL1oG+CrT5z5cE0sqtfqtBznV
	550bl06C6N6q6W8G+DY8E7DbkMdS4Oe6Wlk956U060gMALsEZpn5u3J56SXfGfiKFhhggKbuaZlrr
	zL973dlTVYCNnlmgM9lvywEb71z9O/0gY3MtDpPasRr1cjuw3MRuwH4CG2xEIFOl7eCz/saSE6W1B
	WaO/vt4NB/qjCubgIMoMco6mhuryfWkz+CiWuEk4ZlGkQJISHaBNqaFIfnFcOohDt9lehClibyb88
	EAXEvGaKGINr7dCx3PoFgll93s/q1EZuhLesT3rnMQRMjMI1j77jE7WyTr7Yr8+TjsSQSWpOXpdkF
	Hpv/4IuQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiaY8-0002oV-Bw; Fri, 27 Nov 2020 10:00:20 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiaY5-0002nt-TG
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 10:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 525F81478;
 Fri, 27 Nov 2020 02:00:15 -0800 (PST)
Received: from bogus (unknown [10.57.59.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF5B73F71F;
 Fri, 27 Nov 2020 02:00:13 -0800 (PST)
Date: Fri, 27 Nov 2020 10:00:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.11
Message-ID: <20201127100007.iu657u63jnoeg6g2@bogus>
References: <20201124122412.22386-1-sudeep.holla@arm.com>
 <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_050018_001484_63E39AB3 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>,
 Olof Johansson <olof@lixom.net>, ALKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127100007.CWc11mvdfKeMxKw9RSwwYTJPO_PIZM-KkLQQQGo2NC8@z>

On Thu, Nov 26, 2020 at 09:54:50PM +0100, Arnd Bergmann wrote:
> On Tue, Nov 24, 2020 at 1:24 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > Hi ARM SoC Team,
> >
> > Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
> > the fixes that got merged in -rc2.
> 
> Is there no way to avoid this? I would really prefer not to have to backmerge
> rc2 into my existing branch if it's just about the bugfix.
> 
> I tried rebasing your branch onto -rc2 and only got a trivial conflict
> in one line, and even that could be avoided by merging in your
> bugfix branch instead of the whole -rc2.
> 

Unfortunately the branch/tag I shared with Mark Brown to merge the voltage
regulator part is also based on -rc2. I might have to drop those patches
from this pull request if I need to rebase on -rc1. If that's OK, I can
send fresh/new PR based on -rc1. Sorry for the trouble.

-- 
Regards,
Sudeep

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
