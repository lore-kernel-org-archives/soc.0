Return-Path: <SRS0=ad0e=GZ=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A211C433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 16:14:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6D87322EBE; Fri, 22 Jan 2021 16:14:47 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 748EB206F6;
	Fri, 22 Jan 2021 16:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 748EB206F6
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611332086; x=1642868086;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=akfaX8ej4mNSDSiYlmg4n0T8nIbvD+geiuHI63vtcuQ=;
  b=AcwtNTvzm7QfF8nDcgKEnRJL9RE5Ye4kWM21qgzH4Pb3p4Fs61A0jBu7
   MAAC4bXMTW9G9wGRFUBzEgkmHHSdaE7CxJKAR8TUnsWE8jR4iRXMwnUGq
   5S0OtCfOTAc6aSiKvgNM9bn+3AJzeDF0EigtCxzF/iNBZxKRsi8JRq++t
   9m5h6LqcdzzBk+Ad1Kd1vHzSYz5VcWYfrzNQl0pZi7qUZLkfd54X0TX3/
   iEMiV8BvJ9rztPe45K0ff8u/W2ZxD5UXg0axYAHgW0K3++UPDwSaftxUM
   9zDCExIF/IozHu6vZQHaq5qyDaBHfflFS8Gdv8lPqiruf5d+0BZc2/Cra
   A==;
IronPort-SDR: PGarIi6QTG+I9LIhdvquCOGfspA7sPtUx5742TLHSw1axWQdKUAD9BtXK8cFbV0FxBkNLlmAyR
 ptd2SH4h1l/FrlGrSlrxAYP0HqkQ1JZn0+BHBnl0smH6oOUM6ebMyiLyQBnHXXhlx8ifA2oOUj
 GGN5IrRM3GCtD0jLYS5CQicGmwP0iCRG0ySdulAo5VFOC7LUEGIPw0hsNlNHwxy60QjQwUVWpB
 3qV93A7Y6FpalYIjFY7VUzHVfKU6W6lZhe+qVdLdLl7z+nrXGrBEMnj+M3EtFs7/vX76QjEGd7
 ogI=
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="101063226"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jan 2021 09:14:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 22 Jan 2021 09:14:34 -0700
Received: from [10.171.246.92] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Fri, 22 Jan 2021 09:14:32 -0700
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc
	<arm@kernel.org>, SoC Team <soc@kernel.org>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
 <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <715938cd-d898-5d12-cc11-d79cf27c5430@microchip.com>
Date: Fri, 22 Jan 2021 17:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/01/2021 at 16:25, Arnd Bergmann wrote:
> On Fri, Jan 22, 2021 at 3:35 PM <nicolas.ferre@microchip.com> wrote:
>>
>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>
>> Arnd, Olof,
>>
>> I'm taking back the lead on sending the pull-requests for AT91 and hope that I
>> didn't loose the knowledge in the meantime. Tell me if there's something I'm
>> missing. Thanks a lot to Alexandre who kept our flow steady and very
>> predictable during all those years!
>>
>> Here are the first SoC changes for 5.12 which contain a single patch for multi
>> platform kernels.
>>
>> I plan to send another pull-request for the SoC changes related to new sama7g5
>> that Claudiu sent to the mainling-list recently. I'll let it mature in
>> linux-next by the beginning of next week and will send another pull-request by
>> mid-next-week.
>> Tell me if you see a problem with this approach.
> 
> This all looks good to me, but I think I'd rather take the 'soc' pull request
> into the v5.11 bugfixes, as this may already affect users on other machines.
> 
> I would also suggest adding a 'Cc: stable@vger.kernel.org' tag. If you like,
> I can just cherry-pick that patch into the fixes branch and add it there.

Oh yes, that'd be good, indeed.

You can add the following tag:
Cc: stable@vger.kernel.org #4.12+

Best regards,
-- 
Nicolas Ferre
