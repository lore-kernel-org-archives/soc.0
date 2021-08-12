Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538C3C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:16:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177F861038
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 177F861038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jEdeFqBr53XHMvTYKNzRGzITE/09NmFoOYc09FvfQk=; b=r6xJDU5Cwl0Gno
	amSvq34DqZfSv+IXm+gjaf7Qd6pppY/OwV+48w66rSAE9cEKnexhbc0lZpr5IZuBhO/8OWgwnaVVP
	f/0RO0RYu41pga2Buh/aV7mtVh5OwXQpSD0qBoqGa5BOMwzJxpOd8LSLGH7MAo5MaD9fcayMX3are
	hPbmaJJMVzr07MTk5+QNSRJ+UFv0tuORQzHGxmsIc9Z6weO4ByK9LRTfdg/1WPtdzLwb4ePvTlis/
	09mtrspkfHZxWEJY4LYPGwqZLMIwZp601CPT0BKy1tn8KQzf9WVvVY8JfqUn0q9E4pA1xjV0qeq7w
	gRJVjlZVPungO2qehX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEI03-00BMIO-Ny; Thu, 12 Aug 2021 21:12:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHwW-00BKcW-J8
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 21:08:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 096276109F;
 Thu, 12 Aug 2021 21:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802528;
 bh=JrgeX0TDZtEkb3oZiJcAfhQ5e1W+KK9TRVrxjWwwBkU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uZqqDkpq37DHzFuVHkOijzXDjdpIRog2cX40IOWgnKleIGKXociAy2BdwB8Jvn2S7
 s6FmWY9wnhluWRqjcM5RgK/PPR8RYSPFUrfUXitmXwOl2TjFPxXTW89nNBghOaepV9
 J3/vyAAT5ArzTh79952UB+bBPMVRdV8+3UGIFxlYuNVZ5ilty41BcY/tOkI7WF4IDJ
 BXD5QNBsfB5RC1pJOJ3kTihL+gJCsDHvKEhYNmXIG4IpobvcMZqDeGymJGEYa75Pp9
 WTWxbdQ8XsigcL60JGm+hX1G0hgIzoGJNnIBYyz9K1OqqeRY8oc/2737sYUOd2UNPs
 brZtq0HOQ4OeQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 soc@kernel.org, Olof Johansson <olof@lixom.net>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [GIT PULL v2] ARM: at91: defconfig for 5.15
Date: Thu, 12 Aug 2021 23:08:40 +0200
Message-ID: <162880251645.1376866.7366771530454558975.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210809134521.10155-1-nicolas.ferre@microchip.com>
References: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
 <20210809134521.10155-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140848_717108_8BB8D6CF 
X-CRM114-Status: UNSURE (   8.22  )
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
Message-ID: <20210812210840._43a-It3r-yBBJ7PARHELATTQ5IXVrRjkvvrLZzFr7o@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 15:45:21 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is the second attept about defconfig changes for 5.15 which contains
> addition for SAMA7G5.
> 
> v1 --> v2:
> - add more information to the tag message for explaining why we prefer
>   a new sama7_defconfig file.
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: b528dede9bca2afc262b841757fa994bd035cb43

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
