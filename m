Return-Path: <SRS0=IwrI=PW=huawei.com=jonathan.cameron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB7FC531DC
	for <soc@archiver.kernel.org>; Fri, 23 Aug 2024 08:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42756C4AF12; Fri, 23 Aug 2024 08:39:04 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D75AC4AF0B;
	Fri, 23 Aug 2024 08:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D75AC4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wqtgq2hDVz6K8h6;
	Fri, 23 Aug 2024 16:35:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 023461400DD;
	Fri, 23 Aug 2024 16:39:00 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 09:38:59 +0100
Date: Fri, 23 Aug 2024 09:38:58 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>
Subject: Re: [PATCH v2 3/6] soc: hisilicon: kunpeng_hccs: Add the check for
 base address and size of shared memory
Message-ID: <20240823093858.00007047@Huawei.com>
In-Reply-To: <20240823031059.32579-4-lihuisong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
	<20240823031059.32579-1-lihuisong@huawei.com>
	<20240823031059.32579-4-lihuisong@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Fri, 23 Aug 2024 11:10:56 +0800
Huisong Li <lihuisong@huawei.com> wrote:

> If the shmem_base_addr from PCCT is zero, hccs_register_pcc_channel will
> return success. And then driver will access to illegal address when send
> PCC command. In addition, the size of shared memory used for communication
> between driver and platform is fixed, namely 64 Bytes which is
> unchangeable. So add the verification for them.
> 
As with previous, make it clear if this hardening or fix
fix to catch a problem on shipping hardware (I assume not, but you never
know!)

A comment on existing code inline.  Not a suggestion for a change
in this series, but maybe for the future.  There are a lot
of goto err_mbx_channel_Free in here already and this patch adds
another.  The cleanup there is trivial so DEFINE_FREE() and __free
usage will make this code quite a bit nicer to read.

> Signed-off-by: Huisong Li <lihuisong@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/soc/hisilicon/kunpeng_hccs.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
> index 6e88f597f267..6055e5091cbd 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> @@ -170,15 +170,21 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
>  		goto err_mbx_channel_free;
>  	}
>  
> -	if (pcc_chan->shmem_base_addr) {
> -		cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
> -						 pcc_chan->shmem_size);
> -		if (!cl_info->pcc_comm_addr) {
> -			dev_err(dev, "Failed to ioremap PCC communication region for channel-%u.\n",
> -				hdev->chan_id);
> -			rc = -ENOMEM;
> -			goto err_mbx_channel_free;
> -		}
> +	if (!pcc_chan->shmem_base_addr ||
> +	    pcc_chan->shmem_size != HCCS_PCC_SHARE_MEM_BYTES) {
> +		dev_err(dev, "The base address or size (%llu) of PCC communication region is invalid.\n",
> +			pcc_chan->shmem_size);
> +		rc = -EINVAL;
> +		goto err_mbx_channel_free;
Worth considering for the future: Maybe a DEFINE_FREE for pcc_mbox_free_channel) makes sense,
though if you do you should only assign cl_info->pcc_chan after all possible error paths.

> +	}
> +
> +	cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
> +					 pcc_chan->shmem_size);
> +	if (!cl_info->pcc_comm_addr) {
> +		dev_err(dev, "Failed to ioremap PCC communication region for channel-%u.\n",
> +			hdev->chan_id);
> +		rc = -ENOMEM;
> +		goto err_mbx_channel_free;
>  	}
>  
>  	return 0;

