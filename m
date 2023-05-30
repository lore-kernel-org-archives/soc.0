Return-Path: <SRS0=qzql=BT=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E7BC77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 08:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E21CC433A0; Tue, 30 May 2023 08:43:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 833D2C4339C;
	Tue, 30 May 2023 08:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 833D2C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C80D3AB6;
	Tue, 30 May 2023 01:44:13 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D600F3F663;
	Tue, 30 May 2023 01:43:26 -0700 (PDT)
Date: Tue, 30 May 2023 09:43:24 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, shawnguo@kernel.org,
	arnd@arndb.de, krzk@kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, soc@kernel.org,
	wanghuiqiang@huawei.com, tanxiaofei@huawei.com,
	liuyonglong@huawei.com
Subject: Re: [PATCH v2 1/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
Message-ID: <20230530084324.m47xvpqrga6tegpd@bogus>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230522072211.8894-1-lihuisong@huawei.com>
 <20230522072211.8894-2-lihuisong@huawei.com>
 <20230523093922.f2y4wrz3vkzi7kmw@bogus>
 <b29eab0c-4084-0e91-3e31-7f7c264ad629@huawei.com>
 <20230525073539.waaa7wpudohullcg@bogus>
 <5e0d81c8-5f52-82e5-5509-785e87a9a17e@huawei.com>
 <7852a2b4-b601-f4e8-bc5f-7b1bc9d9dc69@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7852a2b4-b601-f4e8-bc5f-7b1bc9d9dc69@huawei.com>

On Tue, May 30, 2023 at 10:53:38AM +0800, lihuisong (C) wrote:
> Hi Sudeep,
> 
> 
> 在 2023/5/25 16:12, lihuisong (C) 写道:
> > 
> > 在 2023/5/25 15:35, Sudeep Holla 写道:
> > > On Thu, May 25, 2023 at 10:41:51AM +0800, lihuisong (C) wrote:
> > > > Hi Sudeep,
> > > > 
> > > > Here, the interface is used to determine whether a port is in use or
> > > > enabled.
> > > > If we just use 'status', it cannot inidicates its own meaning by name.
> > > > What do you think?
> > > > 
> > > How about "port_status" or "port-status" ?
> > The meaning of this status is a little board.
> > How about 'enable'? just a read-only entry.
> > 
> > 
> "using_status" --> "enable" ? What do you think?
> Its original purpose was to determine whether a port is in use or enabled.
>

That's fine. The main point I was trying to make is plain "status" or
"using_status" is prone to conflict as you have ports, lanes, ...etc.
Adding "port_" to the name whatever you choose is better.

-- 
Regards,
Sudeep
