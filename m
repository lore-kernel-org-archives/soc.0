Return-Path: <SRS0=UCcl=TL=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A544AC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B9C2C340EE; Mon, 28 Feb 2022 15:08:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7C4EC340E7;
	Mon, 28 Feb 2022 15:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7C4EC340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21SF8rYG064262;
	Mon, 28 Feb 2022 09:08:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646060933;
	bh=kj1qA05v2AGqLoUp6CmooBJw+K7QqgiXXWeiU0iop18=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=P9vZEhgZQ0olwUCwg2K1aU7ORzLxaprkpGrV9JZCVKEnHMdeRzc87mJOGUIPag7Z8
	 wFYW0c96Yt4DN9hkcuOLYmyMEEURC2J8VCTSvVY7ZbXvwJcwlZwWKvYooQ0vobX0+/
	 5pte/wzDG/mV87PHN4iHcUhYGAb64XLYpmknhqOM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21SF8rP3027020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Feb 2022 09:08:53 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 28
 Feb 2022 09:08:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 28 Feb 2022 09:08:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21SF8rEV105074;
	Mon, 28 Feb 2022 09:08:53 -0600
Date: Mon, 28 Feb 2022 09:08:53 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team
	<soc@kernel.org>, Tero Kristo <kristo@kernel.org>,
        Linux ARM
	<linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [GIT PULL 2/3] TI K3 defconfig updates for v5.18
Message-ID: <20220228150853.fuymvwutymtkmswu@gondola>
References: <20220228120704.346bn5c56e53qylb@finless>
 <CAK8P3a1PW8afbjvsUNe2UHXBcQHxGXXPodYiK9AgfW-3tTQR0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a1PW8afbjvsUNe2UHXBcQHxGXXPodYiK9AgfW-3tTQR0w@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 15:41-20220228, Arnd Bergmann wrote:
> On Mon, Feb 28, 2022 at 1:07 PM Nishanth Menon <nm@ti.com> wrote:
> >
> > Hi ARM SoC maintainers,
> >
> > The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> >
> >   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v5.18
> >
> > for you to fetch changes up to 3bc04fba357a269f4b7ff824b146d82ad1ebf9de:
> >
> >   arm64: defconfig: Enable USB controller drivers for TI K3 SoC (2022-01-24 13:40:42 -0600)
> >
> > ----------------------------------------------------------------
> > TI K3 defconfig updates for v5.18
> >
> > * Enable USB modules
> 
> It looks like I had this one applied already from the 5.17 submissions. My plan
> was to drop it all, but it looks like I made a minor mistake here. As
> the contents
> are identical, I'll just keep the old version.

Thanks Arnd.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
