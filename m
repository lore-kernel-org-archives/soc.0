Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518931F3B92
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946503; cv=none; b=gJpqHTnW1W6NZ7dFs0foGGuG6xF35aewUnCUUWEVLe5SqoI0lIx0mcsJVazesy8rBma/dPE9v77Ifh2DgOee2HFUbtrZNkOZ71NNSYBY9oCI6trWUOLowldB9maCErUB5+n9xBWsWtKgbZIQV8ZyqhEckGAvEKTzB0hi0NeYzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946503; c=relaxed/simple;
	bh=sNI20FOIW5DW3sqBRpeYgR362t3idDZCuXcjvqhF/eE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AjTL5UTU+FU+tpDhgFkgYau+idLUlGk7TRfgJqmqobW2lWSzQD9HHlN9z7Vy753U+U11HwVBPSKcTnWLPtZC5tGoVctXj1bm0zBpX+nOzOojlCM3tan633JkCSDNtJSj8r8w4xEnsbYj0Big1bh6c+Kb2YPV1TPGFe30DAbfp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DB116C4CEE9; Fri, 14 Mar 2025 10:01:42 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5E79C4CEE3
	for <soc@kernel.org>; Fri, 14 Mar 2025 10:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5E79C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZDfvR03nTz6J7r8;
	Fri, 14 Mar 2025 17:58:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C306140B39;
	Fri, 14 Mar 2025 18:01:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 14 Mar
 2025 11:01:37 +0100
Date: Fri, 14 Mar 2025 10:01:36 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Huisong Li <lihuisong@huawei.com>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <liuyonglong@huawei.com>
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Fix incorrect string
 assembly
Message-ID: <20250314100136.0000416f@huawei.com>
In-Reply-To: <20250314082856.3257783-1-lihuisong@huawei.com>
References: <20250314082856.3257783-1-lihuisong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 14 Mar 2025 16:28:56 +0800
Huisong Li <lihuisong@huawei.com> wrote:

> String assembly should use sysfs_emit_at() instead of sysfs_emit().
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
Fixes tag?

Otherwise looks good to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
> index 8aa8dec14911..444a8f59b7da 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> @@ -1539,8 +1539,8 @@ static ssize_t used_types_show(struct kobject *kobj,
>  	u16 i;
>  
>  	for (i = 0; i < hdev->used_type_num - 1; i++)
> -		len += sysfs_emit(&buf[len], "%s ", hdev->type_name_maps[i].name);
> -	len += sysfs_emit(&buf[len], "%s\n", hdev->type_name_maps[i].name);
> +		len += sysfs_emit_at(buf, len, "%s ", hdev->type_name_maps[i].name);
> +	len += sysfs_emit_at(buf, len, "%s\n", hdev->type_name_maps[i].name);
>  
>  	return len;
>  }

