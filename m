Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB74C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78CE7601FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 13:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78CE7601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGT36IksmFkqiibOhpfl85ux+/lj83H6Wi9mW5yR03w=; b=Y+nxhENP0zGJrl
	fzuOys/utEd16neuYtR7PeF/PGgLnFB27A4/yEqOjTTkNibOIDEduxRqAV37rGdNSXRVA8cBRYtqZ
	fmN/fLKMXxTVtLINZLYKTPxIWgMPHEr/FjiGINI4XwdXqlef8ChH0vEe+3inUWzVIrfs7mla8svqk
	twq94FsHXSDK3CoEsK1Jvoin7z8LD0fguqt54rgu6WLvlDKgZ/G5GZgBA3DXob4h/sX2jh+HJdREO
	Yv1v+uo8axGrvFkyviUtEI9RkcJ8xZPmzRD6f85bdpl4Lwg9QpcOptF3Ktq5gXKKGTxNUpyYm53Rz
	R1AuBqCLoN9nyqsPi8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHOa-006EVx-2w; Wed, 04 Aug 2021 13:57:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHOK-006EQw-5h
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 13:57:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AF6F60F58;
 Wed,  4 Aug 2021 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628085423;
 bh=CfPh8n7X/2HlYs0NevM2NSTKLSxtkrFdu5Iu+5YSy8I=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xe84NgBFKitEXuISRyb4yeDj7QWpCq9GBv00gTgsZ9m3nD5iB8GV2ppSvcvbpyai3
 TOmQVJd5ZetVLCAASFW4+ZnY5qMdpHmYGqUNqvCfHf6RQn/fI0D8kdSihmR9mxcPmh
 GPP9J6E9rLhMAPpYhoLpLzlCxTowwkBqpWNpcrgJw/TuCLrC0d5+rhrMy7qnXd+l24
 CCQd+nkkR5MOjjNRv6wVo6VPbcTaf6iFMuW+tdFweMeXX0gUw+ggoH5YkF107XlN5W
 3Im7CUZ9rWxLeANMbRxFbtoA6qYcMJsPjKGpybszDcBsNkjk5/tmc5sGti0SrPC9Sj
 jTYvKoGAijDuw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Eugen Hristev <eugen.hristev@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [GIT PULL] ARM: at91: dt for 5.15
Date: Wed,  4 Aug 2021 15:56:57 +0200
Message-ID: <162808541220.328977.6437198660609674733.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804085000.13233-1-nicolas.ferre@microchip.com>
References: <20210804085000.13233-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_065704_303551_C5059543 
X-CRM114-Status: UNSURE (   8.36  )
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
Message-ID: <20210804135657.jEwcAx4mcYcFcMjl_UDrKOhZJwjYOj8oPycZa4Xc66M@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 4 Aug 2021 10:50:00 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here are the dt changes for 5.15 which contains addition of SAMA7G5, some
> enhancements to current boards and a couple of (low priority) fixes.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8e816b9915a136c12ab726e92412b917d7e514f7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
