Return-Path: <SRS0=GlTm=NA=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4EDC4338F
	for <soc@archiver.kernel.org>; Mon,  9 Aug 2021 13:41:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 345BA61019; Mon,  9 Aug 2021 13:41:37 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDC8360E76;
	Mon,  9 Aug 2021 13:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDC8360E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628516496; x=1660052496;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Yu+ZKXheXQH6ORhC5K4vYtn0mCS4/OBMjcOH9TigR58=;
  b=SqlrquyfB01yhCpfjHgsvwEe4Z6NChu9XGWs8wHGn06reIxZmPnOewM4
   77fIMPkCgFDnHtMZbf/l0IKTnLreK84EYOfjXHMWHOecEJW6TULvXCFON
   UrzSlkiO/vowKUYKQLnIOtAwgkEML0A4PFsRFSUqaS0FQsqvzvsFoeM0S
   ZqqCZ03brOe8BwvmsWBqZFjZVcopmjP3AT/AVqDT844tKU7dyum0T8zkO
   /v9OnHle65HoyFlUOF6AIA2pXEP6Zm7SSnpoPTrCjHe5olscl67cxFcgr
   jXmvQgx4sSE3tDr2xSkU7Du/w7u/9x+bbOsW6Fc1QJTczHdyrW3JlNpZc
   A==;
IronPort-SDR: YEMOctqGGt7Hwovd5M3mj7p50Z7ersSwrYKsMPVc4SFtIJOgxQwyDasg4tU8G8cRe3KxCLP7N5
 amcZK3JL3TQg+ReaJK9kT7EU2vltYJN4bZB/LyOI2BKLnjUPXPXwgDD2I6TC8xTggmXo7ebg7q
 bauqlcDNFD4h4y3+HlbVOIfQ0039Jhu4SL3DQbOIoeKkY8P4LOZHqsJ42WaYH26M93mgq2TRUQ
 NlWPyR/ehT7HLaVBBkI3S2SfmjC6dxsU4RGmiEm/2NVbCnHzBzDEt1JyyMzcWpJ48+x4EKpurl
 ekS0RR6+q9KS1bnbDNgttG+E
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="139340485"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2021 06:41:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 06:41:35 -0700
Received: from [10.171.246.59] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 9 Aug 2021 06:41:33 -0700
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.15
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team
	<soc@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>
References: <20210804084631.12934-1-nicolas.ferre@microchip.com>
 <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <5f5e8843-1a07-760a-db1a-aee084f00405@microchip.com>
Date: Mon, 9 Aug 2021 15:41:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/08/2021 at 16:02, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Aug 4, 2021 at 10:46 AM <nicolas.ferre@microchip.com> wrote:
>> AT91 defconfig for 5.15:
>>
>> - add defconfig entries for new SoC: SAMA7G5
>>    - dedicated sama7_defconfig to match the needed peripherals and
>>      dependencies
> 
> I feel this needs  better description in the changelog: Why do you need another
> defconfig file in addition to the existing sama5_defconfig? Are they so
> different that a single config is not a good fit for both?

Hi Arnd,

I'm pushing another tag for this with better description. I hope it's 
convincing ;-)

Best regards,
   Nicolas

-- 
Nicolas Ferre
