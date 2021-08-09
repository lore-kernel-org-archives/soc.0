Return-Path: <SRS0=5t0o=NA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBC9C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Aug 2021 13:43:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E002360E97
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Aug 2021 13:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E002360E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gnq70Wy7aSFoItnGmM/Ns1cbubsZtGvlK+5NVzcrbU=; b=qpCIe/QnCtAKKE+JJWjkDJn00w
	fLIJhTzwY8Hh7uK1Cz55vCeelcw46D9CKkOKs4E/6k31ybTYIhDnd7yzRHMniAqUbQEovq3PBH2Hd
	TgOm8HSDBPIaM6B+v5vcx7LRUHM3tGVrK4nb8LET2JH9GUVBX/GdFWvJl9Xs//rM9RpQEeOqdC+b5
	lOuwbZhRrE3YhaDYLxSyg6auxpU3Vy60Ab3DQWStiaYxZK4p5CBQz+l0OUK4b3OTux2ndqjuttPYr
	rUgMF0+MoGoNsK2Pais3YypZiu3zwCpjnuYg12Z3+BqmuzVg2VZJOCxtUbkjFe2MBdzsRo1MMsMK7
	YhLvSiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD5XG-000nql-DS; Mon, 09 Aug 2021 13:41:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD5XB-000npD-Bl
 for linux-arm-kernel@lists.infradead.org; Mon, 09 Aug 2021 13:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628516501; x=1660052501;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Yu+ZKXheXQH6ORhC5K4vYtn0mCS4/OBMjcOH9TigR58=;
 b=UazapQ/qqKeBM5dTqegF34FxqYSpA4C4kdinP7t43QFYPjxp5YPkX4x3
 PBmfiLC9DOYZtd2X8P/XfjxH//dgHXpiIVwgHeSpCcquW58t2kauBtL3i
 cW5sJ6MUBnw8FD7GKgBZJQdSaeLHJg9YhHJ1vwnoCa2KoOESqkS5bKcKC
 yv6sBP6o6gE3x7talpLCmaKHbj52uMPdVQGR5cBrIJ7CUlMyrSxDoHQwS
 TAavE5KUl3xHKUiTpJTH8pa3eLr18gUhrEB70iSgYLIcTyKYG1OgCwSoB
 JMKw0ppK72/obinbKw3Z/AFS6CKBmC+BhiPYuCEUp6s+HKqJkJ1O0X97c A==;
IronPort-SDR: YEMOctqGGt7Hwovd5M3mj7p50Z7ersSwrYKsMPVc4SFtIJOgxQwyDasg4tU8G8cRe3KxCLP7N5
 amcZK3JL3TQg+ReaJK9kT7EU2vltYJN4bZB/LyOI2BKLnjUPXPXwgDD2I6TC8xTggmXo7ebg7q
 bauqlcDNFD4h4y3+HlbVOIfQ0039Jhu4SL3DQbOIoeKkY8P4LOZHqsJ42WaYH26M93mgq2TRUQ
 NlWPyR/ehT7HLaVBBkI3S2SfmjC6dxsU4RGmiEm/2NVbCnHzBzDEt1JyyMzcWpJ48+x4EKpurl
 ekS0RR6+q9KS1bnbDNgttG+E
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="139340485"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Aug 2021 06:41:35 -0700
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_064141_468534_2E7F46E0 
X-CRM114-Status: GOOD (  15.44  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210809134132.xocYF-Fa1zJ5teBzvkX5VLVhLBDUKLQ6daAGSlsHk_o@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
