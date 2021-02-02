Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194BCC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:40:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D775164E3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D775164E3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kbgj2C6xlTMg0t1HhzCfXaWNJ5q/u1q8mHDSoRkQeAI=; b=2YbmZF2nw2MQFTHD8nta5DwiM
	9ZOMyjqbf98VYUWYZ3aMDLZ3rPdlARiSmVrFSOZ4dMGN1UUMXbpoBELJ1I113F1tPrUQ0+zh4e6bA
	Ml0XlLUh9q60OxYFpA0W3x8EwZYiU2KL7sFS/w+jB1rxI2GmUT8HS5CnrrodGMKMkoFvNWx/bHG59
	OqfTkaRi0pagY4kL+4JKOBfJ+Z6DO2mPBk+EqajhaLCtGFS1oftN+Up3AKEp+xLQzjV+TmK0vrV1r
	gGyta63lnBKVoWXnOayJoerTWol67BfdB0xpKLJL+qS/OJVYOstCyTT0ypouOcBY2HbcNuouwU/L7
	oxjmCR6tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73O7-0003mL-FY; Tue, 02 Feb 2021 21:39:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73O4-0003kW-1d
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 21:39:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1BB264E4A;
 Tue,  2 Feb 2021 21:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612301942;
 bh=SjD1cjmLFC497TWFKRsyO8SSBPhERWQg48ow+XPBcig=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dQTBQxEOQ1WMeAKk6t2h7c7iTmTDbu5SL8GOGIBQZcNEKJjTiEUtJeLIrIUSJ/JKq
 ssU12qxdKCBR7U7TToj/1b8AyKSO1V4Egpbt0tKoeCB4wlPtmJGy/CoOZ2WpcsLpdZ
 06FiN3Vu8dLt7aTfkAVVxdQM2lpbjswZSNkOl5Didykljnu9MQsYVDMwqExXQta7aJ
 5UAWTKyo2ohI9HOAiLjR9/+DCo0roJeIvca1dgO9e0gJvpvbUnOrOgvBSQ57vkkGFt
 x7j2IseScB6NSqXLmBY15dlfF/6vxvDfKyZuSEZ1iLkfXZPcNjoAo+HsCir4eV/rsz
 B/hP+mbKehdOg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Subject: Re: [GIT PULL 1/6] Broadcom defconfig changes for 5.12
Date: Tue,  2 Feb 2021 22:38:56 +0100
Message-ID: <161230191188.1903274.2876240133281287107.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_163904_216882_E7ECE1B1 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202213856.sn8kW6QOTu0HcAPbQT25ev5rbG6AgWPoAvC-dTJzIUw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:15 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/defconfig
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 071359e719af26ef27ac626053e236523c5d9d2b

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
