Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCCFC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 17:07:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9E4D233FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 17:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9E4D233FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GfD8S/tyFBZGt6EofMxzNQ3OZbEcwSaO2S21tBagOVc=; b=PSYJtJZfs4P79wfC3OjHGsgIN
	6+08qTx+YOMXKiqmUhHBG3+PHLV1nVNog204dd0CdTf/ed2PzPmUVaeePbkhZ9IbdxHn6H0Y2BLWD
	yUtegKar0TLHp6KenBu43wrlDtdjuIF8QC9cpJbYp9eacxuVVe7FYDiMx/JDn+rBlGi8I51/d9CA7
	a57APSZQzKRRR9/6MyEF8b9KsgZMJTR5plCPUpgqB7acxbiw+qS7SGDsWjHZR+pKGWwM1/GsP77qz
	WDNP+LbCwWqdUiCKQ8rFtavH3n0e91LjruoZfT6d1+42tpJyCM0y5T2uDsstyxdE1ikQC56vLivns
	hRnkBzYHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2zsQ-00017a-Hs; Fri, 22 Jan 2021 17:05:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2zsL-000174-39
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 17:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611335133; x=1642871133;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dkrcTOyV7SF2AdMFgUc0km5YwirX7kjYen8IfpsQ3QM=;
 b=A2+BK0NLq2K8CCao5V/OBaNZkGn3tVBdoH/Zs0zRBD06fS06CRi7GCcf
 lQWX73wvEHZ5n/Wkvhj8h0I0VpjhPbLE43z+OF0tU+LAUG/tUVNBZiCd3
 m0A7NTZyDE4RbP96ATh3VKDFe/1XjQ6tu/UmuxhZo6O1MH/qKEZSKrfvb
 iv6LsiXtou9xdzWj6IGIIyLsDdCVEMGUlFepOyyoXcujh2DGh1A4O2XR3
 4parlA+ggMiGtzbzdciH5rL02VJ7wqsiSaBY1TaYLs76sO91fTAa57Hq4
 qtOXHCVLFtB/gcFeBkRXBZCW00Xd6JP7ttui/fk7zj4eQYHyEnuGc71jK A==;
IronPort-SDR: CAhFatTCMYq27T6yHM3vczHsVxExCMl3AFVAJq9CaLzL8VIEeo1KCNP9vZc/R9UgR/AcyNfPVw
 sl4RFj1iDaNjvKss9jtoc/VQE0jd8VQbmD0WMRDko5B9MdV77OUUOiBWk95QrjdYOn2F4Vl8Qg
 N95gJZxlmBCpaH60n0EI9eQgguWB/l74TG9F3vHX3//9c0tyazTHeQxeDKNPqOXk6AFQVvWqgR
 seOTWcZzrkaThV9JgiouVDTnsOE9nsgJVJ2boRPikxJ7GpovNBlq0RcbzHeZEUn8EDSpFBM/ca
 0iA=
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="112109408"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jan 2021 10:05:31 -0700
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_120533_340447_45EA3AD4 
X-CRM114-Status: GOOD (  22.78  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel list <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122170523.XtZ5FMvfkXsHTt3muBNADlEuuTgW4sSyZFyZ5oBe_EY@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
