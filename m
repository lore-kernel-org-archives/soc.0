Return-Path: <SRS0=aUBr=HE=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E51C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:13:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3652364F50; Tue,  2 Feb 2021 17:13:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D6D64F4B;
	Tue,  2 Feb 2021 17:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D6D64F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nm@ti.com
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
List-Id: <soc.lore.kernel.org>
CC: <arm@kernel.org>, <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd
 Bergmann <arnd@arndb.de>, <linux-kernel@vger.kernel.org>,
        Tero Kristo
	<kristo@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL 1/2] MAINTAINERS: Update to TI maintainer for v5.12
Message-ID: <20210202171351.qhnzxvakptfbyocv@coach>
References: <20210130131411.afna4wj72r7xscqn@skinny>
 <161228438414.1848830.8600684869682893491.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <161228438414.1848830.8600684869682893491.b4-ty@arndb.de>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

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
