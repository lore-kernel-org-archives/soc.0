Return-Path: <SRS0=R4rN=LU=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75417C4345F
	for <soc@archiver.kernel.org>; Mon, 15 Apr 2024 01:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 391FDC2BD10; Mon, 15 Apr 2024 01:17:23 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3F81C072AA
	for <soc@kernel.org>; Mon, 15 Apr 2024 01:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3F81C072AA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VHq2J4Zr6z1hwMy;
	Mon, 15 Apr 2024 09:14:16 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 66AAD1A0172;
	Mon, 15 Apr 2024 09:17:12 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Mon, 15 Apr
 2024 09:17:11 +0800
Message-ID: <661C8017.1070203@hisilicon.com>
Date: Mon, 15 Apr 2024 09:17:11 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH 1/2] soc: hisilicon: kunpeng_hccs: Add the check for obtaining
 complete port attribute
References: <20240403081935.24308-1-lihuisong@huawei.com> <20240403081935.24308-2-lihuisong@huawei.com>
In-Reply-To: <20240403081935.24308-2-lihuisong@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi Huisong,

On 2024/4/3 16:19, Huisong Li wrote:
> The hccs_get_all_port_attr() is used to obtained the attribute of all
> ports on a specified DIE from firmware. However, this interface doesn't
> ensure whether firmware reports the complete attribute of all ports or not.
> So this patch adds the check for this.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> ---
>  drivers/soc/hisilicon/kunpeng_hccs.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
> index 9ff70b38e5e9..bb69a95b5f2d 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> @@ -556,6 +556,12 @@ static int hccs_get_all_port_attr(struct hccs_dev *hdev,
>  		start_id = rsp_head.next_id;
>  	}
>  
> +	if (left_buf_len != 0) {
> +		dev_err(hdev->dev, "do not get the expected port number(%u) attribute.\n",

How about changing to "failed to get the expected port number(%u) attribute.\n"?

Best Regards,
Wei

> +			size);
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> 
