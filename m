Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B0BC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 19:02:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C50164EC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 19:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C50164EC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uZsSzn8nwGmbAODTmv38eLMQZme8QBjuAVt6+pb0MF0=; b=v4gzzYMTOpHsF9ZyfMDiCsZBC
	P2kklD/QARcdSY2nrZEpm0dl/ocUdK3nsfkIi/BgOgENSvBQ65vSV/62znaEo3+zVhk0H7P5G0w39
	tniwrE4/vG08LBJfNtNmnyyyfyr+OLc1495+/7UXVJYWy+TZVQ/nVuTp2/YfRb6nbJgS0grPzK1GA
	BR2x/+1CZuswUKmW8YFrG0KqZFSVx7nm+ZHq/cd9xcHmBO3rV+L4Fa7e8oHMeq4qeAFpbwNI+vEJW
	KbhX78OwKZ3RG/GLSJiUCF9fSw6iCLxwtx4NijppgAlK0BP/OvXADpbO0oOTEfZ4wk5bGEb/1oDpd
	6UaZ80RKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70vS-0000ne-HC; Tue, 02 Feb 2021 19:01:22 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70vQ-0000n8-5i
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 19:01:21 +0000
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
Subject: Re: ARM: dts: mmp devicetree updates
Message-ID: <20210202190106.GA368014@demiurge.local>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
 <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
 <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
 <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_140120_318529_14CC9B71 
X-CRM114-Status: GOOD (  19.54  )
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
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202190106.juJpg9GXi1Btn-MtpNfTxQIq2uc1yjrRvBplVWR8JAw@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
