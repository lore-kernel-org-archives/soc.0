Return-Path: <SRS0=AlPT=RC=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38640C433EF
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B93CC36AE1; Fri, 17 Dec 2021 16:21:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFD33C36AE8;
	Fri, 17 Dec 2021 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BFD33C36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BHGLXMH109339;
	Fri, 17 Dec 2021 10:21:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639758093;
	bh=7TFk+Jo+hYAoWuken2wPSgGAPJSwXULaTRNoWUJ3rVo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=foWh7KESAPmrj9VRg8R1tqUPYMv8Cy/P0Fl8XvPdqobfiWj5Nn3M8Kj6KN0zku9V2
	 dUrymNKNuH+6ueR5logiVUmr1X0rqkIAumjJZAtrvpn/CNnC3Ljxsn8+W3rq6siPvy
	 dE+5Qkd3VEd4y1HZquBEKqA7kG7/wrOwDUJF1j1I=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BHGLXME099912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Dec 2021 10:21:33 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Dec 2021 10:21:33 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Dec 2021 10:21:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BHGLXNg115796;
	Fri, 17 Dec 2021 10:21:33 -0600
Date: Fri, 17 Dec 2021 10:21:33 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Olof <olof@lixom.net>, SoC <soc@kernel.org>, arm-soc <arm@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony
 Lindgren <tony@atomide.com>
Subject: Re: [GIT PULL] soc: Keystone driver update for v5.17
Message-ID: <20211217162133.5a2vzsjvsdabnk6a@puppy>
References: <20211217154921.cagzppcensxx6wm4@pension>
 <20211217160007.etfr5urg76j2n5sf@reissue>
 <CAK8P3a0nPN=e1QaLPaf5TLJgj19SE5OQ2D3YWM2KepM6r+oh7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a0nPN=e1QaLPaf5TLJgj19SE5OQ2D3YWM2KepM6r+oh7Q@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 17:10-20211217, Arnd Bergmann wrote:
> On Fri, Dec 17, 2021 at 5:00 PM Nishanth Menon <nm@ti.com> wrote:
> >
> > On 09:49-20211217, Nishanth Menon wrote:
> > > The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> > >
> > >   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-fixes-for-v5.17
> >
> >
> > uggh.. Could have been tags/ti-driver-soc-for-v5.17 mostly fixes threw
> > my thought off a bit there.. - Do let me know if you folks prefer it
> > as ti-driver-soc-for-v5.17 instead of ti-driver-soc-fixes-for-v5.17
> > and I can retag and respin the PR..
> 
> I don't care about the tag name. However, if any of the patches qualify
> as bugfixes that make sense in 5.16, please split up the branch into fixes
> and new work and send them separately.

There are minor fixes and does'nt make sense for 5.16. So, just this PR
for 5.17.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
