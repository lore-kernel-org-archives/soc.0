Return-Path: <SRS0=Ovyi=AQ=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E525AC6FD18
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 11:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F38BC433A0; Tue, 25 Apr 2023 11:24:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D94A6C433EF;
	Tue, 25 Apr 2023 11:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D94A6C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 161EF4B3;
	Tue, 25 Apr 2023 04:24:50 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59D923F5A1;
	Tue, 25 Apr 2023 04:24:04 -0700 (PDT)
Date: Tue, 25 Apr 2023 12:24:01 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	shawnguo@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
	soc@kernel.org, wanghuiqiang@huawei.com, tanxiaofei@huawei.com,
	Sudeep Holla <sudeep.holla@arm.com>, liuyonglong@huawei.com,
	huangdaode@huawei.com
Subject: Re: [PATCH] soc: hisilicon: Support HCCS driver on Kunpeng SoC
Message-ID: <20230425112401.d4oggwwrzdgnnss7@bogus>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <faa32ce0-00cd-d24c-f505-beb637904af1@kernel.org>
 <edef5e7f-2d5c-d79a-1ac6-286299fb0f8c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edef5e7f-2d5c-d79a-1ac6-286299fb0f8c@huawei.com>

On Tue, Apr 25, 2023 at 11:16:32AM +0800, lihuisong (C) wrote:
> Hi Krzysztof,
> Thanks for your review. My reply is as follows.
> 
> 在 2023/4/24 16:42, Krzysztof Kozlowski 写道:

[...]

> > Maybe leave a comment that all these are ACPI-only and are not allowed
> > in DT usage. Without bindings we are not going to review them. OTOH, I
> > think we don't have a process for such cases in general.
> Thanks for your suggestion. will add it.

Please look at my response and continue the discussion as why _CRS can't
be used[1] before you add any DT bindings. I would prefer to avoid any
DSD style properties especially if it is used only in ACPI.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20230425103040.znv66k364ant6klq@bogus/
