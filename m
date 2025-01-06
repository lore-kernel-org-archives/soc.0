Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861101DDC36
	for <soc@lists.linux.dev>; Mon,  6 Jan 2025 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172039; cv=none; b=jCxE2+vnWEVjlIzbuZa+jLo6gCgDNKKyFkOT07pdCWHDBbXWp9oOXJ16eM6pYRLl4VOw9fmbSnj+hf3xsNvvmksmGBHJwl/WoqF7mSAU3uhZiBoYSyObXm86MXupCHHZKoP75anUoELOBtCumTDz8F/VrawO8B2ge2fX3WMknro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172039; c=relaxed/simple;
	bh=j78xiH+o8dabA5EOBwqK6kdl2HR96xMk/CbwxH2JufQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EcF2SUggJW9xfvZCg/WF2/2EzrxoSQiTDK608m46qqcVe7lj08/quAifMht/wl/4x4dcUHhyDExce3azy9xnYfeKQX9Vbk4uUDkzCmVWq4x5cPpL5CINDTaRIPiMZ8jEtThYAeBnY/sGVqWFehEj5/dWxPFxZhriD404aUNCga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Tn1ftUbX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Tn1ftUbX"
Received: by smtp.kernel.org (Postfix)
	id 19BE5C4CEDD; Mon,  6 Jan 2025 14:00:39 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7788C4CED2
	for <soc@kernel.org>; Mon,  6 Jan 2025 14:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7788C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Cn9Ul002226;
	Mon, 6 Jan 2025 15:00:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	AldtL0vIimc22sbNsqvIOxcuxMNVL4re4FHw05kxe60=; b=Tn1ftUbXZ8g3ldk6
	awUFDDyLy4nQk40i8/8SB/Wcwha8F9e2DEmOBf14ICeyLCsrmQ87UqJm48MMmd2g
	4MUKKqeBkzT+GK6kP1v6HSnVCOdTNLEooMQbpd1PncYLftu3vLNDrUvfSeAi7CTj
	/Kf1sYIN4/7NErFOPGVcYReESirOyZzxkT2fJ7ekBSCStH28iaVc18D87jE/MyBB
	bWzQ24WEUUPJYSJvLsPBUvoj4uhrBTP8aROp+4+MzVjQsDcXW6fidZwwS+VW38Rw
	pp59wNtHyt0O8WnH5rh2EY92rO4cky0lGNdMbhl7SLbcAseHrK1J28opQQH7uOe4
	LGunqg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ygtmm9gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 15:00:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9BFDF40048;
	Mon,  6 Jan 2025 14:59:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 336FE27607A;
	Mon,  6 Jan 2025 14:58:31 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 14:58:30 +0100
Message-ID: <c7afa129-5938-4c5b-9e77-97c67ca2ff96@foss.st.com>
Date: Mon, 6 Jan 2025 14:58:29 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
To: Arnd Bergmann <arnd@arndb.de>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann
 Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Arnd

On 12/20/24 17:47, Arnd Bergmann wrote:
> On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Running "make savedefconfig" highlights that some flags are no more used,
>> remove them.
>> Remove some flags to reduce the kernel image size as STM32 MCU's board
>> embeds low amount of RAM.
>>
>> Changes in V2:
>>    _ squash patches 2-7
>>    _ split patch 1 in three parts and add epxlanations about flags removal.
> 
> Looks good to me, thanks for the update. I assume the plan is to
> have this in another pull request rather than me picking up the
> patches directly, right?

I don't plan to send a second round so you can take it directly.

Thanks
Alex

> 
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
