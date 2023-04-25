Return-Path: <SRS0=Ovyi=AQ=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9C1C77B61
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 13:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EAD88C433A0; Tue, 25 Apr 2023 13:19:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id BD046C433D2;
	Tue, 25 Apr 2023 13:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD046C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2BA74B3;
	Tue, 25 Apr 2023 06:20:07 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 574FE3F64C;
	Tue, 25 Apr 2023 06:19:21 -0700 (PDT)
Date: Tue, 25 Apr 2023 14:19:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	soc@kernel.org, wanghuiqiang@huawei.com, tanxiaofei@huawei.com,
	liuyonglong@huawei.com, huangdaode@huawei.com,
	linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] soc: hisilicon: Support HCCS driver on Kunpeng SoC
Message-ID: <20230425131918.5tf5vot4h7jf54xk@bogus>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <e0c4f4b5-8b34-4542-b676-f98ddb8ef586@app.fastmail.com>
 <20230425103040.znv66k364ant6klq@bogus>
 <c7d9c3c5-e400-c60a-52e0-0f267ec8c517@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7d9c3c5-e400-c60a-52e0-0f267ec8c517@huawei.com>

On Tue, Apr 25, 2023 at 09:00:31PM +0800, lihuisong (C) wrote:
> 
> For firmware, DSD way is simpler and easier to manage these virtual platform
> devices, and it's an usual way in kernel.

Any specific examples you are referring here. We had lots of debate when
DSD was introduced. It must be used only when there is no standard ACPI
way to achieve the same. But in this I don't (yet) think that is the case.
Further "simplicity" is remotely not the reason why you must use DSD.
So until you provide me technical reasons as why _CRS can't work, I
have to NACK this approach. DSD in this case seems like pure hack.

> Driver only needs to get a fixed value, like pcc-id and type, here.
>

Yes and _CRS is used to get similar such properties in ACPI. It includes
normally MMIO and interrupts and since GAS supports PCC and _CRS can
contain GAS, you must simply use that.

> Any vantage if using _CRS with GAS compared with DSD?

Simple IMO, it is also existing standard to achieve things you are trying
to here and DSD is not. You are defining new properties to make DSD work.

So the real question is if _CRS can be used what is the point in defining
DSD for that. Unless I hear more technical and solid reasoning, I see
DSD as just hack and misuse here. It wasn't designed for that and must not
be allowed to make use of it for such use case.

Anyways in case we decide to take DSD route(after more deeper and technical
discussions), as in the kernel docs, please refer [1] for DSD. You need
to publish properties there so that no one comes up with similar but
alternate solution to do exactly this.

> > quite understand what magic the flags contain here to provide any info
> > there.
> This flag is used to report other properties, and every bit means a
> property.
> For instance, driver doesn't need to request PCC channel during the probing
> phase if driver use PCC operation Region.

Sorry I still don't understand it fully.

-- 
Regards,
Sudeep

[1] https://github.com/UEFI/DSD-Guide
