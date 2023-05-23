Return-Path: <SRS0=NTGa=BM=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C055C77B75
	for <soc@archiver.kernel.org>; Tue, 23 May 2023 13:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15274C4339C; Tue, 23 May 2023 13:41:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id A356BC433D2;
	Tue, 23 May 2023 13:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A356BC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8DD7139F;
	Tue, 23 May 2023 06:42:24 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 400DD3F840;
	Tue, 23 May 2023 06:41:38 -0700 (PDT)
Date: Tue, 23 May 2023 14:41:35 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, shawnguo@kernel.org,
	arnd@arndb.de, krzk@kernel.org, linux-kernel@vger.kernel.org,
	soc@kernel.org, wanghuiqiang@huawei.com, tanxiaofei@huawei.com,
	liuyonglong@huawei.com
Subject: Re: [PATCH v2 1/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
Message-ID: <20230523134135.jkkhcwfihflp775m@bogus>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230522072211.8894-1-lihuisong@huawei.com>
 <20230522072211.8894-2-lihuisong@huawei.com>
 <20230523093922.f2y4wrz3vkzi7kmw@bogus>
 <928a893b-6596-8d40-ce0e-80059a363d11@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <928a893b-6596-8d40-ce0e-80059a363d11@huawei.com>

On Tue, May 23, 2023 at 07:57:42PM +0800, lihuisong (C) wrote:
> 
> 在 2023/5/23 17:39, Sudeep Holla 写道:
> > On Mon, May 22, 2023 at 03:22:10PM +0800, Huisong Li wrote:
> > > The Huawei Cache-Coherent System (HCCS) is a bus protocol standard
> > > for ensuring cache coherent on HiSilicon SoC. The performance of
> > > the application may be affected if some hccs ports are in non-full
> > > lane status, have a large number of CRC errors and so on.
> > > 
> > > This driver provides the query interface of the health status and
> > > port information of HCCS on Kunpeng SoC.
> > > 
> > > Signed-off-by: Huisong Li <lihuisong@huawei.com>
> > > ---
> > >   MAINTAINERS                          |    6 +
> > >   drivers/soc/Kconfig                  |    1 +
> > >   drivers/soc/Makefile                 |    1 +
> > >   drivers/soc/hisilicon/Kconfig        |   19 +
> > >   drivers/soc/hisilicon/Makefile       |    2 +
> > >   drivers/soc/hisilicon/kunpeng_hccs.c | 1287 ++++++++++++++++++++++++++
> > >   drivers/soc/hisilicon/kunpeng_hccs.h |  196 ++++
> > >   7 files changed, 1512 insertions(+)
> > >   create mode 100644 drivers/soc/hisilicon/Kconfig
> > >   create mode 100644 drivers/soc/hisilicon/Makefile
> > >   create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.c
> > >   create mode 100644 drivers/soc/hisilicon/kunpeng_hccs.h
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index eddbc48c61e9..fe0e796e8445 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -9399,6 +9399,12 @@ S:	Maintained
> > >   W:	http://www.hisilicon.com
> > >   F:	drivers/spi/spi-hisi-sfc-v3xx.c
> > > +HISILICON KUNPENG SOC HCCS DRIVER
> > s/HCCS/HCCS INFO or QUERY/ ?
> From the current features, what you suggest is suitable.
> But this driver will support to the setting feature.

Ah OK, I wasn't aware of that, in that case it is fine to keep it as is
and add comment about future feature expansions so that the name makes
more sense them. I assumed it is more a query interface.

I also assume the settings with just control performance and is fully
safe and stability of the system is taken care.

[...]

> > > +
> > > +/* PCC defines */
> > > +#define HCCS_PCC_SIGNATURE_MASK		0x50434300
> > > +#define HCCS_PCC_STATUS_CMD_COMPLETE	BIT(0)
> > I am not really sure if we keep duplicating this. I will try to cook up
> > a patch consolidating these.
> Yes, these info is better placed in a global header.
> Do I need to do this in this series?
> Or do not modify it, and then process all related code in your patch.

Fair enough, we can do that later. I don't want to block this for that reason.

-- 
Regards,
Sudeep
