Return-Path: <SRS0=ciMe=BO=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1AAC77B7E
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 07:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAEEFC4339C; Thu, 25 May 2023 07:35:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 37847C433D2;
	Thu, 25 May 2023 07:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37847C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A34F1042;
	Thu, 25 May 2023 00:36:29 -0700 (PDT)
Received: from bogus (unknown [10.57.96.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD4CD3F762;
	Thu, 25 May 2023 00:35:41 -0700 (PDT)
Date: Thu, 25 May 2023 08:35:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, shawnguo@kernel.org,
	arnd@arndb.de, krzk@kernel.org, linux-kernel@vger.kernel.org,
	soc@kernel.org, wanghuiqiang@huawei.com, tanxiaofei@huawei.com,
	Sudeep Holla <sudeep.holla@arm.com>, liuyonglong@huawei.com
Subject: Re: [PATCH v2 1/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
Message-ID: <20230525073539.waaa7wpudohullcg@bogus>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230522072211.8894-1-lihuisong@huawei.com>
 <20230522072211.8894-2-lihuisong@huawei.com>
 <20230523093922.f2y4wrz3vkzi7kmw@bogus>
 <b29eab0c-4084-0e91-3e31-7f7c264ad629@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b29eab0c-4084-0e91-3e31-7f7c264ad629@huawei.com>

On Thu, May 25, 2023 at 10:41:51AM +0800, lihuisong (C) wrote:
> Hi Sudeep,
> 
> Here, the interface is used to determine whether a port is in use or
> enabled.
> If we just use 'status', it cannot inidicates its own meaning by name.
> What do you think?
> 

How about "port_status" or "port-status" ?

-- 
Regards,
Sudeep
