Return-Path: <SRS0=GtEy=BE=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D352C77B7D
	for <soc@archiver.kernel.org>; Mon, 15 May 2023 13:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4175FC4339B; Mon, 15 May 2023 13:08:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D0119C433EF;
	Mon, 15 May 2023 13:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0119C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C941B2F4;
	Mon, 15 May 2023 06:08:56 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C55EF3F67D;
	Mon, 15 May 2023 06:08:09 -0700 (PDT)
Date: Mon, 15 May 2023 14:08:07 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
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
Message-ID: <20230515130807.pdvx7bxwjkfdsmsr@bogus>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <e0c4f4b5-8b34-4542-b676-f98ddb8ef586@app.fastmail.com>
 <20230425103040.znv66k364ant6klq@bogus>
 <c7d9c3c5-e400-c60a-52e0-0f267ec8c517@huawei.com>
 <20230425131918.5tf5vot4h7jf54xk@bogus>
 <db6c713c-f99c-fa3f-8d38-9a5d50889cc2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db6c713c-f99c-fa3f-8d38-9a5d50889cc2@huawei.com>

On Thu, May 04, 2023 at 09:16:16PM +0800, lihuisong (C) wrote:
>
> I'm tring to use CRS with GAS to report PCC channel ID and get other
> informations driver need by address.

OK you had pcc-chan-id pcc-type and device-flags in the DSD style bindings
to begin with. I haven't understood device-flags here so can't comment on
that.

> I found a way to obtain the generic register information according to
> "Referencing the PCC address space" in ACPI spec.
> And driver also get the PCC generic register information successfully.
>

Can you elaborate ? I assume by that you must be able to get pcc-chan-id
right ? You must not need pcc-type as the pcc mailbox driver must handle
the type for you. If not, we may need to fix or add any missing support.

> But I don't know how to set and use the address in PCC register.

It must be same as what you would have specified in you new bindings
under "pcc-chan-id". I am confused as you say you were able to get the
PCC generic register information successfully but you still claim you
don't know how to set or use the address.

> Where should this address come from?
> It seems that ACPI spec is not very detailed about this.
> Do you have any suggestions?
>

I am afraid, I don't have any as I am failing to understand the exact issue
you are facing. 

Let me try to ask the question explicity here: 

If you are just referring to just the <RegisterAddress,> in

Register (PCC, RegisterBitWidth, RegisterBitOffset, RegisterAddress, AccessSize)

then,

RegisterAddress is usually the offset in the comms address associated with
the PCC subspace ID specified in AccessSize. Yes the use of AccessSize for
the PCC subspace ID is bit confusing though.

You can either list all the registers with _CRS individually or the driver
can just use the PCC subspace ID in AccessSize and keep RegisterAddress = 0
but access individual offset based on its own knowledge. I haven't seen the
full driver yet but I assuming that's how you would have used if you went with
your DSD pcc-chan-id proposal.

> On the other hand, we think that System Memory space + method can also
> achieve above goal. What do you think of that?

Again I don't understand what you mean by that.

-- 
Regards,
Sudeep
