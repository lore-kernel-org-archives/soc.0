Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0721CC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:28:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F2C610FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0F2C610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ryZwS1Z0CgR9Ht22A/39qkUoCcU4nJ9B0STMHj7Sd2o=; b=cc2+mBXhGv2rZBEDATWxeuRLS
	IDNbZVrJKQow1SsyMUAhy38iXGx8F2KWT7PWfWK97d934dSAKMrwo2duv/Fai+o7prI1iteTjYvBe
	pZNG3V0H5Mn8q3HBeKux4Yw1zG4X/B5A5gjNFGOoEE2E5n1rc18KpycfFeJIw3euqZUQZn4BASjAj
	g9m5ezv0jhPgednOKmiI56xhGOdia+bi6OX9BvAjPFubjq33wbwKpGOiXepIQfUU3RaLTf0oRKd6k
	kp0jsJSoDC1SbqJSj8vHvhenYAN5x5taOiQ57OVcA1y5H+BS++zpHZ91J3x2El12qMEcShLr88SA6
	WirfJY3xQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWXi-008Nhy-93; Thu, 08 Apr 2021 15:26:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWWh-008NQN-9H
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:25:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9771F61131;
 Thu,  8 Apr 2021 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617895498;
 bh=ig6+AJ8TVdbxN4XM6/vM//3nMIEuURo8C7OVen6PvIM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oGByFWi1NcNNHmaNVY/gZRQmdZcz3Mgwh46tNrjyOxDApbsOEXZuBcoBy9gYsxmcu
 Iirbw9S+hbAzkVi3iPOZ/m0diaglvX1s+CAoQTCuTZtw8+TTAPjpH1NGIiW7cDNc//
 Jplgy6b4SEddS+44A0jQX4rxQtFjVNluvsaErszpupo2T0N0PMfnGx30TtNIIRdf8C
 hVJZWr2030FuSQmtaxMcW2le5Fi6U/GIXIefL/6grP4OlKeJHX5Kl601DzzmFuaZ+x
 AXIXK1/VKYl2gMcXk1zOHexXMnFmi2u7j831LxifC3msDaUymiD81qqWwKmz0QFHfL
 juwXdS2QykaLA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 soc@kernel.org, Olof Johansson <olof@lixom.net>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] ARM: at91: dt for 5.13
Date: Thu,  8 Apr 2021 17:24:25 +0200
Message-ID: <161789493817.1630479.5024717274217057698.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407114415.13180-1-nicolas.ferre@microchip.com>
References: <20210407114415.13180-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162459_573611_A0B6513A 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210408152425.iU_3MLdtWcCcmamx8cWYIw46bTLnTODezBqjVS1Lqsg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 13:44:15 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is first batch of dt changes for 5.13. Please pull.
> 
> Thanks, best regards,
>   Nicolas
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/dt, thanks!

I saw two new warnings from 'make dtbs_check W=1':

arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml: /: 'etm@73C000' does not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: /: 'etm@73C000' does not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'

merge commit: e2b064fec8e49112f7dac779fcec12ded40728c2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
