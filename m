Return-Path: <SRS0=IwrI=PW=huawei.com=jonathan.cameron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420D2C52D7C
	for <soc@archiver.kernel.org>; Fri, 23 Aug 2024 08:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13C7EC4AF14; Fri, 23 Aug 2024 08:41:07 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EA2BC32786;
	Fri, 23 Aug 2024 08:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EA2BC32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wqtk64Hq3z6K8y1;
	Fri, 23 Aug 2024 16:37:50 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 292A8140B63;
	Fri, 23 Aug 2024 16:40:59 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 23 Aug
 2024 09:40:58 +0100
Date: Fri, 23 Aug 2024 09:40:58 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Huisong Li <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzk@kernel.org>,
	<wanghuiqiang@huawei.com>, <liuyonglong@huawei.com>
Subject: Re: [PATCH v2 4/6] soc: hisilicon: kunpeng_hccs: Fix the
 'lane_mode' field name in port info structure to 'max_lane_num'
Message-ID: <20240823094058.00002b9f@Huawei.com>
In-Reply-To: <20240823031059.32579-5-lihuisong@huawei.com>
References: <20240718071134.31155-1-lihuisong@huawei.com>
	<20240823031059.32579-1-lihuisong@huawei.com>
	<20240823031059.32579-5-lihuisong@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Fri, 23 Aug 2024 11:10:57 +0800
Huisong Li <lihuisong@huawei.com> wrote:

> The lane mode of HCCS port is an information to user, and actually comes
> from the maximum lane number. But it is good and easy for driver to use
> the maximum lane number. So fix the 'lane_mode' field name in port info
> structure to 'max_lane_num'.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>

It's unfortunate we missed the ABI in the first place
as that's still confusingly names, but at least this improves things
in the driver.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
>  drivers/soc/hisilicon/kunpeng_hccs.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
> index 6055e5091cbd..418e4ee5d9e5 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> @@ -594,7 +594,7 @@ static int hccs_get_all_port_info_on_die(struct hccs_dev *hdev,
>  		port = &die->ports[i];
>  		port->port_id = attrs[i].port_id;
>  		port->port_type = attrs[i].port_type;
> -		port->lane_mode = attrs[i].lane_mode;
> +		port->max_lane_num = attrs[i].max_lane_num;
>  		port->enable = attrs[i].enable;
>  		port->die = die;
>  	}
> @@ -839,7 +839,7 @@ static ssize_t lane_mode_show(struct kobject *kobj, struct kobj_attribute *attr,
>  {
>  	const struct hccs_port_info *port = kobj_to_port_info(kobj);
>  
> -	return sysfs_emit(buf, "x%u\n", port->lane_mode);
> +	return sysfs_emit(buf, "x%u\n", port->max_lane_num);
>  }
>  static struct kobj_attribute lane_mode_attr = __ATTR_RO(lane_mode);
>  
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.h b/drivers/soc/hisilicon/kunpeng_hccs.h
> index c3adbc01b471..5e12a1e1474e 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.h
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.h
> @@ -19,7 +19,7 @@
>  struct hccs_port_info {
>  	u8 port_id;
>  	u8 port_type;
> -	u8 lane_mode;
> +	u8 max_lane_num;
>  	bool enable; /* if the port is enabled */
>  	struct kobject kobj;
>  	bool dir_created;
> @@ -113,7 +113,7 @@ struct hccs_die_info_rsp_data {
>  struct hccs_port_attr {
>  	u8 port_id;
>  	u8 port_type;
> -	u8 lane_mode;
> +	u8 max_lane_num;
>  	u8 enable : 1; /* if the port is enabled */
>  	u16 rsv[2];
>  };

