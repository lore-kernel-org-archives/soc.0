Return-Path: <SRS0=ad0e=GZ=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCE0C433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 17:05:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ECED823A79; Fri, 22 Jan 2021 17:05:32 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CEA5233FA;
	Fri, 22 Jan 2021 17:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CEA5233FA
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611335132; x=1642871132;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=dkrcTOyV7SF2AdMFgUc0km5YwirX7kjYen8IfpsQ3QM=;
  b=YInLUZoD7qhnZpmOzFeAsGIM0quw3hzqkfM7xhS2dJOiT2/7F3ipIQK1
   pXU4IKGGo5MHf0Wrj7Qu8re06PXQZa3DMpLW9u02kocAydonBelzdIhZh
   6EVfgBU3ygeipKQ4uxH84U5LqsedO0QuIO7dAf2Y6PJ/9Ktx0C/4uzr0k
   5ivL3+8b3149N7b9C43TKbDlYPmPNYfyVsrp5Q+Pg9kAWBuxqUMxMlwBD
   fVu6X+yq9m/AxiCV6PEHL/oO+rjq+GoBcct/CQ5/9srB/dY8VI+fKZwzn
   hCsy6kpo7XMTmfV+hRlW4dpE9Wo0n9ZTM9ua+VT6fQsUipmgnH3TcQELK
   Q==;
IronPort-SDR: CAhFatTCMYq27T6yHM3vczHsVxExCMl3AFVAJq9CaLzL8VIEeo1KCNP9vZc/R9UgR/AcyNfPVw
 sl4RFj1iDaNjvKss9jtoc/VQE0jd8VQbmD0WMRDko5B9MdV77OUUOiBWk95QrjdYOn2F4Vl8Qg
 N95gJZxlmBCpaH60n0EI9eQgguWB/l74TG9F3vHX3//9c0tyazTHeQxeDKNPqOXk6AFQVvWqgR
 seOTWcZzrkaThV9JgiouVDTnsOE9nsgJVJ2boRPikxJ7GpovNBlq0RcbzHeZEUn8EDSpFBM/ca
 0iA=
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; 
   d="scan'208";a="112109408"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jan 2021 10:05:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 22 Jan 2021 10:05:26 -0700
Received: from [10.171.246.92] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Fri, 22 Jan 2021 10:05:24 -0700
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann
	<arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc
	<arm@kernel.org>, SoC Team <soc@kernel.org>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
 <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
 <20210122163520.GG1196852@piout.net>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <7131cfc0-2519-8bbe-a380-609eced61753@microchip.com>
Date: Fri, 22 Jan 2021 18:05:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122163520.GG1196852@piout.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/01/2021 at 17:35, Alexandre Belloni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 22/01/2021 16:25:47+0100, Arnd Bergmann wrote:
>> On Fri, Jan 22, 2021 at 3:35 PM <nicolas.ferre@microchip.com> wrote:
>>>
>>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>>
>>> Arnd, Olof,
>>>
>>> I'm taking back the lead on sending the pull-requests for AT91 and hope that I
>>> didn't loose the knowledge in the meantime. Tell me if there's something I'm
>>> missing. Thanks a lot to Alexandre who kept our flow steady and very
>>> predictable during all those years!
>>>
>>> Here are the first SoC changes for 5.12 which contain a single patch for multi
>>> platform kernels.
>>>
>>> I plan to send another pull-request for the SoC changes related to new sama7g5
>>> that Claudiu sent to the mainling-list recently. I'll let it mature in
>>> linux-next by the beginning of next week and will send another pull-request by
>>> mid-next-week.
>>> Tell me if you see a problem with this approach.
>>
>> This all looks good to me, but I think I'd rather take the 'soc' pull request
>> into the v5.11 bugfixes, as this may already affect users on other machines.
>>
>> I would also suggest adding a 'Cc: stable@vger.kernel.org' tag. If you like,
>> I can just cherry-pick that patch into the fixes branch and add it there.
>>
> 
> I wouldn't backport it as a fix, this is just a warning, in a
> configuration that is very unlikely to be used (and honestly, I
> wouldn't enable this driver on any platform).
> 
> If you take it as a fix, you'll have to also get
> https://lore.kernel.org/linux-arm-kernel/1611318097-8970-5-git-send-email-claudiu.beznea@microchip.com/

Arnd, Alexandre,

Whatever you prefer is fine with me. As I'm not the first impacted I 
wouldn't push in one direction or another.

Best regards,
-- 
Nicolas Ferre
