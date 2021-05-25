Return-Path: <SRS0=Zt5s=KU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A09C2B9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 May 2021 09:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C6561408
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 May 2021 09:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C6561408
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUfK54lYyaqVEoK9dJpb4DmYbHBoNaQNYcunDv3T3+4=; b=lwkVI8IefKRTrDCo+oteWtMuXY
	UUZ1un+M11paD9a6usDVZycANfMBQVkAfomqr/fSvcu9VHyoFsn6xgwtPqlFj93B7Z8WRgLmjeMIS
	+OzEbF5kWR9sYm55Xike6iaanajby+RaAqXZK5GT7hduPsy0ZpX3lbjQHtSXFFV8s3zjZODzHQkVx
	399Ti3O12mn4FyWU96S2yJUh2tIyM/Z63j7WjPRAsXw3pAFlYM/+/woyRQcCS1rOa38zPxK+DbePB
	rWT0p2Q3Ms3wgIDLI6caFbLnM18UukCKIxhhe8ASxo8gsXw5I8LkDHlFjx9JA6FkCuQN8bavR/IQh
	Ndbnqdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llTJa-004LyS-8Y; Tue, 25 May 2021 09:25:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llTJU-004Lw4-Rh
 for linux-arm-kernel@lists.infradead.org; Tue, 25 May 2021 09:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621934724; x=1653470724;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=id5jjjYGUYQ5y88qtb+UmsSE5j6OC46ZQvVJFXn8Wyc=;
 b=IlMLmnNu1i0wFKdyiwmEAayIHwavKQUeRr5/Qd2oMD1oRy+zJC5ioabh
 DcuRgd8UK3teqhkeCkyz5gryHuPb27S8QyEmokLqzAUYCMe+WOi3lhnRF
 Ii70tcqlNsSgIlwu7+300r0bILR9ZSPPPSA6dqmjWGvqLg0SwW8FNZvS+
 XDt0Csika86CAlSj1kZ4TFgu9esdiGeTKPAaTbSy1QdJrNFvRgFAxcSOn
 XCQLFPgbyLJBTobITKYVDZ9M01YZontLKvJ96aB0++oNaWj1LRAZz8kQL
 mG9biqbpoyTNG8/EOZWdIaHQ5ZdJvGskwNJ8pbSTO3DpYHwFc2Afvmj1A w==;
IronPort-SDR: tg+RT8KQ02foJIOL7ihExOxMfJaaEfZF7OcWfCWqUf1mz6TzhnwVXpPCewgCbCH1dCfqqsWpvX
 P4Y/N/kbxWu/njpWFzPnDg6UTJ9SB/FSgqVYATG83//+QM6ZRO63k0ktkmFwzJdy9ecjEyoohu
 rZn+PQdDHnNRpggA3/kv95omzzMlEJkKhoUrmA+C7ZlYR20XoLnnFOIFCvc+cr6ubxxavSHvW2
 ilGsri8AEojsPZYheCw3O2q87NWDfXHG0GKfPZrvcKGNKYUoqTuvpchGoU4QNBmFfoD8K/clPO
 lII=
X-IronPort-AV: E=Sophos;i="5.82,328,1613458800"; d="scan'208";a="129362356"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 May 2021 02:25:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 02:25:22 -0700
Received: from [10.12.74.7] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 25 May 2021 02:25:21 -0700
Subject: Re: [PATCH v2 2/4] ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <Eugen.Hristev@microchip.com>,
 <Ludovic.Desroches@microchip.com>, <soc@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Claudiu.Beznea@microchip.com>,
 <Codrin.Ciubotariu@microchip.com>
References: <20210511071223.71379-1-eugen.hristev@microchip.com>
 <20210511071223.71379-2-eugen.hristev@microchip.com>
 <070939b0-ec77-a135-b351-4c4c8bc543f0@microchip.com>
 <YJo0PY2E36v2Pqz/@piout.net>
 <8c74596c-6d23-c822-fc2e-6cbb984fa4fd@microchip.com>
 <20210511191653.GA2446068@robh.at.kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <bbbb0934-666a-44be-f98c-cb0ad180c792@microchip.com>
Date: Tue, 25 May 2021 11:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511191653.GA2446068@robh.at.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_022524_978085_9E5499C7 
X-CRM114-Status: GOOD (  13.61  )
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
Message-ID: <20210525092520.aQbj9Le5Wgm_D4hfDnqeU_T3YUVjDzrIKiD0q-2oF9s@z>

On 11/05/2021 at 21:16, Rob Herring wrote:
> On Tue, May 11, 2021 at 09:03:37AM +0000, Eugen.Hristev@microchip.com wrote:
>> On 5/11/21 10:37 AM, Alexandre Belloni wrote:
>>> On 11/05/2021 07:18:31+0000, Eugen.Hristev@microchip.com wrote:
>>>> On 5/11/21 10:12 AM, Eugen Hristev wrote:
>>>>> Add Device Tree for sama7g5 SoC and associated board sama7g5-ek
>>>>>
>>>>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
>>>>> [claudiu.beznea@microchip.com: add clocks, ethernet, timers, power]
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>>>> [codrin.ciubotariu@microchip.com: add audio]
>>>>> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>>>>> ---
>>>>
>>>> Changes in v2:
>>>> - fixed license
>>>> - fixed warnings for make dtbs (changed ahb/apb to just soc)
>>>> - changed some node names as suggested
>>>> - removed some okay status properties
>>>> - addressed cpu node by label
>>>> - removed stdout path
>>>
>>> Why would you remove stdout-path? The solution was to remove The console
>>> parameter from bootargs, especially since you don't know what name the
>>> console device will have depending on CONFIG_SERIAL_ATMEL_TTYAT.
>>
>> Ok, sure, I will add it back and remove console=...
>>
>> I will wait to see if Rob has anymore comments before preparing a v3.
> 
> No, nothing else.

Hi Rob,

v4 was posted some time ago:
https://lore.kernel.org/linux-arm-kernel/20210514082151.178571-2-eugen.hristev@microchip.com/

I plan to include this series in at91 tree these couple of next days: do 
I wait for your tag?

Best regards,
   Nicolas


-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
