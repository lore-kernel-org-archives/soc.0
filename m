Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9778FC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:23:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9DE61151
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9DE61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0BkEtSv6SfGfQxO1C5R/v6JE0gBYK663NZkrmaKiRg4=; b=mUi2p5Walytz6ItFx22VWj7/G
	rUPnuuZ9waMVGXe4M+3Yu6WNd0kfRyvaW2q5/F4jNryGiZssfYSxrAVddPzcUH6SK9ZbMgjOIOax7
	sQcPlnnYdsNsdEzssesOM9AyiEHzKA59OBS7v/pJRxx1M90erPtT+rSvphTQHZt4Zy1KYt6pmcjW+
	5OL9+26GiyUvPanH1eJ3gNlPmUb5XBC4XBQIGhQRFvKAr9U6ctlehiSWcZd8SwF/JEt4MbrFtZFhR
	THe7yAiPRlcCLnjVdkbLEfYkwIFCCJZ5U8ex+mcAwQhiyEI1NLWuXSrkIUyxpimUjraLwv1N3g8ti
	+x1CmAjJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUb9u-009CC9-Ib; Thu, 08 Apr 2021 20:21:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUb9q-009CB5-Sn
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:21:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 611E5610FC;
 Thu,  8 Apr 2021 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617913301;
 bh=XG7ZBeR3dlHMBKcF/vu3FeV5kedebxxNaln7NWAPM7c=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UmVZFYgHg2Qu//Lb1WwP3aMhSyPySThqRBS21XDepOffkW2RDa38E6hL//LpbOLAY
 wDcQZc/ecE0zc10u5TNjofg8dKLzU2AJYzGG3/eFLGqBMRTKBufH/nlSaoa32Gax6M
 StiK0FMqBXEcshw9JzE3uE565Gbtm7oTWHtm9bIJvNMHr8PeYE1eD8Xgw9kE89pwVP
 wqcSD2Ko0G0ywJA1mvTBg41roSqc1zzUH9fTyUUD8AwPeTh6521w3ly4UJYp/NjdAH
 V5MXYOFir8Y6oNd6SDm6dAkAHy72jrK6u03r+9USRnYshVMPcNjOWZW9cMS53DD+jZ
 UW/+7xti+M7HA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.13 (#1)
Date: Thu,  8 Apr 2021 22:20:55 +0200
Message-ID: <161791324990.1663215.15241029409271472842.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87v98xbzir.fsf@BL-laptop>
References: <87v98xbzir.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_212143_149946_A03B1EC3 
X-CRM114-Status: GOOD (  10.26  )
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
Message-ID: <20210408202055.D57iKocsDyC6oEXpKRM22gyroO9j-J5DRF8g9e3j1-0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 07 Apr 2021 22:39:08 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for dt for mvebu for v5.13.
> 
> This one is latter that the other ones, because I've just found a
> patch pending since December. I hope it is not too late.
> 
> Gregory
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e3e1276295a4c5eddc31dd297e8f6af275ca9c4f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
