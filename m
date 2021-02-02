Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E203C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:15:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 421EA64ECE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 421EA64ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uftMCf5PlvPLhsfyFTXZClaV8hL38DcguepifAiVd70=; b=T5w6G7QZceJeYB+wi/2YaHKwE
	+IHeh/Dcu7rgy74ipe7vRQqkLDizLLOx+hUBXrKW8EHc2daFTgexCD891CBqrJCxCpYc5dAyBgRNK
	fqyHKDyimvGoiqCJKzWX/LRuf1IJqJpqOOzQZnphXl2PnZ9kfcMgnrdIvhjrY62G0OkrOFrl9gGZW
	utoCOOL+mboaET6ILDjZ2IP9fNGCJQyitdBJQHaC70RULtgwr+SxrmJYk+P1B9a2mQ0KEST816PMe
	ai+ONOnEWpRNBvWxsOMegFi3MRLJ0okYJthk1IuJ+i5Jy93fQZg/RQ3yHWT1PAryTICjGtBaYiIl5
	EFPbkKnJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zFd-0004iu-QG; Tue, 02 Feb 2021 17:14:05 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zFW-0004fi-Lc
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:14:02 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 112HDqOb004710;
 Tue, 2 Feb 2021 11:13:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1612286032;
 bh=0GZnBlsOkIAfjlHvw1T+IMeqbm+/Fp8bDPjTo2hjuDs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Ra8W66MYl0TlPXojJYJRm1TR63LmE1LYpFMwPYm6xPmVYP3hTyuBLH4kw90SkTlrY
 hbr+pxs2hVaL0BogygW6yDCvwzO2EVM3nwTn/xP/ax6A9ChE4e/v4o6dxQXCgpx7pF
 2nTxPK/JDg0GjH1Y44XcBrRNIlH/o333VnXMdezg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 112HDqBx120507
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Feb 2021 11:13:52 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Feb
 2021 11:13:51 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Feb 2021 11:13:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 112HDp2N007407;
 Tue, 2 Feb 2021 11:13:51 -0600
Date: Tue, 2 Feb 2021 11:13:51 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL 1/2] MAINTAINERS: Update to TI maintainer for v5.12
Message-ID: <20210202171351.qhnzxvakptfbyocv@coach>
References: <20210130131411.afna4wj72r7xscqn@skinny>
 <161228438414.1848830.8600684869682893491.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161228438414.1848830.8600684869682893491.b4-ty@arndb.de>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121359_671183_B02ABE40 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, soc@kernel.org, arm@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171351.nm4RETRGalhAAoVRaB3veZWAPTLshx3x_iOsk28Dxlg@z>

On 17:47-20210202, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Sat, 30 Jan 2021 07:14:11 -0600, Nishanth Menon wrote:
> > Please pull the following MAINTAINERS file update for v5.12 cycle. Made
> > sense to send via ARM path since the main PR path was for TI platforms.
> 
> This seems more appropriate to have in v5.11, I tend to fast-track
> maintainer address changes as bug-fixes so future emails reach the
> correct address.

Ouch, my bad. Thanks for the headsup, will keep this in mind if
(hopefully not), we need to do this in the future.

> 
> > The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> > 
> >   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> > 
> > are available in the Git repository at:
> > 
> > [...]
> 
> Merged into arm/fixes, thanks!
> 
> merge commit: 6102f9e700bb3fee2f37756514885e7b14a70ef6

Thanks.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
