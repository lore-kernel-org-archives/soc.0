Return-Path: <SRS0=+bY1=FN=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC518E80ABE
	for <soc@archiver.kernel.org>; Fri, 29 Sep 2023 11:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8E18C433C9; Fri, 29 Sep 2023 11:27:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id EF18AC433C7;
	Fri, 29 Sep 2023 11:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF18AC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BC471FB;
	Fri, 29 Sep 2023 04:28:18 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A56D3F59C;
	Fri, 29 Sep 2023 04:27:38 -0700 (PDT)
Date: Fri, 29 Sep 2023 12:27:36 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: rafael@kernel.org, rafael.j.wysocki@intel.com, xuwei5@hisilicon.com,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, liuyonglong@huawei.com
Subject: Re: [PATCH v2 2/2] soc: kunpeng_hccs: add the check for PCC subspace
 type
Message-ID: <20230929112736.iribjiwzk5wszb4k@bogus>
References: <20230914115753.9064-1-lihuisong@huawei.com>
 <20230920064703.23543-1-lihuisong@huawei.com>
 <20230920064703.23543-3-lihuisong@huawei.com>
 <20230920141147.bq7cjiqjk6c36t6d@bogus>
 <1b05f595-b485-5a7e-ad31-b19f462fe43f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b05f595-b485-5a7e-ad31-b19f462fe43f@huawei.com>

On Thu, Sep 21, 2023 at 10:27:36AM +0800, lihuisong (C) wrote:
> 
> 在 2023/9/20 22:11, Sudeep Holla 写道:
> > On Wed, Sep 20, 2023 at 02:47:03PM +0800, Huisong Li wrote:
> > > Currently, HCCS driver directly uses Generic Communications Channel Shared
> > > Memory Region which is used in type0/1/2 to communicate with platform,
> > > but actually doesn't support type3/4/5.
> > > So this patch adds the check for PCC subspace type.
> > > 
> > > Signed-off-by: Huisong Li <lihuisong@huawei.com>
> > > ---
> > >   drivers/soc/hisilicon/kunpeng_hccs.c | 17 +++++++++++++++++
> > >   1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
> > > index f3810d9d1caa..4ba3bfd45a01 100644
> > > --- a/drivers/soc/hisilicon/kunpeng_hccs.c
> > > +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> > > @@ -174,6 +174,19 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
> > >   	return rc;
> > >   }
> > > +static int hccs_check_pcc_info(struct hccs_dev *hdev)
> > > +{
> > > +	struct pcc_mbox_chan *pcc_chan = hdev->cl_info.pcc_chan;
> > > +
> > > +	if (pcc_chan->type >= ACPI_PCCT_TYPE_EXT_PCC_MASTER_SUBSPACE) {
> > > +		dev_err(hdev->dev, "unsupport for subspace type%u.\n",
> > > +			pcc_chan->type);
> > > +		return -EOPNOTSUPP;
> > > +	}
> > Is this the only use of the PCC type information you have or do you plan to
> > use it for something other than the validation.
> Yeah, it is just validation now. we want to plan this driver can support
> more types.

OK

> > 
> > Just for sake of argument, I can say all users of PCC must then do the
> > similar validation. I don't know where to draw the line here.
> 
> If export PCC type, it is good for the user of PCC to be more universal and
> more compatible.
>

I don't think it is a good idea to just export raw ACPI PCC type to the
client drivers. What if the driver in the future needs to work on a DT
platform as well and need to work with non-PCC mailbox channel ?

Also pushing the client PCC drivers to have more ACPI knowledge to understand
what each type means is also something I prefer to avoid. The real information
you want is whether this is an initiator(previously known master) channel or
responder(previously known as slave) channel. It boils down to unidirectional
vs bidirectional and what direction in bidirectional channels.

It would be good if mbox framework can be taught that, or atleast make an
attempt to see what people think about it. Just patching it the way you are
proposing is just going to hide real issue here.

> > 
> > Ideally I would expect the driver to make this transparent and give error
> > during transmit if not supported.
> I understand you.
> I just check this type only once during the initializing phase.
> Otherwise, every once need to verify it when send PCC command.

Agreed, but refer above for my concern on the solution proposed.

> >
> > The driver must be able to work with different PCC type to support variety
> > of platforms TBH. What is the issue exactly here ? Is this to prevent the
> Agree more with you.
> IMO, the user of PCC has the ability to support variety of platforms if they
> can get PCC type.
> In this case, to prevent type 4 is necessary if driver cannot act as a
> slave.
> on the other hand, If one driver acts as a slave, platform must supply slave
> subspace for them.
> > use of Type 4 ? I think we must do something better but I don't know what
> > that is yet.
> 
> Yes, we can try to do it better. I have a concern, like below.
>

Thanks for agreeing.

> You know that the use of PCC can use polling mode and interrupt mode to
> communicate with platform.
> I'm not sure if the obtaining of the polling mode and interrupt mode is an
> issue to prevent driver to be more universal.

Again this must be addressed at mailbox API level.

> But this driver can know if they support interrupt mode based on struct
> mbox_chan::struct mbox_controller::txdone_irq after requesting PCC channel.

Agreed, I was about to ask the same.

> Because I'm not sure it's a better way.

Again agreed.

> You know that drivers used interrupt mode need to fill the rx_callback
> function into mbx_client when register PCC channel.
> And drivers used polling mode don't do it.
> If we use this way, drivers that both support the two mode have to modify
> the rx_callback pointer after requesting PCC channel.

I am not sure if I followed all the details here. May be a rough hack helps
to understand what you are proposing ? Ofcourse not for merging, just to
understand the issue better.

--
Regards,
Sudeep
