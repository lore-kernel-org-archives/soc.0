Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC97C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:26:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391DD64DDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391DD64DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LyxbBVzt6Wca3yX92qmua54aDTOcUMuhARIr0E41XkI=; b=PsFxyxtXiz4cPPAAxDwP3zYwE
	PS0gvwGKlJoEdnLWX+Ll+vOUtT7QQDybJ0bLOUklU4ZgDrrvl7L/D8QjiXqt9LqjCpqiMPJBPvStm
	91OsSUkpCDkY2prkuv6rUxOKtGd//FCHacQUzj6B7ysAo7Di/CDwIIRX7QdlFVo/ScteYmhfW0dJp
	o7PnkC/Vqae8iD6DGganR9hgJdttKWmYP5K20HIwLMfsIR93BTu6aOwj26fs5baSjabQAZH01ev/u
	8rbhufcfnFftXastEz99g811tjdq7RRU+6rIctVGQg5uq5udmIyvhvpV6Jw7e7DeOo+mzyZPrWkhJ
	B4JvQR+PA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oNI-00072O-9b; Sat, 30 Jan 2021 11:25:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oNF-00071n-UB
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:25:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7460164DDD;
 Sat, 30 Jan 2021 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612005903;
 bh=WSYKOJu9J70X52xF17YT4q3tFjXR3LzaFrcvnDbDj2s=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mIdxqaMUwMNszEXZ0n2/zW68kDnXxAjbBo/uVV+N1jMafaH0ATPBQmEnH/S0C9mK4
 AMNegppHEyLLUof28VMbQQgYL43qU/dC5trc8Axbr3Gkwy3SZ8Ffv17VXQEd3fINBD
 kUfS4/adwGQoz68SYfduSyep3MB/PjuQOXczpmAaWQK87pcJ/a8QxwtCZFm2VakHIk
 pd9HOjgr7dDfaKYVYf3S65mufNjKiwsK4JoalpBiKIN202Y4bBnbqzeeY+JzpYiLk5
 aegcraWLPN4975FRUIhB0xnvi+99ORkgkesrvynCy3dSEdjZjDp0SFGDZcl9uNHANT
 NiYdS/8bbYW0g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 arm@kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12 #2
Date: Sat, 30 Jan 2021 12:24:56 +0100
Message-ID: <161200588882.1995370.4365069809706581847.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129090030.26976-1-nicolas.ferre@microchip.com>
References: <20210129090030.26976-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_062506_079795_8D499CA1 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130112456.lm5SoTE680rlZCZ5GAliHIL5r6rhk61ihnyl1K2DPuc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 10:00:30 +0100, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is the second batch of soc changes for 5.12. Actually first batch was
> consumed as "fixes" following our discussion here:
> https://lore.kernel.org/linux-arm-kernel/CAK8P3a1v=_4E40cZjZ-ff7vs84XE9XaxwdoGW7Rf+LYiA+TCTw@mail.gmail.com/
> Note that v5.11-rc1 is the root of this Pull-Request so the 2 first patches are
> the ones already taken as fixes.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4940b9919119906ba37b3f00611fd5e9be587946

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
