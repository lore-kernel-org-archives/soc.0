Return-Path: <SRS0=Ovyi=AQ=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBB1C77B61
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 10:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67B4FC433EF; Tue, 25 Apr 2023 10:30:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 0C933C433D2;
	Tue, 25 Apr 2023 10:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C933C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E06A2F4;
	Tue, 25 Apr 2023 03:31:29 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7A423F5A1;
	Tue, 25 Apr 2023 03:30:42 -0700 (PDT)
Date: Tue, 25 Apr 2023 11:30:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@arndb.de>, Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <20230425103040.znv66k364ant6klq@bogus>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <e0c4f4b5-8b34-4542-b676-f98ddb8ef586@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0c4f4b5-8b34-4542-b676-f98ddb8ef586@app.fastmail.com>

Thanks Arnd for cc-ing the ALKML.

On Mon, Apr 24, 2023 at 10:09:47AM +0200, Arnd Bergmann wrote:
> On Mon, Apr 24, 2023, at 09:30, Huisong Li wrote:

[...]

> > +
> > +static int hccs_get_device_property(struct hccs_dev *hdev)
> > +{
> > +	struct device *dev = hdev->dev;
> > +
> > +	if (device_property_read_u32(dev, "device-flags", &hdev->flags)) {
> > +		dev_err(hdev->dev, "no device-flags property.\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (device_property_read_u8(dev, "pcc-type", &hdev->type)) {
> > +		dev_err(hdev->dev, "no pcc-type property.\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (device_property_read_u32(dev, "pcc-chan-id", &hdev->chan_id)) {
> > +		dev_err(hdev->dev, "no pcc-channel property.\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	hdev->intr_mode = hccs_get_bit(hdev->flags, HCCS_DEV_FLAGS_INTR_B);
> > +	if (!hccs_dev_property_supported(hdev))
> > +		return -EOPNOTSUPP;
> > +
>
> Where are the device properties documented? I'm never quite sure how
> to handle these for ACPI-only drivers, since we don't normally have the
> bindings in Documentation/devicetree/bindings/, but it feels like there
> should be some properly reviewed document somewhere else.
>
> Adding ACPI and devicetree maintainers to Cc for clarification.

Why are these DSD style properties added here ? Why can't we just make
use of _CRS with Generic Address Structure(GAS) register entry for each
of the PCC channel which eliminates the need of "pcc-chan-id". The type
must be deduced from the order in the list of _CRS if needed. I don't
quite understand what magic the flags contain here to provide any info
there.

--
Regards,
Sudeep
