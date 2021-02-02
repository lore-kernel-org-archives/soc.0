Return-Path: <SRS0=J7jw=HE=v3.sk=lkundrak@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A93C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 19:01:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CE64164F5F; Tue,  2 Feb 2021 19:01:18 +0000 (UTC)
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0626064EC1;
	Tue,  2 Feb 2021 19:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0626064EC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lkundrak@v3.sk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 511ACE0B0C;
	Tue,  2 Feb 2021 18:57:04 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 6kkDOWA5tmAl; Tue,  2 Feb 2021 18:57:03 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 84483E0B78;
	Tue,  2 Feb 2021 18:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FKeiKG_JfjRb; Tue,  2 Feb 2021 18:57:02 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
	by zimbra.v3.sk (Postfix) with ESMTPSA id 45753E0B0C;
	Tue,  2 Feb 2021 18:57:02 +0000 (UTC)
Date: Tue, 2 Feb 2021 20:01:06 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ARM: dts: mmp devicetree updates
Message-ID: <20210202190106.GA368014@demiurge.local>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
 <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
 <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
 <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>

On Tue, Feb 02, 2021 at 06:13:18PM +0100, Arnd Bergmann wrote:
> On Tue, Feb 2, 2021 at 5:41 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Fri, Jan 22, 2021 at 3:09 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > >
> > > > chained to this message is a handful of patches related to MMP device
> > > > trees and bindings. Please take a look and consider queueing them for
> > > > for 5.12.
> > >
> > > These all look good to me, but I notice that a lot of them seem to be
> > > bugfixes, so please have another look and decide if any of them should
> > > go into v5.11 and perhaps backported to stable kernels as well.
> >
> > Hi Lubomir,
> >
> > not sure if you missed my earlier mail. To clarify, I have not applied
> > any of the patches so far. Can you recheck if some of them should be
> > part of the v5.11 release so I know which tree to apply them to?
> 
> Nevermind, I just found your earlier reply in my spam folder. Applying
> the patches now.

Would you mind sharing why your spam filter decided to flag my message? (the
X-Spam* headers, if there's anything relevant there). I'm wondering if it's
possible other spam filters drop my messages for the same reason and if it's
something I could fix.

Thank you.

Lubo

> 
>          Arnd
