Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607041A8F7D
	for <soc@lists.linux.dev>; Mon,  6 Jan 2025 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171723; cv=none; b=sVwFpqWrhwmCLXgdXs8H7JGFGhn6uOaVvqYdlIJucTQw3PRBfbCm7/Kq/ZHKENFO5iduchwqqMlKZOcH3qiwUp4qSV33w4dRwhnOHR15XSUYLRa8uxJ3dH7tLx1gW6y2SkUAO8/hpyhS7piXGrXNUJmUuago0YB+EcJRSrS5qMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171723; c=relaxed/simple;
	bh=/Xs2ahiekQYHe/PbRg5cMSg+mbW3ENNKmFcKGoOOJRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=edKI4INfuJHPXiz0Jvx385wzmZ/zgiaLMyrTddbFwxEJzErAzx/xgzB9GyX4WhznvLwUXb42gPwAYUm8vOrRH8/v3KpLDERa7tslSSne228Q2i0GKxWxckmiLNiFXzad1OLn2iONndAtX/JZeN7Cyn9/PU+Rey/njSIeXP+slQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=i7QcQNqO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="i7QcQNqO"
Received: by smtp.kernel.org (Postfix)
	id 028F0C4CED2; Mon,  6 Jan 2025 13:55:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF0CBC4CEDD
	for <soc@kernel.org>; Mon,  6 Jan 2025 13:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF0CBC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Aw0eo010310;
	Mon, 6 Jan 2025 14:55:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/WVn2MaI0Sf+kXloTCoRvABk6rQrChQx5pkM7ZFBsy8=; b=i7QcQNqO1ZBWfdw6
	lJqeM7RuYQOYjT9aMGB9zWL4upwSOV3mCtAGWtiHl10LxEBt/zaag5/Ppqb+dzmk
	4aZp3jH2az5HMXh7jaeFBhUtOl+l5YYf5rSGLLSvtzAgl3uNh/4ZSa8gLXSLRCYV
	bm9A6W+dnBS91P6c22P6cS6tpmjjB5ZDDn+s7VW9HjJB5lZRYZD48qoqgvKqc/2k
	95yPMRaxO0MW9+HsV6eGdERBpI2kWSI7sFOVCvEZknfguUXlA8mxPTi5rtKzVrUA
	5yB1neEFgiDSwNndb/9buUeYirCrO5WdZM6Luk5iOpC9TWCKZ0PywadcrgzRYSo4
	OEUMcw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43xvrfpxb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 14:55:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DE47F40050;
	Mon,  6 Jan 2025 14:53:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A09327BCF0;
	Mon,  6 Jan 2025 14:52:08 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 14:52:07 +0100
Message-ID: <11c927b6-ebf8-4c02-9fdf-86303144b4aa@foss.st.com>
Date: Mon, 6 Jan 2025 14:52:06 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: configs: stm32: Remove useless flags in STM32
 defconfig
To: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann
 Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <20241220125506.3157268-5-patrice.chotard@foss.st.com>
 <c48b7e84-5287-4da0-84a0-7747581f49d0@app.fastmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <c48b7e84-5287-4da0-84a0-7747581f49d0@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



On 12/20/24 18:06, Arnd Bergmann wrote:
> On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> As stm32_defconfig is dedicated to STM32 MCUs, disable
>> CONFIG_COMMON_CLK_STM32MP flag which is only used by STM32 MPUs.
>>
>> Disable CONFIG_SUSPEND, CONFIG_ADVISE_SYSCALLS, CONFIG_IO_URING
>> CONFIG_POSIX_TIMERS, CONFIG_GCC_PLUGINS, it will reduce the kernel
>> image size for these platforms which embed a low amount of memory.
>>
>> Tested on STM32F746-DISCO board which embeds 8MB of memory.
> 
> Out of curiosity, what is the smallest memory configuration that
> you see people using on stm32f7/h7 these days? I know we had
> configs that kind-of worked on 2MB in the past, but I assume there
> has been a lot of bloat since.
> 
>        Arnd

Hi Arnd

Currently, i have no idea about what is the smallest memory configuration on stm32f4/f7/h7
used by people using these SoCs. As you said, kernel Linux size is increasing version after version.

My goal was just to ensure that official ST boards are still booting a kernel Linux.

Patrice
